//`include "counter60.v"
//`include "counter24.v"


module top_clock(Hour,Minute,Second,_1Hz,nCR,AdjMinKey,AdjHrKey);
	input _1Hz,nCR,AdjMinKey,AdjHrKey;
	output [7:0] Hour,Minute,Second;
	wire [7:0] Hour,Minute,Second;
	supply1 Vdd;
	wire MinCP,HrCP;
	
	counter60 UT1(Second,nCR,Vdd,_1Hz);
	counter60 UT2(Minute,nCR,Vdd,~MinCP);
	counter24 UT3(Hour[7:4],Hour[3:0],nCR,Vdd,~HrCP);
	
	assign MinCP=AdjMinKey?_1Hz:(Second==8'h59);
	assign HrCP=AdjHrKey?_1Hz:({Minute,Second}==16'h5959);

endmodule 

//Divided Frequency
module Divided_Frequency(_1HzOut,_500HzOut,nCR,_1kHzIn);
	input _1kHzIn,nCR;
	output _1HzOut,_500HzOut;
	supply1 Vdd;
	wire [11:0] Q;
	wire EN1,EN2;
	
	counter10 DU0(Q[3:0],nCR,Vdd,_1kHzIn);
	counter10 DU1(Q[7:4],nCR,EN1,_1kHzIn);
	counter10 DU2(Q[11:8],nCR,EN2,_1kHzIn);
	
	assign EN1=(Q[3:0]==4'h9);
	assign EN2=(Q[3:0]==4'h9)&(Q[7:4]==4'h9);
	assign _1HzOut=Q[11];
	assign _500HzOut=Q[0];
endmodule 

