`timescale 1ns / 1ps

module tb_spi_adc;

    // ========================================================================
    // 1. Signals & Parameters
    // ========================================================================
    parameter SYS_CLK_FREQ = 50_000_000;
    parameter ADC_WIDTH    = 12;
    
    // Clock and Reset
    reg sys_clk;
    reg reset_;

    // SPI Interface
    reg cs;
    reg sck;
    reg mosi;
    wire miso;

    // ADC / Hardware Interface
    reg comparator;
    wire [ADC_WIDTH-1:0] dac;
    wire sample_and_hold;
    wire pwr_gate;
    wire dac_rst;
    wire irq;
    wire vref_sel;

    // Simulation Variables
    reg [ADC_WIDTH-1:0] analog_input_val; // The "voltage" we want to measure
    reg [11:0] spi_read_data;             // Data read back from SPI

    // ========================================================================
    // 2. DUT Instantiation
    // ========================================================================
    spi_adc #(
        .SYS_CLK_FREQ(SYS_CLK_FREQ),
        .ADC_WIDTH(ADC_WIDTH)
    ) u_dut (
        .sys_clk(sys_clk),
        .reset_(reset_),
        
        .cs(cs),
        .sck(sck),
        .mosi(mosi),
        .miso(miso),
        
        .comparator(comparator),
        .dac(dac),
        .sample_and_hold(sample_and_hold),
        .pwr_gate(pwr_gate),
        .dac_rst(dac_rst),
        
        .irq(irq),
        .vref_sel(vref_sel)
    );

    // ========================================================================
    // 3. Clock Generation (50 MHz)
    // ========================================================================
    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk; // 20ns period

    // ========================================================================
    // 4. Analog Model (The "Comparator")
    // ========================================================================
    // This block behaves like the physical comparator circuit.
    // If the DAC voltage is less than our "input voltage", comparator outputs 1.
    // We add a small delay to simulate component response time.
    always @(dac or analog_input_val) begin
        #5 comparator = (analog_input_val >= dac) ? 1'b1 : 1'b0;
    end

    // ========================================================================
    // 5. SPI Tasks
    // ========================================================================
    
    // Task to Write to a Register
    task spi_write(input [1:0] addr, input [11:0] data);
        integer i;
        reg [15:0] frame;
        begin
            // Construct Frame: [CMD(01), ADDR, DATA]
            frame = {2'b01, addr, data}; 
            
            cs = 0;
            #100; // Setup time
            
            for (i = 15; i >= 0; i = i - 1) begin
                mosi = frame[i];
                #200 sck = 1; // Rising Edge (Slave samples)
                #200 sck = 0; // Falling Edge
            end
            
            #100;
            cs = 1;
            mosi = 0;
            #200; // Inter-frame delay
        end
    endtask

    // Task to Read from a Register
    task spi_read(input [1:0] addr);
        integer i;
        reg [15:0] frame;
        begin
            // Construct Frame: [CMD(00), ADDR, 000...]
            frame = {2'b00, addr, 12'h000};
            spi_read_data = 0;
            
            cs = 0;
            #100;
            
            for (i = 15; i >= 0; i = i - 1) begin
                mosi = frame[i];
                #200 sck = 1; 
                #200 sck = 0; // Falling Edge (Slave shifts out)
                
                // Sample MISO on falling edge (or next rising, depending on master logic)
                // Here we sample after the slave has updated MISO on the falling edge of previous cycle
                // Simple latch:
                if (i < 12) begin // Valid data is in the lower 12 bits
                   // Note: In Mode 0, MISO is valid on the next rising edge, 
                   // or stable after falling. We sample here for simplicity.
                end
            end
            
            // To capture the full MISO response properly in simulation:
            // We usually need a separate always block or careful timing.
            // For this testbench, we will trust the waveform or use a simple sampler below.
            
            #100;
            cs = 1;
            mosi = 0;
            #200;
        end
    endtask

    // Separate MISO sampler for read task
    // Shifts in MISO on Rising Edge of SCK (Master behavior)
    reg [15:0] miso_shift;
    always @(posedge sck) begin
        if (!cs) begin
            miso_shift = {miso_shift[14:0], miso};
        end
    end

    // ========================================================================
    // 6. Main Test Sequence
    // ========================================================================
    initial begin
        // Setup Waveform Dump
        $dumpfile("tb_spi_adc.vcd");
        $dumpvars(0, tb_spi_adc);
        
        // Initialize Inputs
        reset_ = 0;
        cs = 1;
        sck = 0;
        mosi = 0;
        comparator = 0;
        analog_input_val = 12'h000;
        
        // Apply Reset
        #500;
        reset_ = 1;
        #500;
        
        $display("---------------------------------------------------");
        $display("Test 1: Single Conversion Mode");
        $display("---------------------------------------------------");
        
        // 1. Set Analog Input Voltage (Arbitrary value: 0xA52)
        analog_input_val = 12'hA52; // Expect ADC to find this value
        $display("Analog Input Set to: 0x%h", analog_input_val);
        
        // 2. Configure ADC: Enable + Start + IRQ Enable
        // ADC_EN(0)=1, START(1)=1, AUTO(2)=0, INT_EN(4)=1
        // Binary: ...10011 -> Hex: 0x013
        $display("SPI: Writing Config (Enable + Start + IRQ)");
        spi_write(2'b00, 12'h013); 
        
        // 3. Wait for Interrupt (IRQ)
        $display("Waiting for IRQ...");
        wait(irq == 1);
        $display("IRQ Received! Conversion Complete.");
        
        // 4. Read Data Result via SPI
        // Read Address 0x02 (DATA_REG)
        $display("SPI: Reading Result");
        spi_read(2'b10); 
        
        // The result is in the `miso_shift` register (lower 12 bits)
        // Note: The specific timing of the shift task means we check `miso_shift` after CS goes high.
        #200; 
        spi_read_data = miso_shift[11:0];
        
        $display("Read Back Data: 0x%h", spi_read_data);
        
        // 5. Verification
        if (spi_read_data === analog_input_val) begin // Use === for exact match including x/z checks
             $display("RESULT: PASS - ADC Data matches Input.");
        end else begin
             // Allow +/- 1 LSB error for SAR logic
             if (spi_read_data == analog_input_val + 1 || spi_read_data == analog_input_val - 1)
                $display("RESULT: PASS (Within 1 LSB) - ADC: %h, Input: %h", spi_read_data, analog_input_val);
             else
                $display("RESULT: FAIL - ADC: %h, Input: %h", spi_read_data, analog_input_val);
        end

        #1000;
        
        $display("---------------------------------------------------");
        $display("Test 2: Check START Bit Clearing");
        $display("---------------------------------------------------");
        
        // Read Status Register to clear IRQ (if implemented) or just check CTRL reg
        // Read CTRL_REG (0x00) to see if Bit 1 (START) is 0
        spi_read(2'b00);
        #200;
        spi_read_data = miso_shift[11:0];
        
        if (spi_read_data[1] == 1'b0) 
            $display("PASS: START bit verified cleared.");
        else 
            $display("FAIL: START bit is still high (0x%h)", spi_read_data);

        #1000;
        $display("Simulation Finished.");
        $finish;
    end

endmodule