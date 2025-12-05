.section .text
.global _start

_start:
    /* Set Stack Pointer to TOP of 16KB RAM (0x4000) */
    /* If this is wrong, the CPU crashes immediately on function calls */
    li sp, 0x4000 
    
    /* Jump to C code */
    call main

    /* Trap/Loop if main returns */
loop:
    j loop