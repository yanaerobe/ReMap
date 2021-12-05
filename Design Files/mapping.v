`timescale 1ns / 1ns

module m_mapping(M, M2);

// Parameters Declaration
parameter wl_m = 31;  	// Wordlength of the Mitchell Fraction m
parameter wl_m2 = wl_m + 3;   // Wordlength of the mapped Mitchell Fraction m2

// Input Ports
input [wl_m-1 : 0] M;

// Output Ports
output [wl_m2-1 : 0] M2;

// Registers Declaration
reg [wl_m2-1 : 0] in2_adder; 

// Wires Declaration
wire [wl_m2-1 : 0] in1_adder; 
wire [wl_m2-1 : 0] sum; 


// Behavioral Modelling
assign in1_adder = {M, 3'b0};

always @ M
begin
	case (M[wl_m-1:wl_m-2])
	2'b00: in2_adder <= {1'b0, 1'b1, M, 1'b0};
	2'b01: in2_adder <= {34'b0};
	2'b10: in2_adder <= {2'b11, -{1'b1,M}};
	2'b11: in2_adder <= {1'b1, -{1'b1,M}, 1'b0};
	default: in2_adder = 34'b0;
	endcase
end

assign sum = in1_adder + in2_adder;
assign M2 = sum[wl_m2-1:0];


endmodule
