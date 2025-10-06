## ADC Controller Simulation

### How to Compile and View with `iverilog` and `gtkwave`

Follow these steps on a Linux command line (or a similar environment like WSL on Windows).

**Prerequisites:** You have Icarus Verilog (`iverilog`) and GTKWave (`gtkwave`) installed.

**Step 1: Save the Files**
Save all three Verilog files in the same directory:
* `adc_alu.v`
* `adc_controller.v`
* `tb_adc_controller.v`

**Step 2: Compile the Simulation**
Open your terminal in that directory and run this command. This tells `iverilog` to compile all three source files into a single executable simulation file named `adc_sim`.

```bash
iverilog -o adc_sim tb_adc_controller.v adc_controller.v adc_alu.v
```

**Step 3: Run the Simulation**
Now, run the compiled file. This will execute the testbench, print the `$display` messages to your terminal, and create the waveform file `tb_adc_controller.vcd`.

```bash
vvp adc_sim
```


**Step 4: View the Waveform in GTKWave**
Finally, open the generated VCD file with GTKWave:

```bash
gtkwave tb_adc_controller.vcd
```



## SPI Register Summary

| Address | Register Name     | R/W | Description                               |
| :------ | :---------------- | :-- | :---------------------------------------- |
| `0b00`  | `CTRL_REG`        | R/W | Main control register.                    |
| `0b01`  | `STATUS_INFO_REG` | R   | Combined status flags and device info.    |
| `0b10`  | `DATA_REG`        | R   | Holds the 12-bit conversion result.       |
| `0b11`  | `CAL_OFFSET_REG`  | R   | Stores the offset from the calibration.   |


### `0b00` CTRL\_REG (Control Register)

| Bit(s)   | Name       | Function                                            |
| :------- | :--------- | :-------------------------------------------------- |
| **0** | `ADC_EN`   | `1` = ADC Enable, `0` = Shutdown                    |
| **1** | `START`    | `1` = Start Conversion (Self-clearing)              |
| **2** | `AUTO`     | `1` = Auto Mode, `0` = Manual Mode                  |
| **3** | `VREF_SEL` | `1` = External $V_{ref}$, `0` = Internal $V_{ref}$ |
| **4** | `INT_EN`   | `1` = Interrupt Enable, `0` = Interrupt Disable     |
| **5** | `CAL`      | `1` = Start Calibration (Self-clearing)             |
| **6** | `CLK_SEL`  | `0` = 8 kHz, `1` = 16 kHz                           |
| **[11:7]** | `-`        | Reserved (Read as `0`)                              |

### `0b01` STATUS\_INFO\_REG (Status & Info Register)

| Bit(s)   | Name       | Function                                                       |
| :------- | :--------- | :------------------------------------------------------------- |
| **0** | `EOC`      | **End of Conversion.** `1` when complete. Cleared on read.     |
| **1** | `BUSY`     | `1` when a conversion or calibration is in progress.           |
| **2** | `VREF_RDY` | `1` when the internal voltage reference is stable.             |
| **[7:3]** | `-`        | Reserved (Read as `0`).                                        |
| **[11:8]** | `VERSION`  | A 4-bit hardware version number.                               |

### `0b10` DATA\_REG (Data Register)

| Bit(s)   | Name       | Function                          |
| :------- | :--------- | :-------------------------------- |
| **[11:0]** | `ADC_DATA` | The 12-bit conversion result.     |

### `0b11` CAL\_OFFSET\_REG (Calibration Offset Register)

| Bit(s)   | Name         | Function                                     |
| :------- | :----------- | :------------------------------------------- |
| **[11:0]** | `CAL_OFFSET` | The 12-bit offset value from calibration.    |
