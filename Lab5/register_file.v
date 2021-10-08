// file register_file.v

module register_file(
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [31:0] write_data_in,
	input wire [4:0] write_address,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	input wire [4:0] read_address_debug,
	input wire clock_debug,
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug);
	
	// 32 32 bit registers
	reg [31:0] Registers [0:31];
		
	// write on first half cycle or reset
	always @(posedge clock or posedge reset) begin
		if (reset == 1'b1) begin
			// reset state; set register i to be equal to i
			Registers[0] <= 32'd0;
			Registers[1] <= 32'd1;
			Registers[2] <= 32'd2;
			Registers[3] <= 32'd3;
			Registers[4] <= 32'd4;
			Registers[5] <= 32'd5;
			Registers[6] <= 32'd6;
			Registers[7] <= 32'd7;
			Registers[8] <= 32'd8;
			Registers[9] <= 32'd9;
			Registers[10] <= 32'd10;
			Registers[11] <= 32'd11;
			Registers[12] <= 32'd12;
			Registers[13] <= 32'd13;
			Registers[14] <= 32'd14;
			Registers[15] <= 32'd15;
			Registers[16] <= 32'd16;
			Registers[17] <= 32'd17;
			Registers[18] <= 32'd18;
			Registers[19] <= 32'd19;
			/*Registers[20] <= 32'd20;
			Registers[21] <= 32'd21;
			Registers[22] <= 32'd22;
			Registers[23] <= 32'd23;
			Registers[24] <= 32'd24;
			Registers[25] <= 32'd25;
			Registers[26] <= 32'd26;*/
			Registers[20] <= 32'd0;
			Registers[21] <= 32'd0;
			Registers[22] <= 32'd0;
			Registers[23] <= 32'd0;
			Registers[24] <= 32'd0;
			Registers[25] <= 32'd0;
			Registers[26] <= 32'd0;
			Registers[27] <= 32'd27;
			Registers[28] <= 32'd28;
			Registers[29] <= 32'd29;
			Registers[30] <= 32'd30;
			Registers[31] <= 32'd31;
		end else if (WriteEnable == 1'b1) begin
				// write into register
				Registers[write_address] <= write_data_in;
		end	
	end
	
	// read on second half cycle
	always @(negedge clock) begin
			// choose which register to read from based on the read_address inputs
			data_out_1 <= Registers[read_address_1];
			data_out_2 <= Registers[read_address_2];
	end
	
	always @(posedge clock_debug) begin
		// debug mode; output the wanted register
		data_out_debug <= Registers[read_address_debug];
	end	
endmodule
