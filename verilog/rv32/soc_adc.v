`timescale 1ns / 1ps

module soc_adc (
    input clk,
    input resetn,
    
    // Analog Environment (For Simulation)
    input [11:0] analog_volts,
    output       trap
);

    // ----------------------------------------------------------------
    // 1. Interconnect Signals
    // ----------------------------------------------------------------
    wire        mem_valid;
    wire        mem_instr;
    wire        mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0]  mem_wstrb;
    wire [31:0] mem_rdata;

    // Bus Splitting
    wire        ram_sel   = (mem_addr < 32'h2000_0000);
    wire        gpio_sel  = (mem_addr >= 32'h2000_0000);
    
    // FIX: ram_rdata must be 'reg' to be assigned in always block
    reg  [31:0] ram_rdata; 
    wire [31:0] gpio_rdata;
    
    wire        ram_ready, gpio_ready;

    // Muxing the read data based on selection
    assign mem_ready = ram_sel ? ram_ready : gpio_ready;
    assign mem_rdata = ram_sel ? ram_rdata : gpio_rdata;

    // SPI Signals
    wire cs, sck, mosi, miso;
    
    // ADC Signals
    wire [11:0] dac_out;
    wire        comp_val = (dac_out < analog_volts); // Analog Comparator Model

    // ----------------------------------------------------------------
    // 2. CPU (PicoRV32)
    // ----------------------------------------------------------------
    picorv32 #(
        .PROGADDR_RESET(32'h0000_0000),
        .STACKADDR(32'h0000_4000) // 16KB Top
    ) cpu (
        .clk(clk), .resetn(resetn), .trap(trap),
        .mem_valid(mem_valid), .mem_instr(mem_instr), .mem_ready(mem_ready),
        .mem_addr(mem_addr), .mem_wdata(mem_wdata), .mem_wstrb(mem_wstrb),
        .mem_rdata(mem_rdata)
    );

    // ----------------------------------------------------------------
    // 3. RAM (16KB Byte-Addressable)
    // ----------------------------------------------------------------
    reg [7:0] memory [0:16383];
    integer i;

    initial begin
        for(i=0; i<16384; i=i+1) memory[i] = 0;
        // Load the firmware
        $readmemh("riscv_toolchain/firmware/firmware.hex", memory);
    end

    reg ram_ready_reg;
    always @(posedge clk) begin
        if (!resetn) ram_ready_reg <= 0;
        else begin
            ram_ready_reg <= ram_sel && mem_valid && !ram_ready_reg;
            
            if (ram_sel && mem_valid && !ram_ready_reg) begin
                // Write
                if (mem_wstrb[0]) memory[mem_addr+0] <= mem_wdata[7:0];
                if (mem_wstrb[1]) memory[mem_addr+1] <= mem_wdata[15:8];
                if (mem_wstrb[2]) memory[mem_addr+2] <= mem_wdata[23:16];
                if (mem_wstrb[3]) memory[mem_addr+3] <= mem_wdata[31:24];
                
                // FIX: Use non-blocking assignment and remove 'assign' keyword
                ram_rdata <= {
                    memory[mem_addr+3], 
                    memory[mem_addr+2], 
                    memory[mem_addr+1], 
                    memory[mem_addr+0]
                };
                
                // Debug Print for C Code Result
                if (|mem_wstrb && mem_addr == 32'h400) 
                    $display("[RAM] Firmware wrote Result: %d", mem_wdata);
            end
        end
    end
    assign ram_ready = ram_ready_reg;

    // ----------------------------------------------------------------
    // 4. GPIO Bridge
    // ----------------------------------------------------------------
    gpio_bridge bridge (
        .clk(clk), .resetn(resetn),
        .mem_valid(mem_valid), .mem_ready(gpio_ready),
        .mem_addr(mem_addr), .mem_wdata(mem_wdata), .mem_wstrb(mem_wstrb),
        .mem_rdata(gpio_rdata),
        .spi_cs(cs), .spi_sck(sck), .spi_mosi(mosi), .spi_miso(miso)
    );

    // ----------------------------------------------------------------
    // 5. SPI ADC (Your Hardware)
    // ----------------------------------------------------------------
    spi_adc #( .SYS_CLK_FREQ(50_000_000) ) u_adc (
        .sys_clk(clk), .reset_(resetn),
        .cs(cs), .sck(sck), .mosi(mosi), .miso(miso),
        .comparator(comp_val), .dac(dac_out),
        .sample_and_hold(), .pwr_gate(), .dac_rst(), 
        .irq(), .vref_sel(), .adc_clk_out()
    );

endmodule