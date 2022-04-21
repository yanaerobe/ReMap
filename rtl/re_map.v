`timescale 1ns / 1ns

`include "defines.v"

module remap( 
    input wire [`M1_LENGTH - 1 : 0] m1, 

    output wire [`M2_LENGTH - 1 : 0] m2
); 

    // generate nodes and constants
    wire [`M1_LENGTH - 1 : 0] node [`NODE_NUM - 1 : 0]; 
    wire [`M1_LENGTH - 1 : 0] intcpt [`PIECE_NUM - 1 : 0]; 

	//generated by ../Checked/makeverilog.m 

	assign node[0] = 28'h0000000; 
	assign intcpt[0] = 28'h0000000; 

	assign node[1] = 28'h0400000; 
	assign intcpt[1] = 28'h0030000; 

	assign node[2] = 28'h0C00000; 
	assign intcpt[2] = 28'h01A0000; 

	assign node[3] = 28'h1C00000; 
	assign intcpt[3] = 28'h0520000; 

	assign node[4] = 28'h2C00000; 
	assign intcpt[4] = 28'h0AB0000; 

	assign node[5] = 28'h3000000; 
	assign intcpt[5] = 28'h0AF0000; 

	assign node[6] = 28'h4000000; 
	assign intcpt[6] = 28'h0AD0000; 

	assign node[7] = 28'h4400000; 
	assign intcpt[7] = 28'h1350000; 

	assign node[8] = 28'h4800000; 
	assign intcpt[8] = 28'h1390000; 

	assign node[9] = 28'h6000000; 
	assign intcpt[9] = 28'h1340000; 

	assign node[10] = 28'h6400000; 
	assign intcpt[10] = 28'h1FD0000; 

	assign node[11] = 28'h6C00000; 
	assign intcpt[11] = 28'h2020000; 

	assign node[12] = 28'h7C00000; 
	assign intcpt[12] = 28'h2000000; 

	assign node[13] = 28'h8000000; 
    
    // compare 
    wire [`PIECE_NUM - 1 : 0] piece; 
    wire [`M1_LENGTH - 1 : 0] const; 

    genvar i; 
    generate 
        for (i = 0; i < `PIECE_NUM; i = i + 1) begin: find_piece
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
        ({`M1_LENGTH{piece[12]}} & intcpt[12]); 

    wire [`M1_LENGTH - 1 : 0] adder; 

    assign adder = 
        ( {`M1_LENGTH{piece[0]}} & ((m1) + (m1>>2) + (m1>>3)) ) | 
        ( {`M1_LENGTH{piece[1]}} & ((m1) + (m1>>2) + (m1>>3)) ) | 

        ( {`M1_LENGTH{piece[2]}} & ((m1) + (m1>>2)) ) | 

        ( {`M1_LENGTH{piece[3]}} & ((m1) + (m1>>3)) ) | 

        ( {`M1_LENGTH{piece[4]}} & ((m1)) ) | 
        ( {`M1_LENGTH{piece[5]}} & ((m1)) ) | 
        ( {`M1_LENGTH{piece[6]}} & ((m1)) ) | 

        ( {`M1_LENGTH{piece[7]}} & ((m1) - (m1>>3)) ) | 
        ( {`M1_LENGTH{piece[8]}} & ((m1) - (m1>>3)) ) | 
        ( {`M1_LENGTH{piece[9]}} & ((m1) - (m1>>3)) ) | 

        ( {`M1_LENGTH{piece[10]}} & ((m1) - (m1>>2)) ) | 
        ( {`M1_LENGTH{piece[11]}} & ((m1) - (m1>>2)) ) | 
        ( {`M1_LENGTH{piece[12]}} & ((m1) - (m1>>2)) ); 

    // add adder 2
    wire [`M1_LENGTH - 1 : 0] m2_r; 
     
    assign m2_r = (adder + const); 
    assign m2 = m2_r[`M1_LENGTH - 1 : 1]; 

endmodule
