`timescale 1ns / 1ps

module soc_basic (
    input clk,
    input resetn,
    output trap
);

    // ----------------------------------------------------------------
    // 1. Interconnect Wires
    // ----------------------------------------------------------------
    wire        mem_valid;
    wire        mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0]  mem_wstrb;
    reg  [31:0] mem_rdata;

    // ----------------------------------------------------------------
    // 2. PicoRV32 Core
    // ----------------------------------------------------------------
    picorv32 #(
        .PROGADDR_RESET(32'h0000_0000), // Start at address 0
        .STACKADDR(32'h0000_4000)       // Initial stack pointer
    ) cpu (
        .clk       (clk),
        .resetn    (resetn),
        .trap      (trap),
        .mem_valid (mem_valid),
        .mem_instr (1'b0), // Unused in this simple config
        .mem_ready (mem_ready),
        .mem_addr  (mem_addr),
        .mem_wdata (mem_wdata),
        .mem_wstrb (mem_wstrb),
        .mem_rdata (mem_rdata)
    );

    // ----------------------------------------------------------------
    // 3. Memory (16KB RAM)
    // ----------------------------------------------------------------
    // 16KB = 4096 words of 32-bits
    reg [31:0] memory [0:4095]; 

    // Load the Hex file automatically
    initial begin
        $readmemh("riscv_toolchain/firmware/firmware.hex", memory);
    end

    // Memory Logic
    reg mem_ready_reg;
    
    always @(posedge clk) begin
        if (!resetn) begin
            mem_ready_reg <= 0;
        end else begin
            // 1. Handshake: Ready goes high 1 cycle after Valid
            mem_ready_reg <= mem_valid && !mem_ready_reg;

            // 2. Read/Write Logic
            if (mem_valid && !mem_ready_reg) begin
                
                // WRITE: Only if write strobe is active
                if (|mem_wstrb) begin
                    // Word-aligned write (Simplified for test)
                    memory[mem_addr >> 2] <= mem_wdata;
                    
                    // DEBUG: Print to console so we can see it happen
                    $display("[RAM] Write at 0x%h = Value %d (0x%h)", mem_addr, mem_wdata, mem_wdata);
                end 
                
                // READ: Always read the address (Standard RAM behavior)
                mem_rdata <= memory[mem_addr >> 2];
            end
        end
    end

    assign mem_ready = mem_ready_reg;

endmodule