#include <stdint.h>

// --- Hardware Definitions ---
#define GPIO_BASE 0x20000000
volatile uint32_t *GPIO = (volatile uint32_t *)GPIO_BASE;
#define RESULT_ADDR 0x00000400  // Where we save result for Testbench

// --- Bit Masks for GPIO ---
#define PIN_SCK  (1 << 0)
#define PIN_MOSI (1 << 1)
#define PIN_CS   (1 << 2)
#define PIN_MISO (1 << 3)

// --- Helper Functions ---
void delay(int cycles) { for(volatile int i=0; i<cycles; i++); }

// Logging Helper: Writes to the specific RAM address that Verilog monitors.
// In soc_adc.v, any write to 0x400 triggers a $display().
void debug_log(uint32_t val) {
    volatile int *ram_ptr = (volatile int *)RESULT_ADDR;
    *ram_ptr = val; 
}

uint32_t gpio_state = 0; // Shadow register

void set_pins(int cs, int sck, int mosi) {
    uint32_t val = 0;
    if(cs)   val |= PIN_CS;
    if(sck)  val |= PIN_SCK;
    if(mosi) val |= PIN_MOSI;
    gpio_state = val;
    *GPIO = val;
}

// Bit-Bang 16-bit Transfer
uint16_t spi_transfer(uint16_t tx_frame) {
    uint16_t rx_frame = 0;
    
    // CS Low (Start)
    set_pins(0, 0, 0);
    delay(5);

    for(int i=15; i>=0; i--) {
        // 1. Setup MOSI
        int bit = (tx_frame >> i) & 1;
        set_pins(0, 0, bit);
        
        // 2. SCK High (Sample MISO)
        set_pins(0, 1, bit);
        
        // Read MISO
        if( *GPIO & PIN_MISO ) {
            rx_frame |= (1 << i);
        }
        
        // 3. SCK Low
        set_pins(0, 0, bit);
    }

    // CS High (End)
    set_pins(1, 0, 0);
    delay(20); // Inter-frame delay
    
    return rx_frame;
}

// --- Main Program ---
int main() {
    volatile int *ram_ptr = (volatile int *)RESULT_ADDR;
    uint16_t result = 0;
    uint16_t status = 0;

    // Log: Start of Main
    // Magic Number 0xAAAA indicates "Alive and Starting"
    debug_log(0xAAAA);

    // 1. Initialize: Enable ADC (Bit 0 of CTRL)
    // Cmd: WRITE(01) Addr: CTRL(00) Data: 1
    // Frame: 01 00 000000000001 -> 0x4001
    spi_transfer(0x4001); 
    
    // Log: Initialization Sent (0xBBBB)
    debug_log(0xBBBB);

    // 2. Start Conversion (Bit 1 of CTRL)
    // Cmd: SET(10) Addr: CTRL(00) Data: 2 (Bit 1)
    // Frame: 10 00 000000000010 -> 0x8002
    spi_transfer(0x8002);

    // Log: Conversion Start Sent (0xCCCC)
    debug_log(0xCCCC);

    // 3. Poll Status until EOC (Bit 0 of STATUS) is 1
    // Cmd: READ(00) Addr: STATUS(01)
    // Frame: 00 01 000000000000 -> 0x1000
    while(1) {
        status = spi_transfer(0x1000);
        
        // Log the raw status register to see what we are reading
        // Mask with 0xFFFF0000 to indicate "Status Log" prefix if desired, 
        // but raw value is easier to read.
        debug_log(status); 

        // Check Bit 0 (EOC)
        // If Bit 0 is 1, conversion is done
        if(status & 1) {
            break; 
        }
        
        // Small delay to prevent hammering the bus too fast
        delay(10);
    }

    // Log: EOC Detected (0xDDDD)
    debug_log(0xDDDD);

    // 4. Read Data
    // Cmd: READ(00) Addr: DATA(10)
    // Frame: 00 10 000000000000 -> 0x2000
    result = spi_transfer(0x2000);

    // 5. Write Result to RAM for verification
    *ram_ptr = (result & 0xFFF); 

    // STOP HERE: Do not overwrite with debug log!
    // The testbench will see the write to RESULT_ADDR and finish.
    while(1); 
}