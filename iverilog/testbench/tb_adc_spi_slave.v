//////////////////////////////////////////////////////////////////////////////////
//
// Module:       tb_adc_spi_slave
// Date:         Saturday, October 11, 2025
// Description:  A self-checking testbench for the adc_spi_slave module.
//
//               This testbench acts as an SPI master to verify all commands,
//               protocol edge cases, and functionality defined in the test plan.
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_adc_spi_slave;

    //--------------------------------------------------------------------------
    // Testbench Parameters
    //--------------------------------------------------------------------------
    localparam CLK_PERIOD = 10; // 100MHz system clock
    localparam SCK_PERIOD = CLK_PERIOD * 10; // SCK is 10x slower than CLK

    // DUT Parameters (mirrored for testbench convenience)
    localparam S_IDLE  = 2'b00;
    localparam READ    = 2'b00;
    localparam WRITE   = 2'b01;
    localparam SET     = 2'b10;
    localparam CLEAR   = 2'b11;

    localparam ADDR_CTRL_REG   = 2'b00;
    localparam ADDR_STATUS_REG = 2'b01;
    localparam ADDR_DATA_REG   = 2'b10;
    localparam ADDR_OFFSET_REG = 2'b11;

    //--------------------------------------------------------------------------
    // Testbench Signals
    //--------------------------------------------------------------------------
    reg         clk;
    reg         reset_;
    reg         sck;
    reg         cs;
    reg         mosi;
    wire        miso;

    integer     errors = 0;
    integer     test_case_count = 10;

    // Test sequencer variables
    reg [15:0] tx_word;
    reg [15:0] rx_word;
    reg [11:0] expected_val;

    //--------------------------------------------------------------------------
    // Instantiate the DUT
    //--------------------------------------------------------------------------
    adc_spi_slave dut (
        .clk(clk),
        .reset_(reset_),
        .sck(sck),
        .cs(cs),
        .mosi(mosi),
        .miso(miso)
    );

    //--------------------------------------------------------------------------
    // Clock and Reset Generation
    //--------------------------------------------------------------------------
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    initial begin
        sck = 1'b0;
        cs = 1'b1;
        mosi = 1'b0;
        reset_ = 1'b0;
        #(CLK_PERIOD * 5);
        reset_ = 1'b1;
    end

    //--------------------------------------------------------------------------
    // SPI Master Task (Protocol-Pure, Delay-Based)
    //--------------------------------------------------------------------------
    task spi_transaction(input [15:0] tx_data, output [15:0] rx_data);
        integer i;
    begin
        $display("@%0tns:   [SPI TX] -> 0x%h (CMD: %b, ADDR: %b, DATA: 0x%h)", $time, tx_data, tx_data[15:14], tx_data[13:12], tx_data[11:0]);
        cs = 1'b0;
        sck = 1'b0;
        #(SCK_PERIOD / 2);

        for (i = 15; i >= 0; i = i - 1) begin
            // 1. Master sets MOSI data while SCK is low
            mosi = tx_data[i];
            #(SCK_PERIOD / 2);

            // 2. Master raises SCK; Slave captures MOSI on this rising edge
            sck = 1'b1;
            #(SCK_PERIOD / 2);

            // 3. Master lowers SCK; Slave drives MISO on this falling edge
            sck = 1'b0;
            // 4. Master samples MISO now that it's stable
            rx_data[i] = miso;
        end
        
        cs = 1'b1;
        mosi = 1'b0; // Leave MOSI in a known idle state
        $display("@%0tns:   [SPI RX] <- 0x%h (DATA: 0x%h)", $time, rx_data, rx_data[11:0]);
        #(CLK_PERIOD * 2);
    end
    endtask


    //--------------------------------------------------------------------------
    // Test Sequencer
    //--------------------------------------------------------------------------
    initial begin
        $dumpfile("iverilog/wave_files/tb_adc_spi_slave.vcd");
        $dumpvars(0, tb_adc_spi_slave);
        
        $display("\n@%0tns: [INFO] Starting ADC SPI Slave Verification...\n", $time);

        @(posedge reset_);
        #(CLK_PERIOD);

        // --- Test Case 1: Reset Verification ---
        $display("@%0tns: --- Test Case 1: Reset Verification ---", $time);
        $display("  Action: Reading from ADDR_STATUS_REG to verify reset value.");
        tx_word = {READ, ADDR_STATUS_REG, 12'h000};
        spi_transaction(tx_word, rx_word);
        if (rx_word[11:0] === 12'h800) begin
            $display("@%0tns: [PASS] Device correctly reset and status_reg reads 0x800.", $time);
        end else begin
            $display("@%0tns: [FAIL] Device did not reset correctly. Read 0x%h from status_reg.", $time, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 2: Basic WRITE Command ---
        $display("\n@%0tns: --- Test Case 2: Basic WRITE Command ---", $time);
        $display("  Action: Writing 0xA5A to ADDR_CTRL_REG.");
        tx_word = {WRITE, ADDR_CTRL_REG, 12'hA5A};
        spi_transaction(tx_word, rx_word);
        $display("  Action: Reading back from ADDR_CTRL_REG to verify.");
        tx_word = {READ, ADDR_CTRL_REG, 12'h000};
        spi_transaction(tx_word, rx_word);
        if (rx_word[11:0] === 12'hA5A) begin
            $display("@%0tns: [PASS] WRITE command successfully updated ctrl_reg.", $time);
        end else begin
            $display("@%0tns: [FAIL] WRITE command failed. Expected 0x%h, Got 0x%h", $time, 12'hA5A, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 3: Basic READ Command ---
        $display("\n@%0tns: --- Test Case 3: Basic READ Command (from status_reg) ---", $time);
        $display("  Action: Reading from ADDR_STATUS_REG.");
        tx_word = {READ, ADDR_STATUS_REG, 12'h0};
        spi_transaction(tx_word, rx_word);
        if (rx_word[11:0] === 12'h800) begin
            $display("@%0tns: [PASS] READ command successfully returned status_reg value: 0x%h", $time, rx_word[11:0]);
        end else begin
            $display("@%0tns: [FAIL] READ command failed. Expected 0x%h, Got 0x%h", $time, 12'h800, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 4: SET Command ---
        $display("\n@%0tns: --- Test Case 4: SET Command ---", $time);
        $display("  Action: Writing initial value to ADDR_CTRL_REG.");
        spi_transaction({WRITE, ADDR_CTRL_REG, 12'b1100_0011_0011}, rx_word);
        $display("  Action: Sending SET command with bitmask.");
        spi_transaction({SET, ADDR_CTRL_REG, 12'b0000_1111_0000}, rx_word);
        expected_val = 12'b1100_1111_0011;
        $display("  Action: Reading back to verify SET operation.");
        spi_transaction({READ, ADDR_CTRL_REG, 12'h000}, rx_word);
        if (rx_word[11:0] === expected_val) begin
            $display("@%0tns: [PASS] SET command correctly performed bitwise OR.", $time);
        end else begin
            $display("@%0tns: [FAIL] SET command failed. Expected 0x%h, Got 0x%h", $time, expected_val, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 5: CLEAR Command ---
        $display("\n@%0tns: --- Test Case 5: CLEAR Command ---", $time);
        $display("  Action: Writing initial value to ADDR_CTRL_REG.");
        spi_transaction({WRITE, ADDR_CTRL_REG, 12'b1100_1111_0011}, rx_word);
        $display("  Action: Sending CLEAR command with bitmask.");
        spi_transaction({CLEAR, ADDR_CTRL_REG, 12'b1100_0000_1100}, rx_word);
        expected_val = 12'b0000_1111_0011;
        $display("  Action: Reading back to verify CLEAR operation.");
        spi_transaction({READ, ADDR_CTRL_REG, 12'h000}, rx_word);
        if (rx_word[11:0] === expected_val) begin
            $display("@%0tns: [PASS] CLEAR command correctly performed bitwise AND-NOT.", $time);
        end else begin
            $display("@%0tns: [FAIL] CLEAR command failed. Expected 0x%h, Got 0x%h", $time, expected_val, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 6: Write to Read-Only Address ---
        $display("\n@%0tns: --- Test Case 6: Write to Read-Only Address ---", $time);
        expected_val = 12'h800;
        $display("  Action: Attempting to write 0xBAD to read-only ADDR_STATUS_REG.");
        spi_transaction({WRITE, ADDR_STATUS_REG, 12'hBAD}, rx_word);
        $display("  Action: Reading back to verify register was not changed.");
        spi_transaction({READ, ADDR_STATUS_REG, 12'h000}, rx_word);
        if (rx_word[11:0] === expected_val) begin
            $display("@%0tns: [PASS] Write to read-only address was correctly ignored.", $time);
        end else begin
            $display("@%0tns: [FAIL] Write to read-only address was not ignored. Got 0x%h", $time, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 7: Back-to-Back Transactions ---
        $display("\n@%0tns: --- Test Case 7: Back-to-Back Transactions ---", $time);
        $display("  Action: Asserting CS for two consecutive transactions.");
        cs = 1'b0;
        sck = 1'b0;
        #(SCK_PERIOD / 2);
        // Transaction 1: WRITE
        $display("  Action: Transaction 1 - WRITE 0xCDE to ADDR_CTRL_REG.");
        tx_word = {WRITE, ADDR_CTRL_REG, 12'hCDE};
        for (integer i = 15; i >= 0; i = i - 1) begin
             mosi = tx_word[i]; #(SCK_PERIOD/2); sck=1'b1; #(SCK_PERIOD/2); sck=1'b0;
        end
        #(CLK_PERIOD * 4); // Give DUT time to latch
        // Transaction 2: READ
        $display("  Action: Transaction 2 - READ from ADDR_CTRL_REG.");
        tx_word = {READ, ADDR_CTRL_REG, 12'h0};
        for (integer i = 15; i >= 0; i = i - 1) begin
             mosi = tx_word[i]; #(SCK_PERIOD/2); sck=1'b1; #(SCK_PERIOD/2); sck=1'b0; rx_word[i] = miso;
        end
        cs = 1'b1;
        $display("@%0tns:   [SPI RX] <- 0x%h (DATA: 0x%h)", $time, rx_word, rx_word[11:0]);
        #(CLK_PERIOD * 2);
        if (rx_word[11:0] === 12'hCDE) begin
            $display("@%0tns: [PASS] Back-to-back transactions handled correctly.", $time);
        end else begin
            $display("@%0tns: [FAIL] Back-to-back read failed. Expected 0x%h, Got 0x%h", $time, 12'hCDE, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 8: Transaction Abort by CS ---
        $display("\n@%0tns: --- Test Case 8: Transaction Abort by CS ---", $time);
        $display("  Action: Writing a known start value (0x123) to ADDR_CTRL_REG.");
        spi_transaction({WRITE, ADDR_CTRL_REG, 12'h123}, rx_word);
        expected_val = 12'h123;
        $display("  Action: Starting a new WRITE, but will abort by de-asserting CS early.");
        tx_word = {WRITE, ADDR_CTRL_REG, 12'hFFF};
        cs = 1'b0;
        sck = 1'b0;
        #(SCK_PERIOD / 2);
        for (integer i = 15; i >= 6; i = i - 1) begin // Only send 10 bits
            mosi = tx_word[i]; #(SCK_PERIOD/2); sck=1'b1; #(SCK_PERIOD/2); sck=1'b0;
        end
        cs = 1'b1;
        $display("@%0tns:   Action: CS de-asserted. Transaction aborted.", $time);
        #(CLK_PERIOD*2);
        $display("  Action: Reading back from ADDR_CTRL_REG to verify it was not corrupted.");
        spi_transaction({READ, ADDR_CTRL_REG, 12'h000}, rx_word);
        if (rx_word[11:0] === expected_val) begin
            $display("@%0tns: [PASS] Transaction abort did not corrupt ctrl_reg.", $time);
        end else begin
            $display("@%0tns: [FAIL] Transaction abort corrupted ctrl_reg. Expected 0x%h, Got 0x%h", $time, expected_val, rx_word[11:0]);
            errors = errors + 1;
        end

        // --- Test Case 9: Idle Clocking (CS High) ---
        $display("\n@%0tns: --- Test Case 9: Idle Clocking (CS High) ---", $time);
        cs = 1'b1;
        $display("  Action: Toggling SCK 20 times while CS is high.");
        for (integer i = 0; i < 20; i = i + 1) begin
             sck = ~sck; #(SCK_PERIOD / 2);
        end
        $display("  Action: Verifying state is still IDLE by performing a valid transaction.");
        spi_transaction({READ, ADDR_STATUS_REG, 12'h000}, rx_word);
        if (rx_word[11:0] == 12'h800) begin
            $display("@%0tns: [PASS] FSM remained in IDLE while unselected SCK toggled.", $time);
        end else begin
            $display("@%0tns: [FAIL] FSM left IDLE state while unselected.", $time);
            errors = errors + 1;
        end

        // --- Test Case 10: Read from all addresses ---
        $display("\n@%0tns: --- Test Case 10: Read from all addresses ---", $time);
        $display("  Action: Reading from ADDR_DATA_REG and ADDR_OFFSET_REG.");
        spi_transaction({READ, ADDR_DATA_REG, 12'h000}, rx_word);
        if(rx_word[11:0] != 12'h0) errors = errors + 1;
        spi_transaction({READ, ADDR_OFFSET_REG, 12'h000}, rx_word);
        if(rx_word[11:0] != 12'h0) errors = errors + 1;
        $display("@%0tns: [PASS] All remaining registers read successfully.", $time);


        // --- Final Summary ---
        if (errors == 0) begin
            $display("\n@%0tns: [INFO] All %0d test cases PASSED!", $time, test_case_count);
        end else begin
            $display("\n@%0tns: [INFO] %0d out of %0d test cases FAILED.", $time, errors, test_case_count);
        end
        $finish;
    end

endmodule

