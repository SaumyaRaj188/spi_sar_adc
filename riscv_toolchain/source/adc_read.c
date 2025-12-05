#include <stdint.h>

#define GPIO_BASE 0x20000000
volatile uint32_t *GPIO = (volatile uint32_t *)GPIO_BASE;

// Result Addresses
#define ADDR_SINGLE 0x00000400
#define ADDR_AUTO_1 0x00000404
#define ADDR_AUTO_2 0x00000408
#define ADDR_AUTO_3 0x0000040C
#define ADDR_ABORT  0x00000410 // New Address for Abort Test

// Register Bits
#define BIT_EN      (1 << 0)
#define BIT_START   (1 << 1)
#define BIT_AUTO    (1 << 2)
#define BIT_CLK_SEL (1 << 6) 

#define PIN_SCK  (1 << 0)
#define PIN_MOSI (1 << 1)
#define PIN_CS   (1 << 2)
#define PIN_MISO (1 << 3)

void delay(int cycles) { for(volatile int i=0; i<cycles; i++) __asm__("nop"); }

uint32_t gpio_state = 0;

void set_pins(int cs, int sck, int mosi) {
    uint32_t val = 0;
    if(cs)   val |= PIN_CS;
    if(sck)  val |= PIN_SCK;
    if(mosi) val |= PIN_MOSI;
    gpio_state = val;
    *GPIO = val;
}

uint16_t spi_transfer(uint16_t tx_frame) {
    uint16_t rx_frame = 0;
    set_pins(0, 0, 0); // CS Low
    for(int i=15; i>=0; i--) {
        int bit = (tx_frame >> i) & 1;
        set_pins(0, 0, bit);
        set_pins(0, 1, bit); 
        if( *GPIO & PIN_MISO ) rx_frame |= (1 << i);
        set_pins(0, 0, bit); 
    }
    set_pins(1, 0, 0); // CS High
    delay(5);
    return rx_frame;
}

uint16_t get_conversion() {
    uint16_t status;
    while(1) {
        status = spi_transfer(0x1000);
        if(status & 1) break; 
    }
    return spi_transfer(0x2000);
}

int main() {
    volatile int *ram_ptr;
    uint16_t result = 0;
    uint16_t cmd_val = 0;
    uint16_t status = 0;

    // --- PHASE 1: SINGLE SHOT (16 kHz) ---
    cmd_val = BIT_EN | BIT_CLK_SEL;
    spi_transfer(0x4000 | cmd_val); 
    cmd_val |= BIT_START;
    spi_transfer(0x4000 | cmd_val);
    
    result = get_conversion();
    ram_ptr = (volatile int *)ADDR_SINGLE;
    *ram_ptr = (result & 0xFFF);
    delay(500); 

    // --- PHASE 2: AUTO MODE (8 kHz) ---
    cmd_val = BIT_EN | BIT_START | BIT_AUTO; 
    spi_transfer(0x4000 | cmd_val);

    for(int i=0; i<3; i++) {
        result = get_conversion();
        ram_ptr = (volatile int *)(ADDR_AUTO_1 + (i*4));
        *ram_ptr = (result & 0xFFF);
        delay(500); 
    }

    // --- PHASE 3: ABORT TEST ---
    
    // 1. Ensure Auto Mode is still running (It should be)
    // 2. ABORT: Write 0 to CTRL (Disable ADC)
    // Cmd: WRITE(01) Addr: CTRL(00) Data: 0
    spi_transfer(0x4000);

    // 3. Verify Busy Flag is CLEARED
    while(1) {
        // Read Status
        status = spi_transfer(0x1000);
        
        // Check Bit 1 (BUSY). If it is 0, we successfully aborted.
        if ((status & 2) == 0) {
            // Success! Write Magic Number 0xAB07 (ABORT) to memory
            ram_ptr = (volatile int *)ADDR_ABORT;
            *ram_ptr = 0xAB07;
            break;
        }
        delay(10);
    }

    while(1);
}