###############################################################################
# Created by write_sdc
###############################################################################
current_design spi_adc
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name sys_clk -period 100.0000 [get_ports {sys_clk}]
set_clock_transition 0.1500 [get_clocks {sys_clk}]
set_clock_uncertainty 0.2500 sys_clk
set_input_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {comparator}]
set_input_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {cs}]
set_input_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {mosi}]
set_input_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {reset_}]
set_input_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {sck}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {adc_clk_out}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[0]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[10]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[11]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[1]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[2]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[3]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[4]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[5]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[6]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[7]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[8]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac[9]}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {dac_rst}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {irq}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {miso}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {pwr_gate}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {sample_and_hold}]
set_output_delay 20.0000 -clock [get_clocks {sys_clk}] -add_delay [get_ports {vref_sel}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {adc_clk_out}]
set_load -pin_load 0.0334 [get_ports {dac_rst}]
set_load -pin_load 0.0334 [get_ports {irq}]
set_load -pin_load 0.0334 [get_ports {miso}]
set_load -pin_load 0.0334 [get_ports {pwr_gate}]
set_load -pin_load 0.0334 [get_ports {sample_and_hold}]
set_load -pin_load 0.0334 [get_ports {vref_sel}]
set_load -pin_load 0.0334 [get_ports {dac[11]}]
set_load -pin_load 0.0334 [get_ports {dac[10]}]
set_load -pin_load 0.0334 [get_ports {dac[9]}]
set_load -pin_load 0.0334 [get_ports {dac[8]}]
set_load -pin_load 0.0334 [get_ports {dac[7]}]
set_load -pin_load 0.0334 [get_ports {dac[6]}]
set_load -pin_load 0.0334 [get_ports {dac[5]}]
set_load -pin_load 0.0334 [get_ports {dac[4]}]
set_load -pin_load 0.0334 [get_ports {dac[3]}]
set_load -pin_load 0.0334 [get_ports {dac[2]}]
set_load -pin_load 0.0334 [get_ports {dac[1]}]
set_load -pin_load 0.0334 [get_ports {dac[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {comparator}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {cs}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {mosi}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset_}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sck}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sys_clk}]
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_capacitance 0.2000 [current_design]
set_max_fanout 10.0000 [current_design]
