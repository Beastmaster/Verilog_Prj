module ad9235(clk,nCR,code,ctrl_clk,BCD1,BCD2);
input clk,nCR;
input [11:0]code;
output ctrl_clk;
output [2:0] BCD1;
output [6:0] BCD2;

reg ctrl_clk;
reg [1:0]cnt;

//ctrl clock  20MHz
always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		{cnt,ctrl_clk}<=0;
	else if(cnt==2'd2)
		begin
		cnt<=0;
		ctrl_clk<=~ctrl_clk;
		end
	else
		cnt<=cnt+1'b1;
end



///read data frequency 10kHz
reg [11:0]read_code;
wire en_read;
reg [9:0]cnt_r;

always@(posedge ctrl_clk or negedge nCR)
	if(~nCR)
		cnt_r<=0;
	else if(cnt_r==10'd1000)
		cnt_r<=0;

assign en_read=(cnt_r==10'd1000);

always@(posedge ctrl_clk or negedge nCR)
	if(~nCR)
		read_code<=0;
	else if(en_read)
		read_code<=code;
	else
		read_code<=read_code;


//output to bcd
bcd_1 BCD(read_code,clk,BCD1,BCD2,nCR);

endmodule 



module bcd_1(in,CP,BCD1,BCD2,nCR);
input nCR;
input [11:0]in;
input CP;
output [2:0] BCD1;
output [6:0] BCD2;

reg [2:0] cnt1;
reg [3:0] cnt2;

wire CP2;
divide1 U2(CP,CP2,nCR);

always @(posedge CP2 or negedge nCR)

	if(~nCR)
		cnt1<=3'b000;
	else if(cnt1==3'b111)
		cnt1<=3'b00;
	else
		cnt1<=cnt1+1'b1;


//
assign BCD1=cnt1;

always@(cnt1)
	case(cnt1)
		3'b0:cnt2=in[3:0];
		3'd1:cnt2=in[7:4];
		3'd2:cnt2=in[11:8];
		3'd3:cnt2=0;
		3'd4:cnt2=0;
		3'd5:cnt2=0;
		3'd7:cnt2=0;
		default:cnt2=0;
	endcase

bcd U1(cnt2, BCD2);
	
endmodule


module divide1(CP,OUT,nCR);
input CP,nCR;
output OUT;
reg OUT;

reg [19:0] cnt ;

always @(posedge CP or negedge nCR)
if(~nCR)
	{cnt,OUT}<=20'b0;
else if(cnt==20'd2500)
	begin
		cnt<=20'b0;
		OUT<=~OUT;
	end
else
	cnt<=cnt+1'b1;

endmodule 



module bcd(bcd2,BCD2);
input [3:0] bcd2;
output  [6:0] BCD2;

reg [6:0] BCD2;

always @(bcd2)
	case(bcd2)
		4'h0: BCD2<=7'b1111110;
		4'h1: BCD2<=7'b0110000;
		4'h2: BCD2<=7'b1101101;
		4'h3: BCD2<=7'b1111001;
		4'h4: BCD2<=7'b0110011;
		4'h5: BCD2<=7'b1011011;
		4'h6: BCD2<=7'b1011111;
		4'h7: BCD2<=7'b1110000;
		4'h8: BCD2<=7'b1111111;
		4'h9: BCD2<=7'b1111011;
		default: BCD2<=7'b1100011;
	endcase

endmodule 