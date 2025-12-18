/*
 * =================================================================================
 * Module: adc_spi_slave
 * Description: Implements the SPI peripheral logic to receive control signals 
 * and transmit converted digital data from the ADC.
 * * Author: Saumya Raj Singh
 * Date: 2024
 * License: MIT (Copyright (c) 2024 Saumya Raj Singh)
 * =================================================================================
 */

module adc_spi_slave #(
    parameter WIDTH = 12  // Default to 12-bit
)(
    input           clk,
    input           reset_,
    input           cs,
    input           sck,
    input           mosi,
    output          miso,
    
    // Updated widths based on Parameter
    input  [WIDTH-1:0]   adc_data_in,
    input           adc_busy_in,
    input           adc_eoc_pulse,
    input           hw_clear_start,
    output [WIDTH-1:0]   ctrl_reg_out,
    output          eoc_flag_out
);

    // -- Calculated Parameters --
    localparam HDR_LEN = 4;                 // 2 bits CMD + 2 bits ADDR
    localparam PKT_LEN = WIDTH + HDR_LEN;   // Total SPI Frame length

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

    // -- Registers (Dynamic Width) --
    reg [WIDTH-1:0] ctrl_reg;
    reg             eoc_latch;    
    reg [WIDTH-1:0] data_reg;     
    reg [WIDTH-1:0] info_reg;

    // -- SPI Signals --
    reg [1:0]  state;
    reg [4:0]  bit_cnt;
    
    // Shift register must accommodate Header + Data
    reg [PKT_LEN-1:0] shift_reg;
    reg [WIDTH-1:0]   miso_buffer;
    
    reg        eoc_sent_high;

    // -- Edge Detectors --
    reg sck_s1, sck_s2;
    reg eoc_s1, eoc_s2; 
    wire sck_rise = (sck_s1 && !sck_s2);
    wire sck_fall = (!sck_s1 && sck_s2);
    wire adc_eoc_rise = (eoc_s1 && !eoc_s2);

    // -- Dynamic Protocol Parsing --
    // CMD is at the very top of the shift register
    wire [1:0]       cmd  = shift_reg[PKT_LEN-1 : PKT_LEN-2]; 
    // ADDR is immediately following CMD
    wire [1:0]       addr = shift_reg[PKT_LEN-3 : PKT_LEN-4];
    // Payload is the bottom WIDTH bits
    wire [WIDTH-1:0] pay  = shift_reg[WIDTH-1 : 0];

    // -- State Machine --
    localparam S_IDLE  = 2'b00;
    localparam S_SHIFT = 2'b01;
    localparam S_LATCH = 2'b10;

    assign ctrl_reg_out = ctrl_reg;
    assign eoc_flag_out = eoc_latch;
    
    // MISO Output: Drive MSB of buffer
    assign miso = cs ? 1'bz : miso_buffer[WIDTH-1];

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
            ctrl_reg    <= {WIDTH{1'b0}};
            data_reg    <= {WIDTH{1'b0}};
            info_reg    <= {{(WIDTH-4){1'b0}}, 4'hA}; // Dynamic sizing for fixed ID
            eoc_latch   <= 1'b0;
            bit_cnt     <= 0;
            shift_reg   <= 0;
            miso_buffer <= 0;
            eoc_sent_high <= 0;
        end else begin
            
            // Priority 1: Hardware Start
            if (hw_clear_start) begin
                ctrl_reg[1] <= 1'b0;
                eoc_latch   <= 1'b0;
            end
            // Priority 2: New Result
            else if (adc_eoc_rise) begin
                eoc_latch <= 1'b1;
                data_reg  <= adc_data_in; 
            end
            // Priority 3: SPI Clear Logic
            else if (state == S_LATCH) begin
                if (cmd == CMD_READ && addr == ADDR_DATA) begin
                    eoc_latch <= 1'b0;
                end
                if (cmd == CMD_READ && addr == ADDR_STATUS) begin
                    if (eoc_sent_high) eoc_latch <= 1'b0;
                end
            end

            case(state)
                S_IDLE: begin
                    bit_cnt <= 0;
                    if (!adc_eoc_rise) data_reg <= adc_data_in;
                    if(!cs) state <= S_SHIFT;
                end

                S_SHIFT: begin
                    if(cs) state <= S_IDLE;
                    else if(sck_rise) begin
                        shift_reg <= {shift_reg[PKT_LEN-2:0], mosi};
                        bit_cnt   <= bit_cnt + 1;
                        // Wait for full packet length
                        if (bit_cnt == PKT_LEN - 1) state <= S_LATCH;
                    end

                    if(!cs && sck_fall) miso_buffer <= {miso_buffer[WIDTH-2:0], 1'b0};

                    // Pre-load MISO: Happens after Header (4 bits) is received
                    if(!cs && bit_cnt == HDR_LEN && sck_fall) begin 
                         // Use dynamic slices to check partial shift_reg if needed, 
                         // or just rely on the final latch. 
                         // Note: To respond instantly after 4 bits, we peep at the 
                         // currently shifted bits. 
                         // In S_SHIFT, the bits are at the bottom LSBs as they come in.
                         // Header is [3:0] of shift_reg at this specific moment.
                         if (shift_reg[3:2] == CMD_READ) begin 
                           case(shift_reg[1:0])
                                ADDR_CTRL:   miso_buffer <= ctrl_reg;
                                ADDR_STATUS: begin
                                    // Status is usually fixed width, but we pad it to fit WIDTH
                                    miso_buffer <= {{(WIDTH-2){1'b0}}, adc_busy_in, eoc_latch};
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
                    if (addr == ADDR_CTRL) begin
                        case(cmd)
                            CMD_WRITE: ctrl_reg <= pay;
                            CMD_SET:   ctrl_reg <= ctrl_reg | pay;
                            CMD_CLEAR: ctrl_reg <= ctrl_reg & ~pay;
                            default: ;
                        endcase
                    end
                end
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule