// file thirty_two_bit_adder.v

module thirty_two_bit_adder(
	input wire [31:0] a,
	input wire [31:0] b,
	output wire [31:0] sum);
	
	// carry outs for the ripple carry
	wire [30:0] carries;
	
	// array of 32 one-bit adders
	fa one_bit_adder [31:0] (.a(a), .b(b), .cin({carries,1'b0}), .sum(sum), .cout({1'b0,carries}));
endmodule