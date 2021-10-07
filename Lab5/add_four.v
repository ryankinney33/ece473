// file add_four.v


module thirty_two_bit_adder(
	input wire [31:0] a,
	input wire [31:0] b,
	output wire [31:0] sum);
	
	// carry outs for the ripple carry
	wire [30:0] carries;
	
	// array of 32 one-bit adders
	fa one_bit_adder [31:0] (.a(a), .b(b), .cin({carries,1'b0}), .sum(sum), .cout({1'b0,carries}));
endmodule



module add_four(
	input wire [31:0] data_in,
	output wire [31:0] data_out);
	
	// a ripple-carry adder to add two 32 bit numbers
	// the first input is the number to be added to
	// the second input is a 32 bit constant for 1
	thirty_two_bit_adder(.a(data_in),.b(32'd1), .c(data_out));
	
endmodule
