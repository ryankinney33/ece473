// file PC.v
module PC(
	input wire [31:0] in,
	input wire clock,
	input wire reset,
	output reg [31:0] PC);
	
	// write the new value of the PC at the negative clock edge; reset to zero
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			PC <= 32'd0;
		end else begin
			PC <= in;
		end
	end	
endmodule
