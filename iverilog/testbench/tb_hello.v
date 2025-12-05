`timescale 1ns / 1ps

module tb_hello;

    reg clk = 0;
    reg resetn = 0;
    wire trap;

    // Instantiate our Basic SoC
    soc_basic uut (
        .clk(clk),
        .resetn(resetn),
        .trap(trap)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("hello.vcd");
        $dumpvars(0, tb_hello);

        // Reset Sequence
        resetn = 0;
        #100;
        resetn = 1;
        
        $display("--- Simulation Started ---");
        $display("Waiting for CPU to calculate 10 + 20...");

        // Run for 2000 cycles (Plenty of time for C code to startup and run)
        #20000;

        $display("--- Checking Result ---");
        
        // Peek directly into the SoC's memory array
        // Address 0x400 (1024 bytes) -> Index 1024/4 = 256
        if (uut.memory[256] === 30) begin
            $display("✅ SUCCESS! Memory[0x400] contains 30.");
        end else begin
            $display("❌ FAILURE! Memory[0x400] contains %d (Expected 30)", uut.memory[256]);
            $display("   (If it is 0, the CPU might not have run far enough or crashed)");
        end

        $finish;
    end

endmodule