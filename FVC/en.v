module en(clk,en_count,en_latch,nCR);

input clk,nCR;
output en_count;
output en_latch;

reg [19:0] cnt;

parameter cnt_adder=50;    //counter to get en_count
parameter cnt_en=5450;       //counter to get en_latch
parameter cnt_all=5500;      //overall count cycle

always@(posedge clk or negedge nCR)
begin 
	if(~nCR)
		cnt<=0;
	else if(cnt==cnt_all)
		cnt<=0;
	else
		cnt<=cnt+1'b1;
end

assign en_count=~(cnt==20'b1);
assign en_latch=(cnt==cnt_all);

endmodule 