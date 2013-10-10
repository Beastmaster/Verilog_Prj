// **************************************************************
// COPYRIGHT(c)2007, Xidian
// All rights reserved.
//
// Module name   :  key_press
//
// Author        :  Z-Dixon
// Data          :  2008.5.6
// Abstract      :  xiao dou 
// 
// Modification history
// --------------------------------------------------------------
// 
// $Log$
//
// **************************************************************

module key_press(//input
                 clk,key,
             //output
                 key_out);


input clk;
input key;

reg [31:0] i=0;

output key_out;

reg key_out;


always @(posedge clk)

begin 
     if(key==1)
            begin  
              if(i<500000)
              i=i+1;
              else if(i==500000)
              key_out=1;
            end
     else  
            begin
              key_out=0;
              i=0;
            end

end
endmodule