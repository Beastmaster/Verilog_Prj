
module clock2(clk,
             clr,
             pause,
             turn,
             mode,
             sec,
             min1,
             min0,
             hour1,
             hour0,
             alert,
             LD_alert
             
             );

input    clk;             //时钟信号(50MHz)
input    clr;             //清零键
input    pause;           //秒表暂停键
input    turn;            //调整分还是小时位的控制
input    [1:0]mode;       //决定时钟显示功能状态



output   sec;              //接发光二极管
output   [3:0]min1;        //用于输出接数码管3
output   [3:0]min0;        //用于输出接数码管4
output   [3:0]hour1;       //用于输出接数码管1
output   [3:0]hour0;       //用于输出接数码管2
output   alert;            //接发光二极管，代替轰鸣器
output   LD_alert;         //当闹铃设定后，发光二极管显示



wire     sec;              //秒位显示
wire     LD_alert;         //用于闹铃存在时的提醒显示
wire     clk1;             //时钟1s
wire     clk2;             //时钟100ms，用于秒表最小计时单位
wire     clr1;

reg      [3:0]min1;        //显示
reg      [3:0]min0;        //显示
reg      [3:0]hour1;       //显示
reg      [3:0]hour0;       //显示

reg      [3:0]smin1;       //校时
reg      [3:0]smin0;       //校时
reg      [3:0]shour1;      //校时
reg      [3:0]shour0;      //校时

reg      [3:0]amin1;       //闹铃
reg      [3:0]amin0;       //闹铃
reg      [3:0]ahour1;      //闹铃
reg      [3:0]ahour0;      //闹铃

reg      [3:0]mmin1;       //秒表
reg      [3:0]mmin0;       //秒表
reg      [3:0]mhour1;      //秒表
reg      [3:0]mhour0;      //秒表

reg      alert;            //当闹铃到时高电平输出
reg      [7:0]count;


fdiv     fdiv(.f50m(clk),.f1(clk1));           //50MHZ分频到1HZ
fdiv_ms  fdiv_ms(.f50m(clk),.f2(clk2));        //50MHZ分频到10HZ
key_press  key_press1(.clk(clk),.key(clr),.key_out(clr1));        //消抖


always @(posedge clk1)  
 begin
  if(!clr1)
    begin
	 smin0<=0;
	 smin1<=0;
	 shour1<=0;
	 shour0<=0;

	 amin1<=0;
         amin0<=0;
         ahour1<=0;
         ahour0<=0;
         
         count<=0;
    end
  else
     begin  
         if((count==59))                                  
            begin 
              count<=0;
              smin0<=1;
            end
         else
            count<=count+1;
//以上为秒计数工作过程        
         if((smin1==5)&&(smin0==9)&&(count==59))
            begin
              smin1<=0;
              smin0<=0;
              shour0<=1;
            end
         else
             if((smin0==9)&&(count==59))  
                begin
                   smin1<=smin1+1;
                   smin0<=0;
                end
             else
               if((count==59))
                 smin0<=smin0+1;
               else
                 smin0<=smin0;   
//以上为分工作过程
         if((shour1==2)&&(shour0==3)&&(smin1==5)&&(smin0==9)&&(count==59))
             begin
               shour1<=0;
               shour0<=0; 
             end
         else
              if((shour0==9)&&(smin1==5)&&(smin0==9)&&(count==59))
                 begin
                    shour1<=shour1+1;
                    shour0<=0;
                 end
              else
                 if((smin1==5)&&(smin0==9)&&(count==59))
                    shour0<=shour0+1; 
                 else
                    shour0<=shour0;         
                   
//以上为小时工作过程
         if(mode==2'b01)                                             //闹铃调时状态
              if(turn==1)                                            //当turn为高电平时调整分位
                 if((amin1==5)&&(amin0==9))
                   begin
                     amin1<=0;
                     amin0<=0;
                   end   
                 else
                     if(amin0==9)
                       begin 
                         amin1<=amin1+1;
                         amin0<=0;
                       end
                     else
                        amin0<= amin0+1;
               else                                                //当turn为低电平时调整小时位
                 if((ahour1==2)&&(ahour0==3))
                    begin
                      ahour1<=0;
                      ahour0<=0;
                   end
                 else
                      if(ahour0==9)
                        begin
                          ahour1<=ahour1+1;
                          ahour0<=0;       
                        end
                      else
                         ahour0<=ahour0+1;  
          //else;                      
//以上为闹铃定时过程   

       if(mode==2'b10)                                             //时钟调时状态
             if(turn==1)                                           //当turn为高电平时调整分位
                if((smin1==5)&&(smin0==9))
                  begin
                    smin1<=0;
                    smin0<=0;
                  end   
                else
                    if(smin0==9)
                      begin 
                        smin1<=smin1+1;
                        smin0<=0;
                      end
                    else
                       smin0<=smin0+1;
             else                                                  //当turn为低电平时调整小时位
                if((shour1==2)&&(shour0==3))
                   begin
                     shour1<=0;
                     shour0<=0;
                  end
                else
                     if(shour0==9)
                       begin
                         shour1<=shour1+1;
                         shour0<=0;       
                       end
                     else
                        shour0<=shour0+1; 
        //else;                
      end 
end		
 //以上为时钟调时过程

always @(posedge clk2)
  begin
  if(!clr1)
    begin
       mmin1<=0; 
       mmin0<=0; 
       mhour1<=0;
       mhour0<=0;
    end
  else 
    begin
       if(mode==2'b11)
         begin                                                      //秒表计时状态
             if(pause==0)                                           //当pause为低电平时开始计时
                begin   
		  if((mhour0==9)&&(mmin1==9)&&(mmin0==9))      
                     begin  
			mhour1<=mhour1+1;
			mmin1<=0;
			mmin0<=0;
			mhour0<=0;
	     	     end
		  else                                             
		      if((mmin1==9)&&(mmin0==9))
			 begin
                           mhour0<=mhour0+1;
			   mmin1<=0;
			   mmin0<=0;
			 end
		      else
			 if(mmin0==9)
			    begin
				mmin1<=mmin1+1;
				mmin0<=0;
			    end
			 else
			     mmin0<=mmin0+1;
	        end 
             else                                                 //当pause为高电平时停止计时
                begin            
                  mmin1<=mmin1;  
                  mmin0<=mmin0;  
                  mhour1<=mhour1;
                  mhour0<=mhour0;
                end              
         end
    end
 end
//以上为秒表计时功能

assign LD_alert=(amin1|amin0|ahour1|ahour0)?1:0;                      //当闹铃有定时后LD_alert发光以示闹铃已定
assign sec=clk1;                                                      //接秒时钟发光

always@(posedge clk) 
 begin
   if(!clr1)
      alert<=0;
   else 
      if((amin1==smin1)&&(amin0==smin0)&&(ahour1==shour1)&&(ahour0==shour0))
          alert<=1;                                                  //对闹铃做检查，时间到时发光
      else alert<=0;
 end


//以下为选择显示模块
always @ (posedge clk)
   begin
	 if(!clr1)
	  begin
	     min0<=0;
	     min1<=0;
	     hour1<=0;
             hour0<=0;
	  end
	else  
	 begin  
	    case(mode)
                2'b01:   begin                                       //mode=01时，显示闹铃模块
                          min1<=amin1; 
                          min0<=amin0;  
                          hour1<=ahour1;
                          hour0<=ahour0;          
                         end
                2'b10:   begin                                      //mode=10时，显示校时模块
                          min1<=smin1;   
                          min0<=smin0;   
                          hour1<=shour1; 
                          hour0<=shour0; 
                         end
                2'b11:   begin                                      //mode=11时，显示秒表模块
                          min1<=mmin1;   
                          min0<=mmin0;   
                          hour1<=mhour1; 
                          hour0<=mhour0;  
                         end         
                2'b00:  begin                                      //其他状态，显示普通时钟模块
                          min1<=smin1;         
                          min0<=smin0;  
                          hour1<=shour1;
                          hour0<=shour0;
                        end
           endcase
          end
  end                       

endmodule