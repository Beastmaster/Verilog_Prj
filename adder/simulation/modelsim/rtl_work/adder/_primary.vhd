library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        datain          : in     vl_logic_vector(7 downto 0);
        dataout         : out    vl_logic;
        cs              : out    vl_logic;
        clk             : in     vl_logic;
        nCR             : in     vl_logic;
        sdt             : in     vl_logic
    );
end adder;
