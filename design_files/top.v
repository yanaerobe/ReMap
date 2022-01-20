`timescale 1ns / 1ns

module m_rangemapping(N, O);

// Parameters Declaration
parameter wl_N = 32;    			// Wordlength of the input N
parameter wl_k = 5;					// Wordlength of the characteristic k
parameter wl_m = wl_N-1;			// Wordlength of the Mitchell Fraction m
parameter wl_m2 = wl_m+3;			// Wordlength of the mapped Mitchell Fraction m2
parameter wl_m2_corrected = 27; 	// Wordlength of the corrected m2
parameter wl_O = 5+27;  			// Wordlength of the output O

// Input Ports
input [wl_N - 1 : 0] N;

// Output Ports
output [wl_O - 1 : 0] O;

// Registers Declaration

// Wires Declaration
wire [wl_k - 1 : 0] k;
wire [wl_m - 1 : 0] m;
wire [wl_m2 - 1 : 0] m2;
wire [wl_m2_corrected - 1 : 0] m2_corrected;

// Structural Modelling

m_lod32_rom i_lod32_rom(
	.N(N), 
	.K(k)
	);
	
m_logshifter32 i_logshifter32(
	.N(N),
	.K(k),
	.M(m)
	);
	
m_mapping i_mapping(
	.M(m),
	.M2(m2)
	);

m_errorcorrection i_errorcorrection(
	.M_2MSB(m[wl_m-1:wl_m-2]),
	.M2(m2),
	.M2_CORRECTED(m2_corrected)
	);

assign O = {k, m2_corrected};

endmodule
