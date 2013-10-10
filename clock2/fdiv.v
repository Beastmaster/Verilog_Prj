`timescale 1ns/100ps

module   fdiv (f50m,
               f1
               );


input   f50m;

output  f1;

reg     f1=0;
reg     [24:0]i=0;


always@(posedge f50m)
    begin
      if(i==24999999)    
         begin
           i<=0;
           f1<=~f1;
         end
      else
        i<=i+1;
    end         

endmodule