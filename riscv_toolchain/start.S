.section .text
.global _start

_start:
    /* Set Stack Pointer to 16KB (0x4000) to match soc_basic.v */
    li sp, 0x4000 
    
    /* Jump to C code */
    call main

    /* Trap/Loop if main returns */
loop:
    j loop