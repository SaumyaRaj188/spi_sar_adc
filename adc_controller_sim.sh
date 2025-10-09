# Step 1: Compile the Simulation
iverilog -o adc_sim tb_adc_controller.v adc_controller.v 

# Step 2: Run the Simulation
vvp adc_sim +SEED=1222

# Step 3: View the Waveform
gtkwave tb_adc_controller.vcd