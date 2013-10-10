
module flow(CP,out,nCR);
	input CP,nCR;
	output [7:0] out;
	reg [7:0] out;
	
	wire CP1;
	
	reg [31:0] cnt;
	reg  [7:0]cnt1;
	reg [3:0] cnt2;
		
	divide1 U(CP,CP1);	
	
	always @(posedge CP1 or negedge nCR)
	begin
		if (~nCR)
			begin
			cnt2<=32'b001111111;
			out<=8'b11111111;
			cnt2<=4'b00;
			end
		else if (cnt==32'h5)
			begin
			cnt<=32'b0;
			cnt2<=cnt2+1'b1;
			if(cnt2==4'd6)
				cnt2<=4'd0;
			else if(cnt2<4'd3)
			out<=out<<2'b10;
			else
			out<=out>>2'b10;
			end
		else 
			cnt<=cnt+1'b1;
	end

	
endmodule 


module divide1(in,out);
	
	input in;
	output out;
	reg out;
	
	reg [31:0] i;
//	wire [31:0] i;
		
	
	always @(posedge in)
	if(i==32'h25000)
		begin
			i<=32'b0;
			out<=~out;
		end
	else
		i<=i+1'b1;
endmodule


