module latch1(in,out,en,clk);
input [11:0]in;
input en,clk;         //en enable data vary; clk is external clock
output [11:0]out;
reg [11:0]out;

always@(posedge clk)
if(en)
	out<=in;
else
	out<=out;

endmodule 