module noise(clk,out,dir);
input clk;
output out;
output dir;

assign dir=0;


reg [1:0]cnt;

always@(posedge clk)
cnt<=cnt+1;

assign out=(cnt==0);

endmodule 



module noise12(clk,out_clk,out,nCR);
input clk,nCR;
output out_clk;
output [9:0]out;
reg [9:0]out;

assign out_clk=(cnt==2'b1);

reg [1:0]cnt;
always@(posedge clk)
cnt<=cnt+2'b1;

reg [5:0]cnt1;
always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		{cnt1,out}<=0;
	else if(cnt1==6'd1000)
		begin
		cnt1<=0;
		out<=out+1'b1;
		end
	else
		cnt1<=cnt1+1'b1;
end


endmodule




module noise1(clk,nCR,out_clk,out);
input clk,nCR;
output wire [7:0]out;
reg [4:0]cnt;

output out_clk;
reg CP;
wire address;


assign out_clk=(cnt==2'b1);

reg [1:0]cnt1;
always@(posedge clk)
cnt1<=cnt1+2'b1;


always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		{cnt,CP}<=0;
	else if(cnt==5'd4)
		begin
		cnt<=0;
		CP<=~CP;
		end
	else 
		cnt<=cnt+1'b1;
end


counter U1(.clk(CP),.address(address));
rem  R1(.address(address),.clock(CP),.q(out));


endmodule 






module counter(clk,address);
input clk;
parameter freq_word=1'b1;
output reg [4:0] address;
reg [4:0]phase_adder;

always@(posedge clk)
begin
	phase_adder=phase_adder+freq_word;
	address=phase_adder;
end
endmodule 




