module clock1(seg1,seg2,seg3,seg4,
		AdjHr,AdjMin,
		Mode,nCR,CP,       //CP==1kHz;
		CtrlBell,Buzzer);

		input CP/*_1kHz,*/,nCR,AdjHr,AdjMin;
		input CtrlBell;
		input [3:0]Mode;
		
		output [7:0]seg1,seg2,seg3,seg4;
		output Buzzer;
		
		reg [3:0]_seg1,_seg2,_seg3,_seg4;
		
		wire [7:0] Hour,Minute,Second;
		wire _1Hz,_500Hz,_1kHz;		
		wire [7:0] Set_Hr,Set_Min;
		wire Buzzer_Radio,Buzzer_Bell;


		div_1kHz KHZ(CP,nCR,_1kHz);//frequency division _1kHz
		
		Divided_Frequency DIV1(_1Hz,_500Hz,nCR,_1kHz);  //
		top_clock TOP(Hour,Minute,Second,_1Hz,nCR,AdjMin,AdjHr);//
		
		Radio U_R(Buzzer_Radio,Minute,Second,_1kHz,_500Hz);

		Bell B1(Buzzer_Bell,Set_Hr,Set_Min,			//output Set_Hr,Set_Min
			Hour,Minute,Second,
			AdjHr,AdjMin,
			_1kHz,_500Hz,_1Hz,CtrlBell);
			
		assign Buzzer=Buzzer_Radio||Buzzer_Bell;

	/*	always@(negedge CP)   //CP==1kHz
		case(Mode)
			4'b0000:
				begin
				_seg1<=Minute[3:0];
				_seg2<=Minute[7:4];
				_seg3<=Hour[3:0];
				_seg4<=Hour[7:4];
				end
			4'b0001:
				begin
				_seg1<=Second[3:0];
				_seg2<=Second[7:4];
				_seg3<=Minute[3:0];
				_seg4<=Minute[7:4];
				end
			4'b0010:
				begin
				_seg1<=Set_Min[3:0];
				_seg2<=Set_Min[7:4];
				_seg3<=Set_Hr[3:0];
				_seg4<=Set_Hr[7:4];
				end
			default:
				{_seg1,_seg2,_seg3,_seg4}<=28'b00;
			//4'b0100:_seg
			//4'b1000:_seg
		endcase
	*/	
		//display segs	
		display D1(Minute[3:0],seg1);
		display D2(_seg2,seg2);
		display D3(_seg3,seg3);
		display D4(_seg4,seg4);

endmodule 

/*
module choose(A,B,C,Mode);
	input [3:0]A,B;
	input Mode;
	output [3:0] C;
		
	assign C=Mode?A:B;

endmodule
*/


module div_1kHz(CP,nCR,_1kHz);
	input CP,nCR;
	output _1kHz;
	reg _1kHz;
	
	reg [31:0]cnt;
	
	always@(negedge CP or negedge nCR)
		if(~nCR)
			begin
			_1kHz<=1'b0;
			cnt<=32'b00;
			end
		else if (cnt<=32'd50000)
			begin 
			_1kHz<=~_1kHz;
			cnt<=32'b00;
			end
		else
			cnt<=cnt+1'b1;

endmodule


