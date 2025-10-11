iverilog -o iverilog/sim_files/spi_sim iverilog/testbench/tb_adc_spi_slave.v verilog/adc_spi_slave.v

vvp iverilog/sim_files/spi_sim

# gtkwave iverilog/wave_files/tb_adc_spi_slave.vcd
gtkwave iverilog/wave_files/tb_adc_spi_slave.vcd iverilog/signals/adc_spi_slave.gtkw
