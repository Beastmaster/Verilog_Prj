module Radio(Hr,Min,_1Hz,_500Hz,Sec,out);
	input [7:0]Hr;
	input [7:0]Min;
	input [7:0]Sec;
	input _1Hz,_500Hz;
	output out;
	
	wire ENP;
	wire en;
	reg [3:0]cnt;
	
	assign ENP=(Min==8'b00);
	assign out=(ENP&&_1Hz&&(cnt<(Hr[7:4]*4'd10+Hr[3:0])));
	assign en=(Sec==8'b00);
	
	always@(negedge _1Hz or posedge en)
		if(en)
			cnt<=4'b0;
		else if(cnt==5'h30)
			cnt<=5'h30;
		else
			cnt<=cnt+1'b1;
			
endmodule 