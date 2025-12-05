module gpio_bridge (
    input             clk,
    input             resetn,

    // PicoRV32 Memory Interface
    input             mem_valid,
    output            mem_ready,
    input      [31:0] mem_addr,
    input      [31:0] mem_wdata,
    input      [ 3:0] mem_wstrb,
    output     [31:0] mem_rdata,

    // Physical SPI Pins
    output reg        spi_cs,
    output reg        spi_sck,
    output reg        spi_mosi,
    input             spi_miso
);

    // Hardcoded Base Address for this Peripheral
    localparam GPIO_BASE = 32'h2000_0000;

    // Select Signal: Address matches and CPU is requesting
    wire sel = (mem_valid && (mem_addr == GPIO_BASE));

    // ------------------------------------------------------------------------
    // 1. WRITE LOGIC (CPU -> Wires)
    // ------------------------------------------------------------------------
    // Mapping: Bit 0=SCK, Bit 1=MOSI, Bit 2=CS
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            spi_cs   <= 1'b1; // Default CS High (Inactive)
            spi_sck  <= 1'b0;
            spi_mosi <= 1'b0;
        end else if (sel && |mem_wstrb) begin
            // Update output pins based on data written by CPU
            spi_sck  <= mem_wdata[0];
            spi_mosi <= mem_wdata[1];
            spi_cs   <= mem_wdata[2];
        end
    end

    // ------------------------------------------------------------------------
    // 2. READ LOGIC (Wires -> CPU)
    // ------------------------------------------------------------------------
    // Return: Bit 0=SCK, 1=MOSI, 2=CS, 3=MISO
    assign mem_rdata = {28'd0, spi_miso, spi_cs, spi_mosi, spi_sck};

    // ------------------------------------------------------------------------
    // 3. HANDSHAKE (Ready Signal)
    // ------------------------------------------------------------------------
    reg ready_reg;
    always @(posedge clk or negedge resetn) begin
        if (!resetn) ready_reg <= 0;
        else         ready_reg <= sel && !ready_reg;
    end
    assign mem_ready = ready_reg;

endmodule