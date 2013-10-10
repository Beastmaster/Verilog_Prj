module key_1(key_o,key_r,key,CP,nCR);
	output [3:0]key_o;
	input CP,nCR;
	input [3:0]key_r;
	output [15:0]key;
	
	parameter NUM=100;
	
	reg [15:0]key;
	reg [15:0]cnt;
	
	always@(posedge CP or negedge nCR)
	begin
		if(~nCR)
			cnt<=16'b00;
		else if(cnt==NUM)
			cnt<=16'b00;
		else
			cnt<=cnt+1'b1;
	end
	
	assign key_o[0]=(cnt<25);
	assign key_o[1]=(cnt>25)&&(cnt<50);
	assign key_o[2]=(cnt>50)&&(cnt<75);
	assign key_o[3]=(cnt>75)&&(cnt<100);

	always@(posedge CP)
	begin
		case(key_o)
			4'b0001: 
			4'b0010:
			4'b0100:
			4'b1000:

	end

endmodule 





/*module key_1(key,led);//,CP,_1kHz);
	//input CP;
	//input _1kHz;
	input [7:0]key;
	output [7:0]led;
	reg [7:0]led;
	
	always@(key)
		case(key)
			~8'b01110111: led<=8'h1;//15
			~8'b10110111: led<=8'h2;//25
			~8'b11010111: led<=8'h3;//35
			~8'b11100111: led<=8'h4;//45
			~8'b01111011: led<=8'h5;//16
			~8'b10111011: led<=8'h6;//26
			~8'b11011011: led<=8'h7;//36
			~8'b11101011: led<=8'h8;//46
			~8'b01111101: led<=8'h9;//17
			~8'b10111101: led<=8'h10;//27
			~8'b11011101: led<=8'h11;//37
			~8'b11101101: led<=8'h12;//47
			~8'b01111110: led<=8'h13;//18
			~8'b10111110: led<=8'h14;//28
			~8'b11011110: led<=8'h15;//38
			~8'b11101110: led<=8'h16;//48
			default: led<=8'b11111111;
		endcase
		

endmodule */