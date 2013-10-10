//`include "counter10.v"
//`include "counter6.v"
//counter60
module counter60(Cnt,nCR,EN,CP);
	input nCR,EN,CP;
	output [7:0] Cnt;
	wire [7:0] Cnt;
	counter10 U0(Cnt[3:0],nCR,EN,CP);
	counter6  U1(Cnt[7:4],nCR,EN,CP);
	assign ENP=(Cnt[3:0]==4'h9);
endmodule
