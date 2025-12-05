`timescale 1ns / 1ps

module tb_soc_adc;

    reg clk = 0;
    reg resetn = 0;
    wire trap;
    reg [11:0] analog_input = 12'd2500;

    soc_adc uut (
        .clk(clk),
        .resetn(resetn),
        .analog_volts(analog_input),
        .trap(trap)
    );

    always #10 clk = ~clk;

    // Helper variable to read back physical RAM content
    reg [31:0] physical_ram_val;

    // --- SMART MONITORING ---
    // Instead of waiting blindly, we snoop the RAM writes.
    always @(posedge clk) begin
        if (uut.mem_valid && |uut.mem_wstrb && uut.mem_addr == 32'h400) begin
            
            // Check if the value being written matches our expected result (approx 2500)
            // We filter out debug codes like 0xAAAA (43690) here.
            if (uut.mem_wdata == analog_input || 
               (uut.mem_wdata >= analog_input-1 && uut.mem_wdata <= analog_input+1)) begin
                
                $display("\n[Monitor] Bus Write Detected! CPU is writing: %d", uut.mem_wdata);
                
                // 1. Wait 2 clock cycles to ensure the write commits to the memory array
                repeat(2) @(posedge clk);

                // 2. Read the actual physical memory to confirm storage
                // Address 0x400 = Index 1024. Memory is Little Endian bytes.
                physical_ram_val = {
                    uut.memory[1027], 
                    uut.memory[1026], 
                    uut.memory[1025], 
                    uut.memory[1024]
                };

                if (physical_ram_val == uut.mem_wdata) begin
                    $display("✅ SUCCESS! Physical RAM[0x400] verified: %d", physical_ram_val);
                    $finish; // Stop simulation immediately
                end else begin
                    $display("❌ FAILURE! Bus wrote %d but RAM contains %d", uut.mem_wdata, physical_ram_val);
                    $stop;
                end
            end 
            else begin
                // Log debug codes (like 0xAAAA, 0xBBBB) so we can see progress
                $display("   [Monitor] CPU wrote: %d (0x%h)", uut.mem_wdata, uut.mem_wdata);
            end
        end
    end

    initial begin
        $dumpfile("soc_adc_test.vcd");
        $dumpvars(0, tb_soc_adc);

        $display("--- ADC SOC SIMULATION START ---");
        resetn = 0;
        #200;
        resetn = 1;

        // Safety Timeout
        // If we don't finish in 300,000 cycles, something is broken.
        repeat(300000) @(posedge clk);

        $display("❌ TIMEOUT: CPU never wrote the correct result.");
        $finish;
    end

endmodule