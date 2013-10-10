module bcd_1(CP,BCD1,BCD2,nCR);
input nCR;
input CP;
output [2:0] BCD1;
output [6:0] BCD2;

reg [2:0] cnt1;
reg [3:0] cnt2;

wire CP2;


always @(posedge CP2 or negedge nCR)

	if(~nCR)
		cnt1<=3'b000;
	else if(cnt1==3'b111)
		cnt1<=3'b00;
	else
		cnt1<=cnt1+1'b1;

always @(posedge CP2 or negedge nCR)
begin	
	if(~nCR)
		cnt2<=4'b0;
	else if(cnt2==4'h7)
		cnt2<=4'b00;
	else
		cnt2<=cnt2+1'b1;
end
divide1 U2(CP,CP2,nCR);
bcd U1(cnt2, BCD2);	
assign BCD1=cnt1;

endmodule


module divide1(CP,OUT,nCR);
input CP,nCR;
output OUT;
reg OUT;

reg [31:0] cnt ;

always @(posedge CP or negedge nCR)
if(~nCR)
	{cnt,OUT}<=33'b0;
else if(cnt==31'h10000)
	begin
		cnt<=32'b0;
		OUT<=~OUT;
	end
else
	cnt<=cnt+1'b1;

endmodule 



module bcd(bcd2,BCD2);

input [3:0] bcd2;
output [6:0] BCD2;

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