// file thirty_two_bit_adder.v

module thirty_two_bit_adder(
	input wire [31:0] a,
	input wire [31:0] b,
	output wire [31:0] sum);
	
	// carry outs for the ripple carry
	wire [31:0] carries;

	generate
		genvar i;
	
		for (i=0; i<31; i=i+1) begin : adderGenerate
			fa fullAdd(.a(a[i]), .b(b[i]), .cin(carries[i]), .sum(sum[i]),.cout(carries[i+1]));
		end
	endgenerate
	
	assign carries[0] = 1'b0;
	
endmodule
