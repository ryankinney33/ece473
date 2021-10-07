// file IF_ID.v

module IF_ID(
	input wire [31:0] IF_IN,
	input wire clock,
	output reg [31:0] INSTR);
	
	// set INSTR to IF_IN on the rising edge of the clock
	always @(posedge clock) begin
		INSTR <= IF_IN;
	end
	
	
endmodule
