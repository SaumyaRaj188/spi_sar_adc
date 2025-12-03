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

### How to use CocoTB for testing 
Install cocotb
```bash
python3 -m venv venv
source venv/bin/activate
pip install cocotb
deactivate
```

Before running cocotb, activate the virtual environment
```bash
source venv/bin/activate
```


Run CocoTB



# SPI Interface
Type 0

## SPI Register Summary

| Address | Register Name     | R/W | Description                               |
| :------ | :---------------- | :-- | :---------------------------------------- |
| `0b00`  | `CTRL_REG`        | R/W | Main control register.                    |
| `0b01`  | `STATUS_REG` | R   | Combined status flags and device info.    |
| `0b10`  | `DATA_REG`        | R   | Holds the 12-bit conversion result.       |
| `0b11`  | `INFO_REG`  | R   | Stores the offset from the calibration.   |


### `0b00` CTRL\_REG (Control Register)

| Bit(s)   | Name       | Function                                            |
| :------- | :--------- | :-------------------------------------------------- |
| **0** | `ADC_EN`   | `1` = ADC Enable, `0` = Shutdown                    |
| **1** | `START`    | `1` = Start Conversion (Self-clearing)              |
| **2** | `AUTO`     | `1` = Auto Mode, `0` = Manual Mode                  |
| **3** | `VREF_SEL` | `1` = External $V_{ref}$, `0` = Internal $V_{ref}$ |
| **4** | `INT_EN`   | `1` = Interrupt Enable, `0` = Interrupt Disable     |
| **6** | `CLK_SEL`  | `0` = 8 kHz, `1` = 16 kHz                           |
| **[11:7]** | `-`        | Reserved (Read as `0`)                              |

### `0b01` STATUS\_REG (Status & Info Register)

| Bit(s)   | Name       | Function                                                       |
| :------- | :--------- | :------------------------------------------------------------- |
| **0** | `EOC`      | **End of Conversion.** `1` when complete. Cleared on read.     |
| **1** | `BUSY`     | `1` when a conversion or calibration is in progress.           |
| **[11:2]** | `-`        | Reserved (Read as `0`).                            |

### `0b10` DATA\_REG (Data Register)

| Bit(s)   | Name       | Function                          |
| :------- | :--------- | :-------------------------------- |
| **[11:0]** | `ADC_DATA` | The 12-bit conversion result.     |

### `0b11` INFO\_REG (Calibration Offset Register)

| Bit(s)   | Name         | Function                                     |
| :------- | :----------- | :------------------------------------------- |
| **[11:0]** | `VERSION_INFO` | Info and version no.    |




---
## Frame Structure

| Bits      | Field Name     | Size  | Description                                        |
| :-------- | :------------- | :---- | :------------------------------------------------- |
| **[15:14]** | **`CMD`** | 2 bits | Specifies the operation (Read, Write, etc.).        |
| **[13:12]** | **`ADDR`** | 2 bits | Selects which of the four internal registers to access. |
| **[11:0]** | **`PAYLOAD`** | 12 bits | Contains the data for a write or is ignored for a read. |

### Field Definitions

#### **`CMD` (Command)**
* `2'b00`: **READ** - Reads data from the register at `ADDR`.
* `2'b01`: **WRITE** - Writes the `PAYLOAD` to the register at `ADDR`.
* `2'b10`: **SET MASK** - Sets bits in `CTRL_REG` using the `PAYLOAD` as a mask.
* `2'b11`: **CLEAR MASK** - Clears bits in `CTRL_REG` using the `PAYLOAD` as a mask.

#### **`ADDR` (Address)**
* `2'b00`: `CTRL_REG` (Control Register)
* `2'b01`: `STATUS_INFO_REG` (Status Register)
* `2'b10`: `DATA_REG` (Data Register)
* `2'b11`: `CAL_OFFSET_REG` (Calibration Register)

### Usage Examples

* **To WRITE `12'h5A5` to the `CTRL_REG`:**
    * **CMD:** `01`
    * **ADDR:** `00`
    * **PAYLOAD:** `10110100101` (`5A5`)
    * **Full 16-bit frame:** `0100 0101 1010 0101` = **`16'h45A5`**
    * **Full 16-bit miso frame:** `0000 0000 0000 0000` = **`16'h0000`**

* **To READ from the `STATUS_INFO_REG`:**
    * **CMD:** `00`
    * **ADDR:** `01`
    * **PAYLOAD:** `000000000000` (Don't care)
    * **Full 16-bit frame:** `0001 0000 0000 0000` = **`16'h1000`**
    * **Full 16-bit miso frame:** `0000 ___ ___ ___` = **`16'h0___`**


Of course. Here is the complete pinout for the final, synchronous `spi_controller` module we designed.

The pins are categorized into System, SPI Interface, Control Outputs, and Data/Status Inputs, matching the Verilog module definition.

***
### ## `spi_controller` Pinout

| Pin Name | Type | Function |
| :--- | :--- | :--- |
| **System Signals** |
| `clk` | Input | **Main System Clock**. Drives the internal FSM and logic. |
| `reset_n` | Input | **Active-Low Reset**. Asynchronously resets the entire module. |
| **External SPI Bus** |
| `spi_sclk` | Input | **Serial Clock** from the SPI master. |
| `spi_cs` | Input | **Chip Select** (Active Low). Enables the SPI interface. |
| `spi_mosi` | Input | **Master Out, Slave In**. Receives data from the master. |
| `spi_miso` | Output | **Master In, Slave Out**. Sends data back to the master. |
| **Control Outputs** |
| `adc_en_o` | Output | `CTRL_REG[0]`: ADC Enable signal to the ADC core. |
| `start_conv_o`| Output | `CTRL_REG[1]`: Start Conversion signal. |
| `auto_mode_o` | Output | `CTRL_REG[2]`: Auto/Manual Mode select signal. |
| `vref_sel_o` | Output | `CTRL_REG[3]`: Voltage Reference select signal. |
| `int_en_o` | Output | `CTRL_REG[4]`: Interrupt Enable signal. |
| `start_cal_o` | Output | `CTRL_REG[5]`: Start Calibration signal. |
| `clk_sel_o` | Output | `CTRL_REG[6]`: Clock Select (8kHz/16kHz) signal. |
| **Data/Status Inputs** |
| `adc_data_i` | Input [11:0] | The 12-bit conversion result from the ADC core. |
| `cal_offset_i`| Input [11:0] | The 12-bit calibration result from the ADC core. |
| `eoc_i` | Input | **End of Conversion** flag from the ADC core. |
| `busy_i` | Input | **Busy** flag from the ADC core. |
| `vref_rdy_i` | Input | **Voltage Reference Ready** flag from the ADC core. |