library verilog;
use verilog.vl_types.all;
entity fvc is
    port(
        clk             : in     vl_logic;
        nCR             : in     vl_logic;
        \signal\        : in     vl_logic;
        dac             : out    vl_logic_vector(11 downto 0);
        dac_CP          : out    vl_logic
    );
end fvc;
