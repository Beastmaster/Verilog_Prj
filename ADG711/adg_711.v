/*module ad_711(clk,out,rst);
input clk,rst;
output out;
//reg out;

wire cnt[1:0];

always@(posedge clk or negedge rst)
begin
	if(!rst)
		cnt<=2'b00;
	else
		cnt<=cnt+1'b1;
end

assign out=cnt[0]&&cnt[1];

endmodule */

module adg_711(out1,out2,out3,in,nCR,CP);
	input CP,nCR,in;
	output out1,out2,out3;
	reg out1,out3;
	reg [10:0]Q;
	reg [20:0]cnt;
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			begin
			Q<=3'b00;
			out2<=0;
			end
		else if (Q==11'd50)
			begin
			Q<=11'd00;
			out2<=~out2
			end
		else
			Q<=Q+1'b1;
	end	
	
	always@(posedge CP)
	out1<=~(Q[4]&&Q[3]&&Q[2]);
	
	assign out2=in;
	
	
	always @(negedge CP or negedge nCR)
	begin
		if(~nCR)
			begin
			cnt<=21'd00;
			out3<=0;
			end
		else if (cnt==21'd250)
			begin
			cnt<=21'd0;
			out3<=~out3;
			end
		else
			cnt<=cnt+1'b1;
	end	
	
	
endmodule 




