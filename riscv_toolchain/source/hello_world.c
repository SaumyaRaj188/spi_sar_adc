#include <stdint.h>

// We write our result to this address in RAM (1KB offset)
// Address 0x400 = 1024. In a 32-bit array, this is index 256.
#define RESULT_ADDR 0x00000400

int main() {
    int a = 10;
    int b = 20;
    int c = 0;

    // The Logic: 10 + 20 = 30
    c = a + b; 

    // Write the result to memory so the Testbench can see it
    volatile int *ptr = (volatile int *)RESULT_ADDR;
    *ptr = c;

    // Infinite loop to stop execution
    while(1);

    return 0;
}