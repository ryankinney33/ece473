// file: controller.v

module controller(reset, One, X0, CLK, WEN, SEL, FS);
	input wire reset;
	input wire One;
	input wire X0;
	input wire CLK;
	output reg WEN;
	output reg SEL;
	output reg [1:0] FS;
	
	wire [1:0] Q; // output of the d-flip-flops
	reg [1:0] D; // inputs to the d-flip-flops
	
	dff dff_Q1(.d(D[1]), .clk(CLK), .clrn(!reset), .prn(1'b1), .q(Q[1]));
	dff dff_Q0(.d(D[0]), .clk(CLK), .clrn(!reset), .prn(1'b1), .q(Q[0]));
	
	always @* begin
		// decide what state to go to next
		D[1] = !Q[0] && (!Q[1] && !One && X0 || Q[1]);
		D[0] = !Q[1] && !Q[0] && One || !Q[1] && Q[0] || Q[1] && !Q[0];
		
		SEL = !reset; // SEL line, determines whether or not to set register X to ALU output or the input

		WEN = !reset && !Q[1] && !Q[0] && !One && X0; // tells whether or not to write into X
		
		// ALU control signals. Tells the ALU what operation to perform based on the current state and the inputs
		FS[1] = !Q[1] && !Q[0] && !One || Q[1] && Q[0]; 
		FS[0] = !Q[0] && (!Q[1] && !One && X0 || Q[1]);
	end
	
endmodule
