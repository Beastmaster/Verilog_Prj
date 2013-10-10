module tlv5616(clk,ctrl,data,
sclk,DIN,cs_,FS);        //output data

input clk;
input [3:0] ctrl;       //higher four digits. x;1-fast,0-slow;0;x
input [11:0] data;      //12 digits to determine voltage
 
output sclk,DIN,cs_,FS;



wire allow;
assign allow=sclk&&(~cs_);

always@(posedge allow)      //last digit of data(data[12] out to DIN) at negedge of sclk
DIN<=data[11];              
always@(negedge allow)		//data move a digit at negedge of sclk;
data<<1;







endmodule 

module timer(clk,sclk);
input clk;
output sclk;

reg [10:0] cnt;




endmodule 


