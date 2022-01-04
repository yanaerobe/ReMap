`timescale 1ns / 1ns 

`include "defines.v" 

module remap_top( 
    input wire [`NUM_LENGTH - 1 : 0] num_i, 
    output wire [`NUM_LENGTH - 1 : 0] rslt_o
); 

shifter32 key_values( 
    .num(num_i), 
    
    .k(keyvalues_k), 
    .m1(keyvalues_m1) 
); 

wire [`M1_LENGTH : 0] keyvalues_m1; 

remap re_map( 
    .m1(keyvalues_m), 

    .m2(remap_m2) 
); 

assign rslt_o = {keyvalues_k, remap_m2}; 

endmodule