module counter6(Q,nCR,CP);
	input CP,nCR;
	output [3:0]Q;
	reg [3:0]Q;	
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			Q<=4'b00;
		else if(Q==4'd5)
			Q<=4'b00;
		else
			Q<=Q+1'b1;
	end	
endmodule 


module counter10(Q,nCR,CP);
	input CP,nCR;
	output [3:0]Q;
	reg [3:0]Q;	
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			Q<=4'b00;
		else if(Q==4'd9)
			Q<=4'b00;
		else
			Q<=Q+1'b1;
	end	
endmodule 


module counter60(CntH,CntL,nCR,CP);
	input CP,nCR;
	output [3:0]CntH,CntL;
	wire [3:0]CntH,CntL;
	wire ENP;
	
	assign ENP=CP&&(CntL[3:0]==4'd9);  /////////////
	
	counter10 U1(CntL,nCR,CP);    //the unit
	counter6 U2(CntH,nCR,ENP);   //the decade		
endmodule 

module counter60_2(CntH,CntL,nCR,CP);
	input CP,nCR;
	output [3:0]CntH,CntL;
	wire [3:0]CntH,CntL;
	wire ENP;
	
	assign ENP=(CntL[3:0]==4'd9);  /////////////
	
	counter10 U1(CntL,nCR,CP);    //the unit
	counter6 U2(CntH,nCR,ENP);   //the decade		
endmodule 



module counter24(CntH,CntL,nCR,CP);
	input CP,nCR;
	output [3:0]CntH,CntL;
	reg [3:0]CntH,CntL;
	
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			{CntH,CntL}<=8'b00;
		else if((CntH==4'd2)&&(CntL==4'd3))
			{CntH,CntL}<=8'b00;
		else if(CntL==4'd9)
			begin
			CntH<=CntH+1'b1;
			CntL<=4'b00;
			end
		else 
			begin
			CntH<=CntH;
			CntL<=CntL+1'b1;
			end	
	end
endmodule




module counter12(CntH,CntL,nCR,CP);
	input CP,nCR;
	output [3:0]CntH,CntL;
	reg [3:0]CntH,CntL;
	
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			{CntH,CntL}<=8'b00;
		else if((CntH==4'd1)&&(CntL==4'd1))
			{CntH,CntL}<=8'b00;
		else if(CntL==4'd9)
			begin
			CntH<=CntH+1'b1;
			CntL<=4'b00;
			end
		else 
			begin
			CntH<=CntH;
			CntL<=CntL+1'b1;
			end	
	end
endmodule










