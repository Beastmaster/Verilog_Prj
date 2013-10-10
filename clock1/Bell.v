module Bell(ALARM_Clock,Set_Hr,Set_Min,
			Hour,Minute,Second,
			SetHrkey,SetMinkey,
			_1kHzIn,_500Hz,_1Hz,CtrlBell);
			
	output ALARM_Clock;
	output [7:0] Set_Hr,Set_Min;
	wire   [7:0] Set_Hr,Set_Min;
	wire ALARM_Clock;
	
	input _1kHzIn,_500Hz,_1Hz;
	
	input SetHrkey,SetMinkey;
	input CtrlBell;
	input [7:0] Hour,Minute,Second;
	
	supply1 Vdd;
	wire HrH_EQU,HrL_EQU,MinH_EQU,MinL_EQU;
	wire Time_EQU;
	
	//count minute
	counter60 SU1( Set_Min,Vdd,SetMinkey,_1Hz);
	
	//count hour
	counter24 SU2(Set_Hr[7:4],Set_Hr[3:0],Vdd,SetHrkey,_1Hz);
	
	_4comparator SU4(HrH_EQU,Set_Hr[7:4],Hour[7:4]);
	_4comparator SU5(HrL_EQU,Set_Hr[7:4],Hour[3:0]);
	_4comparator SU6(MinH_EQU,Set_Min[7:4],Minute[7:4]);
	_4comparator SU7(MinL_EQU,Set_Min[3:0],Minute[3:0]);
	
	//music control
	assign Time_EQU=(HrH_EQU&&HrL_EQU&&MinH_EQU&&MinL_EQU);
	assign ALARM_Clock=CtrlBell?(Time_EQU&&(((Second[0]==1'b1)&&_500Hz)
			||((Second[0]==1'b10)&&_1kHzIn))):1'b1;						
endmodule 


module _4comparator(EQU,A,B);
	input [3:0] A,B;
	output EQU;
	assign EQU=(A==B);
endmodule

