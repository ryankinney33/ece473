// file add_four.v

module add_four(
	input wire [31:0] data_in,
	output wire [31:0] data_out);
	
	// a ripple-carry adder to add two 32 bit numbers
	// the first input is the number to be added to
	// the second input is a 32 bit constant for 1
	thirty_two_bit_adder(.a(data_in),.b(32'd1), .sum(data_out));
	
endmodule
