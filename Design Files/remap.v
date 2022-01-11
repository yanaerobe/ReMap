`timescale 1ns / 1ns

`include "defines.v"

module remap( 
    input wire [`M1_LENGTH - 1 : 0] m1, 

    output wire [`M2_LENGTH - 1 : 0] m2
); 

    // generate nodes and constants
    reg [`M1_LENGTH - 1 : 0] node [`NODE_NUM - 1 : 0]; 
    reg [`M1_LENGTH - 1 : 0] intcpt [`PIECE_NUM - 1 : 0]; 
    initial begin 
        $readmemh("node.verilog", node); 
        $readmemh("intcpt.verilog", intcpt); 
    end

    // compare 
    wire [`PIECE_NUM - 1 : 0] piece; 
    wire [`M1_LENGTH - 1 : 0] const = `M1_LENGTH'b0; 

    genvar i; 
    generate 
        for (i = 0; i < 42; i = i + 1) begin 
            assign piece[i] = (node[i] < m1 && m1 <= node[i+1]); 
            assign const = const || ({`M1_LENGTH{piece[i]}} & intcpt[i]); 
        end
    endgenerate 

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