// file MEM_WB.v

module MEM_WB(
	input wire [31:0] MEM_D2,
	input wire [4:0] MEM_RD,
	input wire clock,
	output reg [31:0] WB_D2,
	output reg [4:0] WB_RD);

	always @(negedge clock) begin
		WB_D2 <= MEM_D2;
		WB_RD <= MEM_RD;
	end
endmodule
