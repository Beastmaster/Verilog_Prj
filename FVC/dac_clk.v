module dac_clk(clk,CP,nCR);
input clk;
input nCR;
output CP;

parameter cycle=5;
reg CP;
reg [4:0]cnt;

always@(posedge clk or negedge nCR)
begin
	if(~nCR)
	{cnt,CP}<=0;
	else if(cnt==5)
	begin
		cnt<=0;
		CP<=~CP;
	end
	else 
		cnt<=cnt+1'b1;
end

endmodule 