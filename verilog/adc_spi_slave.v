/*
 * Module: adc_spi_slave
 * VERSION: FINAL SYNTHESIZABLE
 * Description: SPI Slave Interface matching the README.md register map.
 * Handles Register R/W, EOC latching, and status updates.
 */
module adc_spi_slave (
    // System Interface
    input           clk,            // System Clock
    input           reset_,         // Active-low Reset

    // SPI Interface
    input           cs,             // Chip Select
    input           sck,            // SPI Clock
    input           mosi,           // Master Out Slave In
    output          miso,           // Master In Slave Out

    // Hardware Interface (Connections to Top Level/ADC)
    input  [11:0]   adc_data_in,    // Live Data from ADC
    input           adc_busy_in,    // Live Busy Status from ADC
    input           adc_eoc_pulse,  // Pulse from ADC when conversion finishes (Sets EOC)
    input           hw_clear_start, // Signal from Top Level to clear the START bit
    output [11:0]   ctrl_reg_out,   // Expose Control Register to Top Level
    output          eoc_flag_out    // Expose EOC status for Interrupts
);

    // -- Address Map --
    localparam ADDR_CTRL   = 2'b00;
    localparam ADDR_STATUS = 2'b01;
    localparam ADDR_DATA   = 2'b10;
    localparam ADDR_INFO   = 2'b11;

    // -- Command Map --
    localparam CMD_READ  = 2'b00;
    localparam CMD_WRITE = 2'b01;
    localparam CMD_SET   = 2'b10;
    localparam CMD_CLEAR = 2'b11;

    // -- Internal Registers --
    reg [11:0] ctrl_reg;     
    reg        eoc_latch;    
    reg [11:0] data_reg;     
    reg [11:0] info_reg;     

    // -- SPI Logic Signals --
    reg [1:0]  state;
    reg [4:0]  bit_cnt;
    reg [15:0] shift_reg;
    reg [11:0] miso_buffer;
    
    // -- Synchronizers & Edge Detectors --
    reg sck_s1, sck_s2;
    reg eoc_s1, eoc_s2; 
    
    wire sck_rise;
    wire sck_fall;
    wire adc_eoc_rise; 

    assign sck_rise = (sck_s1 && !sck_s2);
    assign sck_fall = (!sck_s1 && sck_s2);
    // Detect 0->1 transition of the ADC ACK signal to safely latch EOC
    assign adc_eoc_rise = (eoc_s1 && !eoc_s2); 

    // Frame Parsing
    wire [1:0]  cmd;
    wire [1:0]  addr;
    wire [11:0] pay;
    
    assign cmd  = shift_reg[15:14];
    assign addr = shift_reg[13:12];
    assign pay  = shift_reg[11:0];

    // -- State Machine --
    localparam S_IDLE  = 2'b00;
    localparam S_SHIFT = 2'b01;
    localparam S_LATCH = 2'b10;

    // -- Assignments --
    assign ctrl_reg_out = ctrl_reg;
    assign eoc_flag_out = eoc_latch; 
    assign miso         = cs ? 1'bz : miso_buffer[11];

    // -- Synchronizers --
    always @(posedge clk or negedge reset_) begin
        if(!reset_) begin
            sck_s1 <= 0; sck_s2 <= 0;
            eoc_s1 <= 0; eoc_s2 <= 0;
        end else begin
            sck_s1 <= sck; sck_s2 <= sck_s1;
            // Sync ADC ACK to our clock domain
            eoc_s1 <= adc_eoc_pulse; eoc_s2 <= eoc_s1;
        end
    end

    // -- Main State Machine & Datapath --
    always @(posedge clk or negedge reset_) begin
        if(!reset_) begin
            state       <= S_IDLE;
            ctrl_reg    <= 12'h0;
            data_reg    <= 12'h0;
            info_reg    <= 12'h00A; 
            eoc_latch   <= 1'b0;
            bit_cnt     <= 0;
            shift_reg   <= 0;
            miso_buffer <= 0;
        end else begin
            
            // 1. EOC Management: 
            // Priority: Clear on Start (New Job) > Set on Finish (Job Done)
            if (hw_clear_start) begin
                eoc_latch <= 1'b0; 
            end else if (adc_eoc_rise) begin
                eoc_latch <= 1'b1; 
            end
            
            // 2. Hardware Clear of START bit
            if (hw_clear_start) begin
                ctrl_reg[1] <= 1'b0; 
            end

            // 3. Data Latch: Capture data immediately on EOC rise
            if (adc_eoc_rise) begin
                data_reg <= adc_data_in;
            end

            case(state)
                S_IDLE: begin
                    bit_cnt <= 0;
                    // Continuously update in IDLE, but respect the latch above if busy
                    if (!adc_eoc_rise) data_reg <= adc_data_in; 
                    
                    if(!cs) state <= S_SHIFT;
                end

                S_SHIFT: begin
                    if(cs) begin
                         state <= S_IDLE; 
                    end else if(sck_rise) begin
                        // Shift In
                        shift_reg <= {shift_reg[14:0], mosi}; 
                        bit_cnt   <= bit_cnt + 1;
                        
                        // Transition to LATCH on the 16th edge
                        if (bit_cnt == 15) begin
                            state <= S_LATCH;
                        end
                    end

                    // Shift Out (MISO) on Falling Edge
                    if(!cs && sck_fall) begin
                         miso_buffer <= {miso_buffer[10:0], 1'b0};
                    end

                    // Pre-load MISO buffer logic (after 4 bits for CMD/ADDR)
                    if(!cs && bit_cnt == 4 && sck_fall) begin 
                         if (shift_reg[3:2] == CMD_READ) begin 
                           case(shift_reg[1:0])
                                ADDR_CTRL:   miso_buffer <= ctrl_reg;
                                ADDR_STATUS: miso_buffer <= {10'b0, adc_busy_in, eoc_latch};
                                ADDR_DATA:   miso_buffer <= data_reg;
                                ADDR_INFO:   miso_buffer <= info_reg;
                           endcase
                        end
                    end
                end

                S_LATCH: begin
                    state <= S_IDLE; 
                    
                    // Execute Write Commands
                    if (addr == ADDR_CTRL) begin
                        case(cmd)
                            CMD_WRITE: ctrl_reg <= pay;
                            CMD_SET:   ctrl_reg <= ctrl_reg | pay;
                            CMD_CLEAR: ctrl_reg <= ctrl_reg & ~pay;
                        endcase
                    end
                    
                    // Clear on Read Logic for EOC
                    if (cmd == CMD_READ && addr == ADDR_STATUS) begin
                        eoc_latch <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule