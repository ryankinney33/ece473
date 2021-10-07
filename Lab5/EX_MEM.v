// file EX_MEM.v

module EX_MEM(
	input wire [31:0] EX_D1,
	input wire [31:0] EX_D2,
	input wire [4:0] EX_RD,
	input wire clock,
	output reg [31:0] MEM_D1,
	output reg [31:0] MEM_D2,
	output reg [4:0] MEM_RD);
	
always @(posedge clock)	begin
	MEM_D1 <= EX_D1;
	MEM_D2 <= EX_D2;
	MEM_RD <= EX_RD;
end
	
endmodule




