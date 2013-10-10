// **************************************************************
// COPYRIGHT(c)2007, Xidian
// All rights reserved.
//
// Module name   :  delay
//
// Author        :  Z-Dixon
// Data          :  2008.5.6
// Abstract      :  delay 0.5ms(50MHz)
// 
// Modification history
// --------------------------------------------------------------
// 
// $Log$
//
// **************************************************************
module delay(//input
                 clk,
             //output
                 clk_delay);


input clk;

output clk_delay;

reg clk_delay=0;

reg [15:0] i=0;

always @(posedge clk)
     
     begin
          
          if(i==12500)
              begin
                   i<=0;
                   clk_delay<=~clk_delay;
              end
          else
              i<=i+1;
     end
endmodule
          













