`timescale 1ns / 1ns

module m_logshifter32(N, K, M);

// Parameters Declaration
parameter wl_N = 32; 			//Wordlength of the input N
parameter wl_k = 5;  			//Wordlength of the characteristic k
parameter wl_m = wl_N - 1;		//Wordlength of the mantissa m

// Input Ports
input [wl_N - 1 : 0] N;
input [wl_k -1 : 0] K;

// Output Ports
output [wl_m - 1 : 0] M;

// Wires Declaration
wire [wl_m - 1 : 0] m;
wire [wl_N - 1 : 0] s4;
wire [wl_N - 1 : 0] s3;
wire [wl_N - 1 : 0] s2;
wire [wl_N - 1 : 0] s1;
wire [wl_N - 1 : 0] s0;

// Behavioural Modelling
assign s4 = K[4] ? N : N  << 16; // 16 shift will be made if k[4]= 0
assign s3 = K[3] ? s4: s4 << 8;
assign s2 = K[2] ? s3: s3 << 4;
assign s1 = K[1] ? s2: s2 << 2;
assign s0 = K[0] ? s1: s1 << 1;
 
assign M = s0[wl_N - 2 : 0];


endmodule
 
