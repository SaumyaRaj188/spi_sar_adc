module spi_controller (
    // -- System Signals --
    input  wire         clk,        // Main system clock
    input  wire         reset_n,    // Active-low asynchronous reset

    // -- External SPI Bus Interface --
    input  wire         spi_sclk,   // Serial Clock from master
    input  wire         spi_cs,     // Chip Select from master
    input  wire         spi_mosi,   // Master Out, Slave In data
    output wire         spi_miso,   // Master In, Slave Out data

    // -- Control Outputs to ADC Core --
    output wire         adc_en_o,
    output wire         start_conv_o,
    output wire         auto_mode_o,
    output wire         vref_sel_o,
    output wire         int_en_o,
    output wire         start_cal_o,
    output wire         clk_sel_o,

    // -- Data/Status Inputs from ADC Core --
    input  wire [11:0]  adc_data_i,
    input  wire [11:0]  cal_offset_i,
    input  wire         eoc_i,
    input  wire         busy_i,
    input  wire         vref_rdy_i
);

    // FSM State Definitions
    localparam S_IDLE    = 2'b00;
    localparam S_SHIFT   = 2'b01;
    localparam S_EXECUTE = 2'b10;

    // Internal Registers
    reg [1:0]  state_reg, next_state;
    reg [15:0] spi_shift_reg;
    reg [3:0]  bit_counter;
    reg [1:0]  cmd_reg;
    reg [1:0]  addr_reg;

    // The four main registers contained within this module
    reg [11:0] ctrl_reg;
    reg [11:0] status_info_reg;
    reg [11:0] data_reg;
    reg [11:0] cal_offset_reg;

    // Internal wire for MISO data selection
    wire [11:0] miso_data_select;
    wire        miso_bit_out;

    //-------------------------------------------------------------
    // FSM Logic
    //-------------------------------------------------------------

    // FSM state register
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state_reg <= S_IDLE;
        else
            state_reg <= next_state;
    end

    // FSM next state logic
    always @(*) begin
        next_state = state_reg; // Default: stay in the same state
        case (state_reg)
            S_IDLE: begin
                if (spi_cs == 0)
                    next_state = S_SHIFT;
            end
            S_SHIFT: begin
                if (spi_cs == 1)
                    next_state = S_EXECUTE;
            end
            S_EXECUTE: begin
                next_state = S_IDLE;
            end
        endcase
    end

    //-------------------------------------------------------------
    // Data Handling and FSM Actions
    //-------------------------------------------------------------

    // 3-flop synchronizer for maximum reliability
    reg sclk_d1, sclk_d2, sclk_d3;
    wire sclk_posedge;

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            sclk_d1 <= 1'b0;
            sclk_d2 <= 1'b0;
            sclk_d3 <= 1'b0;
        end else begin
            sclk_d1 <= spi_sclk;
            sclk_d2 <= sclk_d1;
            sclk_d3 <= sclk_d2; // Third flop for added stability
        end
    end

    // Edge detector now works on the final two, most stable stages
    assign sclk_posedge = sclk_d2 & ~sclk_d3;



    // Main operational logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // Reset all internal registers
            spi_shift_reg <= 16'b0;
            bit_counter   <= 4'b0;
            cmd_reg       <= 2'b0;
            addr_reg      <= 2'b0;
            ctrl_reg      <= 12'b0;
        end else begin
            // Update data/status inputs on every clock cycle
            data_reg              <= adc_data_i;
            cal_offset_reg        <= cal_offset_i;
            status_info_reg[0]    <= eoc_i;
            status_info_reg[1]    <= busy_i;
            status_info_reg[2]    <= vref_rdy_i;
            status_info_reg[11:8] <= 4'h1; // VERSION set to 1.0

            case (state_reg)
                S_IDLE: begin
                    if (spi_cs == 0) begin // Prepare for transaction
                        bit_counter <= 4'b0;
                    end
                end
                
                S_SHIFT: begin
                    if (sclk_posedge) begin
                        spi_shift_reg <= {spi_shift_reg[14:0], spi_mosi};
                        bit_counter   <= bit_counter + 1;

                        // After 4 bits are in, latch the CMD and ADDR
                        if (bit_counter == 3) begin
                            cmd_reg  <= {spi_shift_reg[14:0], spi_mosi}[15:14];
                            addr_reg <= {spi_shift_reg[14:0], spi_mosi}[13:12];
                        end
                    end
                end
                
                S_EXECUTE: begin
                    // On exiting the transaction, execute the command
                    if (addr_reg == 2'b00) begin // Only CTRL_REG is writable
                        case (cmd_reg)
                            2'b01: // WRITE
                                ctrl_reg <= spi_shift_reg[11:0];
                            2'b10: // SET MASK
                                ctrl_reg <= ctrl_reg | spi_shift_reg[11:0];
                            2'b11: // CLEAR MASK
                                ctrl_reg <= ctrl_reg & ~spi_shift_reg[11:0];
                        endcase
                    end
                end
            endcase
        end
    end

    //-------------------------------------------------------------
    // Output Logic
    //-------------------------------------------------------------

    // Unpack the control register bits to the output ports
    assign adc_en_o     = ctrl_reg[0];
    assign start_conv_o = ctrl_reg[1];
    assign auto_mode_o  = ctrl_reg[2];
    assign vref_sel_o   = ctrl_reg[3];
    assign int_en_o     = ctrl_reg[4];
    assign start_cal_o  = ctrl_reg[5];
    assign clk_sel_o    = ctrl_reg[6];

    // Mux to select which register's data to send out on MISO
    assign miso_data_select = (addr_reg == 2'b00) ? ctrl_reg :
                              (addr_reg == 2'b01) ? status_info_reg :
                              (addr_reg == 2'b10) ? data_reg :
                              (addr_reg == 2'b11) ? cal_offset_reg :
                              12'hXXX; // Default to X for debug

    // Select the correct bit to shift out based on the bit counter
    assign miso_bit_out = miso_data_select[11 - bit_counter[3:0]];

    // Tristate logic for MISO pin
    assign spi_miso = (spi_cs == 0) ? miso_bit_out : 1'bz;

endmodule