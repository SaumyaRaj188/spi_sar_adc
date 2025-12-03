/*
 * Module: spi_adc
 * Description: Top-Level Wrapper.
 * - Instantiates adc_controller and adc_spi_slave.
 * - Generates adc_clk based on CLK_SEL.
 * - Manages 'Self-Clearing' START bit logic.
 * - Generates Interrupts from EOC.
 */
module spi_adc #(
    parameter SYS_CLK_FREQ = 50_000_000, // System Clock Frequency (e.g., 50MHz)
    parameter ADC_WIDTH    = 12
)(
    input  sys_clk,
    input  reset_,
    
    // SPI Pins
    input  cs,
    input  sck,
    input  mosi,
    output miso,
    
    // External Controls
    input  comparator,     // From Analog Comparator
    output [ADC_WIDTH-1:0] dac,
    output sample_and_hold,
    output pwr_gate,
    output dac_rst,
    
    // Status/Interrupts
    output irq,            // Active-High Interrupt
    output vref_sel        // Control wire for external reference (CTRL_REG[3])
);

    // -- Internal Connections --
    wire [11:0] ctrl_reg;
    wire [11:0] adc_data_out;
    wire        adc_busy;
    wire        adc_ack;
    wire        eoc_flag;
    
    // -- Control Bit Aliases (From README) --
    wire bit_en      = ctrl_reg[0]; // ADC_EN
    wire bit_start   = ctrl_reg[1]; // START
    wire bit_auto    = ctrl_reg[2]; // AUTO
    wire bit_vref    = ctrl_reg[3]; // VREF_SEL
    wire bit_int_en  = ctrl_reg[4]; // INT_EN
    wire bit_clk_sel = ctrl_reg[6]; // CLK_SEL (0=8k, 1=16k)

    // -- 1. Clock Generation Logic --
    // We derive adc_clk from sys_clk. 
    // Example: If Sys=50MHz, 16kHz div=3125, 8kHz div=6250.
    // Toggling happens at half that count.
    
    localparam DIV_16K = (SYS_CLK_FREQ / 16000) / 2;
    localparam DIV_8K  = (SYS_CLK_FREQ / 8000) / 2;
    
    reg [31:0] clk_cnt;
    reg        adc_clk_reg;
    wire       adc_clk = adc_clk_reg;
    wire [31:0] current_div = bit_clk_sel ? DIV_16K : DIV_8K;

    always @(posedge sys_clk or negedge reset_) begin
        if(!reset_) begin
            clk_cnt <= 0;
            adc_clk_reg <= 0;
        end else begin
            if (clk_cnt >= current_div - 1) begin
                clk_cnt <= 0;
                adc_clk_reg <= ~adc_clk_reg;
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end
    end

    // -- 2. Start / Enable Logic --
    // The ADC Controller uses active-low en_.
    
    reg adc_en_n;       // The actual signal to the controller
    reg start_clear_req; // Signal to slave to clear the START bit

    always @(posedge sys_clk or negedge reset_) begin
        if(!reset_) begin
            adc_en_n        <= 1'b1;
            start_clear_req <= 1'b0;
        end else begin
            
            // --- FIXED ENABLE LOGIC ---
            // Enable ADC (Low) if:
            // 1. Auto Mode is ON
            // 2. Start Bit is ON
            // 3. ADC is currently BUSY converting (Keep it enabled so it doesn't abort!)
            //    BUT: release it (High) when ACK arrives so it stops in Single Mode.
            
            if (!bit_en) begin
                adc_en_n <= 1'b1; // Global Shutdown
            end else begin
                if (bit_auto || bit_start || (adc_busy && !adc_ack)) 
                    adc_en_n <= 1'b0; // Active Low
                else 
                    adc_en_n <= 1'b1; // Idle High
            end

            // --- Self-Clearing Logic ---
            // If we commanded a START, and the ADC confirms it is BUSY,
            // we tell the Slave to clear the bit.
            if (bit_start && adc_busy) begin
                start_clear_req <= 1'b1;
            end else begin
                start_clear_req <= 1'b0;
            end
        end
    end

    // -- 3. Interrupt Logic --
    // IRQ generates when EOC is set AND Interrupts are enabled
    assign irq = eoc_flag & bit_int_en;
    
    // -- 4. VREF Output --
    assign vref_sel = bit_vref;

    // -- 5. Module Instantiations --
    
    // ADC Controller (Standard SAR Logic)
    adc_controller #(
        .WIDTH(ADC_WIDTH)
    ) u_controller (
        .clk             (adc_clk),
        .reset_          (reset_ && bit_en), 
        .en_             (adc_en_n),
        .comparator      (comparator),
        .sample_and_hold (sample_and_hold),
        .pwr_gate        (pwr_gate),
        .dac_rst         (dac_rst),
        .ack             (adc_ack),
        .busy            (adc_busy),
        .dac             (dac),
        .data            (adc_data_out)
    );

    // SPI Slave (Register Interface)
    adc_spi_slave u_spi (
        .clk            (sys_clk),
        .reset_         (reset_),
        .cs             (cs),
        .sck            (sck),
        .mosi           (mosi),
        .miso           (miso),
        
        // Connections
        .adc_data_in    (adc_data_out),
        .adc_busy_in    (adc_busy),
        .adc_eoc_pulse  (adc_ack),       
        .hw_clear_start (start_clear_req),
        .ctrl_reg_out   (ctrl_reg),
        .eoc_flag_out   (eoc_flag)
    );

endmodule