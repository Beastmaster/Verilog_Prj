
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

input    clk;             //ʱ���ź�(50MHz)
input    clr;             //�����
input    pause;           //�����ͣ��
input    turn;            //�����ֻ���Сʱλ�Ŀ���
input    [1:0]mode;       //����ʱ����ʾ����״̬



output   sec;              //�ӷ��������
output   [3:0]min1;        //��������������3
output   [3:0]min0;        //��������������4
output   [3:0]hour1;       //��������������1
output   [3:0]hour0;       //��������������2
output   alert;            //�ӷ�������ܣ����������
output   LD_alert;         //�������趨�󣬷����������ʾ



wire     sec;              //��λ��ʾ
wire     LD_alert;         //�����������ʱ��������ʾ
wire     clk1;             //ʱ��1s
wire     clk2;             //ʱ��100ms�����������С��ʱ��λ
wire     clr1;

reg      [3:0]min1;        //��ʾ
reg      [3:0]min0;        //��ʾ
reg      [3:0]hour1;       //��ʾ
reg      [3:0]hour0;       //��ʾ

reg      [3:0]smin1;       //Уʱ
reg      [3:0]smin0;       //Уʱ
reg      [3:0]shour1;      //Уʱ
reg      [3:0]shour0;      //Уʱ

reg      [3:0]amin1;       //����
reg      [3:0]amin0;       //����
reg      [3:0]ahour1;      //����
reg      [3:0]ahour0;      //����

reg      [3:0]mmin1;       //���
reg      [3:0]mmin0;       //���
reg      [3:0]mhour1;      //���
reg      [3:0]mhour0;      //���

reg      alert;            //�����嵽ʱ�ߵ�ƽ���
reg      [7:0]count;


fdiv     fdiv(.f50m(clk),.f1(clk1));           //50MHZ��Ƶ��1HZ
fdiv_ms  fdiv_ms(.f50m(clk),.f2(clk2));        //50MHZ��Ƶ��10HZ
key_press  key_press1(.clk(clk),.key(clr),.key_out(clr1));        //����


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
//����Ϊ�������������        
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
//����Ϊ�ֹ�������
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
                   
//����ΪСʱ��������
         if(mode==2'b01)                                             //�����ʱ״̬
              if(turn==1)                                            //��turnΪ�ߵ�ƽʱ������λ
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
               else                                                //��turnΪ�͵�ƽʱ����Сʱλ
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
//����Ϊ���嶨ʱ����   

       if(mode==2'b10)                                             //ʱ�ӵ�ʱ״̬
             if(turn==1)                                           //��turnΪ�ߵ�ƽʱ������λ
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
             else                                                  //��turnΪ�͵�ƽʱ����Сʱλ
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
 //����Ϊʱ�ӵ�ʱ����

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
         begin                                                      //����ʱ״̬
             if(pause==0)                                           //��pauseΪ�͵�ƽʱ��ʼ��ʱ
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
             else                                                 //��pauseΪ�ߵ�ƽʱֹͣ��ʱ
                begin            
                  mmin1<=mmin1;  
                  mmin0<=mmin0;  
                  mhour1<=mhour1;
                  mhour0<=mhour0;
                end              
         end
    end
 end
//����Ϊ����ʱ����

assign LD_alert=(amin1|amin0|ahour1|ahour0)?1:0;                      //�������ж�ʱ��LD_alert������ʾ�����Ѷ�
assign sec=clk1;                                                      //����ʱ�ӷ���

always@(posedge clk) 
 begin
   if(!clr1)
      alert<=0;
   else 
      if((amin1==smin1)&&(amin0==smin0)&&(ahour1==shour1)&&(ahour0==shour0))
          alert<=1;                                                  //����������飬ʱ�䵽ʱ����
      else alert<=0;
 end


//����Ϊѡ����ʾģ��
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
                2'b01:   begin                                       //mode=01ʱ����ʾ����ģ��
                          min1<=amin1; 
                          min0<=amin0;  
                          hour1<=ahour1;
                          hour0<=ahour0;          
                         end
                2'b10:   begin                                      //mode=10ʱ����ʾУʱģ��
                          min1<=smin1;   
                          min0<=smin0;   
                          hour1<=shour1; 
                          hour0<=shour0; 
                         end
                2'b11:   begin                                      //mode=11ʱ����ʾ���ģ��
                          min1<=mmin1;   
                          min0<=mmin0;   
                          hour1<=mhour1; 
                          hour0<=mhour0;  
                         end         
                2'b00:  begin                                      //����״̬����ʾ��ͨʱ��ģ��
                          min1<=smin1;         
                          min0<=smin0;  
                          hour1<=shour1;
                          hour0<=shour0;
                        end
           endcase
          end
  end                       

endmodule