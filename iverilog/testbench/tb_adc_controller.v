`timescale 1ns / 1ps

module tb_adc_controller;

    // -- Testbench Parameters --
    localparam WIDTH = 12;

    // -- Testbench Signals --
    reg                           clk;
    reg                           reset_;
    reg                           en_;
    reg  [WIDTH-1:0]              analog_input_equivalent;

    wire                          sample_and_hold;
    wire                          dac_en;
    wire                          ack;
    wire [WIDTH-1:0]              dac;
    wire [WIDTH-1:0]              data;
    wire                          comparator;

    // -- Local variable declarations for test scenarios --
    reg [WIDTH-1:0]                 first_result;
    localparam OVERSAMPLE_BITS    = 2;
    localparam NUM_SAMPLES        = 16;
    localparam AVG_SHIFT          = $clog2(NUM_SAMPLES);
    // Moved HALF_DIVISOR to module scope for Verilog-2005 compatibility
    localparam HALF_DIVISOR       = (1 << (AVG_SHIFT - 1));
    reg [WIDTH+OVERSAMPLE_BITS-1:0] true_oversampled_value;
    reg [WIDTH-1:0]                 noisy_sample;
    reg signed [2:0]                noise;
    reg [WIDTH+AVG_SHIFT-1:0]       accumulator;
    reg [WIDTH+OVERSAMPLE_BITS-1:0] oversampled_result;
    reg [WIDTH-1:0]                 averaged_result_trunc; // Truncated average
    reg [WIDTH-1:0]                 averaged_result_round; // Rounded average
    integer                         seed;

    // ============================================================================
    // Custom Pseudo-Random Number Generator (PRNG)
    // ============================================================================
    task automatic get_random(output [31:0] result, input integer min, max);
        begin
            seed = (seed * 1664525 + 1013904223);
            result = min + (seed % (max - min + 1));
        end
    endtask

    // -- Instantiate the Device Under Test (DUT) --
    adc_controller #(
        .WIDTH(WIDTH)
    ) u_dut (
        .clk(clk),
        .reset_(reset_),
        .en_(en_),
        .comparator(comparator),
        .sample_and_hold(sample_and_hold),
        .dac_en(dac_en),
        .ack(ack),
        .dac(dac),
        .data(data)
    );

    // -- Comparator Modeling --
    assign comparator = (analog_input_equivalent >= dac);

    // -- Clock Generation --
    always #5 clk = ~clk;

    // -- Main Test Sequence --
    initial begin
        if (!$value$plusargs("SEED=%d", seed)) begin
            seed = 1; // Default seed if none is provided
        end
        $display("Simulation running with seed: %d", seed);
        
        $dumpfile("iverilog/wave_files/tb_adc_controller.vcd");
        $dumpvars(0, tb_adc_controller);

        // Initial state and Reset
        $display("--------------------------------------------------");
        $display("Simulation Start: Applying Reset");
        $display("--------------------------------------------------");
        clk <= 0; reset_ <= 0; en_ <= 1;
        #20;
        reset_ <= 1;
        #10;

        // SCENARIO 1: SINGLE CONVERSIONS
        $display("\n--- SCENARIO 1: SINGLE CONVERSIONS (WIDTH=%0d) ---", WIDTH);
        for (integer i = 0; i < 2; i = i + 1) begin
            get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
            $display("\nTest 1.%0d: Starting single conversion for value %4d (0x%h)", i, analog_input_equivalent, analog_input_equivalent);
            en_ <= 0;
            @(posedge clk);
            $display("Waiting for ACK...");
            @(posedge ack);
            $display("ACK received! Conversion complete.");
            en_ <= 1;
            $display("Expected: %4d (0x%h), Received: %4d (0x%h)", analog_input_equivalent, analog_input_equivalent, data, data);
            if (data == analog_input_equivalent) $display("Result: PASS"); else $display("Result: FAIL");
            #50;
        end

        // SCENARIO 2: CONTINUOUS CONVERSION
        $display("\n--- SCENARIO 2: CONTINUOUS CONVERSION ---");
        en_ <= 0;
        
        get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
        $display("\nTest 2.0: Continuous conversion 1 for value %4d (0x%h)", analog_input_equivalent, analog_input_equivalent);
        @(posedge ack);
        $display("ACK 1 received.");
        if (data == analog_input_equivalent) $display("Result 1: PASS"); else $display("Result 1: FAIL");
        first_result = data;
        
        get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
        $display("\nTest 2.1: Continuous conversion 2 for value %4d (0x%h)", analog_input_equivalent, analog_input_equivalent);
        $display("Verifying previous data is stable...");
        if (data == first_result) $display("Previous data is STABLE. PASS."); else $display("Previous data CHANGED. FAIL.");
        @(posedge ack);
        $display("ACK 2 received.");
        if (data == analog_input_equivalent) $display("Result 2: PASS"); else $display("Result 2: FAIL");
        
        en_ <= 1;
        #50;

        // SCENARIO 3: OVERSAMPLING & AVERAGING
        $display("\n--- SCENARIO 3: OVERSAMPLING & AVERAGING ---");

        get_random(true_oversampled_value, 0, (1<<(WIDTH+OVERSAMPLE_BITS))-1);
        $display("Goal: Measure %0d-bit value %d (0x%h) by oversampling.", WIDTH+OVERSAMPLE_BITS, true_oversampled_value, true_oversampled_value);
        
        accumulator = 0;
        en_ <= 0;
        
        for (integer i = 0; i < NUM_SAMPLES; i = i + 1) begin
            get_random(noise, 0, 4);
            noise = noise - 2;
            noisy_sample = (true_oversampled_value >> OVERSAMPLE_BITS) + noise;
            analog_input_equivalent = noisy_sample;
            @(posedge ack);
            accumulator = accumulator + data;
        end
        
        en_ <= 1;
        
        // --- Decimation Logic with Truncation and Rounding ---
        oversampled_result = accumulator >> OVERSAMPLE_BITS;
        averaged_result_trunc = accumulator >> AVG_SHIFT;
        averaged_result_round = (accumulator + HALF_DIVISOR) >> AVG_SHIFT;

        $display("\nOversampling Result (%0d-bit):", WIDTH+OVERSAMPLE_BITS);
        $display("True Value : %d (0x%h)", true_oversampled_value, true_oversampled_value);
        $display("Result     : %d (0x%h)", oversampled_result, oversampled_result);
        
        $display("\nAveraging Result (%0d-bit):", WIDTH);
        $display("True Value (%0d MSBs) : %d (0x%h)", WIDTH, true_oversampled_value >> OVERSAMPLE_BITS, true_oversampled_value >> OVERSAMPLE_BITS);
        $display("Truncated Result      : %d (0x%h)", averaged_result_trunc, averaged_result_trunc);
        $display("Rounded Result        : %d (0x%h)", averaged_result_round, averaged_result_round);
        #50;


        // ==================================================
        // Test Scenario 4: Mid-Conversion Reset Test (Corrected)
        // ==================================================
        $display("\n--- SCENARIO 4: MID-CONVERSION RESET TEST ---");
        get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
        $display("\nTest 4.0: Starting conversion for value %d...", analog_input_equivalent);
        
        // ** FIX: Hold en_ low to keep the conversion active **
        en_ <= 0;
        @(posedge clk);

        // Let the conversion run for a few cycles to ensure it's in S_CONVERT
        $display("Letting conversion run for 5 cycles...");
        repeat (5) @(posedge clk);

        $display("Asserting reset_ during conversion...");
        reset_ <= 0; // Assert reset
        #2; // Wait a moment to check async behavior
        if (u_dut.state == 2'b00) $display("STATE CHECK: FSM correctly returned to IDLE. PASS.");
        else $display("STATE CHECK: FSM did NOT return to IDLE. FAIL.");
        
        #20;
        reset_ <= 1; // De-assert reset
        @(posedge clk);

        $display("\nTest 4.1: Verifying controller can run a new conversion after reset.");
        get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
        $display("Starting new conversion for value %d...", analog_input_equivalent);
        en_ <= 0;
        @(posedge clk);
        $display("Waiting for ACK...");
        @(posedge ack);
        $display("ACK received! Conversion complete.");
        en_ <= 1;
        if (data == analog_input_equivalent) $display("Result: PASS"); else $display("Result: FAIL");
        #50;

        


        // ==================================================
        // Test Scenario 5: Mid-Conversion Enable/Abort Test
        // ==================================================
        $display("\n--- SCENARIO 5: MID-CONVERSION ABORT TEST ---");
        get_random(analog_input_equivalent, 0, (1<<WIDTH)-1);
        $display("\nTest 5.0: Starting conversion for value %d...", analog_input_equivalent);
        en_ <= 0; // Assert enable to start conversion
        @(posedge clk); // Allow FSM to leave IDLE

        // Let the conversion run for a few cycles to ensure it's in S_CONVERT
        $display("Letting conversion run for 5 cycles...");
        repeat (5) @(posedge clk);

        $display("De-asserting en_ during conversion to signal abort...");
        en_ <= 1; // Signal the abort
        
        // Wait for the NEXT clock edge to ensure the state has settled.
        @(posedge clk); 
        #1
        
        // Check if the FSM correctly returned to the IDLE state.
        if (u_dut.state == 2'b00) begin
            $display("STATE CHECK: FSM correctly aborted and returned to IDLE. PASS.");
        end else begin
            $display("STATE CHECK: FSM did NOT return to IDLE. FAIL. (State is %b)", u_dut.state);
        end
        #50; // Delay for waveform clarity



        $display("\n--------------------------------------------------");
        $display("All tests complete. Ending simulation.");
        $display("--------------------------------------------------");
        $finish;
    end

endmodule

