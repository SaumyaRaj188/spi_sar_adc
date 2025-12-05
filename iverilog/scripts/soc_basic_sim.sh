#!/bin/bash

# -----------------------------------------------------------------------------
# Script: soc_basic_sim.sh
# Description: Compiles, runs, and views the Basic SoC (CPU + RAM) simulation.
# -----------------------------------------------------------------------------

# 1. Create directories if they don't exist (Safety check)
mkdir -p iverilog/sim_files
mkdir -p iverilog/wave_files

# 2. Compile
# We include the Testbench, SoC Top Level, and the PicoRV32 Core.
echo "----------------------------------------"
echo "Compiling Verilog Sources..."
echo "----------------------------------------"

iverilog -o iverilog/sim_files/soc_basic_sim \
    iverilog/testbench/tb_soc_basic.v \
    verilog/soc_basic.v \
    verilog/picorv32.v

# Check if compilation succeeded
if [ $? -ne 0 ]; then
    echo "❌ Error: Compilation Failed."
    exit 1
else
    echo "✅ Compilation Successful."
fi

# 3. Run Simulation
echo "----------------------------------------"
echo "Running Simulation..."
echo "----------------------------------------"

# Run vvp. This generates the .vcd file in the current folder (as defined in the TB)
vvp iverilog/sim_files/soc_basic_sim

# Move the VCD to the dedicated wave_files directory
# Note: The testbench dumps "soc_test.vcd"
if [ -f "soc_test.vcd" ]; then
    mv soc_test.vcd iverilog/wave_files/
    echo "✅ Waveform moved to iverilog/wave_files/soc_test.vcd"
else
    echo "⚠️ Warning: VCD file 'soc_test.vcd' not found. Did the simulation run correctly?"
fi

# # 4. View Waveform (Optional - Uncomment to use)
# echo "----------------------------------------"
# echo "Opening GTKWave..."
# echo "----------------------------------------"
#
# # Opens the VCD with the saved signal layout (.gtkw) if it exists
# if [ -f "iverilog/signals/soc_basic.gtkw" ]; then
#     gtkwave iverilog/wave_files/soc_test.vcd iverilog/signals/soc_basic.gtkw &
# else
#     # Fallback if no .gtkw save file exists yet
#     gtkwave iverilog/wave_files/soc_test.vcd &
# fi