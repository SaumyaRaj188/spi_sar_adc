iverilog -o spi_sim tb_spi_controller.v spi_controller.v

vvp spi_sim

gtkwave tb_spi_controller.vcd signals.gtkw