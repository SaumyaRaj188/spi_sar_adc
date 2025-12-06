#!/bin/bash

# =============================================================================
# Script: soc_adc_sim.sh
# Description: Compiles C-code, Builds Hardware, and Runs Full SoC Simulation
# =============================================================================

# 1. Setup Paths
# workspace root assumed to be where this script is called from or parent of script
WORKSPACE_ROOT=$(pwd)

# 2. Compile C Firmware
echo "----------------------------------------"
echo "1. Building Firmware (adc_read.c)..."
echo "----------------------------------------"

# Ensure the build script is executable
chmod +x ./riscv_toolchain/compile.sh

# Run the build script targeting our ADC driver code
./riscv_toolchain/compile.sh -f riscv_toolchain/source/adc_read.c

# Check for failure
if [ $? -ne 0 ]; then
    echo "❌ Firmware Build Failed. Stopping."
    exit 1
fi

# 3. Create Simulation Directories
mkdir -p iverilog/sim_files
mkdir -p iverilog/wave_files

# 4. Compile Verilog Hardware
echo "----------------------------------------"
echo "2. Compiling Verilog Hardware..."
echo "----------------------------------------"

# We list ALL necessary files here
iverilog -o iverilog/sim_files/soc_adc_sim \
    iverilog/testbench/tb_soc_adc.v \
    verilog/rv32/soc_adc.v \
    verilog/rv32/gpio_bridge.v \
    verilog/rv32/picorv32.v \
    verilog/adc/spi_adc.v \
    verilog/adc/adc_controller.v \
    verilog/adc/adc_spi_slave.v

if [ $? -ne 0 ]; then
    echo "❌ Verilog Compilation Failed."
    exit 1
fi

# 5. Run Simulation
echo "----------------------------------------"
echo "3. Running Simulation..."
echo "----------------------------------------"

vvp iverilog/sim_files/soc_adc_sim

# 6. Cleanup
if [ -f "tb_soc_adc.vcd" ]; then
    mv tb_soc_adc.vcd iverilog/wave_files/
    echo "✅ Waveform saved to: iverilog/wave_files/tb_soc_adc.vcd"
else
    echo "⚠️ Warning: No VCD file generated."
fi