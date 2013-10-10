module clk(clk,
       reset,
       mode,
       turn,
       pause,
       q,
       ctr,
       sec,
       alert,
       LD_alert
             );

input   clk;
input   reset;
input   [1:0]mode;
input   turn;
input   pause;


output  [6:0]q;
output  sec;
output  alert;
output  LD_alert;
output  [3:0]ctr;

wire     [3:0]min1; 
wire     [3:0]min0; 
wire     [3:0]hour1;
wire     [3:0]hour0;
wire     [3:0]ctr;

wire      [6:0]q;
wire      sec;
wire      alert;
wire      LD_alert;



clock  clock(.clk(clk),.clr(reset),.mode(mode),.turn(turn),.pause(pause),.min0(min0),.min1(min1),.hour0(hour0),.hour1(hour1),.sec(sec),.alert(alert),.LD_alert(LD_alert));
display  display(.h1(hour1),.h0(hour0),.m1(min1),.m0(min0),.clk(clk),.reset(reset),.q(q),.ctr(ctr));


endmodule