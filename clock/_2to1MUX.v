
module _2to1MUX(OUT,SEL,X,Y);	//2to1 line multiplexer
	input [7:0] X,Y;
	input SEL;
	output [7:0] OUT;
	
	assign OUT=SEL?X:Y;

endmodule 