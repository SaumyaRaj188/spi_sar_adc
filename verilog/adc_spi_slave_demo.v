/*
 * Module: adc_spi_slave
 * Date: Saturday, October 11, 2025
 *
 * Description:
 * A robust, fully synchronous SPI slave module with a clear separation
 * between the state machine logic and the datapath logic. It safely handles
 * the asynchronous 'sck' signal by synchronizing it to the main system 'clk'
 * and using edge-detect pulses to drive the logic. This version is optimized
 * to remove dedicated command and address registers and uses an explicit
 * MSB-first bit mapping for clarity.
 *
 * SPI Protocol:
 * - 16-bit transaction length
 * - Frame: [CMD(2 bits), ADDR(2 bits), DATA(12 bits)]
 * - SPI Mode 0 compatible (data shifted in on rising SCK, shifted out on falling SCK)
 */
module adc_spi_slave (
    // System Interface
    input           clk,     // Main system clock
    input           reset_,  // Active-low asynchronous reset

    // SPI Interface
    input           cs,      // Chip Select (active-low)
    input           sck,     // SPI Clock from Master
    input           mosi,    // Master Out, Slave In
    output          miso     // Master In, Slave Out
);

//=============================================================================
// Parameters
//=============================================================================

// State Definitions
localparam S_IDLE  = 2'b00;
localparam S_SHIFT = 2'b01;
localparam S_LATCH = 2'b11;

// Command Definitions
localparam READ    = 2'b00;
localparam WRITE   = 2'b01;
localparam SET     = 2'b10;
localparam CLEAR   = 2'b11;

// Address Definitions
localparam ADDR_CTRL_REG   = 2'b00;
localparam ADDR_STATUS_REG = 2'b01;
localparam ADDR_DATA_REG   = 2'b10;
localparam ADDR_OFFSET_REG = 2'b11;


//=============================================================================
// Internal Registers & Wires
//=============================================================================

// Slave Data Registers
reg [11:0] ctrl_reg;    // R/W
reg [11:0] status_reg;  // R-Only
reg [11:0] data_reg;    // R-Only
reg [11:0] offset_reg;  // R-Only

// State Machine
reg [1:0]  state_reg, next_state;

// Transactional Logic
reg [4:0]  counter;
reg [15:0] shift_reg;
reg [11:0] miso_data_buffer;

// SCK Synchronizer & Edge Detector
reg  sck_sync1, sck_sync2;
wire posedge_sck_pulse;
wire negedge_sck_pulse;

// Readable aliases for command, address, and data payloads
wire [1:0]  cmd_buffer;
wire [1:0]  addr_buffer;
wire [11:0] mosi_data_buffer;


//=============================================================================
// Continuous Assignments
//=============================================================================

assign cmd_buffer       = shift_reg[15:14];
assign addr_buffer      = shift_reg[13:12];
assign mosi_data_buffer = shift_reg[11:0];
assign miso             = cs ? 1'bz : miso_data_buffer[11];


//=============================================================================
// SCK Synchronizer and Edge Detector
//=============================================================================

always @(posedge clk or negedge reset_) begin
    if (!reset_) begin
        sck_sync1 <= 1'b0;
        sck_sync2 <= 1'b0;
    end
    else begin
        sck_sync1 <= sck;
        sck_sync2 <= sck_sync1;
    end
end

assign posedge_sck_pulse = ~sck_sync2 &  sck_sync1;
assign negedge_sck_pulse =  sck_sync2 & ~sck_sync1;


//=============================================================================
// State Logic
//=============================================================================

// 1. State Register (Sequential): This block holds the current state.
always @(posedge clk or negedge reset_) begin
    if (!reset_) begin
        state_reg <= S_IDLE;
    end
    else begin
        state_reg <= next_state;
    end
end

// 2. Next-State Logic (Combinational): This block determines the next state
// based on the current state and inputs.
always @(*) begin
    next_state = state_reg; // Default: stay in the current state
    case (state_reg)
        S_IDLE: begin
            if (!cs) begin
                next_state = S_SHIFT;
            end
        end
        S_SHIFT: begin
            if (cs || counter == 5'd16) begin
                next_state = S_LATCH;
            end
        end
        S_LATCH: begin
            if (cs) begin
                next_state = S_IDLE;
            end else begin
                next_state = S_SHIFT; // For back-to-back transactions
            end
        end
        default: begin
            next_state = S_IDLE;
        end
    endcase
end


//=============================================================================
// Datapath Logic (Sequential)
//=============================================================================

// This block handles all data manipulation, driven by the current state.
always @(posedge clk or negedge reset_) begin
    if (!reset_) begin
        // Asynchronous Reset for Datapath Registers
        counter          <= 5'b0;
        shift_reg        <= 16'b0;
        miso_data_buffer <= 12'b0;

        ctrl_reg         <= 12'h0;
        status_reg       <= 12'h800;
        data_reg         <= 12'h0;
        offset_reg       <= 12'h0;
    end
    else begin
        // Actions based on the current state
        case (state_reg)
            S_IDLE: begin
                // No actions needed here; counter reset happens in S_LATCH.
            end

            S_SHIFT: begin
                // Shift in data on the rising edge using explicit MSB-first mapping.
                if (posedge_sck_pulse && counter < 16) begin
                    shift_reg[15 - counter] <= mosi; // First bit goes to shift_reg[15]
                    counter                 <= counter + 1;
                end

                // Use if-else if structure to remove ambiguity
                if (counter == 4) begin
                    if (cmd_buffer == READ) begin
                       case (addr_buffer)
                            ADDR_CTRL_REG:   miso_data_buffer <= ctrl_reg;
                            ADDR_STATUS_REG: miso_data_buffer <= status_reg;
                            ADDR_DATA_REG:   miso_data_buffer <= data_reg;
                            ADDR_OFFSET_REG: miso_data_buffer <= offset_reg;
                            default:         miso_data_buffer <= 12'hBAD;
                       endcase
                    end
                end else if (counter > 4) begin
                    // For subsequent bits, shift the buffer left.
                    if (negedge_sck_pulse) begin
                        miso_data_buffer <= {miso_data_buffer[10:0], 1'b0};
                    end
                end
            end

            S_LATCH: begin
                // Perform register writes synchronously.
                if (counter == 16) begin
                    // Use the final position of the cmd/addr bits in shift_reg.
                    if (addr_buffer == ADDR_CTRL_REG) begin
                        case (cmd_buffer)
                            WRITE: ctrl_reg <= mosi_data_buffer;
                            SET:   ctrl_reg <= ctrl_reg | mosi_data_buffer;
                            CLEAR: ctrl_reg <= ctrl_reg & ~mosi_data_buffer;
                        endcase
                    end
                end

                // Reset the counter for the next transaction.
                counter <= 5'b0;
            end
        endcase
    end
end

endmodule

