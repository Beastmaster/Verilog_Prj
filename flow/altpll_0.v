//altpll_avalon CBX_SINGLE_OUTPUT_FILE="ON" CBX_SUBMODULE_USED_PORTS="altpll:areset,clk,locked,inclk" address clk read reset write writedata clk0_divide_by=1 clk0_duty_cycle=50 clk0_multiply_by=1 clk0_phase_shift="0" compensate_clock="CLK0" device_family="CYCLONEII" inclk0_input_frequency=20000 intended_device_family="Cyclone II" operation_mode="normal" port_clk0="PORT_USED" port_clk1="PORT_UNUSED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED"
//VERSION_BEGIN 9.0SP2 cbx_altpll 2009:02:02:16:49:10:SJ cbx_altpll_avalon 2009:03:26:11:46:11:SJ cbx_cycloneii 2008:05:19:10:57:37:SJ cbx_lpm_mux 2009:03:31:01:01:28:SJ cbx_mgl 2009:02:26:16:06:21:SJ cbx_stratixii 2008:11:14:16:08:42:SJ cbx_util_mgl 2008:11:21:14:58:47:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2009 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//altpll CBX_SINGLE_OUTPUT_FILE="ON" clk0_divide_by=1 clk0_duty_cycle=50 clk0_multiply_by=1 clk0_phase_shift="0" compensate_clock="CLK0" device_family="CYCLONEII" inclk0_input_frequency=20000 intended_device_family="Cyclone II" operation_mode="normal" port_clk0="PORT_USED" port_clk1="PORT_UNUSED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED" areset clk inclk locked
//VERSION_BEGIN 9.0SP2 cbx_altpll 2009:02:02:16:49:10:SJ cbx_cycloneii 2008:05:19:10:57:37:SJ cbx_mgl 2009:02:26:16:06:21:SJ cbx_stratixii 2008:11:14:16:08:42:SJ cbx_util_mgl 2008:11:21:14:58:47:SJ  VERSION_END


//dffpipe CBX_SINGLE_OUTPUT_FILE="ON" DELAY=3 WIDTH=1 clock clrn d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 9.0SP2 cbx_mgl 2009:02:26:16:06:21:SJ cbx_stratixii 2008:11:14:16:08:42:SJ cbx_util_mgl 2008:11:21:14:58:47:SJ  VERSION_END

//synthesis_resources = reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  altpll_0_dffpipe_l2c
	( 
	clock,
	clrn,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   clrn;
	input   [0:0]  d;
	output   [0:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
	tri1   clrn;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dffe3a;
	reg	[0:0]	dffe4a;
	reg	[0:0]	dffe5a;
	wire ena;
	wire prn;
	wire sclr;

	// synopsys translate_off
	initial
		dffe3a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe3a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe3a <= 1'b0;
		else if  (ena == 1'b1)   dffe3a <= (d & (~ sclr));
	// synopsys translate_off
	initial
		dffe4a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe4a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe4a <= 1'b0;
		else if  (ena == 1'b1)   dffe4a <= (dffe3a & (~ sclr));
	// synopsys translate_off
	initial
		dffe5a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe5a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe5a <= 1'b0;
		else if  (ena == 1'b1)   dffe5a <= (dffe4a & (~ sclr));
	assign
		ena = 1'b1,
		prn = 1'b1,
		q = dffe5a,
		sclr = 1'b0;
endmodule //altpll_0_dffpipe_l2c

//synthesis_resources = altpll 1 reg 5 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  altpll_0
	( 
	address,
	c0,
	clk,
	locked,
	read,
	readdata,
	reset,
	write,
	writedata) /* synthesis synthesis_clearbox=1 */;
	input   address;
	output   c0;
	input   clk;
	output   locked;
	input   read;
	output   [31:0]  readdata;
	input   reset;
	input   write;
	input   [31:0]  writedata;

	wire  [5:0]   wire_altpll1_clk;
	wire  wire_altpll1_locked;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	pfdena_reg;
	wire	wire_pfdena_reg_ena;
	reg	prev_reset;
	wire  [0:0]   wire_dffpipe2_q;
	wire  w_locked;
	wire  w_pfdena;
	wire  w_pll_areset_in;
	wire  w_reset;
	wire  w_select_control;
	wire  w_select_status;

	altpll   altpll1
	( 
	.activeclock(),
	.areset(w_pll_areset_in),
	.clk(wire_altpll1_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.extclk(),
	.fbout(),
	.inclk({1'b0, clk}),
	.locked(wire_altpll1_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.sclkout0(),
	.sclkout1(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkena({6{1'b1}}),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.extclkena({4{1'b1}}),
	.fbin(1'b1),
	.pfdena(1'b1),
	.phasecounterselect({4{1'b1}}),
	.phasestep(1'b1),
	.phaseupdown(1'b1),
	.pllena(1'b1),
	.scanaclr(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0),
	.scanread(1'b0),
	.scanwrite(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		altpll1.clk0_divide_by = 1,
		altpll1.clk0_duty_cycle = 50,
		altpll1.clk0_multiply_by = 1,
		altpll1.clk0_phase_shift = "0",
		altpll1.compensate_clock = "CLK0",
		altpll1.inclk0_input_frequency = 20000,
		altpll1.operation_mode = "normal",
		altpll1.port_clk0 = "PORT_USED",
		altpll1.port_clk1 = "PORT_UNUSED",
		altpll1.port_clk2 = "PORT_UNUSED",
		altpll1.port_clk3 = "PORT_UNUSED",
		altpll1.port_clk4 = "PORT_UNUSED",
		altpll1.port_clk5 = "PORT_UNUSED",
		altpll1.port_extclk0 = "PORT_UNUSED",
		altpll1.port_extclk1 = "PORT_UNUSED",
		altpll1.port_extclk2 = "PORT_UNUSED",
		altpll1.port_extclk3 = "PORT_UNUSED",
		altpll1.port_phasecounterselect = "PORT_UNUSED",
		altpll1.lpm_type = "altpll";
	// synopsys translate_off
	initial
		pfdena_reg = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) pfdena_reg <= {1{1'b1}};
		else if  (wire_pfdena_reg_ena == 1'b1)   pfdena_reg <= writedata[1];
	assign
		wire_pfdena_reg_ena = (write & w_select_control);
	// synopsys translate_off
	initial
		prev_reset = 0;
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) prev_reset <= {1{1'b1}};
		else  prev_reset <= w_reset;
	altpll_0_dffpipe_l2c   dffpipe2
	( 
	.clock(clk),
	.clrn((~ reset)),
	.d(wire_altpll1_locked),
	.q(wire_dffpipe2_q));
	assign
		c0 = wire_altpll1_clk[0],
		locked = w_locked,
		readdata = {{30{1'b0}}, ((read & w_select_control) & w_pfdena), (read & ((w_select_control & w_pll_areset_in) | (w_select_status & w_locked)))},
		w_locked = wire_dffpipe2_q,
		w_pfdena = pfdena_reg,
		w_pll_areset_in = prev_reset,
		w_reset = ((write & w_select_control) & writedata[0]),
		w_select_control = address,
		w_select_status = (~ address);
endmodule //altpll_0
//VALID FILE
