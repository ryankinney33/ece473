// file register.v

module register(
	input wire [31:0] data_in,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	output reg [31:0] data_out);
	
	always @(posedge clock) begin
		if (!reset) begin
			// resets all bits to zero
			data_out <= 32'h0;
		end else if (WriteEnable) begin
			// write is true, set the bits
			data_out <= data_in;
		end else begin
			// write aint true, just save data_out into data_out?
			data_out <= data_out;
		end
	end

endmodule
