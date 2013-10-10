

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