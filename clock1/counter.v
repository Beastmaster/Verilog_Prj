
//counter24
module counter24(CntH,CntL,nCR,EN,CP);
	input CP,nCR,EN;		//clock-CP,clear-nCR,EN
	output [3:0] CntH,CntL;	//hour counter, tens digit, ones digit
	reg [3:0]  CntH,CntL;
	
	always@(posedge CP or negedge nCR)
	begin
		if(~nCR)
			{CntH,CntL}<=8'h00;   // asynchronous clear
		else if (~EN) 
			{CntH,CntL}<={CntH,CntL};// 
		else if ((CntH>2)||(CntL<9)||((CntH==2)&&(CntL>=3)))
			{CntH,CntL}<=8'h00;   //action to counter errors
		else if ((CntH==2)&&(CntL<3))
			begin
				CntH<=CntH;
				CntL<=CntL+1'b1;
			end
		else if (CntL==9)
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


module counter60(Cnt,nCR,EN,CP);
	input nCR,EN,CP;
	output [7:0] Cnt;
	wire [7:0] Cnt;	
	wire ENP;
	counter10 U0(Cnt[3:0],nCR,EN,CP);
	counter6  U1(Cnt[7:4],nCR,EN,ENP);
	assign ENP=(Cnt[3:0]==4'h9);
	
endmodule

//counter6
module counter6(Q,nCR,EN,CP);
	input nCR,EN,CP;
	output [3:0] Q;
	reg	[3:0] Q;
	
	always @(posedge CP or negedge nCR)
	begin
		if (~nCR)	Q<=4'b00;   //Asynchronous clear
		else if(~EN) Q<=Q;		//counting pause
		else if(Q==4'b0101)
			Q<=4'B00;	
		else 
			Q<=Q+1'b1;			//counter+1	
	end
endmodule


//counter10
module counter10(Q,nCR,EN,CP);
	input nCR,EN,CP;
	output [3:0] Q;
	reg	[3:0] Q;
	
	always @(posedge CP or negedge nCR)
	begin
		if (~nCR)	Q<=4'b00;   //Asynchronous clear
		else if(~EN) Q<=Q;		//counting pause
		else if(Q==4'b1001)
			Q<=4'B00;	
		else 
			Q<=Q+1'b1;			//counter+1	
	end
endmodule 















