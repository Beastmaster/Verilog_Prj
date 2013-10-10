
module blue_test(clk,arst,add0,out1,out2);
input clk,arst,add0;
output out1,out2;
reg out1,out2;


wire add;
key KEY(add0,add,clk);

reg [3:0]state;
reg [12:0]div;

always@(negedge add or negedge arst)
begin
	if(~arst)
		state<=0;
	else if(state==4'd9)
		state<=0;
	else 
		state<=state+1'b1;
end

always@(state)
case(state)
	4'd0:div<=13'h1388;
	4'd1:div<=13'h904;
	4'd2:div<=13'h683;
	4'd3:div<=13'h4e2;
	4'd4:div<=13'h3e8;
	4'd5:div<=13'h341;
	4'd6:div<=13'h2ca;
	4'd7:div<=13'h271;
	4'd8:div<=13'h22c;
	4'd9:div<=13'h1f4;
	default:div<=13'h1388;
endcase

////////////////
reg [12:0]cnt1;
reg [12:0]cnt2;

always@(posedge clk or negedge arst)
begin
	if(~arst)
		cnt1<=0;
	else if(cnt1==div)
		begin
		cnt1<=0;
		out1<=~out1;
		end
	else
		cnt1<=cnt1+1'b1;
end

always@(negedge clk or negedge arst)
begin
	if(~arst)
		cnt2<=0;
	else if(cnt2==5)
		begin
		cnt2<=0;
		out2<=~out2;
		end
	else
		cnt2<=cnt2+1'b1;
end

endmodule 




//module key(key_in,key_out,CP,nCR);
module key(key_in,key_out,clk);
parameter SAMPLE_TIME = 23'd500000;
input clk;
input key_in;
output key_out;

reg [22:0] count_low;
reg [22:0] count_high;

reg key_out_reg;

always @(posedge clk)
 if(key_in ==1'b0)
  count_low <= count_low + 1'b1;
 else
  count_low <= 0;

always @(posedge clk)
 if(key_in ==1'b1)
  count_high <= count_high + 1'b1;
 else
  count_high <= 0;
  
always @(posedge clk)
 if(count_high == SAMPLE_TIME)
  key_out_reg <= 1'b1;
 else if(count_low == SAMPLE_TIME)
  key_out_reg <= 0;

assign key_out = key_out_reg;

endmodule 











