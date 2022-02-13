`timescale 1ns / 1ns

`include "defines.v"

module re_map( 
    input wire [`M1_LENGTH - 1 : 0] m1, 

    output wire [`M2_LENGTH - 1 : 0] m2
); 

    // generate nodes and constants
    wire [`M1_LENGTH - 1 : 0] node [`NODE_NUM - 1 : 0]; 
    wire [`M1_LENGTH - 1 : 0] intcpt [`PIECE_NUM - 1 : 0]; 
    `include "re_data.v"

    // compare 
    wire [`PIECE_NUM - 1 : 0] piece; 
    wire [`M1_LENGTH - 1 : 0] const; 

    genvar i; 
    generate 
        for (i = 0; i < 41; i = i + 1) begin 
            assign piece[i] = ((node[i] < m1) && (m1 <= node[i+1])); 
        end
    endgenerate 

    assign const = 
        ({`M1_LENGTH{piece[0]}} & intcpt[0]) | 
        ({`M1_LENGTH{piece[1]}} & intcpt[1]) | 
        ({`M1_LENGTH{piece[2]}} & intcpt[2]) | 
        ({`M1_LENGTH{piece[3]}} & intcpt[3]) | 
        ({`M1_LENGTH{piece[4]}} & intcpt[4]) | 
        ({`M1_LENGTH{piece[5]}} & intcpt[5]) | 
        ({`M1_LENGTH{piece[6]}} & intcpt[6]) | 
        ({`M1_LENGTH{piece[7]}} & intcpt[7]) | 
        ({`M1_LENGTH{piece[8]}} & intcpt[8]) | 
        ({`M1_LENGTH{piece[9]}} & intcpt[9]) | 
        ({`M1_LENGTH{piece[10]}} & intcpt[10]) | 
        ({`M1_LENGTH{piece[11]}} & intcpt[11]) | 
        ({`M1_LENGTH{piece[12]}} & intcpt[12]) | 
        ({`M1_LENGTH{piece[13]}} & intcpt[13]) | 
        ({`M1_LENGTH{piece[14]}} & intcpt[14]) | 
        ({`M1_LENGTH{piece[15]}} & intcpt[15]) | 
        ({`M1_LENGTH{piece[16]}} & intcpt[16]) | 
        ({`M1_LENGTH{piece[17]}} & intcpt[17]) | 
        ({`M1_LENGTH{piece[18]}} & intcpt[18]) | 
        ({`M1_LENGTH{piece[19]}} & intcpt[19]) | 
        ({`M1_LENGTH{piece[20]}} & intcpt[20]) | 
        ({`M1_LENGTH{piece[21]}} & intcpt[21]) | 
        ({`M1_LENGTH{piece[22]}} & intcpt[22]) | 
        ({`M1_LENGTH{piece[23]}} & intcpt[23]) | 
        ({`M1_LENGTH{piece[24]}} & intcpt[24]) | 
        ({`M1_LENGTH{piece[25]}} & intcpt[25]) | 
        ({`M1_LENGTH{piece[26]}} & intcpt[26]) | 
        ({`M1_LENGTH{piece[27]}} & intcpt[27]) | 
        ({`M1_LENGTH{piece[28]}} & intcpt[28]) | 
        ({`M1_LENGTH{piece[29]}} & intcpt[29]) | 
        ({`M1_LENGTH{piece[30]}} & intcpt[30]) | 
        ({`M1_LENGTH{piece[31]}} & intcpt[31]) | 
        ({`M1_LENGTH{piece[32]}} & intcpt[32]) | 
        ({`M1_LENGTH{piece[33]}} & intcpt[33]) | 
        ({`M1_LENGTH{piece[34]}} & intcpt[34]) | 
        ({`M1_LENGTH{piece[35]}} & intcpt[35]) | 
        ({`M1_LENGTH{piece[36]}} & intcpt[36]) | 
        ({`M1_LENGTH{piece[37]}} & intcpt[37]) | 
        ({`M1_LENGTH{piece[38]}} & intcpt[38]) | 
        ({`M1_LENGTH{piece[39]}} & intcpt[39]) | 
        ({`M1_LENGTH{piece[40]}} & intcpt[40]); 

    wire seg_1; 
    wire seg_2; 
    wire seg_3; 
    wire seg_4; 

    assign seg_1 = (piece[`SEG1_NUM - 1 : 0] || 0); 
    assign seg_2 = (piece[`SEG2_NUM + `SEG1_NUM - 1 : `SEG1_NUM] || 0); 
    assign seg_3 = (piece[`SEG3_NUM + `SEG2_NUM + `SEG1_NUM - 1 : `SEG2_NUM + `SEG1_NUM] || 0); 
    assign seg_4 = (piece[`PIECE_NUM - 1 : `PIECE_NUM - `SEG4_NUM] || 0); 
    
    // shift for adder 2
    wire [`M1_LENGTH - 1 : 0] adder; 

    assign adder = 
        ({`M1_LENGTH{seg_1}} & (m1 << 2)) | 
        ({`M1_LENGTH{seg_2}} & 0) | 
        ({`M1_LENGTH{seg_3}} & -(m1 >> 3)) | 
        ({`M1_LENGTH{seg_4}} & -(m1 >> 2)); // if wrong, it's subtraction

    // add adder 2
    wire [`M1_LENGTH - 1 : 0] m2_r; 
     
    assign m2_r = (m1 + adder + const); 
    assign m2 = m2_r[`M1_LENGTH - 1 : 1]; 

endmodule
