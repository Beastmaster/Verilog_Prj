//Radio.v           used to strike the hour

module Radio (ALARM_Radio,Minute,Second,_1kHzIN,_500Hz);

         input         _1kHzIN,_500Hz;//定义输入端口变量
         input         [7:0] Minute,Second;
         output      ALARM_Radio;//定义输出端口变量
         reg            ALARM_Radio;//说明变量类型
  
  
         always @(Minute or Second)
                   if (Minute==8'h59)
                            case (Second)
                                     8'h51,
                                     8'h53,
                                     8'h55,
                                     8'h57:ALARM_Radio=_500Hz;
                                     8'h59:ALARM_Radio=_1kHzIN;
                                     default: ALARM_Radio=1'b0;
                            endcase

                   else ALARM_Radio=1'b0;

endmodule

 // 5.2定时闹钟模块

//Bell.v               used as a alarm clock

module Bell (Mode,ALARM_Clock,Set_Hr,Set_Min,Hour,Minute,Second,

            ResH,AddHKey,ResL,AddLKey,_1kHzIN,_500Hz,_10Hz,CtrlBell);

                           

         output      ALARM_Clock;

         output      [7:0] Set_Hr,Set_Min;

         wire [7:0] Set_Hr,Set_Min;

         wire ALARM_Clock;

         input         [5:0] Mode;

         input         _1kHzIN,_500Hz,_10Hz;

         input         ResH,AddHKey,ResL,AddLKey;

         input         CtrlBell;

         input         [7:0] Hour,Minute,Second;

         supply1    Vdd;

         wire HrH_EQU,HrL_EQU,MinH_EQU,MinL_EQU;

         wire Time_EQU;

        

         //to change the time of alarm clock
      counter60 SU1 (Set_Min,Vdd&(~(ResL&(Mode==6'd2))),(~AddLKey)&(Mode==6'b000010),_10Hz);
      counter24 SU2 (Set_Hr[7:4],Set_Hr[3:0],Vdd&(~(ResH&(Mode==6'd2))),(~AddHKey)&(Mode==6'b000010),_10Hz);

        

         //to compare the time with the alarm clock
        _4comparator SU4 (HrH_EQU,Set_Hr[7:4],Hour[7:4]);
        _4comparator SU5 (HrL_EQU,Set_Hr[3:0],Hour[3:0]);
        _4comparator SU6 (MinH_EQU,Set_Min[7:4],Minute[7:4]);
        _4comparator SU7 (MinL_EQU,Set_Min[3:0],Minute[3:0]);

        

        assign Time_EQU=(HrH_EQU&&HrL_EQU&&MinH_EQU&&MinL_EQU);
        assign ALARM_Clock = CtrlBell?(Time_EQU&&(((Second[0]==1'b1)&&_500Hz)

                                                        ||((Second[0]==1'b0)&&_1kHzIN))):1'b0;

endmodule


module _4comparator(EQU,A,B);
	input [3:0] A,B;
	output EQU;
	assign EQU=(A==B);
endmodule





 //5.3秒表功能模块

//stopwatch.v           used for timing as a stopwatch

module stopwatch (Sec1,Sec2,_100Hz,nCR,watchst,watchres);
         input         _100Hz,nCR,watchst,watchres;
         output      [7:0] Sec1,Sec2;

         wire [7:0] Sec1,Sec2;

         supply1    Vdd;

         wire SecCP;
         wire nCW;

         counter100 UU1 (Sec1,nCW,Vdd,_100Hz&watchst);//调用模100模块
         counter100 UU2 (Sec2,nCW,Vdd,~SecCP);//调用模100模块

         assign SecCP = (Sec1 == 8'h99);
         assign nCW = (nCR&watchres);

endmodule

 

//counter100.v（被调用的模100模块）

module counter100(Cnt,nCR,EN,CP);

       input   CP,nCR,EN;
       output  [7:0] Cnt;

       wire [7:0] Cnt;
       wire ENP;
         
         counter10 UD0 (Cnt[3:0],nCR,EN,CP);//两次调用模十模块
         counter10 UD1 (Cnt[7:4],nCR,ENP,CP);
         assign     ENP=(Cnt[3:0]==4'h9);

endmodule

 

  //5.4秒可视功能

//ledout.v          to light the led as the second goes

module ledout(led,Second);

         input  [7:0] Second;
         output [9:0] led;
         reg    [9:0] led;

         always @(Second)
         begin

                   case (Second [3:0])
                   4'd1 : led <= 10'b1000000000;
                   4'd2 : led <= 10'b1100000000;
				   4'd3 : led <= 10'b1110000000;
				   4'd4 : led <= 10'b1111000000;
				   4'd5 : led <= 10'b1111100000;
				   4'd6 : led <= 10'b1111110000;
				   4'd7 : led <= 10'b1111111000;
				   4'd8 : led <= 10'b1111111100;
				   4'd9 : led <= 10'b1111111110;
                   4'd0 : led <= 10'b1111111111;
                   default: led <= 10'b0000000000;
                   endcase
         end

endmodule 