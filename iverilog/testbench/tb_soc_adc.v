`timescale 1ns / 1ps

module tb_soc_adc;

    reg clk = 0;
    reg resetn = 0;
    wire trap;
    
    reg [11:0] analog_input;
    
    reg [31:0] expected_val;
    reg [31:0] next_target_addr;
    integer    test_phase = 0;

    soc_adc uut (
        .clk(clk),
        .resetn(resetn),
        .analog_volts(analog_input),
        .trap(trap)
    );

    always #10 clk = ~clk;

    // --- TEST SEQUENCER ---
    always @(posedge clk) begin
        if (uut.mem_valid && |uut.mem_wstrb && uut.mem_addr == next_target_addr) begin
            
            $display("[Time %t] CPU wrote %d (0x%h) to 0x%h", $time, uut.mem_wdata, uut.mem_wdata, uut.mem_addr);

            repeat(2) @(posedge clk);

            // Special Check for Abort Phase
            if (test_phase == 4) begin
                if (uut.mem_wdata == 32'hAB07) begin
                    $display("✅ ABORT TEST PASSED! Busy flag cleared.");
                    $display("\n=============================================");
                    $display("🎉 ALL TESTS PASSED (Single, Auto, Clock, Abort)");
                    $display("=============================================");
                    $finish;
                end else begin
                    $display("❌ ABORT FAIL! Expected 0xAB07, Got 0x%h", uut.mem_wdata);
                    $stop;
                end
            end
            // Normal Value Checks
            else if (uut.mem_wdata >= expected_val - 2 && uut.mem_wdata <= expected_val + 2) begin
                
                if (test_phase == 0) $display("✅ SINGLE SHOT (16kHz) PASSED! (Got %d)", uut.mem_wdata);
                else                 $display("✅ AUTO SAMPLE %0d (8kHz) PASSED! (Got %d)", test_phase, uut.mem_wdata);

                test_phase = test_phase + 1;

                case(test_phase)
                    1: begin
                        analog_input     = 12'd1000;
                        expected_val     = 12'd1000;
                        next_target_addr = 32'h404;
                        $display("-> Changing Input to 1000 for Auto Mode (8kHz)...");
                    end
                    2: begin
                        analog_input     = 12'd2000;
                        expected_val     = 12'd2000;
                        next_target_addr = 32'h408;
                        $display("-> Changing Input to 2000...");
                    end
                    3: begin
                        analog_input     = 12'd3000;
                        expected_val     = 12'd3000;
                        next_target_addr = 32'h40C;
                        $display("-> Changing Input to 3000...");
                    end
                    4: begin
                        // Setup for Abort Test
                        next_target_addr = 32'h410;
                        $display("-> Starting Abort Test (Disabling ADC)...");
                    end
                endcase

            end else begin
                $display("❌ FAIL! Expected approx %d, Got %d", expected_val, uut.mem_wdata);
                $stop;
            end
        end
    end

    initial begin
        $dumpfile("tb_soc_adc.vcd");
        $dumpvars(0, tb_soc_adc);

        $display("--- ADC SOC SIMULATION (COMPREHENSIVE) START ---");
        
        test_phase = 0;
        analog_input = 12'd2500;
        expected_val = 12'd2500;
        next_target_addr = 32'h400;

        resetn = 0;
        #200;
        resetn = 1;

        repeat(4000000) @(posedge clk);
        $display("❌ TIMEOUT: Test sequence did not complete.");
        $finish;
    end

endmodule