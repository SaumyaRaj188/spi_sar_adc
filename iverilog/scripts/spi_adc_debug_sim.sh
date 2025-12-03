#!/bin/bash
# Description: Compiles and runs the DEBUG version of the testbench

echo "----------------------------------------"
echo "Compiling DEBUG Simulation..."
echo "----------------------------------------"

iverilog -o iverilog/sim_files/spi_sim_debug \
    iverilog/testbench/tb_spi_adc_debug.v \
    verilog/spi_adc.v \
    verilog/adc_controller.v \
    verilog/adc_spi_slave.v

if [ $? -ne 0 ]; then
    echo "❌ Error: Compilation Failed."
    exit 1
fi

echo "----------------------------------------"
echo "Running DEBUG Simulation..."
echo "----------------------------------------"

vvp iverilog/sim_files/spi_sim_debug

if [ -f "tb_spi_adc_debug.vcd" ]; then
    mv tb_spi_adc_debug.vcd iverilog/wave_files/
fi

echo "----------------------------------------"
echo "Opening Waveform..."
echo "----------------------------------------"
gtkwave iverilog/wave_files/tb_spi_adc_debug.vcd &