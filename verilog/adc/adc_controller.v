/*
 * =================================================================================
 * Module: adc_controller
 * Description: Manages the control logic for the SAR ADC, interfacing between 
 * the system bus and the SPI communication module.
 * * Author: Saumya Raj Singh
 * Date: 2024
 * License: MIT (Copyright (c) 2024 Saumya Raj Singh)
 * =================================================================================
 */
 
module adc_controller #(
    parameter WIDTH = 12 // Default ADC resolution
)(
    // Control and Clock Inputs
    input        clk,        // System clock
    input        reset_,     // Asynchronous, active-low reset
    input        en_,        // Active-low enable to start a conversion

    // ADC Interface
    input        comparator, // Input from the external voltage comparator

    // Outputs
    output       sample_and_hold, // Control signal for the S&H circuit
    output       pwr_gate,     // Enable signal for the external DAC
    output       dac_rst,   // Reset for the Capacitive DAC
    output       ack,        // Acknowledgment: high when conversion is done
    output       busy, // Busy: when not in Idle state
    output [WIDTH-1:0] dac,        // Output value to drive the external DAC
    output [WIDTH-1:0] data        // Final, valid conversion result
);

    // -- State Parameters --
    localparam S_IDLE    = 2'b00;
    localparam S_INIT    = 2'b01;
    localparam S_CONVERT = 2'b10;
    localparam S_FINISH  = 2'b11;

    // -- Internal Signals --
    reg  [1:0]   state, next_state;

    // Data path registers
    reg  [WIDTH-1:0]  dac_reg;      // Holds the current confirmed result
    reg  [WIDTH-1:0]  counter_reg;  // Holds the bit-mask for the current test
    reg  [WIDTH-1:0]  data_out_reg; // Dedicated stable output register

    // -- Wires for internal logic --
    // 'test_value' is the value sent to the DAC for comparison in the CONVERT state.
    wire [WIDTH-1:0]  test_value;
    // 'is_final_bit' is a status flag, high during the last conversion cycle (LSB).
    wire              is_final_bit;

    // ============================================================================
    // FSM LOGIC (Three-Process Implementation)
    // ============================================================================

    // -- FSM Process 1: State Register (Sequential) --
    always @(posedge clk, negedge reset_) begin
        if (!reset_)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    // -- FSM Process 2: Next-State Logic (Combinational) --
    always @* begin
        next_state = state;
        case (state)
            S_IDLE: begin
                if (!en_) next_state = S_INIT;
            end
            S_INIT: begin
                next_state = S_CONVERT;
            end
            S_CONVERT: begin
                if (en_) begin
                    // If en_ goes high mid-conversion, abort and go to IDLE.
                    next_state = S_IDLE;
                end else if (is_final_bit) begin
                    next_state = S_FINISH;
                end
            end
            S_FINISH: begin
                if (en_) next_state = S_IDLE;   // Single mode complete
                else     next_state = S_INIT;   // Continuous mode restart
            end
            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    // -- FSM Process 3: Output Logic (Combinational) --
    assign sample_and_hold = (state == S_INIT);
    assign ack             = (state == S_FINISH);
    assign pwr_gate        = (state == S_INIT) || (state == S_CONVERT);
    assign busy            = (state != S_IDLE);
    assign dac_rst         = (state == S_INIT);

    // ============================================================================
    // DATA PATH LOGIC
    // ============================================================================

    // -- Combinational Datapath Logic --
    // The "test value" is the current result with the next bit-to-test set to 1.
    assign test_value   = dac_reg | counter_reg;
    // The final bit is being processed when the counter mask is 1 (the LSB).
    assign is_final_bit = (counter_reg == 1);

    // -- Sequential Datapath Logic --
    always @(posedge clk, negedge reset_) begin
        if (!reset_) begin
            dac_reg      <= {WIDTH{1'b0}};
            counter_reg  <= {WIDTH{1'b0}};
            data_out_reg <= {WIDTH{1'b0}};
        end else begin
            case (state)
                S_INIT: begin
                    // For the standard algorithm, the result register must start at 0.
                    dac_reg     <= {WIDTH{1'b0}};
                    // The counter starts with only the MSB set.
                    counter_reg <= (1'b1 << (WIDTH - 1));
                end
                S_CONVERT: begin
                    // This is the core SAR logic, implemented as a multiplexer.
                    // If comparator is high, we keep the bit by updating dac_reg.
                    if (comparator) begin
                        dac_reg <= test_value;
                    end
                    // If comparator is low, we discard the bit by doing nothing
                    // to dac_reg, so it holds its previous value.

                    // Always shift the counter to test the next bit.
                    counter_reg <= counter_reg >> 1;

                    // On the final conversion cycle, latch the final correct result
                    // into the stable data output register.
                    if (is_final_bit) begin
                        // This ternary operator describes the final mux selection for the LSB.
                        data_out_reg <= comparator ? test_value : dac_reg;
                    end
                end
                default: begin
                    // For S_IDLE and S_FINISH, explicitly hold all register values.
                    // This is good practice for linters and design clarity.
                    dac_reg      <= dac_reg;
                    counter_reg  <= counter_reg;
                    data_out_reg <= data_out_reg;
                end
            endcase
        end
    end

    // -- Final Output Assignments --
    // In the CONVERT state, the DAC is driven by the 'test_value'. In all other
    // states, it is driven by the stable, confirmed 'dac_reg' value.
    assign dac  = (state == S_CONVERT) ? test_value : dac_reg;
    // The final data output is always driven by the stable output register.
    assign data = data_out_reg;

endmodule

