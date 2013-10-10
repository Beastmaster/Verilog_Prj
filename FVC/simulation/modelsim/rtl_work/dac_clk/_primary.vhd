library verilog;
use verilog.vl_types.all;
entity dac_clk is
    generic(
        cycle           : integer := 5
    );
    port(
        clk             : in     vl_logic;
        CP              : out    vl_logic;
        nCR             : in     vl_logic
    );
end dac_clk;
