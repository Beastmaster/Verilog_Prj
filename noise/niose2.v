module niose2(clk,nCR,sreg,out_clk);
input clk,nCR;
supply0 dir;
output [9:0]sreg;
output out_clk;

wire en;

reg [3:0]cnt;


reg [1:0]cnt1;
assign out_clk=(cnt==2'b1);
always@(posedge clk)
cnt1<=cnt1+1'b1;


always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		cnt<=0;
	else if(cnt==4'd7)
		begin
		cnt<=0;
		end
	else 
		cnt<=cnt+1'b1;
end

assign en=(cnt==4'd2);

lfsr #(8, 9'h11D)
    data_lfsr1(clk, nCR, en,sreg);


endmodule 





module lfsr
#(  parameter W = 8,
    parameter POLY = 9'h11D)
(   input clk,
    input arst,
    input en,
    output [9:0]sreg1
);
    reg [W-1:0] sreg;
    assign sreg1={sreg,sreg[3],sreg[7]};
    
    always@(posedge clk or negedge arst) begin
        if(!arst) sreg <= 1'b1;
        else begin
            if(en) begin
                if(sreg[0]) sreg <= (sreg >> 1) ^ (POLY >> 1);
                else sreg <= sreg >> 1;
            end
        end
    end
endmodule