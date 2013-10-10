`timescale 1ns/100ps

module fdiv_ms(f50m, 
               f2    
               );




input     f50m;

output    f2;

reg       f2=0;
reg       [22:0]i=0;

always@(posedge f50m)
    begin
      if(i==2499999)
         begin
           i<=0;
           f2<=~f2;
         end
      else
         i<=i+1;
    end
            

endmodule
