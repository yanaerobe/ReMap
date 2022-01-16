`include "defines.v" 

module shifter32( 
    input wire [`NUM_LENGTH - 1 : 0] num, 

    output wire [`K_LENGTH - 1 : 0] k, 
    output wire [`M1_LENGTH - 1 : 0] m1
); 

    // detect k 
    assign k = 
        num[31] ? 5'd31 : 
        num[30] ? 5'd30 : 
        num[29] ? 5'd29 : 
        num[28] ? 5'd28 : 
        num[27] ? 5'd27 : 
        num[26] ? 5'd26 : 
        num[25] ? 5'd25 : 
        num[24] ? 5'd24 : 
        num[23] ? 5'd23 : 
        num[22] ? 5'd22 : 
        num[21] ? 5'd21 : 
        num[20] ? 5'd20 : 
        num[19] ? 5'd19 : 
        num[18] ? 5'd18 : 
        num[17] ? 5'd17 : 
        num[16] ? 5'd16 : 
        num[15] ? 5'd15 : 
        num[14] ? 5'd14 : 
        num[13] ? 5'd13 : 
        num[12] ? 5'd12 : 
        num[11] ? 5'd11 : 
        num[10] ? 5'd10 : 
        num[9] ? 5'd9 : 
        num[8] ? 5'd8 : 
        num[7] ? 5'd7 : 
        num[6] ? 5'd6 : 
        num[5] ? 5'd5 : 
        num[4] ? 5'd4 : 
        num[3] ? 5'd3 : 
        num[2] ? 5'd2 : 
        num[1] ? 5'd1 : 
        5'd0; 

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