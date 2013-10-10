//Complete_Clock.v  top_layer

module clock_3 (led,dp,Seg,ALARM,Clk,,ResH,AddHKey,ResL,AddLKey,CtrlBell,Mode,nCR,watchst);
         input         Clk;          // FPGA clock:50MHz
         input         nCR;          //used to clear all data
         input         ResH,AddHKey,ResL,AddLKey;   //used to adjust data
         output      [27:0] Seg;     //used to output numbers
         output      [9:0] led;  //used to light the led
         output      dp;         //used to control the dot
         wire [7:0] LED_H,LED_L;    //present for the decade and units' digit
         wire _1Hz,_10Hz,_100Hz,_500Hz;
        wire _1kHzIN;
                 
         wire [15:0]  Year;
         wire [7:0] Month,Day,Hour,Minute,Second;
         wire [7:0] Set_Hr,Set_Min;   //used to memorize the time to ring the bell
         wire [7:0] Sec1,Sec2;                 //used for stopwatch
         wire ALARM_Radio;
         wire ALARM_Clock;
         output ALARM;             //used to ring the bell
         input  CtrlBell;             //used to control ring the bell or not
         input  [5:0] Mode;      //used for choosing mode
         input  watchst;           //used to start timing in stopwatch mode

         Divided_Frequency U0 (_1Hz,_10Hz,_100Hz,_500Hz,nCR,_1kHzIN);   //used for frequency division
         stopwatch U1 (Sec1,Sec2,_100Hz,nCR,watchst,AddLKey);   //used for timing as a stopwatch
         top_clock U2 (_10Hz,Mode,Hour,Minute,Second,_1Hz,nCR,ResH,AddHKey,ResL,AddLKey);       //used to count time
         Radio U3 (ALARM_Radio,Minute,Second,_1kHzIN,_500Hz);   //used to strike the hour
         Bell U4 (Mode,ALARM_Clock,Set_Hr,Set_Min,Hour,Minute,Second,ResH,AddHKey,ResL,AddLKey,
                           _1kHzIN,_500Hz,_10Hz,CtrlBell);            //used as a alarm clock

         FreqcDiv U5(_1kHzIN,Clk,nCR);   //used to divide the frequency

//      calendar  U6 (Year,Month,Day,Hour,Minute,Second,Mode,_10Hz,nCR,ResH,AddHKey,ResL,AddLKey);            //used as a calendar

         assign ALARM = ALARM_Radio||ALARM_Clock;  

         _6to1MUX MU1 (LED_H,Mode,Hour,8'h00,Set_Hr,1,Sec2,Year[15:8],Month);     //to control the display of number when mode is changed
         _6to1MUX MU2 (LED_L,Mode,Minute,Second,Set_Min,0,Sec1,Year[7:0],Day);
         SegOut MU4 (Seg,LED_H,LED_L,dp,_1Hz);              //used to output numbers
         ledout MU5 (led,Second);                           //used to light the led

endmodule


/************************/

module FreqcDiv(_1kHzIn,clk,nCR);
	input clk;
	input nCR;
	
	output _1kHzIn;
	reg _1kHzIn;	
	reg [31:0]cnt;
	
	always@(posedge clk )
		if(~nCR)
			begin 
				cnt<=32'b00;
				_1kHzIn<=0;
			end		
		else if(cnt==32'd25000)
			begin
			cnt<=32'b0;
			_1kHzIn<=~_1kHzIn;
			
			end
		else
			begin
				//_1kHzIn<=_1kHzIn;
				cnt<=cnt+1'b1;
			end	
endmodule 
 



//_6to1MUX.v           to control the display of number when mode is changed

module _6to1MUX(OUT,SEL,X,Y,Z,FL,A,B,C);

/*out:the number which should be displayed

 *SEL:the mode which is choosed

 *X:time(hour,minute)

 *Y:second

 *Z:the time of alarm clock

 *FL:used to change 24_hour into 12_hour

 *A:the data of stopwatch

 *B:the number of year

 *C:the number of month and day

 */
         input         [7:0] X,Y,Z,A,B,C;
         input         [5:0] SEL;
         input         FL;
         wire [7:0] XX;  //reg
         output      [7:0] OUT;
         reg            [7:0] OUT;
         assign       XX=X-8'd18;   //

/*     always @(X)

         begin

                   case (X)

                   8'h12: XX <= 8'h00;

                   бнбн

                   8'h23: XX <= 8'h11;

                   default: XX <= X;

                   endcase

         end          */

     always @(X or Y or Z or FL or A or B or C or SEL)     //change the display immediately when mode is changed
         begin
              case (SEL)
                   6'b000000: OUT <= X;
                   6'b000001: OUT <= FL ? (X>=18?XX:X) : X;
                   6'b000010: OUT <= Z;
                   6'b000100: OUT <= Y;
                   6'b001000: OUT <= A;
                   6'b010000: OUT <= B;
                   6'b100000: OUT <= C;
                   default: OUT <= 8'h77;    //display 7777 when mode is choosed uncorrectly
               endcase
         end

endmodule 