# SPI Interface
Type 0

## SPI Register Summary

| Address | Register Name     | R/W | Description                               |
| :------ | :---------------- | :-- | :---------------------------------------- |
| `0b00`  | `CTRL_REG`        | R/W | Main control register.                    |
| `0b01`  | `STATUS_REG` | R   | Combined status flags and device info.    |
| `0b10`  | `DATA_REG`        | R   | Holds the 12-bit conversion result.       |
| `0b11`  | `INFO_REG`  | R   | Stores the offset from the calibration.   |


### `0b00` CTRL\_REG (ADC Control Register)

| Bit(s)   | Name       | Function                                            |
| :------- | :--------- | :-------------------------------------------------- |
| **0** | `ADC_EN`   | `1` = ADC Enable, `0` = Shutdown                    |
| **1** | `START`    | `1` = Start Conversion (Self-clearing)              |
| **2** | `AUTO`     | `1` = Auto Mode, `0` = Manual Mode                  |
| **3** | `VREF_SEL` | `1` = External $V_{ref}$, `0` = Internal $V_{ref}$ |
| **4** | `INT_EN`   | `1` = Interrupt Enable, `0` = Interrupt Disable     |
| **6** | `CLK_SEL`  | `0` = 8 kHz, `1` = 16 kHz                           |
| **[11:7]** | `-`        | Reserved (Read as `0`)                              |

### `0b01` STATUS\_REG (ADC Status Register)

| Bit(s)   | Name       | Function                                                       |
| :------- | :--------- | :------------------------------------------------------------- |
| **0** | `EOC`      | **End of Conversion.** `1` when complete. Cleared on read.     |
| **1** | `BUSY`     | `1` when a conversion or calibration is in progress.           |
| **[11:2]** | `-`        | Reserved (Read as `0`).                            |

### `0b10` DATA\_REG (ADC Data Register)

| Bit(s)   | Name       | Function                          |
| :------- | :--------- | :-------------------------------- |
| **[11:0]** | `ADC_DATA` | The 12-bit conversion result.     |

### `0b11` INFO\_REG (Chip Info Register)

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


***
