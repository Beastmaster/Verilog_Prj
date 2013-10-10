module m_group(clk,nCR,m,out,dir,sreg,out_clk);
input clk,nCR;
output m;
output out;
output dir;
supply0 dir;
output [7:0]sreg;
output out_clk;

wire en;

reg [3:0]cnt;


assign out_clk=(cnt1==2'b1);

reg [1:0]cnt1;
always@(posedge clk)
cnt1<=cnt1+2'b1;


always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		cnt<=0;
	else if(cnt==4'd5)
		begin
		cnt<=0;
		end
	else 
		cnt<=cnt+1'b1;
end

assign en=(cnt==4'd5);
assign out=en;

lfsr #(8, 9'h11D)
    data_lfsr1(clk, nCR, en, m,sreg);

reg [7:0] tem;

always@(posedge en)
begin
	tem<=tem<<1;
	tem[0]<=m;
end



endmodule 



module lfsr
#(  parameter W = 8,
    parameter POLY = 9'h11D)
(   input clk,
    input arst,
    input en,
    output out,
    output [7:0]sreg1
);
    reg [W-1:0] sreg;
    assign out = sreg[0];
    assign sreg1=sreg;
    
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



/*

module m_group(clk,m_1,m_2,nCR,CP0,CP11,m1,m2);
input clk,nCR;
output m_1,m_2;

output m1,m2;

//Manchester coding
assign m_1=((~m1)&&(~CP0))||(m1&&CP0);
assign m_2=((~m2)&&(~CP11))||(m2&&CP11);

wire keyout;

key KEY(nCR,keyout,clk);

reg en1,en2;

//reg [31:0]cnt;
//reg [7:0]m_group;
wire m1,m2;
reg [3:0]state;


parameter clock1=12'd2500;           //10k
parameter clock2=11'd1250;			//20k
parameter clock3=10'd833;			//30k
parameter clock4=10'd625;			//40k
parameter clock5=9'd500;			//50k
parameter clock6=9'd417;    		//60k
parameter clock7=9'd357;			//70k
parameter clock8=9'd312;			//80k
parameter clock9=9'd278;			//90k
parameter clock10=8'd250;			//100k
parameter clock11=4'd2;		    	//10M



reg [11:0]cnt1;
reg [10:0]cnt2;
reg [9:0]cnt3;
reg [9:0]cnt4;
reg [8:0]cnt5;
reg [8:0]cnt6;
reg [8:0]cnt7;
reg [8:0]cnt8;
reg [8:0]cnt9;
reg [7:0]cnt10;
reg [3:0]cnt11;

reg CP1;
reg CP2;
reg CP3;
reg CP4;
reg CP5;
reg CP6;
reg CP7;
reg CP8;
reg CP9;
reg CP10;
reg CP11;


reg CP0;
output CP0;
output CP11;



always@(posedge keyout)
begin 
	if(state==4'd9)
		state<=4'd00;
	else
		state<=state+1'b1;
end


/////////////////////////////
always@(posedge clk)
	begin
		if(cnt1==clock1)
			begin
			CP1=~CP1;
			cnt1=0;
			end
		else
			cnt1<=cnt1+1'b1;
	end

always@(posedge clk)
	begin
		if(cnt2==clock2)
			begin
			CP2=~CP2;
			cnt2=0;
			end
		else
			cnt2<=cnt2+1'b1;
	end

always@(posedge clk)
	begin
		if(cnt3==clock3)
			begin
			CP3=~CP3;
			cnt3=0;
			end
		else
			cnt3<=cnt3+1'b1;
	end

always@(posedge clk)
	begin
		if(cnt4==clock4)
			begin
			CP4=~CP4;
			cnt4=0;
			end
		else
			cnt4<=cnt4+1'b1;
	end


always@(posedge clk)
	begin
		if(cnt5==clock5)
			begin
			CP5=~CP5;
			cnt5=0;
			end
		else
			cnt5<=cnt5+1'b1;
	end
	
always@(posedge clk)
	begin
		if(cnt6==clock6)
			begin
			CP6=~CP6;
			cnt6=0;
			end
		else
			cnt6<=cnt6+1'b1;
	end


always@(posedge clk)
	begin
		if(cnt7==clock7)
			begin
			CP7=~CP7;
			cnt7=0;
			end
		else
			cnt7<=cnt7+1'b1;
	end

always@(posedge clk)
	begin
		if(cnt8==clock8)
			begin
			CP8=~CP8;
			cnt8=0;
			end
		else
			cnt8<=cnt8+1'b1;
	end
	
	
always@(posedge clk)
	begin
		if(cnt9==clock9)
			begin
			CP9=~CP9;
			cnt9=0;
			end
		else
			cnt9<=cnt9+1'b1;
	end

always@(posedge clk)
	begin
		if(cnt10==clock10)
			begin
			CP10=~CP10;
			cnt10=0;
			end
		else
			cnt10<=cnt10+1'b1;
	end

always@(posedge clk )
	begin
		if(cnt11==clock11)
			begin
			CP11=~CP11;
			cnt11=0;
			end
		else
			cnt11<=cnt11+1'b1;
	end

/////////////////////

always@(posedge clk)
begin
case(state)
4'd0:begin
CP0<=CP1;end
4'd1:begin
//en1=(cnt2==clock2);
CP0<=CP2;end
4'd2:begin
//en1=(cnt3==clock3);
CP0<=CP3;end
4'd3:begin
//en1=(cnt4==clock4);
CP0<=CP4;end
4'd4:begin
//en1=(cnt5==clock5);
CP0<=CP5;end
4'd5:begin
//en1=(cnt6==clock6);
CP0<=CP6;end
4'd6:begin
//en1=(cnt7==clock7);
CP0<=CP7;end
4'd7:begin
//en1=(cnt8==clock8);
CP0<=CP8;end
4'd8:begin
//en1=(cnt9==clock9);
CP0<=CP9;end
4'd9:begin
//en1=(cnt10==clock10);
CP0<=CP10;end
endcase
//en2=(cnt11==clock11);
end


mg_1 M1(CP0,m1);
mg_2 M2(CP11,m2);


endmodule 


module mg_1(CP,m);
input CP;
output m;

reg m;
reg [7:0] m_group;

always@(posedge CP)

	begin
	m_group[0]<=m_group[7]^m_group[3]^m_group[2]^m_group[1]^1'b1;
	m_group[7:1]=m_group[6:0];
	m<=m_group[0];	
	end
endmodule 



module mg_2(CP,m);
input CP;
output m;

reg m;
reg [11:0] m_group;

always@(posedge CP)

	begin
	m_group[0]<=m_group[11]^m_group[4]^m_group[3]^m_group[0]^1'b1;
	m_group[11:1]=m_group[10:0];
	m<=m_group[0];
	end

endmodule */