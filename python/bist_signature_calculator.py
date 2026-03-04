"""
BIST Golden Signature Calculator for SAR ADC
Simulates the exact clock-by-clock behavior of the Verilog hardware.
Now includes detailed per-conversion tracking and MISR mathematics.
"""

def get_bist_golden_value():
    # Initial hardware states (from reset)
    lfsr = 0xACE
    misr = 0x000
    state = 0  # 0: S_IDLE, 1: S_INIT, 2: S_CONVERT, 3: S_FINISH
    dac_reg = 0
    counter_reg = 0
    data_out_reg = 0

    conversions = 0
    max_conversions = 64
    done = False
    
    # To track what the LFSR looked like at the start of a conversion
    lfsr_at_start = 0xACE 

    # Verilog Continuous Assignments (Combinational Math)
    def get_lfsr_fb(val):
        # lfsr_fb = lfsr[11] ^ lfsr[6] ^ lfsr[4] ^ lfsr[0]
        return ((val >> 11) ^ (val >> 6) ^ (val >> 4) ^ (val >> 0)) & 1

    def get_misr_fb(curr_misr, data):
        # Break down the MISR math to show the user exactly what is happening
        shifted = (curr_misr << 1) & 0xFFF
        poly = 0x829 if (curr_misr & 0x800) else 0x000
        new_misr = shifted ^ poly ^ data
        return new_misr, shifted, poly

    cycle = 0

    print("=" * 95)
    print(f"{'BIST ENGINE: CYCLE-ACCURATE MISR SIGNATURE GENERATION':^95}")
    print("=" * 95)
    print(f"{'Conv':<5} | {'Cycle':<5} | {'LFSR Seed':<9} | {'ADC Out':<7} | {'MISR Blending Math (Shift ^ Poly ^ Data)':<42} | {'New MISR':<8}")
    print("-" * 95)

    # Simulate until the test completes 64 conversions
    while not done:
        # --- 1. COMBINATIONAL LOGIC (Evaluated before the posedge clock) ---
        en_n = 0 # Forced low (Active) by the BIST wrapper
        is_final_bit = (counter_reg == 1)
        test_value = dac_reg | counter_reg
        comparator = (lfsr >> 11) & 1  # The fake analog pin
        ack = (state == 3)

        # FSM Next State Logic
        if state == 0:     # S_IDLE
            next_state = 1
        elif state == 1:   # S_INIT
            next_state = 2
        elif state == 2:   # S_CONVERT
            if is_final_bit:
                next_state = 3
            else:
                next_state = 2
        elif state == 3:   # S_FINISH
            next_state = 1 # Loops straight back to INIT

        # Datapath Next State Logic
        next_dac_reg = dac_reg
        next_counter_reg = counter_reg
        next_data_out_reg = data_out_reg

        if state == 1:
            next_dac_reg = 0
            next_counter_reg = 0x800
        elif state == 2:
            if comparator:
                next_dac_reg = test_value
            next_counter_reg = counter_reg >> 1
            if is_final_bit:
                next_data_out_reg = test_value if comparator else dac_reg

        # MISR & Counter Logic
        next_misr = misr
        if ack:
            next_misr, shifted, poly = get_misr_fb(misr, data_out_reg)
            conversions += 1
            
            # Print the detailed breakdown for this conversion
            math_str = f"0x{shifted:03X} ^ 0x{poly:03X} ^ 0x{data_out_reg:03X}"
            print(f"{conversions:>4}  | {cycle:>5} |   0x{lfsr_at_start:03X}   |  0x{data_out_reg:03X}  |  {math_str:<40}  |  0x{next_misr:03X}")
            
            if conversions == max_conversions:
                done = True

        # LFSR Next State Logic (Shifts continuously)
        next_lfsr = ((lfsr << 1) & 0xFFF) | get_lfsr_fb(lfsr)

        # --- 2. SEQUENTIAL LOGIC (Apply at posedge clk) ---
        state = next_state
        dac_reg = next_dac_reg
        counter_reg = next_counter_reg
        data_out_reg = next_data_out_reg
        misr = next_misr
        lfsr = next_lfsr
        
        # Capture the LFSR state right as a new conversion initializes
        if state == 1:
            lfsr_at_start = lfsr

        cycle += 1

    print("=" * 95)
    print("--- BIST SIMULATION SUMMARY ---")
    print(f"Total Clock Cycles    : {cycle}")
    print(f"Total Conversions Run : {conversions}")
    print(f"Final Golden MISR     : 0x{misr:03X}")
    print("=" * 95)

if __name__ == '__main__':
    get_bist_golden_value()