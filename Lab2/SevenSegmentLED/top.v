// file top.v
module top( SW, HEX0, HEX1);

	input wire [7:0] SW; // slide switches
	output wire [6:0] HEX0; // 7-seg display 0
	output wire [6:0] HEX1; // 7-seg display 1
	
	hexdecoder(SW[3:0],HEX0); // display value for switches 3-1
	hexdecoder(SW[7:4],HEX1); // display value for switches 7-4
endmodule
