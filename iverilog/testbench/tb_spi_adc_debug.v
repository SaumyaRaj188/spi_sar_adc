`timescale 1ns / 1ps

module tb_spi_adc_debug;

    // ========================================================================
    // 1. Signals & Parameters
    // ========================================================================
    parameter SYS_CLK_FREQ = 50_000_000;
    parameter ADC_WIDTH    = 12;
    
    reg sys_clk;
    reg reset_;
    reg cs, sck, mosi;
    wire miso;

    reg comparator;
    wire [ADC_WIDTH-1:0] dac;
    wire sample_and_hold;
    wire pwr_gate;
    wire dac_rst;
    wire irq;
    wire vref_sel;

    reg [ADC_WIDTH-1:0] analog_input_val;
    reg [11:0] spi_read_data;

    // ========================================================================
    // 2. DUT Instantiation
    // ========================================================================
    spi_adc #(
        .SYS_CLK_FREQ(SYS_CLK_FREQ),
        .ADC_WIDTH(ADC_WIDTH)
    ) u_dut (
        .sys_clk(sys_clk),
        .reset_(reset_),
        .cs(cs), .sck(sck), .mosi(mosi), .miso(miso),
        .comparator(comparator),
        .dac(dac),
        .sample_and_hold(sample_and_hold),
        .pwr_gate(pwr_gate),
        .dac_rst(dac_rst),
        .irq(irq),
        .vref_sel(vref_sel)
    );

    // Clock
    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk; // 50MHz

    // Analog Model
    always @(dac or analog_input_val) begin
        #5 comparator = (analog_input_val >= dac) ? 1'b1 : 1'b0;
    end

    // ========================================================================
    // 3. SPI Tasks
    // ========================================================================
    task spi_write(input [1:0] addr, input [11:0] data);
        integer i;
        reg [15:0] frame;
        begin
            frame = {2'b01, addr, data}; 
            cs = 0;
            #100;
            for (i = 15; i >= 0; i = i - 1) begin
                mosi = frame[i];
                #200 sck = 1; 
                #200 sck = 0; 
            end
            #100; cs = 1; mosi = 0; #200;
        end
    endtask

    task spi_read(input [1:0] addr);
        integer i;
        reg [15:0] frame;
        begin
            frame = {2'b00, addr, 12'h000};
            spi_read_data = 0;
            cs = 0;
            #100;
            for (i = 15; i >= 0; i = i - 1) begin
                mosi = frame[i];
                #200 sck = 1; 
                #200 sck = 0; 
            end
            #100; cs = 1; mosi = 0; #200;
        end
    endtask
    
    reg [15:0] miso_shift;
    always @(posedge sck) if (!cs) miso_shift = {miso_shift[14:0], miso};

    // ========================================================================
    // 4. DEBUG MONITORS
    // ========================================================================
    
    // Internal Signals (Standard Verilog hierarchy access)
    wire [1:0] internal_adc_state = u_dut.u_controller.state;
    wire       internal_start_bit = u_dut.bit_start;
    wire       internal_en_n      = u_dut.adc_en_n;

    always @(internal_adc_state) begin
        case(internal_adc_state)
            2'b00: $display("[TIME %0t] ADC State: IDLE", $time);
            2'b01: $display("[TIME %0t] ADC State: INIT", $time);
            2'b10: $display("[TIME %0t] ADC State: CONVERT", $time);
            2'b11: $display("[TIME %0t] ADC State: FINISH", $time);
        endcase
    end

    always @(negedge internal_start_bit) begin
        if (reset_) $display("[TIME %0t] SPI Logic: START bit cleared by hardware.", $time);
    end

    always @(posedge u_dut.adc_busy) $display("[TIME %0t] Signal: ADC BUSY went HIGH", $time);
    always @(negedge u_dut.adc_busy) $display("[TIME %0t] Signal: ADC BUSY went LOW", $time);
    always @(posedge u_dut.adc_ack)  $display("[TIME %0t] Signal: ADC ACK (End of Conversion)", $time);
    always @(posedge irq)            $display("[TIME %0t] Signal: IRQ Triggered!", $time);

    // ========================================================================
    // 5. Main Test Sequence (Standard Verilog Compatible)
    // ========================================================================
    initial begin
        $dumpfile("tb_spi_adc_debug.vcd");
        $dumpvars(0, tb_spi_adc_debug);
        
        reset_ = 0; cs = 1; sck = 0; mosi = 0; comparator = 0;
        analog_input_val = 12'hA52;
        
        #500 reset_ = 1;
        
        $display("---------------------------------------------------");
        $display("DEBUG SIMULATION STARTED");
        $display("---------------------------------------------------");
        
        $display("[TIME %0t] Writing Config: Enable + Start + IRQ (0x013)", $time);
        spi_write(2'b00, 12'h013); 

        $display("[TIME %0t] Waiting for IRQ...", $time);
        
        fork : wait_logic
            begin : success_thread
                wait(irq == 1);
                $display("[TIME %0t] SUCCESS: IRQ detected.", $time);
                
                // Read Data
                spi_read(2'b10); 
                #200; 
                spi_read_data = miso_shift[11:0];
                $display("[TIME %0t] Read Data: 0x%h", $time, spi_read_data);
                
                // Disable the timeout thread since we succeeded
                disable timeout_thread;
            end
            
            begin : timeout_thread
                // Timeout logic INCREASED to 3,000,000 ns (3 ms)
                // This allows the 8kHz ADC (period 125us, total ~1.75ms) to finish.
                #3000000;
                $display("[TIME %0t] ERROR: Timeout waiting for IRQ!", $time);
                $display("Possible Causes:");
                $display("1. ADC Clock (adc_clk) is not toggling.");
                $display("2. ADC State Machine stuck in IDLE or CONVERT.");
                $display("3. START bit cleared too early.");
                
                // Disable the success thread
                disable success_thread;
                $finish;
            end
        join

        $display("---------------------------------------------------");
        $display("Checking Start Bit Status...");
        spi_read(2'b00);
        #200;
        if (miso_shift[1] == 0) $display("PASS: Start bit is 0.");
        else $display("FAIL: Start bit is 1.");
        
        $finish;
    end

endmodule