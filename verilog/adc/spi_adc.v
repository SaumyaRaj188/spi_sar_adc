/*
 * =================================================================================
 * Module: spi_adc
 * Description: Top-level wrapper for the SPI-based ADC module. Integrates the 
 * standard SAR logic with the new automated BIST Engine via wrapper-level multiplexing.
 *
 * Author: Saumya Raj Singh
 * Date: 2026
 * License: MIT (Copyright (c) 2026 Saumya Raj Singh)
 * =================================================================================
 */

module spi_adc #(
    parameter SYS_CLK_FREQ = 10_000_000, // System Clock Frequency (e.g., 10MHz)
    parameter WIDTH    = 12
)(
    input  ext_clk_pin,   // External Pin
    input  int_rc_clk,    // Internal RC
    input  clk_src_sel,       // The Mux selector (0 = RC, 1 = Pin)
    input  reset_,
    
    // SPI Pins
    input  cs,
    input  sck,
    input  mosi,
    output miso,
    
    // External Controls
    input  comparator,     // From Analog Comparator
    output [WIDTH-1:0] dac,
    output sample_and_hold,
    output pwr_gate,
    output dac_rst,
    
    // Status/Interrupts
    output irq,            // Active-High Interrupt
    output vref_sel,       // Control wire for external reference (CTRL_REG[3])

    // ADC Clock
    output adc_clk_out
);

    // -- Internal Connections --
    wire [11:0] ctrl_reg;
    wire [11:0] adc_data_out;
    wire        adc_busy;
    wire        adc_ack;
    wire        eoc_flag;
    
    // BIST Internal Wires
    wire        bist_cmp_wire;
    wire        bist_done;
    wire        bist_done_pulse;
    wire        bist_pass;
    wire [11:0] misr_sig;
    
    // -- Control Bit Aliases --
    wire bit_en      = ctrl_reg[0]; // ADC_EN
    wire bit_start   = ctrl_reg[1]; // START
    wire bit_auto    = ctrl_reg[2]; // AUTO
    wire bit_vref    = ctrl_reg[3]; // VREF_SEL
    wire bit_int_en  = ctrl_reg[4]; // INT_EN
    wire bit_bist_en = ctrl_reg[5]; // NEW: BIST Enable Bit
    wire bit_clk_sel = ctrl_reg[6]; // CLK_SEL (0=8k, 1=16k)
    
    wire sys_clk; 
    assign sys_clk = clk_src_sel ? ext_clk_pin : int_rc_clk;

    // ============================================================================
    // BIST MULTIPLEXER (Wrapper-Based Test Isolation)
    // ============================================================================
    // Route the fake BIST sequence to the core when enabled, otherwise use physical pin
    wire cmp_to_core = bit_bist_en ? bist_cmp_wire : comparator;

    // -- 1. Clock Generation Logic --
    localparam CYCLES_PER_SAMPLE = WIDTH + 2;
    localparam DIV_16K = ((SYS_CLK_FREQ / 16000) / 2 / CYCLES_PER_SAMPLE);
    localparam DIV_8K  = ((SYS_CLK_FREQ / 8000) / 2 / CYCLES_PER_SAMPLE);
    
    reg [31:0] clk_cnt;
    reg        adc_clk_reg;
    wire       adc_clk = adc_clk_reg;
    wire [31:0] current_div = bit_clk_sel ? DIV_16K : DIV_8K;

    // Keep clock running if BIST is on
    wire adc_clk_enable = adc_busy || (bit_en && (bit_start || bit_auto || bit_bist_en));

    always @(posedge sys_clk or negedge reset_) begin
        if(!reset_) begin
            clk_cnt <= 0;
            adc_clk_reg <= 0;
        end else if (adc_clk_enable) begin
            if (clk_cnt >= current_div - 1) begin
                clk_cnt <= 0;
                adc_clk_reg <= ~adc_clk_reg;
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end else begin
            clk_cnt <= 0;
            adc_clk_reg <= 0;
        end
    end

    // -- 2. Start / Enable Logic --
    reg adc_en_n;       
    reg start_clear_req; 

    always @(posedge sys_clk or negedge reset_) begin
        if(!reset_) begin
            adc_en_n        <= 1'b1;
            start_clear_req <= 1'b0;
        end else begin
            
            if (!bit_en) begin
                adc_en_n <= 1'b1; // Global Shutdown
            end else if (bit_bist_en) begin
                // In BIST Mode: Run conversions automatically until the counter is done
                if (bist_done) adc_en_n <= 1'b1;
                else           adc_en_n <= 1'b0;
            end else begin
                // Normal Mode
                if (bit_auto || bit_start || (adc_busy && !adc_ack)) 
                    adc_en_n <= 1'b0; 
                else 
                    adc_en_n <= 1'b1; 
            end

            // Self-Clearing Logic
            if (bit_start && adc_busy) begin
                start_clear_req <= 1'b1;
            end else begin
                start_clear_req <= 1'b0;
            end
        end
    end

    // -- 3. Interrupt Logic --
    assign irq = eoc_flag & bit_int_en;
    assign vref_sel = bit_vref;

    // -- 4. Module Instantiations --
    
    // ADC Controller (Untouched pure logic block)
    adc_controller #(
        .WIDTH(WIDTH)
    ) u_controller (
        .clk             (adc_clk),
        .reset_          (reset_ && bit_en), 
        .en_             (adc_en_n),
        .comparator      (cmp_to_core),      // Use the multiplexed signal!
        .sample_and_hold (sample_and_hold),
        .pwr_gate        (pwr_gate),
        .dac_rst         (dac_rst),
        .ack             (adc_ack),
        .busy            (adc_busy),
        .dac             (dac),
        .data            (adc_data_out)
    );

    // The New BIST Engine
    adc_bist_engine #(
        .WIDTH(WIDTH),
        .CONV_COUNT(64)
    ) u_bist_engine (
        .clk             (adc_clk),
        .reset_          (reset_ && bit_en),
        .bist_en         (bit_bist_en),
        .adc_ack         (adc_ack),
        .adc_data        (adc_data_out),
        .bist_cmp_out    (bist_cmp_wire),
        .bist_done       (bist_done),
        .bist_done_pulse (bist_done_pulse),
        .bist_pass       (bist_pass),
        .misr_sig        (misr_sig)
    );

    // SPI Slave 
    adc_spi_slave #(
        .WIDTH(WIDTH)
    ) u_spi (
        .clk            (sys_clk),
        .reset_         (reset_),
        .cs             (cs),
        .sck            (sck),
        .mosi           (mosi),
        .miso           (miso),
        
        // Data & IRQ Multiplexing
        // If testing, send the MISR signature and pulse EOC only when fully done.
        .adc_data_in    (bit_bist_en ? misr_sig : adc_data_out),
        .adc_busy_in    (adc_busy),
        .adc_eoc_pulse  (bit_bist_en ? bist_done_pulse : adc_ack),       
        
        // Connections
        .hw_clear_start (start_clear_req),
        .bist_done_in   (bist_done),
        .bist_pass_in   (bist_pass),
        
        .ctrl_reg_out   (ctrl_reg),
        .eoc_flag_out   (eoc_flag)
    );

    assign adc_clk_out = adc_clk;

endmodule
