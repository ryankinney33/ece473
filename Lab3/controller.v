// file: controller.v

module controller(reset, One, X0, CLK, WEN, SEL, FS);
	input wire reset;
	input wire One;
	input wire X0;
	input wire CLK;
	output reg WEN;
	output reg SEL;
	output reg [1:0] FS;
	
	wire [1:0] Q;
	reg [1:0] D;
	
	dff dff_Q1(.d(D[1]), .clk(CLK), .clrn(!reset), .prn(1'b1), .q(Q[1]));
	dff dff_Q0(.d(D[0]), .clk(CLK), .clrn(!reset), .prn(1'b1), .q(Q[0]));
	
	always @* begin
		D[1] = !reset && ((!Q[1] && !Q[0] && !One && X0) || (Q[1] && !Q[0])); // can factor !Q[0] out, do it later
		D[0] = !reset && ((!Q[1] && !Q[0] && One) || (!Q[1] && Q[0]) || (Q[1] && !Q[0]));
		
		SEL = !reset;

		WEN = !reset && !Q[1] && !Q[0] && !One && X0;
		
		FS[1] = !reset && ((!Q[1] && !Q[0] && !One) || (Q[1] && Q[0]));
		FS[0] = !reset && ((!Q[1] && !Q[0] && !One && X0) || (Q[1] && !Q[0]));
	end
	
endmodule
