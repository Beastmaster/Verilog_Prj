
module Complete_Clock(BCD1,BCD2,BCD3,BCD4,ALARM,
		CP,AdjMinkey,AdjHrkey,SetMinkey,SetHrkey,
		CtrlBell,Mode,nCR);
		
	input CP;

	wire _1kHzIn;  //system input clock signal
	input nCR;		//system clear signal
	
	output [7:0] BCD1,BCD2,BCD3,BCD4;//output variable, output 8421BCD code to monitor
	wire [7:0] BCD1,BCD2,BCD3,BCD4;
	
	wire _1Hz,_500Hz;		//out put of frequency divider
	input AdjMinkey,AdjHrkey;   //check timer time input keys
	wire [7:0] Hour,Minute,Second;	//output of timer
	input SetMinkey,SetHrkey;	//key to set output signal of clock
	wire [7:0] Set_Hr,Set_Min;
	wire ALARM_Radio;
	wire ALARM_Clock;  //
	output ALARM;
	
	wire [7:0] LED_Hr,LED_Min,LED_Sec;	//declear type of variable
	
	input CtrlBell;
	input Mode;		//mode=1,display setting time.mode=0,display timer time
	
	
	//get _1kHz CP
	cp TIM(CP,_1kHzIn);
		
	//call divider module
	Divided_Frequency U0(_1Hz,_500Hz,nCR,_1kHzIn);
	
	//top circuit of counting time
	top_clock U1(Hour,Minute,Second,_1Hz,nCR,AdjMinKey,AdjHrKey);
	
	//telling time
	Radio U2(ALARM_Radio,Minute,Second,_1kHzIn,_500Hz);
	
	//timeing alarm module
	Bell U3(ALARM_Clock,Set_Hr,Set_Min,Hour,Minute,Second,SetHrKey,SetMinKey,_1kHzIn,_500Hz,_1Hz,CtrlBell);
	
	//speaker control module
	assign ALARM=ALARM_Radio||ALARM_Clock;
	
	//choose number to display to LED
	_2to1MUX MUX1(LED_Hr,Mode,Set_Hr,Hour);
	_2to1MUX MUX2(LED_Min,Mode,Set_Min,Min);
	_2to1MUX MUX3(LED_Sec,Mode,8'h00,Second);
	
	//display code
	display A1(LED_Hr[3:0],BCD1);
	display A2(LED_Hr[7:4],BCD2);
	display A3(LED_Min[3:0],BCD3);
	display A4(LED_Min[7:4],BCD4);
	display A5(LED_Sec[3:0],BCD5);
	display A6(LED_Sec[7:4],BCD6);
		
endmodule 



module display(in,out);
	input [3:0] in;
	output [7:0] out;
	reg [7:0] out;

	always @(in)
		case(in)
				  4'd0: out = ~7'b0111111;
                  4'd1:out = ~7'b0000110;                
				  4'd2: out = ~7'b1011011;
				  4'd3: out = ~7'b1001111;
                  4'd4: out = ~7'b1100110;
				  4'd5: out = ~7'b1101101;
                  4'd6: out = ~7'b1111101;
				  4'd7: out = ~7'b0000111;
				  4'd8: out = ~7'b1111111;
				  4'd9: out = ~7'b1101111;
                  default:out = 7'b1111111;
		endcase
	
endmodule 



//get _1kHz CP
module cp(in,out);
	input in ;
	output out;
	reg out;
	reg [15:0]cnt;
	
	always@(posedge in)
	if(cnt==16'h50000)
		begin
			cnt<=16'b0;
			out<=~out;
		end
		
	else
		cnt<=cnt+1'b1;
endmodule 