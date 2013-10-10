
module series(clk, datain, wrsig, idle, tx);
input clk;          //UARTʱ��
input [7:0]datain; //��Ҫ���͵�����
input wrsig;        //���������������Ч
output idle;        //��·״ָ̬ʾ����Ϊ��·æ����Ϊ��·����
output tx;          //���������ź�
reg idle, tx;
reg send;
reg wrsigbuf, wrsigrise;
reg presult;
reg[7:0] cnt;       //������
parameter paritymode = 1'b0;



//��ⷢ�������Ƿ���Ч
always @(posedge clk)
begin
wrsigbuf <= wrsig;
wrsigrise <= (~wrsigbuf) & wrsig;
end

always @(posedge clk)
	begin
		if (wrsigrise &&  (~idle))  //������������Ч����·Ϊ����ʱ�������µ����ݷ��ͽ���
			begin
				send <= 1'b1;
			end
		else if(cnt == 8'd176)      //һ֡���Ϸ��ͽ���
			begin
				send <= 1'b0;
			end
	end
	
always @(posedge clk)
	begin
		if(send == 1'b1)
			begin
			case(cnt)       //������ʼλ
			8'd0:
				begin
				tx <= 1'b0;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd16:
				begin
				tx <= datain[0];    //��������0λ
				presult <= datain[0]^paritymode;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd32:
				begin
				tx <= datain[1];    //��������1λ
				presult <= datain[1]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd48:
				begin
				tx <= datain[2];    //��������2λ
				presult <= datain[2]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd64:
				begin
				tx <= datain[3];    //��������3λ
				presult <= datain[3]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd80:
				begin
				tx <= datain[4];    //��������4λ
				presult <= datain[4]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd96:
				begin
				tx <= datain[5];    //��������5λ
				presult <= datain[5]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd112:
				begin
				tx <= datain[6];    //��������6λ
				presult <= datain[6]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd128:
				begin
				tx <= datain[7];    //��������7λ
				presult <= datain[7]^presult;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd144:
				begin
				tx <= presult;      //������żУ��λ
				presult <= datain[0]^paritymode;
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd160:
				begin
				tx <= 1'b1;     //����ֹͣλ             
				idle <= 1'b1;
				cnt <= cnt + 8'd1;
				end
			8'd176:
				begin
				tx <= 1'b1;             
				idle <= 1'b0;   //һ֡���Ϸ��ͽ���
				cnt <= cnt + 8'd1;
				end
			default:
				begin
				cnt <= cnt + 8'd1;
				end
			endcase
			end
		else
			begin
			tx <= 1'b1;
			cnt <= 8'd0;
			idle <= 1'b0;
			
			end
		end
endmodule



module uartrx(clk, rx, dataout, rdsig, dataerror, frameerror);
input clk;          //����ʱ��
input rx;           //UART��������
output dataout;     //�����������
output rdsig;
output dataerror;   //���ϳ���ָʾ
output frameerror;  //֡����ָʾ
reg[7:0] dataout;
reg rdsig, dataerror;
reg frameerror;
reg [7:0] cnt;
reg rxbuf, rxfall, receive;
parameter paritymode = 1'b0;
reg presult, idle;

always @(posedge clk)   //�����·���½���
begin
rxbuf <= rx;
rxfall <= rxbuf & (~rx);
end
always @(posedge clk)
begin
if (rxfall && (~idle))  //��⵽��·���½��ز���ԭ����·Ϊ���У������������ݽ���
begin
receive <= 1'b1;
end
else if(cnt == 8'd175)  //�����������
begin
receive <= 1'b0;
end
end
always @(posedge clk)
begin
if(receive == 1'b1)
begin
case (cnt)
8'd0:
begin
idle <= 1'b1;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd24:  //���յ�0λ����
begin
idle <= 1'b1;
dataout[0] <= rx;
presult <= paritymode^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd40: //���յ�1λ����
begin
idle <= 1'b1;
dataout[1] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd56: //���յ�2λ����
begin
idle <= 1'b1;
dataout[2] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd72: //���յ�3λ����
begin
idle <= 1'b1;
dataout[3] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd88: //���յ�4λ����
begin
idle <= 1'b1;
dataout[4] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd104: //���յ�5λ����
begin
idle <= 1'b1;
dataout[5] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd120:     //���յ�6λ����
begin
idle <= 1'b1;
dataout[6] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b0;
end
8'd136:     //���յ�7λ����
begin
idle <= 1'b1;
dataout[7] <= rx;
presult <= presult^rx;
cnt <= cnt + 8'd1;
rdsig <= 1'b1;
end
8'd152:     //������żУ��λ
begin
idle <= 1'b1;
if(presult == rx)
dataerror <= 1'b0;
else
dataerror <= 1'b1;  //�����żУ��λ���ԣ���ʾ���ݳ���   
cnt <= cnt + 8'd1;
rdsig <= 1'b1;
end
8'd168:
begin
idle <= 1'b1;
if(1'b1 == rx)
frameerror <= 1'b0;
else
frameerror <= 1'b1;     //���û�н��յ�ֹͣλ����ʾ֡����
cnt <= cnt + 8'd1;
rdsig <= 1'b1;
end
default:
begin
cnt <= cnt + 8'd1;
end
endcase
end
else
begin
cnt <= 8'd0;
idle <= 1'b0;
rdsig <= 1'b0;
end
end
endmodule




















/*
module series(CP,nCR,allow,data_in,data_out);
input CP,nCR,allow;
input [31:0]data_in;
output data_out;
reg data_out;

*/
//get bit CP
/*
parameter BT=12'd100;
reg CP;
reg [11:0] cnt1;
always@(posedge clk or negedge nCR)
begin 
	if(~nCR)
		{cnt1,CP}<=12'b00;
	else if(cnt1==BT)
		begin
		cnt1<=11'b00;
		CP<=~CP;
		end
	else
		cnt1<=cnt1+1'b1;
end
*/




/*
//data go to reg when data_in changes
reg [31:0]data_reg;
always@(data_in)
data_reg<=data_in;


//state machine
reg [5:0]state;
reg [31:0] temp;
wire cor;

always@(posedge CP or negedge nCR)
begin
	if(~nCR)
		state<=6'b00;
	else if(allow)             ////////
		state<=6'b00;
	else if(state==6'b101100)
		state<=6'b00;
	else
		state<=state+1'b1;
end


always@(posedge CP)
begin
	if((6'd0<state<6'd9)||(6'd11<state<6'd20)||(6'd22<state<6'd31)||(6'd33<state<6'd43))
	temp=temp<<1;
	else if(state==0)
	temp<=data_reg;
end

always@(negedge CP)
case(state)
	6'b00:
	begin
	data_out<=1;//0
	//data_reg<=data_in;
	end
	
	6'b01,
	6'b001100,//11
	6'b010111,//22
	6'b100010:data_out<=0;//33
	
	6'b001010,//9
	6'b001011,//10
	6'b010101,//20
	6'b010110,//21
	6'b100000,//31
	6'b100001,//32
	6'b101011,//42
	6'b101100:data_out<=1;//43
	
	default:
		data_out<=temp[31];

endcase

endmodule 


*/


/*
`define VB 1
`define start_data 1
`define stop_data 2
`define clock 50_000_000
`define bit_value 9600

module series(clk,rxd,rxd_ok,data_out);
input clk,rxd;
reg rxd_busy;
reg [7:0] out;
reg [31:0] i;
reg [31:0] ii;
reg rxd_ok;
output rxd_ok;
output [{`VB*8-1}:0] data_out;
reg [{`VB*8-1}:0] data_out;
reg [{{`VB+3}*8-1}:0] data;
reg [{{`VB+3}*8-1}:0] xor_data;
reg [7:0] data_xor;

parameter hz=`clock/`bit_value;

always@(posedge clk)
begin
	if(~rxd)
		rxd_busy=1'b1;
	if(rxd_busy)
		i=i+1'b1;
	case(i)
	hz/2+hz*1:out[0]=rxd;
	hz/2+hz*2:out[0]=rxd;
	hz/2+hz*3:out[0]=rxd;
	hz/2+hz*4:out[0]=rxd;
	hz/2+hz*5:out[0]=rxd;
	hz/2+hz*6:out[0]=rxd;
	hz/2+hz*7:out[0]=rxd;
	hz/2+hz*8:out[0]=rxd;
	endcase
	
	if(i>=hz*10)
	begin
	rxd_busy=1'b0;
	i=1'b0;
	end
end

always @(negedge rxd_busy)
begin
	data[{{`VB+3}*8-1}:0]=data[{{`VB+3}*8-1}:0]>>8;
	data[{{`VB+3}*8-1}:{{`VB+2}*8}]=out;
	xor_data=data[{{`VB+1}*8-1}:0];
	
	ii=0;
	data_xor=0;
	while(ii<{`VB+1})
	begin
		data_xor=data_xor^xor_data[7:0];
		xor_data=xor_data>>8;
		ii=ii+1;
	end
	if((data[{{`VB+3}*8-1}:{`VB+2}*8]==`stop_data)&&(data[7:0]==`start_data)&&(data_xor=data[{{`VB+2}*8-1}:{`VB+1}*8]))
		begin 
			data_out[{`VB*8-1}:0]=data[{{`VB+1}*8-1}:8];
			rxd_ok=~rxd_ok;
		end
end

endmodule


*/
/*

module series(clk,rst,TxD_start,TxD_data,TxD,TxD_busy);
input clk,rst,TxD_start;
input [7:0] TxD_data;  //data wating to send
output TxD,TxD_busy;   //data in series 
reg TxD;
reg[7:0] TxD_dataReg;
reg[3:0] state;
parameter ClkFrequency=2500000000;   //clock frequency
parameter Baud=9600;     //baud rate

//baud rate
parameter BaudGeneratorAccWidth=16;
reg [BaudGeneratorAccWidth:0] BaudGeneratorAcc;
wire [BaudGeneratorAccWidth:0] BaudGeneratorInc;
//((Baud<<(BaudGeneratorAccWidth-4))+(ClkFrequency>>5))/(ClkFrequency>>4);
wire BaudTick=BaudGeneratorAcc[BaudGeneratorAccWidth];
wire TxD_busy;

always@(posedge clk or negedge rst)
	if(~rst)
		BaudGeneratorAcc<=0;
	else if (TxD_busy)
		BaudGeneratorAcc<=BaudGeneratorAcc[BaudGeneratorAccWidth-1:0]+BaudGeneratorInc;
		
		//send port
		wire TxD_ready=(state==0);//state=0,TxD_ready=1,free state
		assign TxD_busy=~TxD_ready;//free state,TxD_busy=0

//send data to be sending to regeister TxD_dataReg
always@(posedge clk or negedge rst)
	if(~rst)
		TxD_dataReg<=8'b0000;
	else if(TxD_ready&TxD_start)
	TxD_dataReg<=TxD_data;
	
	//send state machine
	always@(posedge clk or negedge rst)
	if(~rst)
		      begin
         state <= 4'b0000;   // ��λʱ��״̬Ϊ0000�����Ͷ�һֱ��1��ƽ
         TxD <= 1'b1;
      end
 else 
 case(state)
  4'b0000: if(TxD_start) begin
                      state <= 4'b0100; // ���ܵ������źţ����뷢��״̬
                         end
  4'b0100: if(BaudTick) begin
                            state <= 4'b1000;  // ���Ϳ�ʼλ - 0��ƽ
                  TxD <= 1'b0;
                            end
  4'b1000: if(BaudTick) begin
                            state <= 4'b1001;  // bit 0
                  TxD <= TxD_dataReg[0];
                            end
  4'b1001: if(BaudTick) begin
                            state <= 4'b1010;  // bit 1
                  TxD <= TxD_dataReg[1];
                        end
  4'b1010: if(BaudTick) begin
                            state <= 4'b1011;  // bit 2
                  TxD <= TxD_dataReg[2];
                            end
  4'b1011: if(BaudTick) begin
                            state <= 4'b1100;  // bit 3
                  TxD <= TxD_dataReg[3];
                            end
  4'b1100: if(BaudTick) begin
                            state <= 4'b1101;  // bit 4
                  TxD <= TxD_dataReg[4];
                            end
  4'b1101: if(BaudTick) begin
                            state <= 4'b1110;  // bit 5
                  TxD <= TxD_dataReg[5];
                            end
  4'b1110: if(BaudTick) begin
                            state <= 4'b1111;  // bit 6
                  TxD <= TxD_dataReg[6];
                            end
  4'b1111: if(BaudTick) begin
                            state <= 4'b0010;  // bit 7
                  TxD <= TxD_dataReg[7];
                            end
  4'b0010: if(BaudTick) begin
                            state <= 4'b0011;  // stop1
                  TxD <= 1'b1;
                            end
  4'b0011: if(BaudTick) begin
                            state <= 4'b0000;  // stop2
                        TxD <= 1'b1;
                            end
  default: if(BaudTick) begin
                            state <= 4'b0000;
                TxD <= 1'b1;
              end
 endcase
endmodule



*/

















