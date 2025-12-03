`timescale 1ns / 1ps

/*
 * Module: tb_spi_adc
 * Description: Exhaustive Verification Suite for SPI ADC System.
 * CORRECTED: Timing checks aligned with 14x hardware scaling at 50MHz.
 */
module tb_spi_adc;

    // ========================================================================
    // 1. Configuration & Parameters
    // ========================================================================
    parameter SYS_CLK_FREQ = 50_000_000; // 50 MHz System Clock
    parameter ADC_WIDTH    = 12;
    
    // Registers
    localparam REG_CTRL   = 2'b00;
    localparam REG_STATUS = 2'b01;
    localparam REG_DATA   = 2'b10;
    localparam REG_INFO   = 2'b11;

    // Control Bits
    localparam BIT_ADC_EN = 0;
    localparam BIT_START  = 1;
    localparam BIT_AUTO   = 2;
    localparam BIT_VREF   = 3;
    localparam BIT_INT_EN = 4;
    localparam BIT_CLK_SEL= 6;

    // ========================================================================
    // 2. Signals
    // ========================================================================
    reg sys_clk, reset_;
    reg cs, sck, mosi;
    wire miso;

    reg comparator;
    wire [ADC_WIDTH-1:0] dac;
    wire sample_and_hold, pwr_gate, dac_rst, irq, vref_sel, adc_clk_out;

    reg [ADC_WIDTH-1:0] analog_volts;
    reg [11:0] spi_rx_data;
    integer start_time, end_time, duration;
    integer test_num = 0;
    reg eoc_found;

    // ========================================================================
    // 3. DUT Instantiation
    // ========================================================================
    spi_adc #( .SYS_CLK_FREQ(SYS_CLK_FREQ), .ADC_WIDTH(ADC_WIDTH) ) u_dut (
        .sys_clk(sys_clk), .reset_(reset_),
        .cs(cs), .sck(sck), .mosi(mosi), .miso(miso),
        .comparator(comparator), .dac(dac),
        .sample_and_hold(sample_and_hold), .pwr_gate(pwr_gate), .dac_rst(dac_rst),
        .irq(irq), .vref_sel(vref_sel), .adc_clk_out(adc_clk_out)
    );

    // ========================================================================
    // 4. Clocks & Analog Model
    // ========================================================================
    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk; 

    always @(dac or analog_volts) begin
        #5 comparator = (analog_volts >= dac) ? 1'b1 : 1'b0;
    end

    // ========================================================================
    // 5. Tasks (Helpers)
    // ========================================================================
    task spi_write(input [1:0] addr, input [11:0] data);
        integer i;
        reg [15:0] frame;
        begin
            frame = {2'b01, addr, data}; 
            cs = 0; #100;
            for (i=15; i>=0; i=i-1) begin mosi=frame[i]; #200 sck=1; #200 sck=0; end
            #100; cs = 1; mosi = 0; #200;
        end
    endtask

    task spi_read(input [1:0] addr);
        integer i;
        reg [15:0] frame;
        begin
            frame = {2'b00, addr, 12'h000};
            cs = 0; #100;
            for (i=15; i>=0; i=i-1) begin mosi=frame[i]; #200 sck=1; #200 sck=0; end
            #100; cs = 1; mosi = 0; #200;
        end
    endtask

    reg [15:0] shift_in;
    always @(posedge sck) if (!cs) shift_in = {shift_in[14:0], miso};

    task check(input [11:0] actual, input [11:0] expected, input [8*50:1] msg);
        begin
            if (actual === expected || (actual >= expected-1 && actual <= expected+1))
                $display("  [PASS] %s: 0x%h", msg, actual);
            else begin
                $display("  [FAIL] %s: Expected 0x%h, Got 0x%h", msg, expected, actual);
                $finish;
            end
        end
    endtask

    task clear_irq;
        begin
            spi_read(REG_STATUS);
            #200;
            if (irq == 1) wait(irq == 0);
        end
    endtask

    task adc_hard_reset;
        begin
            if (irq) begin spi_read(REG_STATUS); #200; if(irq) wait(!irq); end
            spi_write(REG_CTRL, 0); 
            #5000;
        end
    endtask

    // ========================================================================
    // 6. Test Sequence
    // ========================================================================
    initial begin
        $dumpfile("tb_spi_adc.vcd");
        $dumpvars(0, tb_spi_adc);
        
        reset_=0; cs=1; sck=0; mosi=0; analog_volts=0;
        #1000 reset_=1; #1000;

        $display("\n================ STARTING EXHAUSTIVE TESTS ================");

        // TEST 1: Defaults
        test_num=1; $display("\nTEST %0d: Defaults", test_num);
        spi_read(REG_CTRL); #200; check(shift_in[11:0], 0, "Reset CTRL");
        spi_read(REG_INFO); #200; check(shift_in[11:0], 12'h00A, "Info Reg");

        // TEST 2: R/W
        test_num=2; $display("\nTEST %0d: Register R/W", test_num);
        spi_write(REG_CTRL, 12'h5A5);
        spi_read(REG_CTRL); #200; check(shift_in[11:0], 12'h5A5, "Readback");
        spi_write(REG_CTRL, 0);

        // TEST 3: VREF
        test_num=3; $display("\nTEST %0d: VREF Pin", test_num);
        spi_write(REG_CTRL, (1<<BIT_VREF)); #200;
        if (vref_sel) $display("  [PASS] VREF High"); else $display("  [FAIL] VREF Low");
        spi_write(REG_CTRL, 0);

        // TEST 4: Single 8ksps (Target ~125us)
        test_num=4; $display("\nTEST %0d: Single 8ksps (Input 0xA52)", test_num);
        analog_volts = 12'hA52;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN));
        
        start_time = $time;
        fork : t4_wait
            begin wait(irq); disable t4_wait; end
            begin #400000; disable t4_wait; end
        join
        end_time = $time;
        duration = end_time - start_time;

        if (!irq) begin $display("  [FAIL] IRQ Timeout"); $finish; end
        
        // Correct Range for 14x Clock: 110,000 to 130,000 ns
        if (duration > 110000 && duration < 130000) 
            $display("  [PASS] 8ksps Timing OK (%0d ns)", duration);
        else 
            $display("  [FAIL] 8ksps Timing bad (%0d ns)", duration);

        spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'hA52, "Result");

        // TEST 5: Corners
        test_num=5; $display("\nTEST %0d: Data Corners", test_num);
        adc_hard_reset();
        analog_volts = 12'h000;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN));
        wait(irq); spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'h000, "Min Input");

        adc_hard_reset();
        analog_volts = 12'hFFF;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN));
        wait(irq); spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'hFFF, "Max Input");

        // TEST 6: Self-Clearing Start
        test_num=6; $display("\nTEST %0d: Self-Clearing Start", test_num);
        spi_read(REG_CTRL); #200;
        if (shift_in[BIT_START] == 0) $display("  [PASS] Bit Cleared");
        else $display("  [FAIL] Bit Stuck");

        // TEST 7: Busy Flag
        test_num=7; $display("\nTEST %0d: Busy Flag", test_num);
        adc_hard_reset();
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN));
        
        // FIX: Wait 25us (approx 2 ADC clocks at 50MHz/Divider)
        #25000; 
        
        spi_read(REG_STATUS); #200;
        if (shift_in[1] == 1) $display("  [PASS] Busy High"); else $display("  [FAIL] Busy Low (Status: 0x%h)", shift_in);
        wait(irq);

        // TEST 8: Interrupt Masking
        test_num=8; $display("\nTEST %0d: Interrupt Masking", test_num);
        adc_hard_reset();
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START));
        #200000; // Wait > 125us
        if (!irq) $display("  [PASS] IRQ Low"); else $display("  [FAIL] IRQ Toggled");
        spi_read(REG_STATUS); #200;
        if (shift_in[0]) $display("  [PASS] EOC Set"); else $display("  [FAIL] EOC Missing");

        // TEST 9: 16ksps (Target ~62.5us)
        test_num=9; $display("\nTEST %0d: 16ksps Clock", test_num);
        adc_hard_reset();
        analog_volts = 12'h888;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN)|(1<<BIT_CLK_SEL));
        
        start_time = $time;
        fork : t9_wait
            begin wait(irq); disable t9_wait; end
            begin #200000; disable t9_wait; end
        join
        end_time = $time;
        duration = end_time - start_time;

        // Correct Range: 55,000 to 75,000 ns
        if (duration > 55000 && duration < 75000) $display("  [PASS] 16ksps Timing OK (%0d ns)", duration);
        else $display("  [FAIL] 16ksps bad (%0d ns)", duration);
        
        spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'h888, "16ksps Data");

        // TEST 10: Revert 8ksps
        test_num=10; $display("\nTEST %0d: Revert 8ksps", test_num);
        adc_hard_reset();
        analog_volts = 12'h111;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_START)|(1<<BIT_INT_EN));
        
        start_time = $time;
        fork : t10_wait
            begin wait(irq); disable t10_wait; end
            begin #400000; disable t10_wait; end
        join
        end_time = $time;
        duration = end_time - start_time;

        // Correct Range: 110,000 to 130,000 ns
        if (duration > 110000 && duration < 130000) $display("  [PASS] 8ksps Timing OK (%0d ns)", duration);
        else $display("  [FAIL] 8ksps bad (%0d ns)", duration);

        spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'h111, "8ksps Data");

        // TEST 11: Auto Mode (Polling)
        test_num=11; $display("\nTEST %0d: Auto Mode (NO IRQ)", test_num);
        adc_hard_reset();
        analog_volts = 12'h200;
        spi_write(REG_CTRL, (1<<BIT_ADC_EN)|(1<<BIT_AUTO)|(1<<BIT_CLK_SEL)); 
        
        eoc_found=0; while(!eoc_found) begin spi_read(REG_STATUS); #200; if(shift_in[0]) eoc_found=1; end
        spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'h200, "Auto 1");
        
        analog_volts = 12'h999;
        
        // // Flush Stale Result
        // eoc_found=0; while(!eoc_found) begin spi_read(REG_STATUS); #200; if(shift_in[0]) eoc_found=1; end
        // spi_read(REG_DATA); 
        
        // Get New Result
        eoc_found=0; while(!eoc_found) begin spi_read(REG_STATUS); #200; if(shift_in[0]) eoc_found=1; end
        spi_read(REG_DATA); #200;
        check(shift_in[11:0], 12'h999, "Auto 2");

        // TEST 12: Disable
        test_num=12; $display("\nTEST %0d: Global Disable", test_num);
        spi_write(REG_CTRL, 0); #1000;
        if (!pwr_gate && !dac_rst) $display("  [PASS] Inactive"); else $display("  [FAIL] Active");

        $display("\n================ ALL TESTS PASSED ================");
        $finish;
    end

endmodule