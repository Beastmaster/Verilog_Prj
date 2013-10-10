library verilog;
use verilog.vl_types.all;
entity catch_edge is
    port(
        clk             : in     vl_logic;
        nCR             : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end catch_edge;
