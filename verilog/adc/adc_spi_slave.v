/*
 * Module: adc_spi_slave
 * VERSION: FINAL (Dual-Clear + Priority Fix)
 * Description: SPI Slave Interface.
 * - EOC Set: When ADC finishes.
 * - EOC Clear: When HW Starts, OR Data Read, OR Status Read (Verified).
 */
module adc_spi_slave (
    input           clk,
    input           reset_,
    input           cs,
    input           sck,
    input           mosi,
    output          miso,
    input  [11:0]   adc_data_in,
    input           adc_busy_in,
    input           adc_eoc_pulse,
    input           hw_clear_start,
    output [11:0]   ctrl_reg_out,
    output          eoc_flag_out
);

    // -- Register Map --
    localparam ADDR_CTRL   = 2'b00;
    localparam ADDR_STATUS = 2'b01;
    localparam ADDR_DATA   = 2'b10;
    localparam ADDR_INFO   = 2'b11;

    // -- Commands --
    localparam CMD_READ  = 2'b00;
    localparam CMD_WRITE = 2'b01;
    localparam CMD_SET   = 2'b10;
    localparam CMD_CLEAR = 2'b11;

    // -- Registers --
    reg [11:0] ctrl_reg;     
    reg        eoc_latch;    
    reg [11:0] data_reg;     
    reg [11:0] info_reg;     

    // -- SPI Signals --
    reg [1:0]  state;
    reg [4:0]  bit_cnt;
    reg [15:0] shift_reg;
    reg [11:0] miso_buffer;
    
    // Internal flag to track what we sent to the Master
    reg        eoc_sent_high;

    // -- Edge Detectors --
    reg sck_s1, sck_s2;
    reg eoc_s1, eoc_s2; 
    wire sck_rise = (sck_s1 && !sck_s2);
    wire sck_fall = (!sck_s1 && sck_s2);
    wire adc_eoc_rise = (eoc_s1 && !eoc_s2); 

    // -- Protocol Parsing --
    wire [1:0]  cmd  = shift_reg[15:14];
    wire [1:0]  addr = shift_reg[13:12];
    wire [11:0] pay  = shift_reg[11:0];

    // -- State Machine --
    localparam S_IDLE  = 2'b00;
    localparam S_SHIFT = 2'b01;
    localparam S_LATCH = 2'b10;

    assign ctrl_reg_out = ctrl_reg;
    assign eoc_flag_out = eoc_latch; 
    assign miso         = cs ? 1'bz : miso_buffer[11];

    always @(posedge clk or negedge reset_) begin
        if(!reset_) begin
            sck_s1 <= 0; sck_s2 <= 0;
            eoc_s1 <= 0; eoc_s2 <= 0;
        end else begin
            sck_s1 <= sck; sck_s2 <= sck_s1;
            eoc_s1 <= adc_eoc_pulse; eoc_s2 <= eoc_s1;
        end
    end

    // -- Main State Machine & Logic --
    always @(posedge clk or negedge reset_) begin
        if(!reset_) begin
            state       <= S_IDLE;
            ctrl_reg    <= 12'h0;
            data_reg    <= 12'h0;
            info_reg    <= 12'h00A; 
            eoc_latch   <= 1'b0;
            bit_cnt     <= 0;
            shift_reg   <= 0;
            miso_buffer <= 0;
            eoc_sent_high <= 0;
        end else begin
            
            // =========================================================
            //  EOC LATCH LOGIC (Priority Chain)
            // =========================================================
            
            // Priority 1: Hardware Start (Clears everything for new job)
            if (hw_clear_start) begin
                ctrl_reg[1] <= 1'b0; // Clear Start Bit
                eoc_latch   <= 1'b0; // Clear EOC
            end
            
            // Priority 2: New Result Arrived (Sets EOC)
            else if (adc_eoc_rise) begin
                eoc_latch <= 1'b1; 
                data_reg  <= adc_data_in; 
            end
            
            // Priority 3: SPI Clear Logic (Only happens in LATCH state)
            else if (state == S_LATCH) begin
                
                // Case A: Clear on DATA Read
                if (cmd == CMD_READ && addr == ADDR_DATA) begin
                    eoc_latch <= 1'b0;
                end
                
                // Case B: Clear on STATUS Read (If we sent a '1')
                if (cmd == CMD_READ && addr == ADDR_STATUS) begin
                    if (eoc_sent_high) eoc_latch <= 1'b0;
                end
            end
            // =========================================================

            case(state)
                S_IDLE: begin
                    bit_cnt <= 0;
                    if (!adc_eoc_rise) data_reg <= adc_data_in;
                    if(!cs) state <= S_SHIFT;
                end

                S_SHIFT: begin
                    if(cs) state <= S_IDLE; 
                    else if(sck_rise) begin
                        shift_reg <= {shift_reg[14:0], mosi}; 
                        bit_cnt   <= bit_cnt + 1;
                        if (bit_cnt == 15) state <= S_LATCH;
                    end

                    if(!cs && sck_fall) miso_buffer <= {miso_buffer[10:0], 1'b0};

                    // Pre-load MISO
                    if(!cs && bit_cnt == 4 && sck_fall) begin 
                         if (shift_reg[3:2] == CMD_READ) begin 
                           case(shift_reg[1:0])
                                ADDR_CTRL:   miso_buffer <= ctrl_reg;
                                ADDR_STATUS: begin
                                    miso_buffer <= {10'b0, adc_busy_in, eoc_latch};
                                    // Snapshot EOC state to avoid race condition
                                    eoc_sent_high <= eoc_latch; 
                                end
                                ADDR_DATA:   miso_buffer <= data_reg;
                                ADDR_INFO:   miso_buffer <= info_reg;
                           endcase
                        end
                    end
                end

                S_LATCH: begin
                    state <= S_IDLE; 
                    
                    // Write Logic (EOC Clear logic handled in Priority block above)
                    if (addr == ADDR_CTRL) begin
                        case(cmd)
                            CMD_WRITE: ctrl_reg <= pay;
                            CMD_SET:   ctrl_reg <= ctrl_reg | pay;
                            CMD_CLEAR: ctrl_reg <= ctrl_reg & ~pay;
                            default: ;
                        endcase
                    end
                end

                default: begin
                    // Default: stay in idle
                    state <= S_IDLE; 
                end

            endcase
        end
    end

endmodule