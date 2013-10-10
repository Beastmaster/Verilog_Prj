// megafunction wizard: %RAM: 2-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: sine.v
// Megafunction Name(s):
// 			altsyncram
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 235 06/17/2009 SP 2 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altsyncram ADDRESS_REG_B="CLOCK0" CLOCK_ENABLE_INPUT_A="BYPASS" CLOCK_ENABLE_INPUT_B="BYPASS" CLOCK_ENABLE_OUTPUT_A="BYPASS" CLOCK_ENABLE_OUTPUT_B="BYPASS" DEVICE_FAMILY="Cyclone II" NUMWORDS_A=32 NUMWORDS_B=32 OPERATION_MODE="DUAL_PORT" OUTDATA_ACLR_B="NONE" OUTDATA_REG_B="UNREGISTERED" POWER_UP_UNINITIALIZED="TRUE" RAM_BLOCK_TYPE="M4K" READ_DURING_WRITE_MODE_MIXED_PORTS="DONT_CARE" WIDTH_A=8 WIDTH_B=8 WIDTH_BYTEENA_A=1 WIDTHAD_A=5 WIDTHAD_B=5 address_a address_b clock0 data_a q_b wren_a
//VERSION_BEGIN 9.0SP2 cbx_altsyncram 2009:05:19:16:53:16:SJ cbx_cycloneii 2008:05:19:10:57:37:SJ cbx_lpm_add_sub 2009:05:07:10:25:28:SJ cbx_lpm_compare 2009:02:03:01:43:16:SJ cbx_lpm_decode 2008:05:19:10:39:27:SJ cbx_lpm_mux 2009:03:31:01:01:28:SJ cbx_mgl 2009:02:26:16:06:21:SJ cbx_stratix 2008:09:18:16:08:35:SJ cbx_stratixii 2008:11:14:16:08:42:SJ cbx_stratixiii 2009:05:12:13:36:56:SJ cbx_util_mgl 2008:11:21:14:58:47:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = M4K 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"OPTIMIZE_POWER_DURING_SYNTHESIS=NORMAL_COMPILATION"} *)
module  sine_altsyncram
	( 
	address_a,
	address_b,
	clock0,
	data_a,
	q_b,
	wren_a) /* synthesis synthesis_clearbox=1 */;
	input   [4:0]  address_a;
	input   [4:0]  address_b;
	input   clock0;
	input   [7:0]  data_a;
	output   [7:0]  q_b;
	input   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   [4:0]  address_b;
	tri1   clock0;
	tri1   [7:0]  data_a;
	tri0   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_ram_block1a_0portbdataout;
	wire  [0:0]   wire_ram_block1a_1portbdataout;
	wire  [0:0]   wire_ram_block1a_2portbdataout;
	wire  [0:0]   wire_ram_block1a_3portbdataout;
	wire  [0:0]   wire_ram_block1a_4portbdataout;
	wire  [0:0]   wire_ram_block1a_5portbdataout;
	wire  [0:0]   wire_ram_block1a_6portbdataout;
	wire  [0:0]   wire_ram_block1a_7portbdataout;
	wire  [4:0]  address_a_wire;
	wire  [4:0]  address_b_wire;

	cycloneii_ram_block   ram_block1a_0
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[0]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_0portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_0.connectivity_checking = "OFF",
		ram_block1a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_0.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_0.operation_mode = "dual_port",
		ram_block1a_0.port_a_address_width = 5,
		ram_block1a_0.port_a_data_width = 1,
		ram_block1a_0.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_0.port_a_first_address = 0,
		ram_block1a_0.port_a_first_bit_number = 0,
		ram_block1a_0.port_a_last_address = 31,
		ram_block1a_0.port_a_logical_ram_depth = 32,
		ram_block1a_0.port_a_logical_ram_width = 8,
		ram_block1a_0.port_b_address_clock = "clock0",
		ram_block1a_0.port_b_address_width = 5,
		ram_block1a_0.port_b_data_out_clear = "none",
		ram_block1a_0.port_b_data_out_clock = "none",
		ram_block1a_0.port_b_data_width = 1,
		ram_block1a_0.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_0.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_0.port_b_first_address = 0,
		ram_block1a_0.port_b_first_bit_number = 0,
		ram_block1a_0.port_b_last_address = 31,
		ram_block1a_0.port_b_logical_ram_depth = 32,
		ram_block1a_0.port_b_logical_ram_width = 8,
		ram_block1a_0.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_0.power_up_uninitialized = "true",
		ram_block1a_0.ram_block_type = "M4K",
		ram_block1a_0.lpm_type = "cycloneii_ram_block",
		ram_block1a_0.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_1
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[1]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_1portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_1.connectivity_checking = "OFF",
		ram_block1a_1.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_1.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_1.operation_mode = "dual_port",
		ram_block1a_1.port_a_address_width = 5,
		ram_block1a_1.port_a_data_width = 1,
		ram_block1a_1.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_1.port_a_first_address = 0,
		ram_block1a_1.port_a_first_bit_number = 1,
		ram_block1a_1.port_a_last_address = 31,
		ram_block1a_1.port_a_logical_ram_depth = 32,
		ram_block1a_1.port_a_logical_ram_width = 8,
		ram_block1a_1.port_b_address_clock = "clock0",
		ram_block1a_1.port_b_address_width = 5,
		ram_block1a_1.port_b_data_out_clear = "none",
		ram_block1a_1.port_b_data_out_clock = "none",
		ram_block1a_1.port_b_data_width = 1,
		ram_block1a_1.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_1.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_1.port_b_first_address = 0,
		ram_block1a_1.port_b_first_bit_number = 1,
		ram_block1a_1.port_b_last_address = 31,
		ram_block1a_1.port_b_logical_ram_depth = 32,
		ram_block1a_1.port_b_logical_ram_width = 8,
		ram_block1a_1.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_1.power_up_uninitialized = "true",
		ram_block1a_1.ram_block_type = "M4K",
		ram_block1a_1.lpm_type = "cycloneii_ram_block",
		ram_block1a_1.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_2
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[2]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_2portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_2.connectivity_checking = "OFF",
		ram_block1a_2.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_2.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_2.operation_mode = "dual_port",
		ram_block1a_2.port_a_address_width = 5,
		ram_block1a_2.port_a_data_width = 1,
		ram_block1a_2.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_2.port_a_first_address = 0,
		ram_block1a_2.port_a_first_bit_number = 2,
		ram_block1a_2.port_a_last_address = 31,
		ram_block1a_2.port_a_logical_ram_depth = 32,
		ram_block1a_2.port_a_logical_ram_width = 8,
		ram_block1a_2.port_b_address_clock = "clock0",
		ram_block1a_2.port_b_address_width = 5,
		ram_block1a_2.port_b_data_out_clear = "none",
		ram_block1a_2.port_b_data_out_clock = "none",
		ram_block1a_2.port_b_data_width = 1,
		ram_block1a_2.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_2.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_2.port_b_first_address = 0,
		ram_block1a_2.port_b_first_bit_number = 2,
		ram_block1a_2.port_b_last_address = 31,
		ram_block1a_2.port_b_logical_ram_depth = 32,
		ram_block1a_2.port_b_logical_ram_width = 8,
		ram_block1a_2.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_2.power_up_uninitialized = "true",
		ram_block1a_2.ram_block_type = "M4K",
		ram_block1a_2.lpm_type = "cycloneii_ram_block",
		ram_block1a_2.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_3
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[3]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_3portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_3.connectivity_checking = "OFF",
		ram_block1a_3.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_3.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_3.operation_mode = "dual_port",
		ram_block1a_3.port_a_address_width = 5,
		ram_block1a_3.port_a_data_width = 1,
		ram_block1a_3.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_3.port_a_first_address = 0,
		ram_block1a_3.port_a_first_bit_number = 3,
		ram_block1a_3.port_a_last_address = 31,
		ram_block1a_3.port_a_logical_ram_depth = 32,
		ram_block1a_3.port_a_logical_ram_width = 8,
		ram_block1a_3.port_b_address_clock = "clock0",
		ram_block1a_3.port_b_address_width = 5,
		ram_block1a_3.port_b_data_out_clear = "none",
		ram_block1a_3.port_b_data_out_clock = "none",
		ram_block1a_3.port_b_data_width = 1,
		ram_block1a_3.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_3.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_3.port_b_first_address = 0,
		ram_block1a_3.port_b_first_bit_number = 3,
		ram_block1a_3.port_b_last_address = 31,
		ram_block1a_3.port_b_logical_ram_depth = 32,
		ram_block1a_3.port_b_logical_ram_width = 8,
		ram_block1a_3.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_3.power_up_uninitialized = "true",
		ram_block1a_3.ram_block_type = "M4K",
		ram_block1a_3.lpm_type = "cycloneii_ram_block",
		ram_block1a_3.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_4
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[4]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_4portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_4.connectivity_checking = "OFF",
		ram_block1a_4.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_4.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_4.operation_mode = "dual_port",
		ram_block1a_4.port_a_address_width = 5,
		ram_block1a_4.port_a_data_width = 1,
		ram_block1a_4.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_4.port_a_first_address = 0,
		ram_block1a_4.port_a_first_bit_number = 4,
		ram_block1a_4.port_a_last_address = 31,
		ram_block1a_4.port_a_logical_ram_depth = 32,
		ram_block1a_4.port_a_logical_ram_width = 8,
		ram_block1a_4.port_b_address_clock = "clock0",
		ram_block1a_4.port_b_address_width = 5,
		ram_block1a_4.port_b_data_out_clear = "none",
		ram_block1a_4.port_b_data_out_clock = "none",
		ram_block1a_4.port_b_data_width = 1,
		ram_block1a_4.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_4.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_4.port_b_first_address = 0,
		ram_block1a_4.port_b_first_bit_number = 4,
		ram_block1a_4.port_b_last_address = 31,
		ram_block1a_4.port_b_logical_ram_depth = 32,
		ram_block1a_4.port_b_logical_ram_width = 8,
		ram_block1a_4.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_4.power_up_uninitialized = "true",
		ram_block1a_4.ram_block_type = "M4K",
		ram_block1a_4.lpm_type = "cycloneii_ram_block",
		ram_block1a_4.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_5
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[5]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_5portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_5.connectivity_checking = "OFF",
		ram_block1a_5.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_5.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_5.operation_mode = "dual_port",
		ram_block1a_5.port_a_address_width = 5,
		ram_block1a_5.port_a_data_width = 1,
		ram_block1a_5.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_5.port_a_first_address = 0,
		ram_block1a_5.port_a_first_bit_number = 5,
		ram_block1a_5.port_a_last_address = 31,
		ram_block1a_5.port_a_logical_ram_depth = 32,
		ram_block1a_5.port_a_logical_ram_width = 8,
		ram_block1a_5.port_b_address_clock = "clock0",
		ram_block1a_5.port_b_address_width = 5,
		ram_block1a_5.port_b_data_out_clear = "none",
		ram_block1a_5.port_b_data_out_clock = "none",
		ram_block1a_5.port_b_data_width = 1,
		ram_block1a_5.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_5.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_5.port_b_first_address = 0,
		ram_block1a_5.port_b_first_bit_number = 5,
		ram_block1a_5.port_b_last_address = 31,
		ram_block1a_5.port_b_logical_ram_depth = 32,
		ram_block1a_5.port_b_logical_ram_width = 8,
		ram_block1a_5.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_5.power_up_uninitialized = "true",
		ram_block1a_5.ram_block_type = "M4K",
		ram_block1a_5.lpm_type = "cycloneii_ram_block",
		ram_block1a_5.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_6
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[6]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_6portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_6.connectivity_checking = "OFF",
		ram_block1a_6.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_6.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_6.operation_mode = "dual_port",
		ram_block1a_6.port_a_address_width = 5,
		ram_block1a_6.port_a_data_width = 1,
		ram_block1a_6.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_6.port_a_first_address = 0,
		ram_block1a_6.port_a_first_bit_number = 6,
		ram_block1a_6.port_a_last_address = 31,
		ram_block1a_6.port_a_logical_ram_depth = 32,
		ram_block1a_6.port_a_logical_ram_width = 8,
		ram_block1a_6.port_b_address_clock = "clock0",
		ram_block1a_6.port_b_address_width = 5,
		ram_block1a_6.port_b_data_out_clear = "none",
		ram_block1a_6.port_b_data_out_clock = "none",
		ram_block1a_6.port_b_data_width = 1,
		ram_block1a_6.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_6.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_6.port_b_first_address = 0,
		ram_block1a_6.port_b_first_bit_number = 6,
		ram_block1a_6.port_b_last_address = 31,
		ram_block1a_6.port_b_logical_ram_depth = 32,
		ram_block1a_6.port_b_logical_ram_width = 8,
		ram_block1a_6.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_6.power_up_uninitialized = "true",
		ram_block1a_6.ram_block_type = "M4K",
		ram_block1a_6.lpm_type = "cycloneii_ram_block",
		ram_block1a_6.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	cycloneii_ram_block   ram_block1a_7
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[7]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block1a_7portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_7.connectivity_checking = "OFF",
		ram_block1a_7.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_7.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_7.operation_mode = "dual_port",
		ram_block1a_7.port_a_address_width = 5,
		ram_block1a_7.port_a_data_width = 1,
		ram_block1a_7.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_7.port_a_first_address = 0,
		ram_block1a_7.port_a_first_bit_number = 7,
		ram_block1a_7.port_a_last_address = 31,
		ram_block1a_7.port_a_logical_ram_depth = 32,
		ram_block1a_7.port_a_logical_ram_width = 8,
		ram_block1a_7.port_b_address_clock = "clock0",
		ram_block1a_7.port_b_address_width = 5,
		ram_block1a_7.port_b_data_out_clear = "none",
		ram_block1a_7.port_b_data_out_clock = "none",
		ram_block1a_7.port_b_data_width = 1,
		ram_block1a_7.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_7.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_7.port_b_first_address = 0,
		ram_block1a_7.port_b_first_bit_number = 7,
		ram_block1a_7.port_b_last_address = 31,
		ram_block1a_7.port_b_logical_ram_depth = 32,
		ram_block1a_7.port_b_logical_ram_width = 8,
		ram_block1a_7.port_b_read_enable_write_enable_clock = "clock0",
		ram_block1a_7.power_up_uninitialized = "true",
		ram_block1a_7.ram_block_type = "M4K",
		ram_block1a_7.lpm_type = "cycloneii_ram_block",
		ram_block1a_7.lpm_hint = "DONT_POWER_OPTIMIZE=ON";
	assign
		address_a_wire = address_a,
		address_b_wire = address_b,
		q_b = {wire_ram_block1a_7portbdataout[0], wire_ram_block1a_6portbdataout[0], wire_ram_block1a_5portbdataout[0], wire_ram_block1a_4portbdataout[0], wire_ram_block1a_3portbdataout[0], wire_ram_block1a_2portbdataout[0], wire_ram_block1a_1portbdataout[0], wire_ram_block1a_0portbdataout[0]};
endmodule //sine_altsyncram
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module sine (
	clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q)/* synthesis synthesis_clearbox = 1 */;

	input	  clock;
	input	[7:0]  data;
	input	[4:0]  rdaddress;
	input	[4:0]  wraddress;
	input	  wren;
	output	[7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [7:0] sub_wire0;
	wire [7:0] q = sub_wire0[7:0];

	sine_altsyncram	sine_altsyncram_component (
				.wren_a (wren),
				.clock0 (clock),
				.address_a (wraddress),
				.address_b (rdaddress),
				.data_a (data),
				.q_b (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
// Retrieval info: PRIVATE: ADDRESSSTALL_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_B NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_B NUMERIC "0"
// Retrieval info: PRIVATE: CLRdata NUMERIC "0"
// Retrieval info: PRIVATE: CLRq NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren NUMERIC "0"
// Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRwren NUMERIC "0"
// Retrieval info: PRIVATE: Clock NUMERIC "0"
// Retrieval info: PRIVATE: Clock_A NUMERIC "0"
// Retrieval info: PRIVATE: Clock_B NUMERIC "0"
// Retrieval info: PRIVATE: ECC NUMERIC "0"
// Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_B"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: MEMSIZE NUMERIC "256"
// Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "0"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "2"
// Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "2"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_B NUMERIC "3"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGq NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress NUMERIC "1"
// Retrieval info: PRIVATE: REGrren NUMERIC "1"
// Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
// Retrieval info: PRIVATE: REGwren NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: USE_DIFF_CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
// Retrieval info: PRIVATE: VarWidth NUMERIC "0"
// Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "8"
// Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "8"
// Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: enable NUMERIC "0"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK0"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_B STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_B STRING "BYPASS"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "32"
// Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "32"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "DUAL_PORT"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "UNREGISTERED"
// Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "TRUE"
// Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "M4K"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_MIXED_PORTS STRING "DONT_CARE"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "5"
// Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "5"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "8"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "8"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT VCC clock
// Retrieval info: USED_PORT: data 0 0 8 0 INPUT NODEFVAL data[7..0]
// Retrieval info: USED_PORT: q 0 0 8 0 OUTPUT NODEFVAL q[7..0]
// Retrieval info: USED_PORT: rdaddress 0 0 5 0 INPUT NODEFVAL rdaddress[4..0]
// Retrieval info: USED_PORT: wraddress 0 0 5 0 INPUT NODEFVAL wraddress[4..0]
// Retrieval info: USED_PORT: wren 0 0 0 0 INPUT GND wren
// Retrieval info: CONNECT: @data_a 0 0 8 0 data 0 0 8 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
// Retrieval info: CONNECT: q 0 0 8 0 @q_b 0 0 8 0
// Retrieval info: CONNECT: @address_a 0 0 5 0 wraddress 0 0 5 0
// Retrieval info: CONNECT: @address_b 0 0 5 0 rdaddress 0 0 5 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL sine.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine_wave*.jpg FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sine_syn.v TRUE
// Retrieval info: LIB_FILE: altera_mf
