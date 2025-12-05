#!/bin/bash

# -----------------------------------------------------------------------------
# Script: run_rv32_sim.sh
# Description: Compiles, runs, and manages waveforms for PicoRV32 simulation.
# -----------------------------------------------------------------------------

# 1. Create directories if they don't exist
mkdir -p iverilog/sim_files
mkdir -p iverilog/wave_files

# 2. Compile
echo "----------------------------------------"
echo "Compiling Verilog Sources..."
echo "----------------------------------------"

# UPDATED PATHS:
# tb_picorv32_basic.v is in iverilog/testbench/
# picorv32.v is in verilog/
iverilog -o iverilog/sim_files/rv32_sim \
    iverilog/testbench/tb_picorv32_basic.v \
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

# Run the simulation executable
vvp iverilog/sim_files/rv32_sim

# 4. Move the VCD
# The testbench dumps "cpu_test.vcd" in the current directory
if [ -f "cpu_test.vcd" ]; then
    mv cpu_test.vcd iverilog/wave_files/
    echo "✅ Waveform moved to iverilog/wave_files/cpu_test.vcd"
else
    echo "⚠️ Warning: VCD file 'cpu_test.vcd' not found. Did the simulation finish?"
fi

# # 5. View Waveform (Optional)
# # echo "----------------------------------------"
# # echo "Opening GTKWave..."
# # echo "----------------------------------------"
#
# # if [ -f "iverilog/signals/rv32_basic.gtkw" ]; then
# #     gtkwave iverilog/wave_files/cpu_test.vcd iverilog/signals/rv32_basic.gtkw &
# # else
# #     gtkwave iverilog/wave_files/cpu_test.vcd &
# # fi