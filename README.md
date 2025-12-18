# SPI SAR ADC Controller SoC

A comprehensive project featuring an SPI-based Successive Approximation Register (SAR) Analog-to-Digital Converter (ADC) digital controller, verified within a RISC-V System-on-Chip (SoC) environment and implemented using the Sky130 process node.

![Project Status](https://img.shields.io/badge/status-RTL--GDSII--ready-green)
![License](https://img.shields.io/badge/license-MIT-blue)
![Tech Node](https://img.shields.io/badge/tech-Sky130A-red)

## Table of Contents
1. [Project Overview](#project-overview)
2. [Repository Structure](#repository-structure)
3. [SPI Interface Specification](#spi-interface-specification)
4. [System Architecture](#system-architecture)
5. [Verification Strategy](#verification-strategy)
6. [Physical Implementation](#physical-implementation)
7. [Getting Started](#getting-started)
8. [Author & License](#author)

---

## Project Overview

This project implements a modular digital controller for a 12-bit SAR ADC, designed to interface seamlessly with analog comparators and capacitive DACs. The design emphasizes modularity, configurability, and power efficiency.

The system is partitioned into a core controller (handling the SAR algorithm and analog timing) and a standard 4-wire SPI slave interface (handling host communication). The design has been rigorously verified through a dual-phase strategy: block-level RTL validation and system-level hardware-firmware co-simulation using a PicoRV32 RISC-V processor.

Finally, the design was taken through a complete RTL-to-GDSII physical implementation flow using **LibreLane** and the **SkyWater 130nm PDK**.

> **Documentation:** For detailed SPI timing diagrams, register maps, and command protocols, please refer to the [project documentation](docs/).

### Key Features
* **Resolution:** Configurable data `WIDTH` (Default: 12-bit, Minimum: 8-bit).
* **Interface:** Standard 4-wire SPI Slave (Mode 0) with packet-based protocol.
* **Sampling Rate:** Programmable clock dividers supporting standard rates (e.g., 8ksps, 16ksps).
* **Power Management:** Aggressive clock gating logic to minimize dynamic power during idle states.
* **Atomic Operations:** Custom register map supporting atomic SET and CLEAR bit manipulations.
* **SoC Integration:** Validated via MMIO (Memory Mapped I/O) with a RISC-V CPU.

---

## Repository Structure

* **[docs/](docs/)**: Detailed design reports, presentations, and technical documentation.
* **[verilog/](verilog/)**: Source RTL for the ADC controller (`adc_controller.v`), SPI slave (`adc_spi_slave.v`), and the top-level wrapper (`spi_adc.v`). Also includes the PicoRV32-based SoC for testing.
* **[iverilog/](iverilog/)**: Simulation scripts, testbenches, and signal configuration files.
* **[riscv_toolchain/](riscv_toolchain/)**: Firmware source code (C and Assembly) and compilation scripts for the processor.
* **[librelane/](librelane/)**: Configuration files (`config.json`, `pin_order.cfg`) for physical design. *Note: Full run data is not included to maintain a lightweight repo.*

---

## SPI Interface Specification

The ADC acts as a standard SPI Slave optimized for low-latency access.

* **Mode:** SPI Mode 0 (CPOL=0, CPHA=0).
* **Frame Size:** HEADER (4-Bit: 2 Bit CMD + 2 Bit ADDR) + `WIDTH`

*Standard 16-bit packets for `WIDTH` = 12*

### Packet Structure

| Bit [1:0] | Bit [1:0] | Bit [WIDTH:0] |
| :--- | :--- | :--- |
| **Command (CMD)** | **Address (ADDR)** | **Payload / Data** |

### Commands
| CMD | Binary | Operation | Description |
| :--- | :--- | :--- | :--- |
| **READ** | `00` | Read Register | Transmits current register value on MISO. Payload is ignored. |
| **WRITE** | `01` | Write Register | Overwrites register with Payload. |
| **SET** | `10` | Set Mask | Atomic OR: `Reg <= Reg | Payload`. |
| **CLEAR** | `11` | Clear Mask | Atomic AND-NOT: `Reg <= Reg & ~Payload`. |

### Register Map
| Addr | Name | R/W | Description |
| :--- | :--- | :--- | :--- |
| **`00`** | `CTRL_REG` | R/W | **Control Register**.<br>• **Bit 0 (ADC_EN):** 1=Enable, 0=Shutdown.<br>• **Bit 1 (START):** Write 1 to trigger conversion (Self-clearing).<br>• **Bit 2 (AUTO):** 1=Continuous Mode, 0=Single Shot.<br>• **Bit 3 (VREF_SEL):** 0=Internal, 1=External.<br>• **Bit 4 (INT_EN):** 1=Enable hardware IRQ pin.<br>• **Bit 6 (CLK_SEL):** 0=8ksps, 1=16ksps. |
| **`01`** | `STATUS_REG` | RO | **Status Register**.<br>• **Bit 0 (EOC):** End of Conversion. Cleared automatically on data read.<br>• **Bit 1 (BUSY):** High during conversion. |
| **`02`** | `DATA_REG` | RO | **Data Register.** Holds the most recent 12-bit conversion result. |
| **`03`** | `INFO_REG` | RO | **Info Register.** Hardcoded Chip ID (e.g., `0xA`). |

---

## System Architecture

The architecture is deliberately flattened to minimize signal latency. It consists of three primary modules:

1.  **`adc_controller` (The Core)**:
    * Implements the Successive Approximation algorithm using a Finite State Machine (FSM).
    * Manages the Sample-and-Hold (S/H) timing and DAC control signals.
    * Ensures deterministic execution time ($N+2$ clock cycles per sample).

2.  **`adc_spi_slave` (The Bridge)**:
    * Manages high-speed serialization/deserialization.
    * Decodes the custom register map (Control, Status, Data, Info).
    * Implements "look-ahead" logic for zero-latency reads.

3.  **`spi_adc` (Top Level Wrapper)**:
    * Encapsulates the system and manages clock domain generation.
    * Derives the analog sampling clock from the system clock with configurable prescalers.

---

## Verification Strategy

The verification strategy is bifurcated into two phases:

### 1. Block-Level Verification
Utilizes a self-checking testbench to verify protocol compliance and timing adherence.
* **Coverage:** 12 distinct test scenarios covering Register R/W, VREF control, Data Integrity, and Interrupt Masking.
* **Results:** Verified correct FSM transitions and SPI Mode 0 compliance.

### 2. SoC-Level Verification (Hardware-Firmware Co-Simulation)
Integrates the IP into a realistic bus-based SoC using the **PicoRV32** core.
* **Firmware:** C-based drivers (`adc_read.c`) compiled via the RISC-V GNU Toolchain.
* **Scope:** Validates MMIO addressing, interrupt latency, and driver processing overhead.
* **Stimulus:** The testbench acts as the "Physical World," responding to CPU actions by changing analog voltage inputs.

---

## Physical Implementation

The physical layout was generated using the **LibreLane "Classic" Flow** (OpenROAD, Yosys, Magic, KLayout).

* **Process Node:** SkyWater 130nm (High Density).
* **Area:** $0.0178 \text{ mm}^2$ ($128.41 \mu\text{m} \times 139.13 \mu\text{m}$).
* **Power:** $108.9 \mu\text{W}$ Total Power (at 10MHz).
* **Signoff:** Passed DRC (Magic), LVS (Netgen), and Antenna checks.

---

## Getting Started

### Prerequisites

Ensure you have the following tools installed and added to your `$PATH`:
1.  **Icarus Verilog (v12.0+)**: For RTL simulation.
2.  **GTKWave**: For waveform analysis.
3.  **RISC-V GNU Toolchain**: Specifically `riscv64-unknown-elf-gcc` for compiling firmware.
4.  **LibreLane / OpenLane**: For reproducing the physical design (GDSII).

### Quick Start: Running the SoC Simulation

Follow these steps to compile the C firmware and run the full system simulation.

#### 1. Compile the Firmware
First, compile the C driver code into a hex file that the RISC-V processor can load into its memory.
```bash
# Navigate to the toolchain directory
cd riscv_toolchain

# Compile the firmware (source/adc_read.c -> firmware/firmware.hex)
# This uses the linker script to map code to the SoC's memory space
./compile.sh
```

#### 2. Run the RTL Simulation
Once the `firmware.hex` is generated, compile the Verilog testbench and run the simulation.
```bash
# Navigate to the simulation directory
cd ../iverilog

# Compile the design and testbench
iverilog -o soc_sim.out -I ../verilog/ ../verilog/spi_adc.v ../verilog/adc_controller.v ../verilog/adc_spi_slave.v testbench/tb_soc_adc.v

# Execute the simulation
vvp soc_sim.out
```

*Expected Output:*
You should see the self-checking testbench output indicating passed tests:
```text
SINGLE SHOT (16kHz) PASSED! (Got 2566)
AUTO SAMPLE 1 (8kHz) PASSED! (Got 1542)
...
ALL TESTS PASSED
```

#### 3. View Waveforms
To analyze the SPI packets and internal FSM state transitions:
```bash
gtkwave wave_files/tb_soc_adc.vcd
```

### Physical Implementation
To reproduce the GDSII layout using the Sky130 PDK:
```bash
# Navigate to the librelane directory
cd librelane

# Run the LibreLane flow using the provided config
librelane config.json 
```

---

## Author

**Saumya Raj Singh** ([@SaumyaRaj188](https://github.com/SaumyaRaj188))

*Please reach out via the contact details on my GitHub profile.*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.