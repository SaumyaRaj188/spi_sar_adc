#!/bin/bash

# =============================================================================
# 1. PATH CONFIGURATION
# =============================================================================

# Get the directory where THIS script is stored (riscv_toolchain/)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define Output Directory (riscv_toolchain/firmware)
FIRMWARE_DIR="$SCRIPT_DIR/firmware"

# Ensure the folder exists
mkdir -p "$FIRMWARE_DIR"

# =============================================================================
# 2. ARGUMENT PARSING
# =============================================================================
C_FILE=""
OUT_NAME="firmware"

while getopts "f:" opt; do
  case $opt in
    f) C_FILE="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
        exit 1
    ;;
  esac
done

# =============================================================================
# 3. VALIDATION
# =============================================================================
if [ -z "$C_FILE" ]; then
    echo "Error: No input file specified."
    echo "Usage: ./riscv_toolchain/compile.sh -f <path/to/source/file.c>"
    exit 1
fi

if [ ! -f "$C_FILE" ]; then
    echo "Error: Source file '$C_FILE' not found."
    exit 1
fi

echo "--------------------------------------------------------"
echo "🔧 Compiling for RISC-V (RV32I)"
echo "   Script Root: $SCRIPT_DIR"
echo "   Source:      $C_FILE"
echo "   Helpers:     start.S, linker.ld (in Script Root)"
echo "   Output:      $FIRMWARE_DIR/$OUT_NAME.hex"
echo "--------------------------------------------------------"

# =============================================================================
# 4. COMPILATION STEPS
# =============================================================================

# Step 1: Compile C + Assembly -> ELF Executable
# We look for start.S and linker.ld in SCRIPT_DIR (riscv_toolchain/)
riscv64-unknown-elf-gcc \
    -march=rv32i \
    -mabi=ilp32 \
    -ffreestanding \
    -nostdlib \
    -o "$FIRMWARE_DIR/${OUT_NAME}.elf" \
    "$SCRIPT_DIR/start.S" \
    "$C_FILE" \
    -T "$SCRIPT_DIR/linker.ld"

if [ $? -ne 0 ]; then
    echo "❌ GCC Compilation Failed."
    exit 1
fi

# Step 2: Convert ELF -> HEX (for Verilog)
riscv64-unknown-elf-objcopy -O verilog "$FIRMWARE_DIR/${OUT_NAME}.elf" "$FIRMWARE_DIR/${OUT_NAME}.hex"

echo "✅ Success! Hex file generated at:"
echo "   $FIRMWARE_DIR/${OUT_NAME}.hex"