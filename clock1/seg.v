module display(in,out);
	input [3:0] in;
	output [7:0] out;
	reg [7:0] out;

	always @(in)
		case(in)
				  4'd0: out = ~7'b0111111;
                  4'd1: out = ~7'b0000110;                
				  4'd2: out = ~7'b1011011;
				  4'd3: out = ~7'b1001111;
                  4'd4: out = ~7'b1100110;
				  4'd5: out = ~7'b1101101;
                  4'd6: out = ~7'b1111101;
				  4'd7: out = ~7'b0000111;
				  4'd8: out = ~7'b1111111;
				  4'd9: out = ~7'b1101111;
                  default:out = ~7'b1111111;
		endcase
	
endmodule 


