
module adder(datain,dataout,cs,clk,nCR,sdt);
input [7:0]datain;
input clk,nCR,sdt;
output dataout;
output cs;

reg dataout;
reg [3:0]state;
reg cs;
reg [20:0] cnt;


always@(posedge clk or negedge nCR)
begin
	if(~nCR)
		{cnt,cs,state}<=0;
	else if(sdt==1)
		if(cnt==21'd100)
		begin
			cnt<=0;
			cs<=~cs;
			if(cs==1)
				if(state==4'd7)
					state<=4'd0;
				else
					if(cs==1)
						state<=state+1'b1;
		end
		else 
		cnt<=cnt+1'b1;
end

always@(posedge clk)
begin
	case(state)
	4'd0:begin  dataout<=datain[0];end
	4'd1:begin  dataout<=datain[1];end
	4'd2:begin  dataout<=datain[2];end
	4'd3:begin  dataout<=datain[3];end
	4'd4:begin  dataout<=datain[4];end
	4'd5:begin  dataout<=datain[5];end
	4'd6:begin  dataout<=datain[6];end
	4'd7:begin  dataout<=datain[7];end
	default:dataout<=0;
	endcase
end

//assign dataout=databuf[0]&&cs;

endmodule 








/*
module adder(EN,Mode,clk,nCR,seg1,seg2,seg3,seg4);
	input EN,Mode,clk,nCR;
	//wire [7:0]SimSec,SecS;
	output [6:0]seg1,seg2,seg3,seg4;
	wire [7:0]SimSec,SecS;
	reg CP;
	wire CP1;
	
	reg [3:0] dis1,dis2,dis3,dis4;
	wire en1,en2;
	
	reg [31:0]cnt;
	always@(negedge clk)
		if(cnt==32'd500000)
			begin
			cnt<=32'b00;
			CP<=~CP;
			end
		else
			cnt<=cnt+1'b1;
	
	assign en1=SimSec[3:0]==4'd9;
	assign en2=((SimSec[3:0]==4'd9)&&(SimSec[7:4]==4'd9));
	
	assign CP1=CP&&EN;
	
	counter10 C1(SimSec[3:0],nCR,CP1);
	counter10 C2(SimSec[7:4],nCR,en1);
	counter60 C3(SecS[7:4],SecS[3:0],nCR,en2);

	always@(Mode)
		case(Mode)
		1'b1:
		begin
			dis1<=SimSec[3:0];
			dis2<=SimSec[7:4];
			dis3<=SecS[3:0];
			dis4<=SecS[7:4];
		end
		default:
				begin
			dis1<=SimSec[3:0];
			dis2<=SimSec[7:4];
			dis3<=SecS[3:0];
			dis4<=SecS[7:4];
		end
		endcase
				
	display SEG1(dis1,seg1);
	display SEG2(dis2,seg2);
	display SEG3(dis3,seg3);
	display SEG4(dis4,seg4);
		
endmodule 





module display(LEDO,SEGO);
         input  [3:0] LEDO;
         output [6:0] SEGO;

         reg  [6:0] SEGO;
         always @(LEDO)
             case(LEDO)
                  4'd0: SEGO = ~7'b0111111;
                  4'd1: SEGO = ~7'b0000110;                
				  4'd2: SEGO = ~7'b1011011;
				  4'd3: SEGO = ~7'b1001111;
                  4'd4: SEGO = ~7'b1100110;
				  4'd5: SEGO = ~7'b1101101;
                  4'd6: SEGO = ~7'b1111101;
				  4'd7: SEGO = ~7'b0000111;
				  4'd8: SEGO = ~7'b1111111;
				  4'd9: SEGO = ~7'b1101111;
                  default:SEGO = 7'b1111111;
            endcase
endmodule  



*/


