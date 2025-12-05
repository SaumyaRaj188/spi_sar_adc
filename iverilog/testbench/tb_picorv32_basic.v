`timescale 1 ns / 1 ps

module tb_top;
    // -------------------------------------------------------------------------
    // 1. Signals and Setup
    // -------------------------------------------------------------------------
    reg clk;
    reg resetn;
    wire trap;

    // Memory Interface Wires
    wire mem_valid;
    wire mem_instr;
    wire mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0] mem_wstrb;
    reg  [31:0] mem_rdata;

    // -------------------------------------------------------------------------
    // 2. Instantiate the PicoRV32 Core
    // -------------------------------------------------------------------------
    picorv32 #(
        .PROGADDR_RESET(32'h0000_0000) // Start executing at address 0
    ) uut (
        .clk(clk),
        .resetn(resetn),
        .trap(trap),
        .mem_valid(mem_valid),
        .mem_instr(mem_instr),
        .mem_ready(mem_ready),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_wstrb(mem_wstrb),
        .mem_rdata(mem_rdata)
    );

    // -------------------------------------------------------------------------
    // 3. Simple Memory Simulation (RAM + ROM combined)
    // -------------------------------------------------------------------------
    reg [31:0] memory [0:255]; // 256 words of memory (1KB total)
    reg mem_ready_reg;

    // Initialize Memory (Acting as ROM)
    initial begin
        // Program: Calculate 10 + 20 = 30 and store it to address 0x40
        
        // 1. ADDI x1, x0, 10  (Load 10 into x1)
        // Machine Code: 000000001010 00000 000 00001 0010011 -> 0x00A00093
        memory[0] = 32'h00A00093;

        // 2. ADDI x2, x0, 20  (Load 20 into x2)
        // Machine Code: 000000010100 00000 000 00010 0010011 -> 0x01400113
        memory[1] = 32'h01400113;

        // 3. ADD x3, x1, x2   (x3 = x1 + x2)
        // Machine Code: 0000000 00010 00001 000 00011 0110011 -> 0x002081B3
        memory[2] = 32'h002081B3;

        // 4. SW x3, 64(x0)    (Store x3 to address 64 aka 0x40)
        // Machine Code: 0000010 00011 00000 010 00000 0100011 -> 0x04302023
        memory[3] = 32'h04302023;

        // 5. EBREAK (Trap/Halt)
        memory[4] = 32'h00100073; 
    end

    // Memory Logic
    assign mem_ready = mem_ready_reg;

    always @(posedge clk) begin
        if (!resetn) begin
            mem_ready_reg <= 0;
            mem_rdata <= 0;
        end else begin
            // Default ready to 0
            mem_ready_reg <= 0;

            // If CPU wants to talk (mem_valid) and we aren't already done
            if (mem_valid && !mem_ready_reg) begin
                mem_ready_reg <= 1; // Ack the request next cycle
                
                // Address translation: RISC-V uses Byte address, Verilog array uses Word Index
                // Divide address by 4 (shift right 2)
                
                // READ OPERATION
                if (mem_wstrb == 0) begin
                    mem_rdata <= memory[mem_addr >> 2];
                end 
                
                // WRITE OPERATION (Simplified: assumes full 32-bit word write)
                else begin
                    if (mem_wstrb == 4'b1111) begin
                        memory[mem_addr >> 2] <= mem_wdata;
                        $display("MEMORY WRITE: Address 0x%h = Value %d (0x%h)", mem_addr, mem_wdata, mem_wdata);
                    end
                end
            end
        end
    end

    // -------------------------------------------------------------------------
    // 4. Clock and Simulation Control
    // -------------------------------------------------------------------------
    initial begin
        // Setup GTKWave
        $dumpfile("cpu_test.vcd");
        $dumpvars(0, tb_top);

        // Initialize signals
        clk = 0;
        resetn = 0;
        
        // Reset sequence
        #20 resetn = 1;

        // Run simulation
        #500;
        
        // Check result manually
        if (memory[16] === 30) 
            $display("SUCCESS: Memory[0x40] contains 30!");
        else 
            $display("FAILURE: Memory[0x40] contains %d", memory[16]);
            
        $finish;
    end

    always #5 clk = ~clk; // 10ns clock period

endmodule