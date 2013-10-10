module max_period_mea
( input clk, input code_edge, output reg [15:0] period);
    reg [15:0] cnt, p_temp; reg [23:0] cnt_for_100ms;
    initial begin cnt <= 1'b0; p_temp <= 1'b0;
        cnt_for_100ms <= 1'b0; period <= 1'b0; end
    wire en_100ms = (cnt_for_100ms == 1'b0);
    always@(posedge clk) begin
        if(cnt_for_100ms < 24'd4999999)
            cnt_for_100ms <= cnt_for_100ms + 1'b1;
        else cnt_for_100ms <= 1'b0; end
    always@(posedge clk) begin
        if(code_edge) cnt <= 1'b0;
        else cnt <= cnt + 1'b1; end
    always@(posedge clk) begin
        if(en_100ms) begin
            p_temp <= 1'b0; period <= p_temp; end
        else if(code_edge) begin
            if(cnt > p_temp) p_temp <= cnt; end end
endmodule


module mcst//man_clk_rec_easy
( input clk, input man_code, output man_sync);
    reg [1:0] man_code_dly;
    wire man_code_edge = ^man_code_dly;
    always@(posedge clk) begin
        man_code_dly = {man_code_dly[0], man_code}; end
    wire [15:0] prd;
    max_period_mea inst_p_mea
    (   .clk(clk), .code_edge(man_code_edge), .period(prd));
    reg [15:0] cnt;
    always@(posedge clk) begin
        if(man_code_edge) begin
            if(cnt > (prd - (prd >> 2)) || cnt < (prd >> 2))
            cnt <= 1'b0; end
        else begin
            if(cnt < prd - 1'b1) cnt <= cnt + 1'b1;
            else cnt <= 1'b0; end end
    assign man_sync = (cnt == (prd - (prd >> 2)) || cnt == (prd >> 2));
endmodule


































