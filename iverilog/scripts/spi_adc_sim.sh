#!/bin/bash

# -----------------------------------------------------------------------------
# Script: run_spi_sim.sh
# Description: Compiles, runs, and views the SPI ADC System simulation.
# -----------------------------------------------------------------------------

# 1. Create directories if they don't exist (Safety check)
mkdir -p iverilog/sim_files
mkdir -p iverilog/wave_files

# 2. Compile
# We include the Testbench, Top Level, Controller, and Slave files.
echo "----------------------------------------"
echo "Compiling Verilog Sources..."
echo "----------------------------------------"

iverilog -o iverilog/sim_files/spi_sim \
    iverilog/testbench/tb_spi_adc.v \
    verilog/spi_adc.v \
    verilog/adc_controller.v \
    verilog/adc_spi_slave.v

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
vvp iverilog/sim_files/spi_sim

# Move the VCD to the dedicated wave_files directory
if [ -f "tb_spi_adc.vcd" ]; then
    mv tb_spi_adc.vcd iverilog/wave_files/
    echo "✅ Waveform moved to iverilog/wave_files/tb_spi_adc.vcd"
else
    echo "⚠️ Warning: VCD file not found. Did the simulation run correctly?"
fi

# 4. View Waveform
echo "----------------------------------------"
echo "Opening GTKWave..."
echo "----------------------------------------"

# Opens the VCD with the saved signal layout (.gtkw) if it exists
if [ -f "iverilog/signals/adc_spi_slave.gtkw" ]; then
    gtkwave iverilog/wave_files/tb_spi_adc.vcd iverilog/signals/adc_spi_slave.gtkw &
else
    # Fallback if no .gtkw save file exists yet
    gtkwave iverilog/wave_files/tb_spi_adc.vcd &
fi