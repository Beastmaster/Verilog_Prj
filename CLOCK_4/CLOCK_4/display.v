module display(LEDO,SEGO);
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