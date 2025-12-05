`timescale 1ns / 1ps

module tb_soc_basic;

    reg clk = 0;
    reg resetn = 0;
    wire trap;

    soc_basic uut (
        .clk(clk),
        .resetn(resetn),
        .trap(trap)
    );

    always #10 clk = ~clk;

    // Helper to read 32-bit word from byte array
    function [31:0] read_ram_word;
        input [31:0] addr;
        begin
            read_ram_word = {
                uut.memory[addr+3],
                uut.memory[addr+2],
                uut.memory[addr+1],
                uut.memory[addr+0]
            };
        end
    endfunction

    initial begin
        $dumpfile("soc_test.vcd");
        $dumpvars(0, tb_soc_basic);

        $display("--- SIMULATION START ---");
        resetn = 0;
        #200;
        resetn = 1;
        
        // Wait loop with Trap Check
        repeat (20000) begin
            @(posedge clk);
            if (trap) begin
                $display("❌ CPU CRASHED (Trap Signal High) at time %t", $time);
                $finish;
            end
        end

        $display("--- CPU Time Limit Reached ---");

        // Check Result
        // We look at bytes 0x400, 401, 402, 403
        if (read_ram_word(32'h400) === 30) begin
            $display("✅ SUCCESS! RAM[0x400] contains 30 (0x1E)");
        end else begin
            $display("❌ FAIL. RAM[0x400] = %d (Expected 30)", read_ram_word(32'h400));
        end

        $finish;
    end

endmodule