OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    /* Must match the RAM size in your Verilog (0 to 0x3FFF) */
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 16K
}

SECTIONS
{
    .text : { *(.text) } > RAM
    .data : { *(.data) } > RAM
    .bss  : { *(.bss)  } > RAM
}