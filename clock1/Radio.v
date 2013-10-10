module Radio(ALARM_Radio1,Minute,Second,_1kHzIn,_500Hz);
	input _1kHzIn,_500Hz;
	input [7:0] Minute,Second;
	output ALARM_Radio1;
	reg ALARM_Radio1;
	
	always @(Minute or Second) 
		if (Minute ==8'h59)
			case (Second)
				8'h51,
				8'h53,
				8'h55,
				8'h57: ALARM_Radio1=_500Hz;
				8'h59: ALARM_Radio1=_1kHzIn;
				default: ALARM_Radio1=1'b0;
			endcase
		else ALARM_Radio1=1'b0;
endmodule 
