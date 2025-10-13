import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
import random

# Testbench Parameters
CLK_PERIOD_NS = 10
SCK_PERIOD_NS = CLK_PERIOD_NS * 10

# DUT Parameters
READ    = 0b00
WRITE   = 0b01
SET     = 0b10
CLEAR   = 0b11
ADDR_CTRL_REG   = 0b00
ADDR_STATUS_REG = 0b01
ADDR_DATA_REG   = 0b10
ADDR_OFFSET_REG = 0b11

# --- Reusable SPI Master Coroutine ---
async def spi_transaction(dut, cmd, addr, data_in):
    """Drives a complete 16-bit SPI transaction, simulating a blind master."""
    tx_word = (cmd << 14) | (addr << 12) | data_in
    dut._log.info(f"[SPI TX] -> Sending 0x{tx_word:04X} (CMD: {cmd:02b}, ADDR: {addr:02b}, DATA: 0x{data_in:03X})")
    
    dut.cs.value = 0
    dut.sck.value = 0
    await Timer(SCK_PERIOD_NS / 2, unit='ns')

    rx_word = 0
    for i in range(15, -1, -1):
        dut.mosi.value = (tx_word >> i) & 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 0
        if dut.miso.value.is_resolvable:
            rx_word |= (dut.miso.value.integer << i)

    dut.cs.value = 1
    dut.mosi.value = 0
    dut._log.info(f"[SPI RX] <- Received 0x{rx_word:04X} (DATA: 0x{rx_word & 0xFFF:03X})")
    await Timer(CLK_PERIOD_NS * 2, unit='ns')
    return rx_word & 0xFFF

# --- Reset Coroutine ---
async def reset_dut(dut):
    """Applies a reset to the DUT."""
    dut.reset_.value = 0
    dut.cs.value = 1
    dut.sck.value = 0
    dut.mosi.value = 0
    await Timer(CLK_PERIOD_NS * 5, unit='ns')
    dut.reset_.value = 1
    await Timer(CLK_PERIOD_NS, unit='ns')
    dut._log.info("Reset complete.")

# --- Test Cases ---
@cocotb.test()
async def run_all_tests(dut):
    """Main test function to run all verification scenarios."""
    
    # Start the main system clock
    cocotb.start_soon(Clock(dut.clk, CLK_PERIOD_NS, unit='ns').start())
    
    # --- Test Case 1: Reset Verification ---
    dut._log.info("--- Test Case 1: Reset Verification ---")
    await reset_dut(dut)
    dut._log.info("Action: Reading from ADDR_STATUS_REG to verify reset value.")
    read_val = await spi_transaction(dut, READ, ADDR_STATUS_REG, 0)
    assert read_val == 0x800, f"Reset failed! Expected 0x800, got 0x{read_val:X}"
    dut._log.info("[PASS] Device correctly reset and status_reg reads 0x800.")

    # --- Test Case 2: Basic WRITE Command ---
    dut._log.info("\n--- Test Case 2: Basic WRITE Command ---")
    await spi_transaction(dut, WRITE, ADDR_CTRL_REG, 0xA5A)
    read_val = await spi_transaction(dut, READ, ADDR_CTRL_REG, 0)
    assert read_val == 0xA5A, f"WRITE command failed! Expected 0xA5A, got 0x{read_val:X}"
    dut._log.info("[PASS] WRITE command successfully updated ctrl_reg.")

    # --- Test Case 3: Basic READ Command (from status_reg) ---
    dut._log.info("\n--- Test Case 3: Basic READ Command (from status_reg) ---")
    read_val = await spi_transaction(dut, READ, ADDR_STATUS_REG, 0)
    assert read_val == 0x800
    dut._log.info(f"[PASS] READ command successfully returned status_reg value: 0x{read_val:X}")

    # --- Test Case 4: SET Command ---
    dut._log.info("\n--- Test Case 4: SET Command ---")
    await spi_transaction(dut, WRITE, ADDR_CTRL_REG, 0b1100_0011_0011)
    await spi_transaction(dut, SET, ADDR_CTRL_REG, 0b0000_1111_0000)
    expected_val = 0b1100_1111_0011
    read_val = await spi_transaction(dut, READ, ADDR_CTRL_REG, 0)
    assert read_val == expected_val, f"SET command failed! Expected 0x{expected_val:X}, got 0x{read_val:X}"
    dut._log.info("[PASS] SET command correctly performed bitwise OR.")

    # --- Test Case 5: CLEAR Command ---
    dut._log.info("\n--- Test Case 5: CLEAR Command ---")
    await spi_transaction(dut, WRITE, ADDR_CTRL_REG, 0b1100_1111_0011)
    await spi_transaction(dut, CLEAR, ADDR_CTRL_REG, 0b1100_0000_1100)
    expected_val = 0b0000_1111_0011
    read_val = await spi_transaction(dut, READ, ADDR_CTRL_REG, 0)
    assert read_val == expected_val, f"CLEAR command failed! Expected 0x{expected_val:X}, got 0x{read_val:X}"
    dut._log.info("[PASS] CLEAR command correctly performed bitwise AND-NOT.")

    # --- Test Case 6: Write to Read-Only Address ---
    dut._log.info("\n--- Test Case 6: Write to Read-Only Address ---")
    await spi_transaction(dut, WRITE, ADDR_STATUS_REG, 0xBAD)
    read_val = await spi_transaction(dut, READ, ADDR_STATUS_REG, 0)
    assert read_val == 0x800, "Write to read-only address was not ignored!"
    dut._log.info("[PASS] Write to read-only address was correctly ignored.")

    # --- Test Case 7: Back-to-Back Transactions ---
    dut._log.info("\n--- Test Case 7: Back-to-Back Transactions ---")
    dut.cs.value = 0
    dut.sck.value = 0
    await Timer(SCK_PERIOD_NS / 2, unit='ns')
    # Tx 1: Write
    dut._log.info("Action: Transaction 1 - WRITE 0xCDE to ADDR_CTRL_REG.")
    tx_word = (WRITE << 14) | (ADDR_CTRL_REG << 12) | 0xCDE
    for i in range(15, -1, -1):
        dut.mosi.value = (tx_word >> i) & 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 0
    await Timer(CLK_PERIOD_NS * 4, unit='ns') # Give DUT time to latch
    # Tx 2: Read
    dut._log.info("Action: Transaction 2 - READ from ADDR_CTRL_REG.")
    rx_word = 0
    tx_word = (READ << 14) | (ADDR_CTRL_REG << 12) | 0
    for i in range(15, -1, -1):
        dut.mosi.value = (tx_word >> i) & 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 0
        if dut.miso.value.is_resolvable:
            rx_word |= (dut.miso.value.integer << i)
    dut.cs.value = 1
    read_val = rx_word & 0xFFF
    assert read_val == 0xCDE, f"Back-to-back failed! Expected 0xCDE, got 0x{read_val:X}"
    dut._log.info("[PASS] Back-to-back transactions handled correctly.")

    # --- Test Case 8: Transaction Abort by CS ---
    dut._log.info("\n--- Test Case 8: Transaction Abort by CS ---")
    await spi_transaction(dut, WRITE, ADDR_CTRL_REG, 0x123)
    expected_val = 0x123
    tx_word = (WRITE << 14) | (ADDR_CTRL_REG << 12) | 0xFFF
    dut.cs.value = 0
    dut.sck.value = 0
    await Timer(SCK_PERIOD_NS / 2, unit='ns')
    for i in range(15, 5, -1): # Only send 10 bits
        dut.mosi.value = (tx_word >> i) & 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 0
    dut.cs.value = 1
    dut._log.info("Action: CS de-asserted. Transaction aborted.")
    await Timer(CLK_PERIOD_NS * 2, unit='ns')
    read_val = await spi_transaction(dut, READ, ADDR_CTRL_REG, 0)
    assert read_val == expected_val, f"Abort corrupted ctrl_reg! Expected 0x{expected_val:X}, got 0x{read_val:X}"
    dut._log.info("[PASS] Transaction abort did not corrupt ctrl_reg.")

    # --- Test Case 9: Idle Clocking (CS High) ---
    dut._log.info("\n--- Test Case 9: Idle Clocking (CS High) ---")
    dut.cs.value = 1
    for i in range(20):
        dut.sck.value = 0
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
        dut.sck.value = 1
        await Timer(SCK_PERIOD_NS / 2, unit='ns')
    read_val = await spi_transaction(dut, READ, ADDR_STATUS_REG, 0)
    assert read_val == 0x800, "FSM left IDLE state while unselected!"
    dut._log.info("[PASS] FSM remained in IDLE while unselected SCK toggled.")

    # --- Test Case 10: Read from all addresses ---
    dut._log.info("\n--- Test Case 10: Read from all addresses ---")
    read_val_data = await spi_transaction(dut, READ, ADDR_DATA_REG, 0)
    read_val_offset = await spi_transaction(dut, READ, ADDR_OFFSET_REG, 0)
    assert read_val_data == 0, f"data_reg should be 0, but was 0x{read_val_data:X}"
    assert read_val_offset == 0, f"offset_reg should be 0, but was 0x{read_val_offset:X}"
    dut._log.info("[PASS] All remaining registers read successfully.")

