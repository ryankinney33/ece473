// file: controller.v

module controller(reset, One, X0, CLK, WEN, SEL, FS, STATE);
	input wire reset;
	input wire One;
	input wire X0;
	input wire CLK;
	output reg WEN;
	output reg SEL;
	output reg [1:0] FS;
	output reg [2:0] STATE;
	
	wire [2:0] Q;
	reg [2:0] D;
	reg clr;
		
	dff dff_Q2(.d(D[2]), .clk(CLK), .clrn(clr), .prn(1'b1), .q(Q[2]));
	dff dff_Q1(.d(D[1]), .clk(CLK), .clrn(clr), .prn(1'b1), .q(Q[1]));
	dff dff_Q0(.d(D[0]), .clk(CLK), .clrn(clr), .prn(1'b1), .q(Q[0]));
	
	always @* begin
		clr = !reset;
//		D[2] = (Q[1] && Q[0] && !reset) || (!Q[1] && !Q[0] && One && X0) || (!Q[2]&&!Q[1]&&!Q[0]&&!reset&&!One&&!X0);
//		D[1] = (Q[1] && !Q[0] && !reset) || (!Q[0] && !reset && !One && X0);
//		D[0] = (!Q[1] && Q[0] && !reset) || (Q[1] && !Q[0] && !reset) && (!Q[2] && !Q[1] && !reset && One);
		
		D[2] = (Q[1] && Q[0] && !reset) || (!Q[1] && !Q[0] && !reset && !X0);
		D[1] = (Q[1] && !Q[0] && !reset) || (!Q[0] && !reset && !One && X0);
		D[0] = (!Q[1] && !reset && One) || (!Q[1] && Q[0] && !reset) || (Q[1] && !Q[0] && !reset);
		
		
		SEL = !reset;
		
		WEN = !Q[1] && !reset && X0;
		
		
		
//		WEN = !D[1] && !reset && X0;
		
//		FS[1] = (!D[1] && D[0]) || (!D[1] && !D[0] && One);
		
//		FS[0] = (D[1] && !D[0]) || (!D[0] && !One && X0);
		
		STATE = Q;
	end
	
endmodule
