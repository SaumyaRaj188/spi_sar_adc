/*
 * =================================================================================
 * Module: adc_bist_engine
 * Description: Generates pseudo-random test vectors (LFSR) and compresses the 
 * ADC outputs into a final signature (MISR) to verify digital functionality 
 * without requiring analog inputs.
 *
 * Author: Saumya Raj Singh
 * Date: 2026
 * License: MIT (Copyright (c) 2026 Saumya Raj Singh)
 * =================================================================================
 */

module adc_bist_engine #(
    parameter WIDTH = 12,
    parameter CONV_COUNT = 64 // Number of conversions to run for the test
)(
    input  clk,              // Driven by adc_clk
    input  reset_,           // System reset
    input  bist_en,          // High to enable BIST mode
    input  adc_ack,          // Pulse from controller indicating a conversion is done
    input  [WIDTH-1:0] adc_data, // The converted data to compress
    
    output bist_cmp_out,     // Pseudo-random bit sent to the ADC comparator
    output bist_done,        // High when all conversions are complete
    output bist_done_pulse,  // 1-clock pulse when test finishes (for IRQ)
    output bist_pass,        // High if MISR matches golden signature
    output [WIDTH-1:0] misr_sig  // Final compressed signature
);

    // -- 1. LFSR: Pseudo-Random Pattern Generator --
    // Polynomial: x^12 + x^6 + x^4 + x^1 + 1
    reg [11:0] lfsr;
    wire lfsr_fb = lfsr[11] ^ lfsr[6] ^ lfsr[4] ^ lfsr[0];

    always @(posedge clk or negedge reset_) begin
        if (!reset_) begin
            lfsr <= 12'hACE; // Non-zero seed
        end else if (bist_en) begin
            lfsr <= {lfsr[10:0], lfsr_fb}; // Shift continuously during test
        end else begin
            lfsr <= 12'hACE; // Reset seed when test is disabled
        end
    end
    
    // Drive the fake comparator with the MSB of the LFSR
    assign bist_cmp_out = lfsr[11];

    // -- 2. MISR: Signature Analyzer --
    // Compresses the full ADC parallel data output into a single signature
    reg [WIDTH-1:0] misr;
    wire [WIDTH-1:0] misr_fb = {misr[WIDTH-2:0], 1'b0} ^ 
                               (misr[WIDTH-1] ? 12'h829 : 12'h000) ^ 
                               adc_data;

    always @(posedge clk or negedge reset_) begin
        if (!reset_) begin
            misr <= {WIDTH{1'b0}};
        end else if (!bist_en) begin
            misr <= {WIDTH{1'b0}};
        end else if (adc_ack) begin
            // Compress data only when a conversion finishes
            misr <= misr_fb;
        end
    end
    
    assign misr_sig = misr;

    // -- 3. Test Controller & Counter --
    reg [6:0] count;
    reg done_reg;

    always @(posedge clk or negedge reset_) begin
        if (!reset_) begin
            count <= 0;
            done_reg <= 0;
        end else if (!bist_en) begin
            count <= 0;
            done_reg <= 0;
        end else if (adc_ack && !done_reg) begin
            if (count == CONV_COUNT - 1) begin
                done_reg <= 1'b1;
            end else begin
                count <= count + 1;
            end
        end
    end

    assign bist_done = done_reg;

    // Generate a 1-clock pulse when done to trigger the SPI latch and IRQ
    reg done_d;
    always @(posedge clk or negedge reset_) begin
        if (!reset_) done_d <= 0;
        else done_d <= done_reg;
    end
    assign bist_done_pulse = done_reg & ~done_d;

    // -- 4. Pass/Fail Evaluation --
    assign bist_pass = (misr == 12'h793); 

endmodule