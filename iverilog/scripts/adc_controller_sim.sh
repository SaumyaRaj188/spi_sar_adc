# Step 1: Compile the Simulation
iverilog -o iverilog/sim_files/adc_sim iverilog/testbench/tb_adc_controller.v verilog/adc_controller.v 

# Step 2: Run the Simulation
vvp iverilog/sim_files/adc_sim +SEED=1222

# Step 3: View the Waveform
gtkwave iverilog/wave_files/tb_adc_controller.vcd