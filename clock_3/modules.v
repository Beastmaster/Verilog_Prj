//FileName:counter24.v (bcd count:0~23)

module counter24 (CntH,CntL,nCR,EN,CP);

         input  CP,nCR,EN;//�ֱ�Ϊ��ʱ����CP�������ź�nCR��ʹ���ź�EN��
         output  [3:0] CntH,CntL;//Сʱ��������ʮλ�͸�λ����źţ�
         reg  [3:0] CntH,CntL;//���Ϊ8421BCD�룻

    always @(posedge CP or negedge nCR)
    begin

		if (~nCR) 
			{CntH,CntL}<=8'h00;//�첽���㣻

        else if (~EN) 
			{CntH,CntL}<={CntH,CntL};//��ʹ���ź���Ч�Ĵ���

        else if ((CntH>2)||(CntL>9)||((CntH==2)&&(CntL>=3)))
             {CntH,CntL}<=8'h00;//��Сʱ����������Ĵ���

        else if ((CntH==2)&&(CntL<3))//����20~23������
				begin        CntH<=CntH;   CntL<=CntL+1'b1;    end
        else if (CntL==9)//Сʱʮλ����
                begin        CntH<=CntH+1'b1;  CntL<=4'b0000;        end
        else//Сʱ��λ����
         begin        
         CntH<=CntH;   CntL<=CntL+1'b1; 
         end
     end

endmodule

 

///4.2ģ60�����������

//counter60.v(BCD:00~59)��ʮ���Ƶļ���������ģʮ��ģ������ģ�����ɣ�

module counter60(Cnt,nCR,EN,CP);

         input  CP,nCR,EN;
         output  [7:0] Cnt;//ģ��ʮ������źţ�

         wire [7:0] Cnt;//���Ϊ8421BCD�룻
         wire ENP;//������ʮλ��ʹ���źţ��м��������

         counter10 UC0 (Cnt[3:0],nCR,EN,CP);//�������ĸ�λ��
         counter6  UC1 (Cnt[7:4],nCR,ENP,CP);//��������ʮλ��

         assign       ENP=(Cnt[3:0]==4'h9);//����������ʮλ��ʹ���źţ�

endmodule

//counter6.v(BCD:0~5)

module counter6(Q,nCR,EN,CP);
     input  CP,nCR,EN;
     output [3:0] Q;
     reg    [3:0] Q;
         
         always @(posedge CP or negedge nCR)
         begin
             if (~nCR)   Q<=4'b0000;//nCR=0,���������첽���㣻
             else if (~EN) Q<=Q;//EN=0����ͣ��������
             else if (Q==4'b0101) Q<=4'b0000;
             else Q<=Q+1'b1;//��������һ������
         end

endmodule


//counter10
module counter10(Q,nCR,EN,CP);
	input nCR,EN,CP;
	output [3:0] Q;
	reg	[3:0] Q;
	
	always @(posedge CP or negedge nCR)
	begin
		if (~nCR)	Q<=4'b00;   //Asynchronous clear
		else if(~EN) Q<=Q;		//counting pause
		else if(Q==4'b1001)
			Q<=4'B00;	
		else 
			Q<=Q+1'b1;			//counter+1	
	end
endmodule 
 


 

///4.3�����ӵ����壨ֻ���ӵ��ǲ��֣�δ�����������ܣ�

//top_clock.v             used to count time
 module top_clock (_10Hz,Mode,Hour,Minute,Second,_1Hz,nCR,
                           ResH,AddHKey,ResL,AddLKey);

         input         _1Hz,_10Hz,nCR,ResH,AddHKey,ResL,AddLKey;
         input [5:0] Mode;
         output [7:0] Hour,Minute,Second;
         wire [7:0] Hour,Minute,Second;
         supply1  Vdd;
         wire nCRL,nCRH;
         wire MinCP,HrCP;

         counter60 UT1 (Second,nCR,Vdd,_1Hz);          //count second
         counter60 UT2 (Minute,nCRL,Vdd,~MinCP);            //count     minute
         counter24 UT3 (Hour [7:4],Hour [3:0],nCRH,Vdd,~HrCP);      //count hour

         assign nCRL= nCR&(~(ResL&((Mode==6'd0)|(Mode==6'd1))));     
         assign nCRH= nCR&(~(ResH&((Mode==6'd0)|(Mode==6'd1))));   
         assign MinCP= (((Mode==6'd0)|(Mode==6'd1))&(~AddLKey)) ? _10Hz : (Second == 8'h59);
         assign HrCP=  (((Mode==6'd0)|(Mode==6'd1))&(~AddHKey)) ? _10Hz : ({Minute,Second}==16'h5959);

endmodule




///4.4��Ƶģ������

//Divided_Frequency.v              used for frequency division

module Divided_Frequency(_1HzOut,_10Hz,_100Hz,_500HzOut,nCR,_1kHzIN);

/*    _1HzOut is used to count time;

         _10Hz is used to adjust time;

         _100Hz is used to timing in the stopwatch mode;

         _500HzOut is used to strike the hour;

         nCR is used to clear data;

*/

         input   _1kHzIN,nCR;
         output  _1HzOut,_10Hz,_100Hz,_500HzOut;
         supply1 Vdd;
         wire [11:0] Q;
         wire _10Hz,_100Hz;

         counter10 DU0 (Q[3:0],nCR,Vdd,_1kHzIN);//����ģʮ������
         counter10 DU1 (Q[7:4],nCR,_100Hz,_1kHzIN);
         counter10 DU2 (Q[11:8],nCR,_10Hz,_1kHzIN);

         assign _100Hz = (Q[3:0]==4'h9);
         assign _10Hz = (Q[7:4]==4'h9)&(Q[3:0]==4'h9);
         assign _1HzOut=Q[11];
         assign _500HzOut=Q[0];

endmodule

///4.5�߶��������ʾģ��

//SegOut.v                 used to output numbers

module SegOut(Seg,LED_H,LED_L,dp,_1Hz);

         input         [7:0] LED_H,LED_L;
         input   _1Hz;        //use 1Hz to blink the dot
         output  [27:0]Seg;
         output  dp;             //used to control the dot
         reg  dp;

         SegChange FA1 (LED_L[3:0],Seg[6:0]);//���õĵ�������ܵ�ģ��
         SegChange FA2 (LED_L[7:4],Seg[13:7]);//���õĵ�������ܵ�ģ��
         SegChange FA3 (LED_H[3:0],Seg[20:14]);//���õĵ�������ܵ�ģ��
         SegChange FA4 (LED_H[7:4],Seg[27:21]);//���õĵ�������ܵ�ģ��
 
 
         always @(posedge _1Hz)
                   dp<=~dp;

endmodule

 

//SegChange.v to display the number needed�������������ģ�飩

module SegChange(LEDO,SEGO);

         input  [3:0] LEDO;
         output [6:0] SEGO;

         reg  [6:0] SEGO;

         always @(LEDO)

                  case(LEDO)
                  4'd0: SEGO = ~7'b0111111;
                  4'd1: SEGO = ~7'b0000110;                
				  4'd2: SEGO = ~7'b1011011;
				  4'd3: SEGO = ~7'b1001111;
                  4'd4: SEGO = ~7'b1100110;
				  4'd5: SEGO = ~7'b1101101;
                  4'd6: SEGO = ~7'b1111101;
				  4'd7: SEGO = ~7'b0000111;
				  4'd8: SEGO = ~7'b1111111;
				  4'd9: SEGO = ~7'b1101111;
                  default:SEGO = 7'b1111111;
                   endcase

endmodule 