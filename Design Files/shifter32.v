`include "defines.v" 

module shifter32( 
    input wire [`NUM_LENGTH - 1 : 0] num, 

    output wire [`K_LENGTH - 1 : 0] k, 
    output wire [`M1_LENGTH - 1 : 0] m1
); 

    // detect k 
    always @ (*) begin 
        casex (num) 
            32'b0000_0000_0000_0000_0000_0000_0000_0000: k = 5'b00000; 
            32'b0000_0000_0000_0000_0000_0000_0000_0001: k = 5'b00000; 
            32'b0000_0000_0000_0000_0000_0000_0000_001x: k = 5'b00001; 
            32'b0000_0000_0000_0000_0000_0000_0000_01xx: k = 5'b00010; 
            32'b0000_0000_0000_0000_0000_0000_0000_1xxx: k = 5'b00011; 
            32'b0000_0000_0000_0000_0000_0000_0001_xxxx: k = 5'b00100; 
            32'b0000_0000_0000_0000_0000_0000_001x_xxxx: k = 5'b00101; 
            32'b0000_0000_0000_0000_0000_0000_01xx_xxxx: k = 5'b00110; 
            32'b0000_0000_0000_0000_0000_0000_1xxx_xxxx: k = 5'b00111; 
            32'b0000_0000_0000_0000_0000_0001_xxxx_xxxx: k = 5'b01000; 
            32'b0000_0000_0000_0000_0000_001x_xxxx_xxxx: k = 5'b01001; 
            32'b0000_0000_0000_0000_0000_01xx_xxxx_xxxx: k = 5'b01010; 
            32'b0000_0000_0000_0000_0000_1xxx_xxxx_xxxx: k = 5'b01011; 
            32'b0000_0000_0000_0000_0001_xxxx_xxxx_xxxx: k = 5'b01100; 
            32'b0000_0000_0000_0000_001x_xxxx_xxxx_xxxx: k = 5'b01101; 
            32'b0000_0000_0000_0000_01xx_xxxx_xxxx_xxxx: k = 5'b01110; 
            32'b0000_0000_0000_0000_1xxx_xxxx_xxxx_xxxx: k = 5'b01111; 
            32'b0000_0000_0000_0001_xxxx_xxxx_xxxx_xxxx: k = 5'b10000; 
            32'b0000_0000_0000_001x_xxxx_xxxx_xxxx_xxxx: k = 5'b10001; 
            32'b0000_0000_0000_01xx_xxxx_xxxx_xxxx_xxxx: k = 5'b10010; 
            32'b0000_0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx: k = 5'b10011; 
            32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b10100; 
            32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b10101; 
            32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b10110; 
            32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b10111; 
            32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11000; 
            32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11001; 
            32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11010; 
            32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11011; 
            32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11100; 
            32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11101; 
            32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11110; 
            32'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: k = 5'b11111; 
            default: k = 5'b00000; 
        endcase
    end

    // acquire m1, might have bug
    wire [`M1_LENGTH : 0] m0; 
    wire [`M1_LENGTH : 0] shift_16; 
    wire [`M1_LENGTH : 0] shift_8; 
    wire [`M1_LENGTH : 0] shift_4; 
    wire [`M1_LENGTH : 0] shift_2; 
    wire [`M1_LENGTH : 0] shift_1; 

    assign m0 = num[`NUM_LENGTH - 1 : `NUM_LENGTH - `M1_LENGTH - 1]; 
    assign shift_16 = k[4] ? m0 : (m0 << 16); 
    assign shift_8 = k[3] ? shift_16 : shift_16 << 8; 
    assign shift_4 = k[2] ? shift_8 : shift_8 << 4; 
    assign shift_2 = k[1] ? shift_4 : shift_4 << 2; 
    assign shift_1 = k[0] ? shift_2 : shift_2 << 1; 
    
    assign m1 = shift_1[`M1_LENGTH - 1 : 0]; // delete MSB

endmodule