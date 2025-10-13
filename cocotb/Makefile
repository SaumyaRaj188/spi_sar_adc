# Makefile for Cocotb Simulation

# Default simulator
SIM ?= icarus

# Language of the top-level design
TOPLEVEL_LANG ?= verilog

# --- CRITICAL CHANGE ---
# Point to the Verilog source file, which is one directory up from here.
VERILOG_SOURCES = ../verilog/adc_spi_slave.v

# The name of the top-level Verilog module you are testing
TOPLEVEL = adc_spi_slave

# The name of the Python file containing your test cases (in this directory)
MODULE = test_adc_spi_slave

# Include Cocotb's standard make rules
include $(shell cocotb-config --makefiles)/Makefile.sim