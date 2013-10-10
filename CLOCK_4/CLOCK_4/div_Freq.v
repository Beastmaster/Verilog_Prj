module Freq_div1(_1Hz,nCR,CP);
	input nCR,CP;
	output _1Hz;
	reg _1Hz;
	
	reg [31:0] cnt1;
	
	always @(negedge CP or negedge nCR)
		if(~nCR)
			{cnt1,_1Hz}<=33'b00;
		else if (cnt1==32'd25000000)
			begin
				cnt1<=32'b00;
				_1Hz<=~_1Hz;
			end
		else
			cnt1<=cnt1+1'b1;
endmodule 



module Freq_div500(_500Hz,nCR,CP);
	input nCR,CP;
	output _500Hz;
	reg _500Hz;
	
	reg [31:0] cnt1;
	
	always @(negedge CP or negedge nCR)
		if(~nCR)
			{cnt1,_500Hz}<=33'b00;
		else if (cnt1==32'd100000)
			begin
				cnt1<=32'b00;
				_500Hz<=~_500Hz;
			end
		else
			cnt1<=cnt1+1'b1;
endmodule 


module Freq_div10(_10Hz,nCR,CP);
	input nCR,CP;
	output _10Hz;
	reg _10Hz;
	
	reg [31:0] cnt2;

always @(negedge CP or negedge nCR)
		if(~nCR)
			{cnt2,_10Hz}<=33'b00;
		else if (cnt2==32'd5000000)
			begin
				cnt2<=32'b00;
				_10Hz<=~_10Hz;
			end
		else
			cnt2<=cnt2+1'b1;
endmodule 




module Freq_div100(_100Hz,nCR,CP);
	input nCR,CP;
	output _100Hz;
	reg _100Hz;
	
	reg [31:0] cnt2;

always @(negedge CP or negedge nCR)
		if(~nCR)
			{cnt2,_100Hz}<=33'b00;
		else if (cnt2==32'd500000)
			begin
				cnt2<=32'b00;
				_100Hz<=~_100Hz;
			end
		else
			cnt2<=cnt2+1'b1;
endmodule 




module Freq_div1k(_1kHz,nCR,CP);
	input nCR,CP;
	output _1kHz;
	reg _1kHz;
	
	reg [31:0] cnt2;

always @(negedge CP or negedge nCR)
		if(~nCR)
			{cnt2,_1kHz}<=33'b00;
		else if (cnt2==32'd250000)
			begin
				cnt2<=32'b00;
				_1kHz<=~_1kHz;
			end
		else
			cnt2<=cnt2+1'b1;
endmodule 

