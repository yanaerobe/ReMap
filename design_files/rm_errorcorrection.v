`timescale 1ns / 1ns

module m_errorcorrection(M_2MSB, M2, M2_CORRECTED);

// Parameters Declaration
parameter wl_m = 31;  				// Wordlength of the Mitchell Fraction m
parameter wl_m2 = wl_m + 3;   	// Wordlength of the mapped Mitchell Fraction m2
parameter wl_m2_corrected = 27;	// Wordlength of the corrected m2

// Input Ports
input [1 : 0] M_2MSB;
input [wl_m2-1 : 0] M2;

// Output Ports
output [wl_m2_corrected-1 : 0] M2_CORRECTED;

// Registers Declaration
reg [9 : 0] in2_adder2;

// Wires Declaration
wire [9 : 0] in1_adder1;
wire [9 : 0] in2_adder1;
wire [9 : 0] sum1;
wire [9 : 0] in1_adder2;
wire [9 : 0] sum2;

// Behavioral Modelling
// -- 1st Adder
assign in1_adder1 = M2[wl_m2-1:wl_m2-10];
assign in2_adder1 = ~(M2[wl_m2-2] && ~M2[wl_m2-3]) ? 10'b0 : {3'b0, M2[wl_m2-1:wl_m2-7]};
assign sum1 = in1_adder1 + in2_adder1;

// -- 2nd Adder
assign in1_adder2 = sum1;

always @ (M2[wl_m2-2], M2[wl_m2-3], M_2MSB)
begin
	casex ({M2[wl_m2-2 : wl_m2-3], M_2MSB})
	4'b0x00: in2_adder2 <= 10'b1100001100;
	4'b0x01: in2_adder2 <= 10'b0001010101;
	4'b0x10: in2_adder2 <= 10'b0100011010;
	4'b0x11: in2_adder2 <= 10'b0111111110;
	4'b1000: in2_adder2 <= 10'b1011100000;
	4'b1001: in2_adder2 <= 10'b0000101010;
	4'b1010: in2_adder2 <= 10'b0011101111;
	4'b1011: in2_adder2 <= 10'b0111010011;
	4'b1100: in2_adder2 <= 10'b1100001101;
	4'b1101: in2_adder2 <= 10'b0001010111;
	4'b1110: in2_adder2 <= 10'b0100011100;
	4'b1111: in2_adder2 <= 10'b1000000000;
	default: in2_adder2 <= 10'b0;
	endcase	
end

assign sum2 = in1_adder2 + in2_adder2;
assign M2_CORRECTED = {sum2, M2[wl_m2-11:wl_m2-27]};

endmodule
