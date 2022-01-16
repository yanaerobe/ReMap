`timescale 1ns / 1ns

module m_lod32_rom(N, K);

// Parameters Declaration
parameter wl_N = 32;  // Wordlength of the input N
parameter wl_k = 5;   // Wordlength of the charateristic k

// Input Ports
input [wl_N - 1 : 0] N;

// Output Ports
output [wl_k - 1 : 0] K;

// Registers Declaration
reg [wl_k - 1 : 0] K;

// Behavioral Modelling
always @*
begin

casex (N)
32'b0000_0000_0000_0000_0000_0000_0000_0000: K = 5'b00000;
32'b0000_0000_0000_0000_0000_0000_0000_0001: K = 5'b00000;
32'b0000_0000_0000_0000_0000_0000_0000_001x: K = 5'b00001;
32'b0000_0000_0000_0000_0000_0000_0000_01xx: K = 5'b00010;
32'b0000_0000_0000_0000_0000_0000_0000_1xxx: K = 5'b00011;
32'b0000_0000_0000_0000_0000_0000_0001_xxxx: K = 5'b00100;
32'b0000_0000_0000_0000_0000_0000_001x_xxxx: K = 5'b00101;
32'b0000_0000_0000_0000_0000_0000_01xx_xxxx: K = 5'b00110;
32'b0000_0000_0000_0000_0000_0000_1xxx_xxxx: K = 5'b00111;
32'b0000_0000_0000_0000_0000_0001_xxxx_xxxx: K = 5'b01000;
32'b0000_0000_0000_0000_0000_001x_xxxx_xxxx: K = 5'b01001;
32'b0000_0000_0000_0000_0000_01xx_xxxx_xxxx: K = 5'b01010;
32'b0000_0000_0000_0000_0000_1xxx_xxxx_xxxx: K = 5'b01011;
32'b0000_0000_0000_0000_0001_xxxx_xxxx_xxxx: K = 5'b01100;
32'b0000_0000_0000_0000_001x_xxxx_xxxx_xxxx: K = 5'b01101;
32'b0000_0000_0000_0000_01xx_xxxx_xxxx_xxxx: K = 5'b01110;
32'b0000_0000_0000_0000_1xxx_xxxx_xxxx_xxxx: K = 5'b01111;
32'b0000_0000_0000_0001_xxxx_xxxx_xxxx_xxxx: K = 5'b10000;
32'b0000_0000_0000_001x_xxxx_xxxx_xxxx_xxxx: K = 5'b10001;
32'b0000_0000_0000_01xx_xxxx_xxxx_xxxx_xxxx: K = 5'b10010;
32'b0000_0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx: K = 5'b10011;
32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b10100;
32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b10101;
32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b10110;
32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b10111;
32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11000;
32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11001;
32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11010;
32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11011;
32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11100;
32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11101;
32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11110;
32'b1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx: K = 5'b11111;
default: K = 5'b00000;

endcase

end


endmodule
