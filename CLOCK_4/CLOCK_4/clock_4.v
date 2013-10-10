module clock_4(clk,nCR,adjHr0,adjMin0,seg1,seg2,seg3,seg4,Mode,STOP_EN,buzzer,Ctrl,alarm);
	input clk,nCR,adjHr0,adjMin0;
	input [2:0]Mode;
	output [6:0]seg1,seg2,seg3,seg4;
	output buzzer;    //LED0
	
	reg [3:0]dis1,dis2,dis3,dis4;
		
	wire [3:0]CntH,CntL;
	wire [6:0]seg1,seg2,seg3,seg4;
	wire [7:0]Sec,Min,Hr;
	
	wire adjHr,adjMin;
	
	reg adjMin_0,adjHr_0;
	
	
	//12jinweizhi	
	wire [7:0]Hr_12;
	
	
	// ringing time
	wire [7:0] Hr_Set,Min_Set;
	input Ctrl;        //sw3
	output alarm;
	
	// CPs
	wire _1Hz;
	wire MinCP,HrCP;
	wire _100Hz,_10Hz,_500Hz,_1kHz;	
	
	//stopwatch value
	wire [7:0]SimSec,SecS;
	input STOP_EN;       //sw4
	
	//get_key	
	key K1(adjMin0,adjMin,clk);
	key K2(adjHr0,adjHr,clk);
	
	
	//divide frequency
	 Freq_div1 F1(_1Hz,nCR,clk);
	 Freq_div500 F2(_500Hz,nCR,clk);
	 Freq_div10 F3(_10Hz,nCR,clk);
	 Freq_div100 F4(_100Hz,nCR,clk);
	 Freq_div1k F5(_1kHz,nCR,clk);
	
	//achieve base 
	assign MinCP=~adjMin_0?_10Hz:((Sec[7:4]==4'd5)&&(Sec[3:0]==4'd9));
	assign HrCP=~adjHr_0?_10Hz:(((Sec[7:4]==4'd5)&&(Sec[3:0]==4'd9))&&((Min[7:4]==4'd5)&&(Min[3:0]==4'd9)));
	
	counter60 C1(Sec[7:4],Sec[3:0],nCR,_1Hz);
	counter60 C2(Min[7:4],Min[3:0],nCR,MinCP);
	counter24 C3(Hr[7:4],Hr[3:0],nCR,HrCP);	
	///////////////////////////
	counter12 C4(Hr_12[7:4],Hr_12[3:0],nCR,HrCP);
	
	
	//Radio buzzer
	Radio R0(Hr,Min,_1Hz,_500Hz,Sec,buzzer);
	
	
	//Clock ring
	Alarm A0(Hr,Min,Hr_Set,Min_Set,nCR,adjHr,adjMin,alarm,Mode[2],Ctrl,_1Hz,_10Hz);
	
			
	//STOPWATCH
	stopwatch S0(STOP_EN,Mode[1],SimSec,SecS,_1kHz,adjHr);
	
	
		
	//get value
	always@(Mode)
	begin
		case(Mode)
			3'b000:
				begin
				adjMin_0<=adjMin;
				adjHr_0<=adjHr;
				dis1<=Sec[3:0];
				dis2<=Sec[7:4];
				dis3<=Min[3:0];
				dis4<=Min[7:4];
				end
			
			3'b001:
				begin
				adjMin_0<=adjMin;
				adjHr_0<=adjHr;
				dis1<=Min[3:0];
				dis2<=Min[7:4];
				dis3<=Hr[3:0];
				dis4<=Hr[7:4];
				end
				
			3'b011:
				begin
				adjMin_0<=adjMin;
				adjHr_0<=adjHr;
				dis1<=Min[3:0];
				dis2<=Min[7:4];
				dis3<=Hr_12[3:0];
				dis4<=Hr_12[7:4];
				end	
				
				
			3'b010:
				begin
				dis1<=SimSec[3:0];
				dis2<=SimSec[7:4];
				dis3<=SecS[3:0];
				dis4<=SecS[7:4];
				end
			3'b100:
				begin
				dis1<=Min_Set[3:0];
				dis2<=Min_Set[7:4];
				dis3<=Hr_Set[3:0];
				dis4<=Hr_Set[7:4];
				end
			default:
				begin
				dis1<=4'b00;
				dis2<=4'b00;
				dis3<=4'b00;
				dis4<=4'b00;
				end
		
		endcase
	end
	
	//display
	display SEG1(dis1,seg1);
	display SEG2(dis2,seg2);
	display SEG3(dis3,seg3);
	display SEG4(dis4,seg4);
	
endmodule 




/*
module Sec_CP(_1Hz,CP,nCR);
	input _1Hz,cCR;
	output _1Hz;
	reg _1Hz;
	reg cnt;
	
	
endmodule */