module LCD1(clk,nCR,CS,SCLK,SID,PSB);
input clk,nCR;

output CS,SCLK,SID;
reg SID;
reg [5:0]state;//0-2,3-26,27-29

reg [7:0]data;
reg [7:0]data2;
reg send;

output PSB;
supply0 PSB;//series mode


////////
wire CP;
div DIV(clk,CP);

/////////
//state machine running
always@(posedge CP or negedge nCR)
begin
	if(~nCR)
		begin
		state<=6'd0;
		data<=8'b1010101;
		end
	else if(state==6'd29)
		state<=6'd0;
	else
		state<=state+1'b1;
end

assign CS=(6'd2<state<6'd27);
assign SCLK=CP&&(6'd2<state<6'd27);

always@(posedge clk)
begin
	case(state)
	//first byte
	6'd3,6'd4,6'd5,6'd6,6'd7:SID<=1'b1;
	6'd8:SID<=0;  //TO LCD
	6'd9:SID<=1'b1;  //disply=1,control=0
	6'd10:SID<=0; //stuck in 0;
	
	//2th byte
	6'd11:begin data2<=data<<1;SID<=data2[7]; end
	6'd12:begin data2<=data<<1;SID<=data2[7]; end
	6'd13:begin data2<=data<<1;SID<=data2[7]; end
	6'd14:begin data2<=data<<1;SID<=data2[7]; end
	6'd15,6'd16,6'd17,6'd18:SID<=0;
	
	//3th byte
	6'd19:begin data2<=data<<1;SID<=data2[7]; end
	6'd20:begin data2<=data<<1;SID<=data2[7]; end
	6'd21:begin data2<=data<<1;SID<=data2[7]; end
	6'd22:begin data2<=data<<1;SID<=data2[7]; end
	6'd23,6'd24,6'd25,6'd26:SID<=0;	
	
	default: SID<=0;
	
	endcase
end

endmodule 




module div(clk,CP);
input clk;
output CP;
reg CP;
reg [6:0] cnt;

always@(posedge clk)
begin
	if(cnt==7'd100)
		begin
		cnt<=7'd0;
		CP<=~CP;
		end
	else
		cnt<=cnt+1'b1;
end
endmodule 















/*module LCD1(CP,out,out2,nCR);
input CP,nCR;
output [7:0]out;
output [7:0]out2;

reg [7:0]out;

wire clk;
wire clk2;

divide1 U(CP,clk,nCR);

divide1 U2(clk,clk2,nCR);

always @ (negedge clk or negedge nCR)
	begin
	if(~nCR)
		out<=8'b10111010;
	else
		out<=out+1'b1;
	end

assign out2=((out||8'b00010000)&&8'b11110111);
//assign out2[4:3]=2'b10;
		
endmodule 



module divide1(CP,OUT,nCR);
input CP,nCR;
output OUT;
reg OUT;

reg [31:0] cnt ;

always @(posedge CP or negedge nCR)
if(~nCR)
	{cnt,OUT}<=33'b0;
else if(cnt==31'h500000)
	begin
		cnt<=32'b0;
		OUT<=~OUT;
	end
else
	cnt<=cnt+1'b1;

endmodule */