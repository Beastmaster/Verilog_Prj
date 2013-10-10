
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

