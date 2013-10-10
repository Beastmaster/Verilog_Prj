module ads805(clk,nCR,CP,dir);
input clk,nCR;
output CP;
output [1:0]dir;

reg [5:0]cnt;
reg CP;

assign dir=2'b00;


always@(posedge clk or negedge nCR)
begin
	if(!nCR)
		{CP,cnt}<=0;
	else if (cnt==6'd5)
		begin
			cnt<=0;
			CP<=~CP;
		end
	else
		cnt<=cnt+1'b1;
end


endmodule 