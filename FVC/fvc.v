module fvc(clk,nCR,signal,dac,dac_CP);
input clk,nCR;         //input clk, clear signal
input signal;          //signal to be count
output [11:0] dac;	   //dac output 
output dac_CP;

reg [11:0] dac;
reg [11:0]count;
wire s_edge;         //posedge of signal

catch_edge U0(clk,nCR,signal,s_edge);    //catch edge of signal
dac_clk U1(clk,dac_CP,nCR);				//clock of DAC


always@(posedge signal or posedge clk or negedge nCR)
	if(~nCR)
		count<=0;
	else if(signal)
		begin
		dac<=count;
		count<=0;
		end
	else 
		count<=count+1'b1;
		
endmodule 





module catch_edge(clk,nCR,in,out);
	input clk,nCR;
	input in;
	output out;
	
	reg reg1,reg2;
	
	always@(posedge clk or negedge nCR)
	begin
		if(~nCR)
		{reg1,reg2}<=0;
		else
		begin
		reg1<=in;
		reg2<=reg1;
		end
	end
	
	assign out=~reg1&&reg2;

endmodule 


/*
en_count
en_latch
*/