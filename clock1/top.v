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
	reg _1HzOut,_500HzOut;
//	supply1 Vdd;
	
	reg [31:0] cnt1;
	reg [3:0]cnt2;
	
	always @(negedge _1kHzIn or negedge nCR)
		if(~nCR)
			begin
				_1HzOut<=1'b0;
				cnt1<=32'b00;
				_500HzOut<=1'b0;
				cnt2<=4'b00;
				
			end
		else if(cnt1==32'd1000)
			begin
			cnt1<=32'b00;
			_1HzOut<=~_1HzOut;
			end
		else if(cnt2==4'd2)
			begin
			cnt2<=4'b00;
			_1HzOut<=~_1HzOut;
			end
		else
			begin
			cnt1<=cnt1+1'b1;
			cnt2<=cnt2+1'b1;
			end
	
	
/*	wire [11:0] Q;
	wire EN1,EN2;
	
	counter10 DU0(Q[3:0],nCR,Vdd,_1kHzIn);
	counter10 DU1(Q[7:4],nCR,EN1,_1kHzIn);
	counter10 DU2(Q[11:8],nCR,EN2,_1kHzIn);
	
	assign EN1=(Q[3:0]==4'h9);
	assign EN2=(Q[3:0]==4'h9)&(Q[7:4]==4'h9);
	assign _1HzOut=Q[11];
	assign _500HzOut=Q[0];*/
endmodule 

 