`timescale 1ns / 1ps

module soc_basic (
    input clk,
    input resetn,
    output trap
);

    // ----------------------------------------------------------------
    // 1. Interconnect
    // ----------------------------------------------------------------
    wire        mem_valid;
    wire        mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0]  mem_wstrb;
    reg  [31:0] mem_rdata;
    
    // Wire for instruction fetch indication
    wire        mem_instr;

    // ----------------------------------------------------------------
    // 2. CPU Instance
    // ----------------------------------------------------------------
    picorv32 #(
        .PROGADDR_RESET(32'h0000_0000),
        .STACKADDR(32'h0000_4000) // 16KB Top
    ) cpu (
        .clk       (clk),
        .resetn    (resetn),
        .trap      (trap),
        .mem_valid (mem_valid),
        .mem_instr (mem_instr),
        .mem_ready (mem_ready),
        .mem_addr  (mem_addr),
        .mem_wdata (mem_wdata),
        .mem_wstrb (mem_wstrb),
        .mem_rdata (mem_rdata)
    );

    // ----------------------------------------------------------------
    // 3. Memory (Byte-Addressable 16KB)
    // ----------------------------------------------------------------
    // 16384 bytes = 16KB. Index is 0 to 16383.
    reg [7:0] memory [0:16383]; 
    
    // FIX: Declare integer outside the initial block
    integer i;

    initial begin
        // Initialize to zero to avoid 'x'
        for (i=0; i<16384; i=i+1) memory[i] = 8'h00;

        // Load Firmware (Bytes)
        $readmemh("riscv_toolchain/firmware/firmware.hex", memory);
    end

    // ----------------------------------------------------------------
    // 4. Memory Controller
    // ----------------------------------------------------------------
    reg mem_ready_reg;
    
    always @(posedge clk) begin
        if (!resetn) begin
            mem_ready_reg <= 0;
        end else begin
            // Handshake
            mem_ready_reg <= mem_valid && !mem_ready_reg;

            if (mem_valid && !mem_ready_reg) begin
                
                // --- WRITE (Little Endian) ---
                if (|mem_wstrb) begin
                    if (mem_wstrb[0]) memory[mem_addr + 0] <= mem_wdata[7:0];
                    if (mem_wstrb[1]) memory[mem_addr + 1] <= mem_wdata[15:8];
                    if (mem_wstrb[2]) memory[mem_addr + 2] <= mem_wdata[23:16];
                    if (mem_wstrb[3]) memory[mem_addr + 3] <= mem_wdata[31:24];
                    
                    // Debug output
                    if (mem_addr == 32'h400) begin
                         $display("[RAM] Write at 0x400 detected! Data: %d", mem_wdata);
                    end
                end 
                
                // --- READ (Little Endian) ---
                // Combine 4 bytes into 1 word
                mem_rdata <= { 
                    memory[mem_addr + 3], 
                    memory[mem_addr + 2], 
                    memory[mem_addr + 1], 
                    memory[mem_addr + 0] 
                };
            end
        end
    end

    assign mem_ready = mem_ready_reg;

endmodule