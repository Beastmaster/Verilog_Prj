 //module key(key_in,key_out,CP,nCR);
module key(key_in,key_out,clk);
parameter SAMPLE_TIME = 23'd1000000;
input clk;
input key_in;
output key_out;

reg [22:0] count_low;
reg [22:0] count_high;

reg key_out_reg;

always @(posedge clk)
 if(key_in ==1'b0)
  count_low <= count_low + 1'b1;
 else
  count_low <= 0;

always @(posedge clk)
 if(key_in ==1'b1)
  count_high <= count_high + 1'b1;
 else
  count_high <= 0;
  
always @(posedge clk)
 if(count_high == SAMPLE_TIME)
  key_out_reg <= 1'b1;
 else if(count_low == SAMPLE_TIME)
  key_out_reg <= 0;

assign key_out = key_out_reg;

endmodule 