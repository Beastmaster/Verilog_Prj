module ser_pa(clk,nCR,)








module ser_pa1( s_data, p_data,clk,en,nCR);
input s_data;
input clk,nCR,en;
output [19:0]p_data;

reg [9:0]p_data;

always@(posedge clk or negedge nCR)
if(~nCR)
	p_data<=0;
else if(en)
	begin
		p_data<=p_data<<1;
		p_data[0]<=s_data;
	end
else
	p_data<=p_data;
endmodule 




module trans()
input 



endmodule 







