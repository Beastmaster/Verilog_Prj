module LEDdisp(CP,BCD1,BCD2,BCD3,BCD4,Segout,SG1,SG2,SG3,SG4);
	input CP;    //1kHz clock
	input [3:0] BCD1,BCD2,BCD3,BCD4;  //4-bit binary code of counter output
	output [6:0] Segout;   //7-segment code out put 
	output SG1,SG2,SG3,SG4;   //SG1~SG4 select LED
	reg SG1,SG2,SG3,SG4;
	reg [6:0] Segout;
	reg [1:0] Count;           //internal 2-bit counter
	reg [3:0] Seg_in;   //4bit binary code
	
	//select LED0~LED3 display
	
	always @ (posedge CP)  //CP=1kHz
		case (Count)
			2'b00: begin 
					{SG1,SG2,SG3,SG4}=4'b1000;   //LED1 display
					Seg_in=BCD1;
					Count=Count+1;   //count=1
					end
					
			2'b01: begin 
					{SG1,SG2,SG3,SG4}=4'b0100;   //LED2 display
					Seg_in=BCD2;
					Count=Count+1;   //count=2
					end			
	
			2'b10: begin 
					{SG1,SG2,SG3,SG4}=4'b0010;   //LED3 display
					Seg_in=BCD3;
					Count=Count+1;   //count=3
					end
					
			2'b11: begin 
					{SG1,SG2,SG3,SG4}=4'b0001;   //LED4 display
					Seg_in=BCD4;
					Count=Count+1;   //count=0
					end
		endcase
		
		//BCD code=>7Segment Code (a~g)
	always @(Seg_in)
		case(Seg_in)
		
		//gfedcba
		4'b0000: Segout=7'b1000000;   //display digital 0(40H)
		4'b0001: Segout=7'b1111001;   //display digital 2(79H)
		4'b0010: Segout=7'b0100100;   //display digital 3(24H)
		4'b0011: Segout=7'b1000000;   //display digital 4(30H)
		4'b0100: Segout=7'b1000000;   //display digital 5(19H)
		4'b0101: Segout=7'b1000000;   //display digital 6(12H)
		4'b0110: Segout=7'b1000000;   //display digital 7(02H)		
		4'b0111: Segout=7'b1000000;   //display digital 8(78H)
		4'b1000: Segout=7'b1000000;   //display digital 9(00H)
		4'b1001: Segout=7'b1000000;   //display digital A(10H)
		4'b1010: Segout=7'b1000000;   //display digital B(08H)
		4'b1011: Segout=7'b1000000;   //display digital C(03H)
		4'b1100: Segout=7'b1000000;   //display digital D(27H)
		4'b1101: Segout=7'b1000000;   //display digital E(21H)
		4'b1110: Segout=7'b1000000;   //display digital F(06H)
		4'b1111: Segout=7'b1000000;   //display digital G(0eH)
		default: Segout=7'b0100011;   //display digital 0(40H)
				
		endcase
		
endmodule
