module display(q,ctr,h1,h0,m1,m0,clk,reset);


output[6:0]q;
output[3:0] ctr;

input[3:0] h1,h0,m1,m0;
input clk,reset;

reg[6:0] q;
reg[3:0] ctr;
reg[3:0] temp;
reg[3:0] i;
reg[3:0] gh;

delay yanshi(clk,clk2);

always @(posedge clk2 or negedge reset)
begin
if(!reset)     i <=0;  
else 
      if(i==3)  i<=0;   else   i<=i+1;
end

always @(posedge clk2 or negedge reset)
begin 
if(!reset)   gh<=0;
else
 case(i)
  0: gh<=4'b0111;
  1: gh<=4'b1011;
  2: gh<=4'b1101;
  3: gh<=4'b1110;
  endcase
end


always @(posedge clk2 or negedge reset)
   begin
      if(!reset) ctr<=0;
      else     
      ctr<=gh;
   end

always @(posedge clk2 or negedge reset)
begin
if(!reset)  temp<=0;
else
 case(i)
 
   0: temp <=h1;
   1: temp <=h0;
   2: temp <=m1;       
   3: temp <=m0;
 endcase
end

always @(posedge clk2 or negedge reset)
begin
if(!reset) q<=7'b0000001;
else
  case(temp)
4'd0:q<=7'b0000001;
4'd1:q<=7'b1001111;
4'd2:q<=7'b0010010;
4'd3:q<=7'b0000110;
4'd4:q<=7'b1001100;
4'd5:q<=7'b0100100;
4'd6:q<=7'b0100000;
4'd7:q<=7'b0001111;
4'd8:q<=7'b0000000;
4'd9:q<=7'b0000100;
default:q<=7'bx;
  endcase
end
endmodule
