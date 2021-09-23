// file hexdecoder.v
module hexdecoder(in,out);

	input wire [3:0] in;
	output reg [6:0] out;
	
	always @* begin
		if(in == 4'h0) begin
			out = 7'b1000000;
			
		end else if(in == 4'h1) begin
			out = 7'b1111001;
			
		end else if(in == 4'h2) begin
			out = 7'b0100100; 
		
		end else if(in == 4'h3) begin
			out = 7'b0110000;
		
		end else if(in == 4'h4) begin
			out = 7'b0011001;
		
		end else if(in == 4'h5) begin
			out = 7'b0010010;
		
		end else if(in == 4'h6) begin
			out = 7'b0000010;
		
		end else if(in == 4'h7) begin
			out = 7'b1111000;
		
		end else if(in == 4'h8) begin
			out = 7'b0000000;
		
		end else if(in == 4'h9) begin
			out = 7'b0010000;
		
		end else if(in == 4'hA) begin
			out = 7'b0001000;
		
		end else if(in == 4'hB) begin
			out = 7'b0000011;
		
		end else if(in == 4'hC) begin
			out = 7'b1000110;
		
		end else if(in == 4'hD) begin
			out = 7'b0100001;
		
		end else if(in == 4'hE) begin
			out = 7'b0000110;
		
		end else begin // in == 4'hF
			out = 7'b0001110;
		
		end
	end
	
endmodule
