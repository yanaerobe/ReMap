`include "defines.v" 

module re_shifter32( 
    input wire [`NUM_LENGTH - 1 : 0] num, 

    output wire [`K_LENGTH - 1 : 0] k, 
    output wire [`M1_LENGTH - 1 : 0] m1
); 

    // detect k 
    assign k = 
        ({`K_LENGTH{num[31]}} & `K_LENGTH'd31) | 
        ({`K_LENGTH{num[30]}} & `K_LENGTH'd30) | 
        ({`K_LENGTH{num[29]}} & `K_LENGTH'd29) | 
        ({`K_LENGTH{num[28]}} & `K_LENGTH'd28) | 
        ({`K_LENGTH{num[27]}} & `K_LENGTH'd27) | 
        ({`K_LENGTH{num[26]}} & `K_LENGTH'd26) | 
        ({`K_LENGTH{num[25]}} & `K_LENGTH'd25) | 
        ({`K_LENGTH{num[24]}} & `K_LENGTH'd24) | 
        ({`K_LENGTH{num[23]}} & `K_LENGTH'd23) | 
        ({`K_LENGTH{num[22]}} & `K_LENGTH'd22) | 
        ({`K_LENGTH{num[21]}} & `K_LENGTH'd21) | 
        ({`K_LENGTH{num[20]}} & `K_LENGTH'd20) | 
        ({`K_LENGTH{num[19]}} & `K_LENGTH'd19) | 
        ({`K_LENGTH{num[18]}} & `K_LENGTH'd18) | 
        ({`K_LENGTH{num[17]}} & `K_LENGTH'd17) | 
        ({`K_LENGTH{num[16]}} & `K_LENGTH'd16) | 
        ({`K_LENGTH{num[15]}} & `K_LENGTH'd15) | 
        ({`K_LENGTH{num[14]}} & `K_LENGTH'd14) | 
        ({`K_LENGTH{num[13]}} & `K_LENGTH'd13) | 
        ({`K_LENGTH{num[12]}} & `K_LENGTH'd12) | 
        ({`K_LENGTH{num[11]}} & `K_LENGTH'd11) | 
        ({`K_LENGTH{num[10]}} & `K_LENGTH'd10) | 
        ({`K_LENGTH{num[9]}} & `K_LENGTH'd9) | 
        ({`K_LENGTH{num[8]}} & `K_LENGTH'd8) | 
        ({`K_LENGTH{num[7]}} & `K_LENGTH'd7) | 
        ({`K_LENGTH{num[6]}} & `K_LENGTH'd6) | 
        ({`K_LENGTH{num[5]}} & `K_LENGTH'd5) | 
        ({`K_LENGTH{num[4]}} & `K_LENGTH'd4) | 
        ({`K_LENGTH{num[3]}} & `K_LENGTH'd3) | 
        ({`K_LENGTH{num[2]}} & `K_LENGTH'd2) | 
        ({`K_LENGTH{num[1]}} & `K_LENGTH'd1) | 
        ({`K_LENGTH{num[0]}} & `K_LENGTH'd0); 

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