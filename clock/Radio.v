module Radio(ALARM_Radio,Minute,Second,_1kHzIn,_500Hz);
	input _1kHzIn,_500Hz;
	input [7:0] Minute,Second;
	output ALARM_Radio;
	reg ALARM_Radio;
	
	always @(Minute or Second) 
		if (Minute ==8'h59)
			case (Second)
				8'h51,
				8'h53,
				8'h55,
				8'h57: ALARM_Radio=_500Hz;
				8'h59: ALARM_Radio=_1kHzIn;
				default: ALARM_Radio=1'b0;
			endcase
		else ALARM_Radio=1'b0;
endmodule 