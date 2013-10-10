module stopwatch(EN,Mode,SimSec,Sec,CP,nCR);
	input EN,Mode,CP,nCR;
	output [7:0]SimSec,Sec;
	wire [7:0]SimSec,Sec;
	wire CP1;
	wire en1,en2;
	
	assign CP1=CP&&EN;
	assign en1=SimSec[3:0]==4'd9;
	assign en2=((SimSec[3:0]==4'd9)&&(SimSec[7:4]==4'd9));
	
	
	counter10 C1(SimSec[3:0],nCR,CP1);
	counter10 C2(SimSec[7:4],nCR,en1);
	counter60 C3(Sec[7:4],Sec[3:0],nCR,en2);

endmodule 

 