module m_group2(clk,data_seq,noise_seq,arst,add0,out,en1,en_1);
input clk,arst,add0;
output data_seq,out;

output en1,en_1;

wire add;
key KEY(add0,add,clk);


wire en1,en2;

reg [3:0]state;
reg [12:0]div;

datarate_ctrl 
D1 (clk,
    div,
    en1,
    en2
);

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
	4'd1:div<=13'd2500;
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

lfsr #(8, 9'h11D)
    data_lfsr1(clk, arst, en1, data_seq);

 man_coder Coder_data(clk,en1,en2,
    data_seq, out);   


//////////////////////////////////
parameter div1=13'd5;
wire en_1,en_2;
output noise_seq;

datarate_ctrl D2(clk,div1,en_1,en_2);
    
lfsr #(12, 13'h1033)
    data_lfsr2(clk, arst, en_1, noise_seq);

    
endmodule 

module datarate_ctrl

(   input clk,
    input [12:0] div,
    output en1,
    output en2
);
    reg [12:0] cnt;
    always@(posedge clk) begin
        if(cnt < div - 1'b1)
            cnt <= cnt + 1'b1;
        else
            cnt <= 1'b0;
    end
    assign en1 = (cnt == (div - 1'b1));
    assign en2 =(cnt == ((div >> 1) - 1'b1));
endmodule


module lfsr
#(  parameter W = 8,
    parameter POLY = 9'h11D)
(   input clk,
    input arst,
    input en,
    output out
);
    reg [W-1:0] sreg;
    assign out = sreg[0];
    always@(posedge clk or negedge arst) begin
        if(!arst) sreg <= 1'b1;
        else begin
            if(en) begin
                if(out) sreg <= (sreg >> 1) ^ (POLY >> 1);
                else sreg <= sreg >> 1;
            end
        end
    end
endmodule



module man_coder
(   input clk, input en1, input en2,
    input in, output reg out
);
    reg ck;
    always@(posedge clk) begin
        if(en1) ck <= 1'b0;
        else if(en2) ck <= 1'b1;
    end
    always@(posedge clk) begin
        out <= in ^ ck;
    end
endmodule




