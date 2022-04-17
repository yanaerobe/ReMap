`include "defines.v" 

module shifter32( 
    input wire [`NUM_LENGTH - 1 : 0] num, 
    input wire [`K_LENGTH - 1 : 0] k, 

    output wire [`M1_LENGTH - 1 : 0] m1
); 

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
