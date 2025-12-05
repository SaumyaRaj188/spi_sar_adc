OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    /* LENGTH = 16K to match soc_basic.v */
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 16K
}

SECTIONS
{
    .text : {
        *(.text)           /* Code */
    } > RAM

    .data : {
        *(.data)           /* Initialized Variables */
    } > RAM

    .bss : {
        *(.bss)            /* Zero-filled Variables */
    } > RAM
}