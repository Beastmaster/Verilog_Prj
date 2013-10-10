 module Alarm(Hr,Min,Hr_Set,Min_Set,nCR,adjHr,adjMin,buzzer,Mode,Ctrl,_1Hz,_10Hz);
	input [7:0]Hr,Min;
	input nCR,adjHr,adjMin,Mode,Ctrl,_1Hz,_10Hz;
	output [7:0]Hr_Set,Min_Set;
	output buzzer;
	wire [7:0]Hr_Set,Min_Set;
	
	wire MinCP;
	wire HrCP;
	
	supply1 vdd;
	
 	assign MinCP=(~adjMin)&&Mode?_10Hz:vdd;
	assign HrCP=(~adjHr)&&Mode?_10Hz:vdd;
	
	counter60 C2(Min_Set[7:4],Min_Set[3:0],nCR,MinCP);
	counter24 C3(Hr_Set[7:4],Hr_Set[3:0],nCR,HrCP);
	
	assign buzzer=Ctrl&&(Min_Set==Min)&&(Hr_Set==Hr)&&_1Hz;
	
	
 endmodule 