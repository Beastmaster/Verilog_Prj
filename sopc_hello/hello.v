//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_latency_counter,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 13: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 13: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 13: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[13 : 11] , 11'b0} == 14'h1000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | cpu_0_instruction_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[13 : 11] , 11'b0} == 14'h1000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_0_jtag_debug_module_reset of type reset_n to cpu_0_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_0_jtag_debug_module_reset = ~cpu_0_jtag_debug_module_reset_n;

  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_byteenable_onchip_RAM_s1,
                                       cpu_0_data_master_byteenable_onchip_ROM_s1,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_onchip_RAM_s1,
                                       cpu_0_data_master_granted_onchip_ROM_s1,
                                       cpu_0_data_master_granted_pio_0_s1,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_onchip_RAM_s1,
                                       cpu_0_data_master_qualified_request_onchip_ROM_s1,
                                       cpu_0_data_master_qualified_request_pio_0_s1,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_onchip_RAM_s1,
                                       cpu_0_data_master_read_data_valid_onchip_ROM_s1,
                                       cpu_0_data_master_read_data_valid_pio_0_s1,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_onchip_RAM_s1,
                                       cpu_0_data_master_requests_onchip_ROM_s1,
                                       cpu_0_data_master_requests_pio_0_s1,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_onchip_RAM_s1_end_xfer,
                                       d1_onchip_ROM_s1_end_xfer,
                                       d1_pio_0_s1_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       onchip_RAM_s1_readdata_from_sa,
                                       onchip_ROM_s1_readdata_from_sa,
                                       pio_0_s1_readdata_from_sa,
                                       reset_n,
                                       sysid_control_slave_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_readdatavalid,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 13: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output           cpu_0_data_master_latency_counter;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_readdatavalid;
  output           cpu_0_data_master_waitrequest;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_onchip_RAM_s1;
  input            cpu_0_data_master_granted_onchip_ROM_s1;
  input            cpu_0_data_master_granted_pio_0_s1;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_onchip_RAM_s1;
  input            cpu_0_data_master_qualified_request_onchip_ROM_s1;
  input            cpu_0_data_master_qualified_request_pio_0_s1;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_onchip_RAM_s1;
  input            cpu_0_data_master_read_data_valid_onchip_ROM_s1;
  input            cpu_0_data_master_read_data_valid_pio_0_s1;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_onchip_RAM_s1;
  input            cpu_0_data_master_requests_onchip_ROM_s1;
  input            cpu_0_data_master_requests_pio_0_s1;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_onchip_RAM_s1_end_xfer;
  input            d1_onchip_ROM_s1_end_xfer;
  input            d1_pio_0_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input   [ 15: 0] onchip_RAM_s1_readdata_from_sa;
  input   [ 15: 0] onchip_ROM_s1_readdata_from_sa;
  input   [  7: 0] pio_0_s1_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 13: 0] cpu_0_data_master_address_last_time;
  wire    [ 13: 0] cpu_0_data_master_address_to_slave;
  reg     [  3: 0] cpu_0_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  reg     [  1: 0] cpu_0_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire             cpu_0_data_master_is_granted_some_slave;
  reg              cpu_0_data_master_latency_counter;
  wire    [  1: 0] cpu_0_data_master_next_dbs_rdv_counter;
  reg              cpu_0_data_master_read_but_no_slave_selected;
  reg              cpu_0_data_master_read_last_time;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_run;
  wire             cpu_0_data_master_waitrequest;
  reg              cpu_0_data_master_write_last_time;
  reg     [ 31: 0] cpu_0_data_master_writedata_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_0_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_onchip_RAM_s1 | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_onchip_RAM_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_onchip_RAM_s1) & (cpu_0_data_master_granted_onchip_RAM_s1 | ~cpu_0_data_master_qualified_request_onchip_RAM_s1) & ((~cpu_0_data_master_qualified_request_onchip_RAM_s1 | ~cpu_0_data_master_read | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_onchip_RAM_s1 | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_onchip_ROM_s1 | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_onchip_ROM_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_onchip_ROM_s1) & (cpu_0_data_master_granted_onchip_ROM_s1 | ~cpu_0_data_master_qualified_request_onchip_ROM_s1) & ((~cpu_0_data_master_qualified_request_onchip_ROM_s1 | ~cpu_0_data_master_read | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_onchip_ROM_s1 | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_requests_pio_0_s1) & ((~cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_read | (1 & ~d1_pio_0_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_requests_sysid_control_slave) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[13 : 0];

  //cpu_0_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_data_master_read_but_no_slave_selected <= cpu_0_data_master_read & cpu_0_data_master_run & ~cpu_0_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_data_master_is_granted_some_slave = cpu_0_data_master_granted_cpu_0_jtag_debug_module |
    cpu_0_data_master_granted_onchip_RAM_s1 |
    cpu_0_data_master_granted_onchip_ROM_s1 |
    cpu_0_data_master_granted_pio_0_s1 |
    cpu_0_data_master_granted_sysid_control_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_data_master_readdatavalid = (cpu_0_data_master_read_data_valid_onchip_RAM_s1 & dbs_rdv_counter_overflow) |
    (cpu_0_data_master_read_data_valid_onchip_ROM_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_data_master_readdatavalid = cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_pio_0_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_sysid_control_slave;

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~(cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_data_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_onchip_RAM_s1}} | {onchip_RAM_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_0_data_master_read_data_valid_onchip_ROM_s1}} | {onchip_ROM_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_0_data_master_qualified_request_pio_0_s1 & cpu_0_data_master_read)}} | pio_0_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_sysid_control_slave & cpu_0_data_master_read)}} | sysid_control_slave_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_data_master_waitrequest = ~cpu_0_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_latency_counter <= 0;
      else 
        cpu_0_data_master_latency_counter <= p1_cpu_0_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_data_master_latency_counter = ((cpu_0_data_master_run & cpu_0_data_master_read))? latency_load_value :
    (cpu_0_data_master_latency_counter)? cpu_0_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({1 {cpu_0_data_master_requests_onchip_RAM_s1}} & 1) |
    ({1 {cpu_0_data_master_requests_onchip_ROM_s1}} & 1);

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_0_data_master_requests_onchip_RAM_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_onchip_RAM_s1)) |
    (cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_read & 1 & 1) |
    (cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_write & 1 & 1) |
    (((~0) & cpu_0_data_master_requests_onchip_ROM_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_onchip_ROM_s1)) |
    (cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_read & 1 & 1) |
    (cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_write & 1 & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = (cpu_0_data_master_read_data_valid_onchip_RAM_s1)? onchip_RAM_s1_readdata_from_sa :
    onchip_ROM_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    (~(cpu_0_data_master_dbs_address[1]))? cpu_0_data_master_writedata[15 : 0] :
    (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_onchip_RAM_s1)? 2 :
    (cpu_0_data_master_requests_onchip_ROM_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_data_master_next_dbs_rdv_counter = cpu_0_data_master_dbs_rdv_counter + cpu_0_data_master_dbs_rdv_counter_inc;

  //cpu_0_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_data_master_dbs_rdv_counter_inc = (cpu_0_data_master_read_data_valid_onchip_RAM_s1)? 2 :
    2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_data_master_read_data_valid_onchip_RAM_s1 |
    cpu_0_data_master_read_data_valid_onchip_ROM_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_data_master_dbs_rdv_counter <= cpu_0_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_data_master_dbs_rdv_counter[1] & ~cpu_0_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_address_last_time <= 0;
      else 
        cpu_0_data_master_address_last_time <= cpu_0_data_master_address;
    end


  //cpu_0/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_data_master_waitrequest & (cpu_0_data_master_read | cpu_0_data_master_write);
    end


  //cpu_0_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_address != cpu_0_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_byteenable_last_time <= 0;
      else 
        cpu_0_data_master_byteenable_last_time <= cpu_0_data_master_byteenable;
    end


  //cpu_0_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_byteenable != cpu_0_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_last_time <= 0;
      else 
        cpu_0_data_master_read_last_time <= cpu_0_data_master_read;
    end


  //cpu_0_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_read != cpu_0_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_write_last_time <= 0;
      else 
        cpu_0_data_master_write_last_time <= cpu_0_data_master_write;
    end


  //cpu_0_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_write != cpu_0_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_writedata_last_time <= 0;
      else 
        cpu_0_data_master_writedata_last_time <= cpu_0_data_master_writedata;
    end


  //cpu_0_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_writedata != cpu_0_data_master_writedata_last_time) & cpu_0_data_master_write)
        begin
          $write("%0d ns: cpu_0_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_onchip_RAM_s1,
                                              cpu_0_instruction_master_granted_onchip_ROM_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_onchip_RAM_s1,
                                              cpu_0_instruction_master_qualified_request_onchip_ROM_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_onchip_RAM_s1,
                                              cpu_0_instruction_master_read_data_valid_onchip_ROM_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_onchip_RAM_s1,
                                              cpu_0_instruction_master_requests_onchip_ROM_s1,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_onchip_RAM_s1_end_xfer,
                                              d1_onchip_ROM_s1_end_xfer,
                                              onchip_RAM_s1_readdata_from_sa,
                                              onchip_ROM_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 13: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output           cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 13: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_onchip_RAM_s1;
  input            cpu_0_instruction_master_granted_onchip_ROM_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_onchip_RAM_s1;
  input            cpu_0_instruction_master_qualified_request_onchip_ROM_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_onchip_RAM_s1;
  input            cpu_0_instruction_master_read_data_valid_onchip_ROM_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_onchip_RAM_s1;
  input            cpu_0_instruction_master_requests_onchip_ROM_s1;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_onchip_RAM_s1_end_xfer;
  input            d1_onchip_ROM_s1_end_xfer;
  input   [ 15: 0] onchip_RAM_s1_readdata_from_sa;
  input   [ 15: 0] onchip_ROM_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 13: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 13: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_0_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg              cpu_0_instruction_master_latency_counter;
  wire    [  1: 0] cpu_0_instruction_master_next_dbs_rdv_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_0_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_onchip_RAM_s1 | ~cpu_0_instruction_master_requests_onchip_RAM_s1) & (cpu_0_instruction_master_granted_onchip_RAM_s1 | ~cpu_0_instruction_master_qualified_request_onchip_RAM_s1) & ((~cpu_0_instruction_master_qualified_request_onchip_RAM_s1 | ~cpu_0_instruction_master_read | (1 & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_onchip_ROM_s1 | ~cpu_0_instruction_master_requests_onchip_ROM_s1) & (cpu_0_instruction_master_granted_onchip_ROM_s1 | ~cpu_0_instruction_master_qualified_request_onchip_ROM_s1) & ((~cpu_0_instruction_master_qualified_request_onchip_ROM_s1 | ~cpu_0_instruction_master_read | (1 & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[13 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_onchip_RAM_s1 |
    cpu_0_instruction_master_granted_onchip_ROM_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = (cpu_0_instruction_master_read_data_valid_onchip_RAM_s1 & dbs_rdv_counter_overflow) |
    (cpu_0_instruction_master_read_data_valid_onchip_ROM_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_onchip_RAM_s1}} | {onchip_RAM_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_read_data_valid_onchip_ROM_s1}} | {onchip_ROM_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({1 {cpu_0_instruction_master_requests_onchip_RAM_s1}} & 1) |
    ({1 {cpu_0_instruction_master_requests_onchip_ROM_s1}} & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = (cpu_0_instruction_master_read_data_valid_onchip_RAM_s1)? onchip_RAM_s1_readdata_from_sa :
    onchip_ROM_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_onchip_RAM_s1)? 2 :
    (cpu_0_instruction_master_requests_onchip_ROM_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_instruction_master_next_dbs_rdv_counter = cpu_0_instruction_master_dbs_rdv_counter + cpu_0_instruction_master_dbs_rdv_counter_inc;

  //cpu_0_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_instruction_master_dbs_rdv_counter_inc = (cpu_0_instruction_master_read_data_valid_onchip_RAM_s1)? 2 :
    2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_instruction_master_read_data_valid_onchip_RAM_s1 |
    cpu_0_instruction_master_read_data_valid_onchip_ROM_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_instruction_master_dbs_rdv_counter <= cpu_0_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_instruction_master_dbs_rdv_counter[1] & ~cpu_0_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_0_instruction_master_granted_onchip_RAM_s1 & cpu_0_instruction_master_read & 1 & 1) |
    (cpu_0_instruction_master_granted_onchip_ROM_s1 & cpu_0_instruction_master_read & 1 & 1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_RAM_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_byteenable,
                                   cpu_0_data_master_dbs_address,
                                   cpu_0_data_master_dbs_write_16,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   cpu_0_instruction_master_address_to_slave,
                                   cpu_0_instruction_master_dbs_address,
                                   cpu_0_instruction_master_latency_counter,
                                   cpu_0_instruction_master_read,
                                   onchip_RAM_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_0_data_master_byteenable_onchip_RAM_s1,
                                   cpu_0_data_master_granted_onchip_RAM_s1,
                                   cpu_0_data_master_qualified_request_onchip_RAM_s1,
                                   cpu_0_data_master_read_data_valid_onchip_RAM_s1,
                                   cpu_0_data_master_requests_onchip_RAM_s1,
                                   cpu_0_instruction_master_granted_onchip_RAM_s1,
                                   cpu_0_instruction_master_qualified_request_onchip_RAM_s1,
                                   cpu_0_instruction_master_read_data_valid_onchip_RAM_s1,
                                   cpu_0_instruction_master_requests_onchip_RAM_s1,
                                   d1_onchip_RAM_s1_end_xfer,
                                   onchip_RAM_s1_address,
                                   onchip_RAM_s1_byteenable,
                                   onchip_RAM_s1_chipselect,
                                   onchip_RAM_s1_clken,
                                   onchip_RAM_s1_readdata_from_sa,
                                   onchip_RAM_s1_write,
                                   onchip_RAM_s1_writedata
                                )
;

  output  [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1;
  output           cpu_0_data_master_granted_onchip_RAM_s1;
  output           cpu_0_data_master_qualified_request_onchip_RAM_s1;
  output           cpu_0_data_master_read_data_valid_onchip_RAM_s1;
  output           cpu_0_data_master_requests_onchip_RAM_s1;
  output           cpu_0_instruction_master_granted_onchip_RAM_s1;
  output           cpu_0_instruction_master_qualified_request_onchip_RAM_s1;
  output           cpu_0_instruction_master_read_data_valid_onchip_RAM_s1;
  output           cpu_0_instruction_master_requests_onchip_RAM_s1;
  output           d1_onchip_RAM_s1_end_xfer;
  output  [  9: 0] onchip_RAM_s1_address;
  output  [  1: 0] onchip_RAM_s1_byteenable;
  output           onchip_RAM_s1_chipselect;
  output           onchip_RAM_s1_clken;
  output  [ 15: 0] onchip_RAM_s1_readdata_from_sa;
  output           onchip_RAM_s1_write;
  output  [ 15: 0] onchip_RAM_s1_writedata;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 13: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 15: 0] onchip_RAM_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_onchip_RAM_s1;
  wire             cpu_0_data_master_qualified_request_onchip_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_RAM_s1;
  reg              cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_onchip_RAM_s1;
  wire             cpu_0_data_master_saved_grant_onchip_RAM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_onchip_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_RAM_s1;
  reg              cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_onchip_RAM_s1;
  wire             cpu_0_instruction_master_saved_grant_onchip_RAM_s1;
  reg              d1_onchip_RAM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_RAM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_onchip_RAM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_onchip_RAM_s1;
  wire    [  9: 0] onchip_RAM_s1_address;
  wire             onchip_RAM_s1_allgrants;
  wire             onchip_RAM_s1_allow_new_arb_cycle;
  wire             onchip_RAM_s1_any_bursting_master_saved_grant;
  wire             onchip_RAM_s1_any_continuerequest;
  reg     [  1: 0] onchip_RAM_s1_arb_addend;
  wire             onchip_RAM_s1_arb_counter_enable;
  reg     [  1: 0] onchip_RAM_s1_arb_share_counter;
  wire    [  1: 0] onchip_RAM_s1_arb_share_counter_next_value;
  wire    [  1: 0] onchip_RAM_s1_arb_share_set_values;
  wire    [  1: 0] onchip_RAM_s1_arb_winner;
  wire             onchip_RAM_s1_arbitration_holdoff_internal;
  wire             onchip_RAM_s1_beginbursttransfer_internal;
  wire             onchip_RAM_s1_begins_xfer;
  wire    [  1: 0] onchip_RAM_s1_byteenable;
  wire             onchip_RAM_s1_chipselect;
  wire    [  3: 0] onchip_RAM_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_RAM_s1_chosen_master_rot_left;
  wire             onchip_RAM_s1_clken;
  wire             onchip_RAM_s1_end_xfer;
  wire             onchip_RAM_s1_firsttransfer;
  wire    [  1: 0] onchip_RAM_s1_grant_vector;
  wire             onchip_RAM_s1_in_a_read_cycle;
  wire             onchip_RAM_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_RAM_s1_master_qreq_vector;
  wire             onchip_RAM_s1_non_bursting_master_requests;
  wire    [ 15: 0] onchip_RAM_s1_readdata_from_sa;
  reg              onchip_RAM_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_RAM_s1_saved_chosen_master_vector;
  reg              onchip_RAM_s1_slavearbiterlockenable;
  wire             onchip_RAM_s1_slavearbiterlockenable2;
  wire             onchip_RAM_s1_unreg_firsttransfer;
  wire             onchip_RAM_s1_waits_for_read;
  wire             onchip_RAM_s1_waits_for_write;
  wire             onchip_RAM_s1_write;
  wire    [ 15: 0] onchip_RAM_s1_writedata;
  wire             p1_cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register;
  wire    [ 13: 0] shifted_address_to_onchip_RAM_s1_from_cpu_0_data_master;
  wire    [ 13: 0] shifted_address_to_onchip_RAM_s1_from_cpu_0_instruction_master;
  wire             wait_for_onchip_RAM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_RAM_s1_end_xfer;
    end


  assign onchip_RAM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_onchip_RAM_s1 | cpu_0_instruction_master_qualified_request_onchip_RAM_s1));
  //assign onchip_RAM_s1_readdata_from_sa = onchip_RAM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_RAM_s1_readdata_from_sa = onchip_RAM_s1_readdata;

  assign cpu_0_data_master_requests_onchip_RAM_s1 = ({cpu_0_data_master_address_to_slave[13 : 11] , 11'b0} == 14'h1800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //onchip_RAM_s1_arb_share_counter set values, which is an e_mux
  assign onchip_RAM_s1_arb_share_set_values = (cpu_0_data_master_granted_onchip_RAM_s1)? 2 :
    (cpu_0_instruction_master_granted_onchip_RAM_s1)? 2 :
    (cpu_0_data_master_granted_onchip_RAM_s1)? 2 :
    (cpu_0_instruction_master_granted_onchip_RAM_s1)? 2 :
    1;

  //onchip_RAM_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_RAM_s1_non_bursting_master_requests = cpu_0_data_master_requests_onchip_RAM_s1 |
    cpu_0_instruction_master_requests_onchip_RAM_s1 |
    cpu_0_data_master_requests_onchip_RAM_s1 |
    cpu_0_instruction_master_requests_onchip_RAM_s1;

  //onchip_RAM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_RAM_s1_any_bursting_master_saved_grant = 0;

  //onchip_RAM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_RAM_s1_arb_share_counter_next_value = onchip_RAM_s1_firsttransfer ? (onchip_RAM_s1_arb_share_set_values - 1) : |onchip_RAM_s1_arb_share_counter ? (onchip_RAM_s1_arb_share_counter - 1) : 0;

  //onchip_RAM_s1_allgrants all slave grants, which is an e_mux
  assign onchip_RAM_s1_allgrants = (|onchip_RAM_s1_grant_vector) |
    (|onchip_RAM_s1_grant_vector) |
    (|onchip_RAM_s1_grant_vector) |
    (|onchip_RAM_s1_grant_vector);

  //onchip_RAM_s1_end_xfer assignment, which is an e_assign
  assign onchip_RAM_s1_end_xfer = ~(onchip_RAM_s1_waits_for_read | onchip_RAM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_RAM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_RAM_s1 = onchip_RAM_s1_end_xfer & (~onchip_RAM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_RAM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_RAM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_RAM_s1 & onchip_RAM_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_RAM_s1 & ~onchip_RAM_s1_non_bursting_master_requests);

  //onchip_RAM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_RAM_s1_arb_share_counter <= 0;
      else if (onchip_RAM_s1_arb_counter_enable)
          onchip_RAM_s1_arb_share_counter <= onchip_RAM_s1_arb_share_counter_next_value;
    end


  //onchip_RAM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_RAM_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_RAM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_RAM_s1) | (end_xfer_arb_share_counter_term_onchip_RAM_s1 & ~onchip_RAM_s1_non_bursting_master_requests))
          onchip_RAM_s1_slavearbiterlockenable <= |onchip_RAM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master onchip_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = onchip_RAM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //onchip_RAM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_RAM_s1_slavearbiterlockenable2 = |onchip_RAM_s1_arb_share_counter_next_value;

  //cpu_0/data_master onchip_RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = onchip_RAM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master onchip_RAM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = onchip_RAM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master onchip_RAM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = onchip_RAM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted onchip_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_onchip_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_onchip_RAM_s1 <= cpu_0_instruction_master_saved_grant_onchip_RAM_s1 ? 1 : (onchip_RAM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_onchip_RAM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_onchip_RAM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_onchip_RAM_s1 & cpu_0_instruction_master_requests_onchip_RAM_s1;

  //onchip_RAM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_RAM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_onchip_RAM_s1 = cpu_0_data_master_requests_onchip_RAM_s1 & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter))) | ((!cpu_0_data_master_byteenable_onchip_RAM_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register_in = cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_read & ~onchip_RAM_s1_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register = {cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register, cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_onchip_RAM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_RAM_s1 = cpu_0_data_master_read_data_valid_onchip_RAM_s1_shift_register;

  //onchip_RAM_s1_writedata mux, which is an e_mux
  assign onchip_RAM_s1_writedata = cpu_0_data_master_dbs_write_16;

  //mux onchip_RAM_s1_clken, which is an e_mux
  assign onchip_RAM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_onchip_RAM_s1 = (({cpu_0_instruction_master_address_to_slave[13 : 11] , 11'b0} == 14'h1800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted onchip_RAM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_onchip_RAM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_onchip_RAM_s1 <= cpu_0_data_master_saved_grant_onchip_RAM_s1 ? 1 : (onchip_RAM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_onchip_RAM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_onchip_RAM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_onchip_RAM_s1 & cpu_0_data_master_requests_onchip_RAM_s1;

  assign cpu_0_instruction_master_qualified_request_onchip_RAM_s1 = cpu_0_instruction_master_requests_onchip_RAM_s1 & ~((cpu_0_instruction_master_read & ((1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register_in = cpu_0_instruction_master_granted_onchip_RAM_s1 & cpu_0_instruction_master_read & ~onchip_RAM_s1_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register, cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_RAM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_RAM_s1 = cpu_0_instruction_master_read_data_valid_onchip_RAM_s1_shift_register;

  //allow new arb cycle for onchip_RAM/s1, which is an e_assign
  assign onchip_RAM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for onchip_RAM/s1, which is an e_assign
  assign onchip_RAM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_onchip_RAM_s1;

  //cpu_0/instruction_master grant onchip_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_onchip_RAM_s1 = onchip_RAM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant onchip_RAM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_onchip_RAM_s1 = onchip_RAM_s1_arb_winner[0] && cpu_0_instruction_master_requests_onchip_RAM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for onchip_RAM/s1, which is an e_assign
  assign onchip_RAM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_onchip_RAM_s1;

  //cpu_0/data_master grant onchip_RAM/s1, which is an e_assign
  assign cpu_0_data_master_granted_onchip_RAM_s1 = onchip_RAM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant onchip_RAM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_onchip_RAM_s1 = onchip_RAM_s1_arb_winner[1] && cpu_0_data_master_requests_onchip_RAM_s1;

  //onchip_RAM/s1 chosen-master double-vector, which is an e_assign
  assign onchip_RAM_s1_chosen_master_double_vector = {onchip_RAM_s1_master_qreq_vector, onchip_RAM_s1_master_qreq_vector} & ({~onchip_RAM_s1_master_qreq_vector, ~onchip_RAM_s1_master_qreq_vector} + onchip_RAM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_RAM_s1_arb_winner = (onchip_RAM_s1_allow_new_arb_cycle & | onchip_RAM_s1_grant_vector) ? onchip_RAM_s1_grant_vector : onchip_RAM_s1_saved_chosen_master_vector;

  //saved onchip_RAM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_RAM_s1_saved_chosen_master_vector <= 0;
      else if (onchip_RAM_s1_allow_new_arb_cycle)
          onchip_RAM_s1_saved_chosen_master_vector <= |onchip_RAM_s1_grant_vector ? onchip_RAM_s1_grant_vector : onchip_RAM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_RAM_s1_grant_vector = {(onchip_RAM_s1_chosen_master_double_vector[1] | onchip_RAM_s1_chosen_master_double_vector[3]),
    (onchip_RAM_s1_chosen_master_double_vector[0] | onchip_RAM_s1_chosen_master_double_vector[2])};

  //onchip_RAM/s1 chosen master rotated left, which is an e_assign
  assign onchip_RAM_s1_chosen_master_rot_left = (onchip_RAM_s1_arb_winner << 1) ? (onchip_RAM_s1_arb_winner << 1) : 1;

  //onchip_RAM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_RAM_s1_arb_addend <= 1;
      else if (|onchip_RAM_s1_grant_vector)
          onchip_RAM_s1_arb_addend <= onchip_RAM_s1_end_xfer? onchip_RAM_s1_chosen_master_rot_left : onchip_RAM_s1_grant_vector;
    end


  assign onchip_RAM_s1_chipselect = cpu_0_data_master_granted_onchip_RAM_s1 | cpu_0_instruction_master_granted_onchip_RAM_s1;
  //onchip_RAM_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_RAM_s1_firsttransfer = onchip_RAM_s1_begins_xfer ? onchip_RAM_s1_unreg_firsttransfer : onchip_RAM_s1_reg_firsttransfer;

  //onchip_RAM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_RAM_s1_unreg_firsttransfer = ~(onchip_RAM_s1_slavearbiterlockenable & onchip_RAM_s1_any_continuerequest);

  //onchip_RAM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_RAM_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_RAM_s1_begins_xfer)
          onchip_RAM_s1_reg_firsttransfer <= onchip_RAM_s1_unreg_firsttransfer;
    end


  //onchip_RAM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_RAM_s1_beginbursttransfer_internal = onchip_RAM_s1_begins_xfer;

  //onchip_RAM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_RAM_s1_arbitration_holdoff_internal = onchip_RAM_s1_begins_xfer & onchip_RAM_s1_firsttransfer;

  //onchip_RAM_s1_write assignment, which is an e_mux
  assign onchip_RAM_s1_write = cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_onchip_RAM_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //onchip_RAM_s1_address mux, which is an e_mux
  assign onchip_RAM_s1_address = (cpu_0_data_master_granted_onchip_RAM_s1)? (shifted_address_to_onchip_RAM_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_onchip_RAM_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_onchip_RAM_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_onchip_RAM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_RAM_s1_end_xfer <= 1;
      else 
        d1_onchip_RAM_s1_end_xfer <= onchip_RAM_s1_end_xfer;
    end


  //onchip_RAM_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_RAM_s1_waits_for_read = onchip_RAM_s1_in_a_read_cycle & 0;

  //onchip_RAM_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_RAM_s1_in_a_read_cycle = (cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_onchip_RAM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_RAM_s1_in_a_read_cycle;

  //onchip_RAM_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_RAM_s1_waits_for_write = onchip_RAM_s1_in_a_write_cycle & 0;

  //onchip_RAM_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_RAM_s1_in_a_write_cycle = cpu_0_data_master_granted_onchip_RAM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_RAM_s1_in_a_write_cycle;

  assign wait_for_onchip_RAM_s1_counter = 0;
  //onchip_RAM_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_RAM_s1_byteenable = (cpu_0_data_master_granted_onchip_RAM_s1)? cpu_0_data_master_byteenable_onchip_RAM_s1 :
    -1;

  assign {cpu_0_data_master_byteenable_onchip_RAM_s1_segment_1,
cpu_0_data_master_byteenable_onchip_RAM_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_onchip_RAM_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_onchip_RAM_s1_segment_0 :
    cpu_0_data_master_byteenable_onchip_RAM_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_RAM/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_onchip_RAM_s1 + cpu_0_instruction_master_granted_onchip_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_onchip_RAM_s1 + cpu_0_instruction_master_saved_grant_onchip_RAM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_ROM_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_byteenable,
                                   cpu_0_data_master_dbs_address,
                                   cpu_0_data_master_dbs_write_16,
                                   cpu_0_data_master_debugaccess,
                                   cpu_0_data_master_latency_counter,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   cpu_0_instruction_master_address_to_slave,
                                   cpu_0_instruction_master_dbs_address,
                                   cpu_0_instruction_master_latency_counter,
                                   cpu_0_instruction_master_read,
                                   onchip_ROM_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_0_data_master_byteenable_onchip_ROM_s1,
                                   cpu_0_data_master_granted_onchip_ROM_s1,
                                   cpu_0_data_master_qualified_request_onchip_ROM_s1,
                                   cpu_0_data_master_read_data_valid_onchip_ROM_s1,
                                   cpu_0_data_master_requests_onchip_ROM_s1,
                                   cpu_0_instruction_master_granted_onchip_ROM_s1,
                                   cpu_0_instruction_master_qualified_request_onchip_ROM_s1,
                                   cpu_0_instruction_master_read_data_valid_onchip_ROM_s1,
                                   cpu_0_instruction_master_requests_onchip_ROM_s1,
                                   d1_onchip_ROM_s1_end_xfer,
                                   onchip_ROM_s1_address,
                                   onchip_ROM_s1_byteenable,
                                   onchip_ROM_s1_chipselect,
                                   onchip_ROM_s1_clken,
                                   onchip_ROM_s1_debugaccess,
                                   onchip_ROM_s1_readdata_from_sa,
                                   onchip_ROM_s1_write,
                                   onchip_ROM_s1_writedata
                                )
;

  output  [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1;
  output           cpu_0_data_master_granted_onchip_ROM_s1;
  output           cpu_0_data_master_qualified_request_onchip_ROM_s1;
  output           cpu_0_data_master_read_data_valid_onchip_ROM_s1;
  output           cpu_0_data_master_requests_onchip_ROM_s1;
  output           cpu_0_instruction_master_granted_onchip_ROM_s1;
  output           cpu_0_instruction_master_qualified_request_onchip_ROM_s1;
  output           cpu_0_instruction_master_read_data_valid_onchip_ROM_s1;
  output           cpu_0_instruction_master_requests_onchip_ROM_s1;
  output           d1_onchip_ROM_s1_end_xfer;
  output  [  8: 0] onchip_ROM_s1_address;
  output  [  1: 0] onchip_ROM_s1_byteenable;
  output           onchip_ROM_s1_chipselect;
  output           onchip_ROM_s1_clken;
  output           onchip_ROM_s1_debugaccess;
  output  [ 15: 0] onchip_ROM_s1_readdata_from_sa;
  output           onchip_ROM_s1_write;
  output  [ 15: 0] onchip_ROM_s1_writedata;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 13: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input   [ 15: 0] onchip_ROM_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_onchip_ROM_s1;
  wire             cpu_0_data_master_qualified_request_onchip_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_ROM_s1;
  reg              cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register_in;
  wire             cpu_0_data_master_requests_onchip_ROM_s1;
  wire             cpu_0_data_master_saved_grant_onchip_ROM_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_onchip_ROM_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_ROM_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_ROM_s1;
  reg              cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_onchip_ROM_s1;
  wire             cpu_0_instruction_master_saved_grant_onchip_ROM_s1;
  reg              d1_onchip_ROM_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_ROM_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_onchip_ROM_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_onchip_ROM_s1;
  wire    [  8: 0] onchip_ROM_s1_address;
  wire             onchip_ROM_s1_allgrants;
  wire             onchip_ROM_s1_allow_new_arb_cycle;
  wire             onchip_ROM_s1_any_bursting_master_saved_grant;
  wire             onchip_ROM_s1_any_continuerequest;
  reg     [  1: 0] onchip_ROM_s1_arb_addend;
  wire             onchip_ROM_s1_arb_counter_enable;
  reg     [  1: 0] onchip_ROM_s1_arb_share_counter;
  wire    [  1: 0] onchip_ROM_s1_arb_share_counter_next_value;
  wire    [  1: 0] onchip_ROM_s1_arb_share_set_values;
  wire    [  1: 0] onchip_ROM_s1_arb_winner;
  wire             onchip_ROM_s1_arbitration_holdoff_internal;
  wire             onchip_ROM_s1_beginbursttransfer_internal;
  wire             onchip_ROM_s1_begins_xfer;
  wire    [  1: 0] onchip_ROM_s1_byteenable;
  wire             onchip_ROM_s1_chipselect;
  wire    [  3: 0] onchip_ROM_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_ROM_s1_chosen_master_rot_left;
  wire             onchip_ROM_s1_clken;
  wire             onchip_ROM_s1_debugaccess;
  wire             onchip_ROM_s1_end_xfer;
  wire             onchip_ROM_s1_firsttransfer;
  wire    [  1: 0] onchip_ROM_s1_grant_vector;
  wire             onchip_ROM_s1_in_a_read_cycle;
  wire             onchip_ROM_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_ROM_s1_master_qreq_vector;
  wire             onchip_ROM_s1_non_bursting_master_requests;
  wire    [ 15: 0] onchip_ROM_s1_readdata_from_sa;
  reg              onchip_ROM_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_ROM_s1_saved_chosen_master_vector;
  reg              onchip_ROM_s1_slavearbiterlockenable;
  wire             onchip_ROM_s1_slavearbiterlockenable2;
  wire             onchip_ROM_s1_unreg_firsttransfer;
  wire             onchip_ROM_s1_waits_for_read;
  wire             onchip_ROM_s1_waits_for_write;
  wire             onchip_ROM_s1_write;
  wire    [ 15: 0] onchip_ROM_s1_writedata;
  wire             p1_cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register;
  wire    [ 13: 0] shifted_address_to_onchip_ROM_s1_from_cpu_0_data_master;
  wire    [ 13: 0] shifted_address_to_onchip_ROM_s1_from_cpu_0_instruction_master;
  wire             wait_for_onchip_ROM_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_ROM_s1_end_xfer;
    end


  assign onchip_ROM_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_onchip_ROM_s1 | cpu_0_instruction_master_qualified_request_onchip_ROM_s1));
  //assign onchip_ROM_s1_readdata_from_sa = onchip_ROM_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_ROM_s1_readdata_from_sa = onchip_ROM_s1_readdata;

  assign cpu_0_data_master_requests_onchip_ROM_s1 = ({cpu_0_data_master_address_to_slave[13 : 10] , 10'b0} == 14'h2400) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //onchip_ROM_s1_arb_share_counter set values, which is an e_mux
  assign onchip_ROM_s1_arb_share_set_values = (cpu_0_data_master_granted_onchip_ROM_s1)? 2 :
    (cpu_0_instruction_master_granted_onchip_ROM_s1)? 2 :
    (cpu_0_data_master_granted_onchip_ROM_s1)? 2 :
    (cpu_0_instruction_master_granted_onchip_ROM_s1)? 2 :
    1;

  //onchip_ROM_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_ROM_s1_non_bursting_master_requests = cpu_0_data_master_requests_onchip_ROM_s1 |
    cpu_0_instruction_master_requests_onchip_ROM_s1 |
    cpu_0_data_master_requests_onchip_ROM_s1 |
    cpu_0_instruction_master_requests_onchip_ROM_s1;

  //onchip_ROM_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_ROM_s1_any_bursting_master_saved_grant = 0;

  //onchip_ROM_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_ROM_s1_arb_share_counter_next_value = onchip_ROM_s1_firsttransfer ? (onchip_ROM_s1_arb_share_set_values - 1) : |onchip_ROM_s1_arb_share_counter ? (onchip_ROM_s1_arb_share_counter - 1) : 0;

  //onchip_ROM_s1_allgrants all slave grants, which is an e_mux
  assign onchip_ROM_s1_allgrants = (|onchip_ROM_s1_grant_vector) |
    (|onchip_ROM_s1_grant_vector) |
    (|onchip_ROM_s1_grant_vector) |
    (|onchip_ROM_s1_grant_vector);

  //onchip_ROM_s1_end_xfer assignment, which is an e_assign
  assign onchip_ROM_s1_end_xfer = ~(onchip_ROM_s1_waits_for_read | onchip_ROM_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_ROM_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_ROM_s1 = onchip_ROM_s1_end_xfer & (~onchip_ROM_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_ROM_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_ROM_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_ROM_s1 & onchip_ROM_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_ROM_s1 & ~onchip_ROM_s1_non_bursting_master_requests);

  //onchip_ROM_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ROM_s1_arb_share_counter <= 0;
      else if (onchip_ROM_s1_arb_counter_enable)
          onchip_ROM_s1_arb_share_counter <= onchip_ROM_s1_arb_share_counter_next_value;
    end


  //onchip_ROM_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ROM_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_ROM_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_ROM_s1) | (end_xfer_arb_share_counter_term_onchip_ROM_s1 & ~onchip_ROM_s1_non_bursting_master_requests))
          onchip_ROM_s1_slavearbiterlockenable <= |onchip_ROM_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master onchip_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = onchip_ROM_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //onchip_ROM_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_ROM_s1_slavearbiterlockenable2 = |onchip_ROM_s1_arb_share_counter_next_value;

  //cpu_0/data_master onchip_ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = onchip_ROM_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master onchip_ROM/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = onchip_ROM_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master onchip_ROM/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = onchip_ROM_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted onchip_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_onchip_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_onchip_ROM_s1 <= cpu_0_instruction_master_saved_grant_onchip_ROM_s1 ? 1 : (onchip_ROM_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_onchip_ROM_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_onchip_ROM_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_onchip_ROM_s1 & cpu_0_instruction_master_requests_onchip_ROM_s1;

  //onchip_ROM_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_ROM_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_onchip_ROM_s1 = cpu_0_data_master_requests_onchip_ROM_s1 & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter))) | ((!cpu_0_data_master_byteenable_onchip_ROM_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register_in = cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_read & ~onchip_ROM_s1_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register = {cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register, cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_onchip_ROM_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_ROM_s1 = cpu_0_data_master_read_data_valid_onchip_ROM_s1_shift_register;

  //onchip_ROM_s1_writedata mux, which is an e_mux
  assign onchip_ROM_s1_writedata = cpu_0_data_master_dbs_write_16;

  //mux onchip_ROM_s1_clken, which is an e_mux
  assign onchip_ROM_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_onchip_ROM_s1 = (({cpu_0_instruction_master_address_to_slave[13 : 10] , 10'b0} == 14'h2400) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted onchip_ROM/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_onchip_ROM_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_onchip_ROM_s1 <= cpu_0_data_master_saved_grant_onchip_ROM_s1 ? 1 : (onchip_ROM_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_onchip_ROM_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_onchip_ROM_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_onchip_ROM_s1 & cpu_0_data_master_requests_onchip_ROM_s1;

  assign cpu_0_instruction_master_qualified_request_onchip_ROM_s1 = cpu_0_instruction_master_requests_onchip_ROM_s1 & ~((cpu_0_instruction_master_read & ((1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register_in = cpu_0_instruction_master_granted_onchip_ROM_s1 & cpu_0_instruction_master_read & ~onchip_ROM_s1_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register = {cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register, cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_ROM_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_ROM_s1 = cpu_0_instruction_master_read_data_valid_onchip_ROM_s1_shift_register;

  //allow new arb cycle for onchip_ROM/s1, which is an e_assign
  assign onchip_ROM_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for onchip_ROM/s1, which is an e_assign
  assign onchip_ROM_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_onchip_ROM_s1;

  //cpu_0/instruction_master grant onchip_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_onchip_ROM_s1 = onchip_ROM_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant onchip_ROM/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_onchip_ROM_s1 = onchip_ROM_s1_arb_winner[0] && cpu_0_instruction_master_requests_onchip_ROM_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for onchip_ROM/s1, which is an e_assign
  assign onchip_ROM_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_onchip_ROM_s1;

  //cpu_0/data_master grant onchip_ROM/s1, which is an e_assign
  assign cpu_0_data_master_granted_onchip_ROM_s1 = onchip_ROM_s1_grant_vector[1];

  //cpu_0/data_master saved-grant onchip_ROM/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_onchip_ROM_s1 = onchip_ROM_s1_arb_winner[1] && cpu_0_data_master_requests_onchip_ROM_s1;

  //onchip_ROM/s1 chosen-master double-vector, which is an e_assign
  assign onchip_ROM_s1_chosen_master_double_vector = {onchip_ROM_s1_master_qreq_vector, onchip_ROM_s1_master_qreq_vector} & ({~onchip_ROM_s1_master_qreq_vector, ~onchip_ROM_s1_master_qreq_vector} + onchip_ROM_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_ROM_s1_arb_winner = (onchip_ROM_s1_allow_new_arb_cycle & | onchip_ROM_s1_grant_vector) ? onchip_ROM_s1_grant_vector : onchip_ROM_s1_saved_chosen_master_vector;

  //saved onchip_ROM_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ROM_s1_saved_chosen_master_vector <= 0;
      else if (onchip_ROM_s1_allow_new_arb_cycle)
          onchip_ROM_s1_saved_chosen_master_vector <= |onchip_ROM_s1_grant_vector ? onchip_ROM_s1_grant_vector : onchip_ROM_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_ROM_s1_grant_vector = {(onchip_ROM_s1_chosen_master_double_vector[1] | onchip_ROM_s1_chosen_master_double_vector[3]),
    (onchip_ROM_s1_chosen_master_double_vector[0] | onchip_ROM_s1_chosen_master_double_vector[2])};

  //onchip_ROM/s1 chosen master rotated left, which is an e_assign
  assign onchip_ROM_s1_chosen_master_rot_left = (onchip_ROM_s1_arb_winner << 1) ? (onchip_ROM_s1_arb_winner << 1) : 1;

  //onchip_ROM/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ROM_s1_arb_addend <= 1;
      else if (|onchip_ROM_s1_grant_vector)
          onchip_ROM_s1_arb_addend <= onchip_ROM_s1_end_xfer? onchip_ROM_s1_chosen_master_rot_left : onchip_ROM_s1_grant_vector;
    end


  assign onchip_ROM_s1_chipselect = cpu_0_data_master_granted_onchip_ROM_s1 | cpu_0_instruction_master_granted_onchip_ROM_s1;
  //onchip_ROM_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_ROM_s1_firsttransfer = onchip_ROM_s1_begins_xfer ? onchip_ROM_s1_unreg_firsttransfer : onchip_ROM_s1_reg_firsttransfer;

  //onchip_ROM_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_ROM_s1_unreg_firsttransfer = ~(onchip_ROM_s1_slavearbiterlockenable & onchip_ROM_s1_any_continuerequest);

  //onchip_ROM_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ROM_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_ROM_s1_begins_xfer)
          onchip_ROM_s1_reg_firsttransfer <= onchip_ROM_s1_unreg_firsttransfer;
    end


  //onchip_ROM_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_ROM_s1_beginbursttransfer_internal = onchip_ROM_s1_begins_xfer;

  //onchip_ROM_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_ROM_s1_arbitration_holdoff_internal = onchip_ROM_s1_begins_xfer & onchip_ROM_s1_firsttransfer;

  //onchip_ROM_s1_write assignment, which is an e_mux
  assign onchip_ROM_s1_write = cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_write;

  assign shifted_address_to_onchip_ROM_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //onchip_ROM_s1_address mux, which is an e_mux
  assign onchip_ROM_s1_address = (cpu_0_data_master_granted_onchip_ROM_s1)? (shifted_address_to_onchip_ROM_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_onchip_ROM_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_onchip_ROM_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_onchip_ROM_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_ROM_s1_end_xfer <= 1;
      else 
        d1_onchip_ROM_s1_end_xfer <= onchip_ROM_s1_end_xfer;
    end


  //onchip_ROM_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_ROM_s1_waits_for_read = onchip_ROM_s1_in_a_read_cycle & 0;

  //onchip_ROM_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_ROM_s1_in_a_read_cycle = (cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_onchip_ROM_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_ROM_s1_in_a_read_cycle;

  //onchip_ROM_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_ROM_s1_waits_for_write = onchip_ROM_s1_in_a_write_cycle & 0;

  //onchip_ROM_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_ROM_s1_in_a_write_cycle = cpu_0_data_master_granted_onchip_ROM_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_ROM_s1_in_a_write_cycle;

  assign wait_for_onchip_ROM_s1_counter = 0;
  //onchip_ROM_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_ROM_s1_byteenable = (cpu_0_data_master_granted_onchip_ROM_s1)? cpu_0_data_master_byteenable_onchip_ROM_s1 :
    -1;

  assign {cpu_0_data_master_byteenable_onchip_ROM_s1_segment_1,
cpu_0_data_master_byteenable_onchip_ROM_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_onchip_ROM_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_onchip_ROM_s1_segment_0 :
    cpu_0_data_master_byteenable_onchip_ROM_s1_segment_1;

  //debugaccess mux, which is an e_mux
  assign onchip_ROM_s1_debugaccess = (cpu_0_data_master_granted_onchip_ROM_s1)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_ROM/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_onchip_ROM_s1 + cpu_0_instruction_master_granted_onchip_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_onchip_ROM_s1 + cpu_0_instruction_master_saved_grant_onchip_ROM_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_0_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_0_data_master_address_to_slave,
                              cpu_0_data_master_byteenable,
                              cpu_0_data_master_latency_counter,
                              cpu_0_data_master_read,
                              cpu_0_data_master_write,
                              cpu_0_data_master_writedata,
                              pio_0_s1_readdata,
                              reset_n,

                             // outputs:
                              cpu_0_data_master_granted_pio_0_s1,
                              cpu_0_data_master_qualified_request_pio_0_s1,
                              cpu_0_data_master_read_data_valid_pio_0_s1,
                              cpu_0_data_master_requests_pio_0_s1,
                              d1_pio_0_s1_end_xfer,
                              pio_0_s1_address,
                              pio_0_s1_chipselect,
                              pio_0_s1_readdata_from_sa,
                              pio_0_s1_reset_n,
                              pio_0_s1_write_n,
                              pio_0_s1_writedata
                           )
;

  output           cpu_0_data_master_granted_pio_0_s1;
  output           cpu_0_data_master_qualified_request_pio_0_s1;
  output           cpu_0_data_master_read_data_valid_pio_0_s1;
  output           cpu_0_data_master_requests_pio_0_s1;
  output           d1_pio_0_s1_end_xfer;
  output  [  1: 0] pio_0_s1_address;
  output           pio_0_s1_chipselect;
  output  [  7: 0] pio_0_s1_readdata_from_sa;
  output           pio_0_s1_reset_n;
  output           pio_0_s1_write_n;
  output  [  7: 0] pio_0_s1_writedata;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  7: 0] pio_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_0_s1;
  wire             cpu_0_data_master_qualified_request_pio_0_s1;
  wire             cpu_0_data_master_read_data_valid_pio_0_s1;
  wire             cpu_0_data_master_requests_pio_0_s1;
  wire             cpu_0_data_master_saved_grant_pio_0_s1;
  reg              d1_pio_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_allgrants;
  wire             pio_0_s1_allow_new_arb_cycle;
  wire             pio_0_s1_any_bursting_master_saved_grant;
  wire             pio_0_s1_any_continuerequest;
  wire             pio_0_s1_arb_counter_enable;
  reg     [  1: 0] pio_0_s1_arb_share_counter;
  wire    [  1: 0] pio_0_s1_arb_share_counter_next_value;
  wire    [  1: 0] pio_0_s1_arb_share_set_values;
  wire             pio_0_s1_beginbursttransfer_internal;
  wire             pio_0_s1_begins_xfer;
  wire             pio_0_s1_chipselect;
  wire             pio_0_s1_end_xfer;
  wire             pio_0_s1_firsttransfer;
  wire             pio_0_s1_grant_vector;
  wire             pio_0_s1_in_a_read_cycle;
  wire             pio_0_s1_in_a_write_cycle;
  wire             pio_0_s1_master_qreq_vector;
  wire             pio_0_s1_non_bursting_master_requests;
  wire             pio_0_s1_pretend_byte_enable;
  wire    [  7: 0] pio_0_s1_readdata_from_sa;
  reg              pio_0_s1_reg_firsttransfer;
  wire             pio_0_s1_reset_n;
  reg              pio_0_s1_slavearbiterlockenable;
  wire             pio_0_s1_slavearbiterlockenable2;
  wire             pio_0_s1_unreg_firsttransfer;
  wire             pio_0_s1_waits_for_read;
  wire             pio_0_s1_waits_for_write;
  wire             pio_0_s1_write_n;
  wire    [  7: 0] pio_0_s1_writedata;
  wire    [ 13: 0] shifted_address_to_pio_0_s1_from_cpu_0_data_master;
  wire             wait_for_pio_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_0_s1_end_xfer;
    end


  assign pio_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_0_s1));
  //assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata;

  assign cpu_0_data_master_requests_pio_0_s1 = ({cpu_0_data_master_address_to_slave[13 : 4] , 4'b0} == 14'h2800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_0_s1_arb_share_counter set values, which is an e_mux
  assign pio_0_s1_arb_share_set_values = 1;

  //pio_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_0_s1;

  //pio_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_0_s1_any_bursting_master_saved_grant = 0;

  //pio_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_0_s1_arb_share_counter_next_value = pio_0_s1_firsttransfer ? (pio_0_s1_arb_share_set_values - 1) : |pio_0_s1_arb_share_counter ? (pio_0_s1_arb_share_counter - 1) : 0;

  //pio_0_s1_allgrants all slave grants, which is an e_mux
  assign pio_0_s1_allgrants = |pio_0_s1_grant_vector;

  //pio_0_s1_end_xfer assignment, which is an e_assign
  assign pio_0_s1_end_xfer = ~(pio_0_s1_waits_for_read | pio_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_0_s1 = pio_0_s1_end_xfer & (~pio_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_0_s1 & pio_0_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests);

  //pio_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_arb_share_counter <= 0;
      else if (pio_0_s1_arb_counter_enable)
          pio_0_s1_arb_share_counter <= pio_0_s1_arb_share_counter_next_value;
    end


  //pio_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_slavearbiterlockenable <= 0;
      else if ((|pio_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_0_s1) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests))
          pio_0_s1_slavearbiterlockenable <= |pio_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_0_s1_slavearbiterlockenable2 = |pio_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_0_s1 = cpu_0_data_master_requests_pio_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_pio_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pio_0_s1 = cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_read & ~pio_0_s1_waits_for_read;

  //pio_0_s1_writedata mux, which is an e_mux
  assign pio_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_0_s1 = cpu_0_data_master_qualified_request_pio_0_s1;

  //cpu_0/data_master saved-grant pio_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_0_s1 = cpu_0_data_master_requests_pio_0_s1;

  //allow new arb cycle for pio_0/s1, which is an e_assign
  assign pio_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_0_s1_master_qreq_vector = 1;

  //pio_0_s1_reset_n assignment, which is an e_assign
  assign pio_0_s1_reset_n = reset_n;

  assign pio_0_s1_chipselect = cpu_0_data_master_granted_pio_0_s1;
  //pio_0_s1_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_firsttransfer = pio_0_s1_begins_xfer ? pio_0_s1_unreg_firsttransfer : pio_0_s1_reg_firsttransfer;

  //pio_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_unreg_firsttransfer = ~(pio_0_s1_slavearbiterlockenable & pio_0_s1_any_continuerequest);

  //pio_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_reg_firsttransfer <= 1'b1;
      else if (pio_0_s1_begins_xfer)
          pio_0_s1_reg_firsttransfer <= pio_0_s1_unreg_firsttransfer;
    end


  //pio_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_0_s1_beginbursttransfer_internal = pio_0_s1_begins_xfer;

  //~pio_0_s1_write_n assignment, which is an e_mux
  assign pio_0_s1_write_n = ~(((cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_write)) & pio_0_s1_pretend_byte_enable);

  assign shifted_address_to_pio_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_0_s1_address mux, which is an e_mux
  assign pio_0_s1_address = shifted_address_to_pio_0_s1_from_cpu_0_data_master >> 2;

  //d1_pio_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_0_s1_end_xfer <= 1;
      else 
        d1_pio_0_s1_end_xfer <= pio_0_s1_end_xfer;
    end


  //pio_0_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_read = pio_0_s1_in_a_read_cycle & pio_0_s1_begins_xfer;

  //pio_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_0_s1_in_a_read_cycle;

  //pio_0_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_write = pio_0_s1_in_a_write_cycle & 0;

  //pio_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_0_s1_in_a_write_cycle;

  assign wait_for_pio_0_s1_counter = 0;
  //pio_0_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign pio_0_s1_pretend_byte_enable = (cpu_0_data_master_granted_pio_0_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input   [ 13: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 13: 0] shifted_address_to_sysid_control_slave_from_cpu_0_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[13 : 3] , 3'b0} == 14'h2820) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sysid_control_slave = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_0_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module hello_reset_clk_0_domain_synch_module (
                                               // inputs:
                                                clk,
                                                data_in,
                                                reset_n,

                                               // outputs:
                                                data_out
                                             )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module hello (
               // 1) global signals:
                clk_0,
                reset_n,

               // the_pio_0
                out_port_from_the_pio_0
             )
;

  output  [  7: 0] out_port_from_the_pio_0;
  input            clk_0;
  input            reset_n;

  wire             clk_0_reset_n;
  wire    [ 13: 0] cpu_0_data_master_address;
  wire    [ 13: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_RAM_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_onchip_ROM_s1;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_onchip_RAM_s1;
  wire             cpu_0_data_master_granted_onchip_ROM_s1;
  wire             cpu_0_data_master_granted_pio_0_s1;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_latency_counter;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_onchip_RAM_s1;
  wire             cpu_0_data_master_qualified_request_onchip_ROM_s1;
  wire             cpu_0_data_master_qualified_request_pio_0_s1;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_onchip_RAM_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_ROM_s1;
  wire             cpu_0_data_master_read_data_valid_pio_0_s1;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_onchip_RAM_s1;
  wire             cpu_0_data_master_requests_onchip_ROM_s1;
  wire             cpu_0_data_master_requests_pio_0_s1;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 13: 0] cpu_0_instruction_master_address;
  wire    [ 13: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_onchip_RAM_s1;
  wire             cpu_0_instruction_master_granted_onchip_ROM_s1;
  wire             cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_onchip_RAM_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_ROM_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_onchip_RAM_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_ROM_s1;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_onchip_RAM_s1;
  wire             cpu_0_instruction_master_requests_onchip_ROM_s1;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_onchip_RAM_s1_end_xfer;
  wire             d1_onchip_ROM_s1_end_xfer;
  wire             d1_pio_0_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire    [  9: 0] onchip_RAM_s1_address;
  wire    [  1: 0] onchip_RAM_s1_byteenable;
  wire             onchip_RAM_s1_chipselect;
  wire             onchip_RAM_s1_clken;
  wire    [ 15: 0] onchip_RAM_s1_readdata;
  wire    [ 15: 0] onchip_RAM_s1_readdata_from_sa;
  wire             onchip_RAM_s1_write;
  wire    [ 15: 0] onchip_RAM_s1_writedata;
  wire    [  8: 0] onchip_ROM_s1_address;
  wire    [  1: 0] onchip_ROM_s1_byteenable;
  wire             onchip_ROM_s1_chipselect;
  wire             onchip_ROM_s1_clken;
  wire             onchip_ROM_s1_debugaccess;
  wire    [ 15: 0] onchip_ROM_s1_readdata;
  wire    [ 15: 0] onchip_ROM_s1_readdata_from_sa;
  wire             onchip_ROM_s1_write;
  wire    [ 15: 0] onchip_ROM_s1_writedata;
  wire    [  7: 0] out_port_from_the_pio_0;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_chipselect;
  wire    [  7: 0] pio_0_s1_readdata;
  wire    [  7: 0] pio_0_s1_readdata_from_sa;
  wire             pio_0_s1_reset_n;
  wire             pio_0_s1_write_n;
  wire    [  7: 0] pio_0_s1_writedata;
  wire             reset_n_sources;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset                                      (cpu_0_jtag_debug_module_reset),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address                                   (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_onchip_RAM_s1                  (cpu_0_data_master_byteenable_onchip_RAM_s1),
      .cpu_0_data_master_byteenable_onchip_ROM_s1                  (cpu_0_data_master_byteenable_onchip_ROM_s1),
      .cpu_0_data_master_dbs_address                               (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                              (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module           (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_onchip_RAM_s1                     (cpu_0_data_master_granted_onchip_RAM_s1),
      .cpu_0_data_master_granted_onchip_ROM_s1                     (cpu_0_data_master_granted_onchip_ROM_s1),
      .cpu_0_data_master_granted_pio_0_s1                          (cpu_0_data_master_granted_pio_0_s1),
      .cpu_0_data_master_granted_sysid_control_slave               (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_onchip_RAM_s1           (cpu_0_data_master_qualified_request_onchip_RAM_s1),
      .cpu_0_data_master_qualified_request_onchip_ROM_s1           (cpu_0_data_master_qualified_request_onchip_ROM_s1),
      .cpu_0_data_master_qualified_request_pio_0_s1                (cpu_0_data_master_qualified_request_pio_0_s1),
      .cpu_0_data_master_qualified_request_sysid_control_slave     (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_onchip_RAM_s1             (cpu_0_data_master_read_data_valid_onchip_RAM_s1),
      .cpu_0_data_master_read_data_valid_onchip_ROM_s1             (cpu_0_data_master_read_data_valid_onchip_ROM_s1),
      .cpu_0_data_master_read_data_valid_pio_0_s1                  (cpu_0_data_master_read_data_valid_pio_0_s1),
      .cpu_0_data_master_read_data_valid_sysid_control_slave       (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_readdata                                  (cpu_0_data_master_readdata),
      .cpu_0_data_master_readdatavalid                             (cpu_0_data_master_readdatavalid),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module          (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_onchip_RAM_s1                    (cpu_0_data_master_requests_onchip_RAM_s1),
      .cpu_0_data_master_requests_onchip_ROM_s1                    (cpu_0_data_master_requests_onchip_ROM_s1),
      .cpu_0_data_master_requests_pio_0_s1                         (cpu_0_data_master_requests_pio_0_s1),
      .cpu_0_data_master_requests_sysid_control_slave              (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_waitrequest                               (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                    (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                         (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_onchip_RAM_s1_end_xfer                                   (d1_onchip_RAM_s1_end_xfer),
      .d1_onchip_ROM_s1_end_xfer                                   (d1_onchip_ROM_s1_end_xfer),
      .d1_pio_0_s1_end_xfer                                        (d1_pio_0_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                             (d1_sysid_control_slave_end_xfer),
      .onchip_RAM_s1_readdata_from_sa                              (onchip_RAM_s1_readdata_from_sa),
      .onchip_ROM_s1_readdata_from_sa                              (onchip_ROM_s1_readdata_from_sa),
      .pio_0_s1_readdata_from_sa                                   (pio_0_s1_readdata_from_sa),
      .reset_n                                                     (clk_0_reset_n),
      .sysid_control_slave_readdata_from_sa                        (sysid_control_slave_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                (clk_0),
      .cpu_0_instruction_master_address                                   (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_onchip_RAM_s1                     (cpu_0_instruction_master_granted_onchip_RAM_s1),
      .cpu_0_instruction_master_granted_onchip_ROM_s1                     (cpu_0_instruction_master_granted_onchip_ROM_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_onchip_RAM_s1           (cpu_0_instruction_master_qualified_request_onchip_RAM_s1),
      .cpu_0_instruction_master_qualified_request_onchip_ROM_s1           (cpu_0_instruction_master_qualified_request_onchip_ROM_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_onchip_RAM_s1             (cpu_0_instruction_master_read_data_valid_onchip_RAM_s1),
      .cpu_0_instruction_master_read_data_valid_onchip_ROM_s1             (cpu_0_instruction_master_read_data_valid_onchip_ROM_s1),
      .cpu_0_instruction_master_readdata                                  (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                             (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_onchip_RAM_s1                    (cpu_0_instruction_master_requests_onchip_RAM_s1),
      .cpu_0_instruction_master_requests_onchip_ROM_s1                    (cpu_0_instruction_master_requests_onchip_ROM_s1),
      .cpu_0_instruction_master_waitrequest                               (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_onchip_RAM_s1_end_xfer                                          (d1_onchip_RAM_s1_end_xfer),
      .d1_onchip_ROM_s1_end_xfer                                          (d1_onchip_ROM_s1_end_xfer),
      .onchip_RAM_s1_readdata_from_sa                                     (onchip_RAM_s1_readdata_from_sa),
      .onchip_ROM_s1_readdata_from_sa                                     (onchip_ROM_s1_readdata_from_sa),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_readdatavalid                       (cpu_0_data_master_readdatavalid),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (clk_0),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_0_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  onchip_RAM_s1_arbitrator the_onchip_RAM_s1
    (
      .clk                                                      (clk_0),
      .cpu_0_data_master_address_to_slave                       (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                             (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_onchip_RAM_s1               (cpu_0_data_master_byteenable_onchip_RAM_s1),
      .cpu_0_data_master_dbs_address                            (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                           (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_onchip_RAM_s1                  (cpu_0_data_master_granted_onchip_RAM_s1),
      .cpu_0_data_master_latency_counter                        (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_onchip_RAM_s1        (cpu_0_data_master_qualified_request_onchip_RAM_s1),
      .cpu_0_data_master_read                                   (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_RAM_s1          (cpu_0_data_master_read_data_valid_onchip_RAM_s1),
      .cpu_0_data_master_requests_onchip_RAM_s1                 (cpu_0_data_master_requests_onchip_RAM_s1),
      .cpu_0_data_master_write                                  (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                     (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_onchip_RAM_s1           (cpu_0_instruction_master_granted_onchip_RAM_s1),
      .cpu_0_instruction_master_latency_counter                 (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_onchip_RAM_s1 (cpu_0_instruction_master_qualified_request_onchip_RAM_s1),
      .cpu_0_instruction_master_read                            (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_RAM_s1   (cpu_0_instruction_master_read_data_valid_onchip_RAM_s1),
      .cpu_0_instruction_master_requests_onchip_RAM_s1          (cpu_0_instruction_master_requests_onchip_RAM_s1),
      .d1_onchip_RAM_s1_end_xfer                                (d1_onchip_RAM_s1_end_xfer),
      .onchip_RAM_s1_address                                    (onchip_RAM_s1_address),
      .onchip_RAM_s1_byteenable                                 (onchip_RAM_s1_byteenable),
      .onchip_RAM_s1_chipselect                                 (onchip_RAM_s1_chipselect),
      .onchip_RAM_s1_clken                                      (onchip_RAM_s1_clken),
      .onchip_RAM_s1_readdata                                   (onchip_RAM_s1_readdata),
      .onchip_RAM_s1_readdata_from_sa                           (onchip_RAM_s1_readdata_from_sa),
      .onchip_RAM_s1_write                                      (onchip_RAM_s1_write),
      .onchip_RAM_s1_writedata                                  (onchip_RAM_s1_writedata),
      .reset_n                                                  (clk_0_reset_n)
    );

  onchip_RAM the_onchip_RAM
    (
      .address    (onchip_RAM_s1_address),
      .byteenable (onchip_RAM_s1_byteenable),
      .chipselect (onchip_RAM_s1_chipselect),
      .clk        (clk_0),
      .clken      (onchip_RAM_s1_clken),
      .readdata   (onchip_RAM_s1_readdata),
      .write      (onchip_RAM_s1_write),
      .writedata  (onchip_RAM_s1_writedata)
    );

  onchip_ROM_s1_arbitrator the_onchip_ROM_s1
    (
      .clk                                                      (clk_0),
      .cpu_0_data_master_address_to_slave                       (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                             (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_onchip_ROM_s1               (cpu_0_data_master_byteenable_onchip_ROM_s1),
      .cpu_0_data_master_dbs_address                            (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                           (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_debugaccess                            (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_onchip_ROM_s1                  (cpu_0_data_master_granted_onchip_ROM_s1),
      .cpu_0_data_master_latency_counter                        (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_onchip_ROM_s1        (cpu_0_data_master_qualified_request_onchip_ROM_s1),
      .cpu_0_data_master_read                                   (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_ROM_s1          (cpu_0_data_master_read_data_valid_onchip_ROM_s1),
      .cpu_0_data_master_requests_onchip_ROM_s1                 (cpu_0_data_master_requests_onchip_ROM_s1),
      .cpu_0_data_master_write                                  (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                     (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_onchip_ROM_s1           (cpu_0_instruction_master_granted_onchip_ROM_s1),
      .cpu_0_instruction_master_latency_counter                 (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_onchip_ROM_s1 (cpu_0_instruction_master_qualified_request_onchip_ROM_s1),
      .cpu_0_instruction_master_read                            (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_ROM_s1   (cpu_0_instruction_master_read_data_valid_onchip_ROM_s1),
      .cpu_0_instruction_master_requests_onchip_ROM_s1          (cpu_0_instruction_master_requests_onchip_ROM_s1),
      .d1_onchip_ROM_s1_end_xfer                                (d1_onchip_ROM_s1_end_xfer),
      .onchip_ROM_s1_address                                    (onchip_ROM_s1_address),
      .onchip_ROM_s1_byteenable                                 (onchip_ROM_s1_byteenable),
      .onchip_ROM_s1_chipselect                                 (onchip_ROM_s1_chipselect),
      .onchip_ROM_s1_clken                                      (onchip_ROM_s1_clken),
      .onchip_ROM_s1_debugaccess                                (onchip_ROM_s1_debugaccess),
      .onchip_ROM_s1_readdata                                   (onchip_ROM_s1_readdata),
      .onchip_ROM_s1_readdata_from_sa                           (onchip_ROM_s1_readdata_from_sa),
      .onchip_ROM_s1_write                                      (onchip_ROM_s1_write),
      .onchip_ROM_s1_writedata                                  (onchip_ROM_s1_writedata),
      .reset_n                                                  (clk_0_reset_n)
    );

  onchip_ROM the_onchip_ROM
    (
      .address     (onchip_ROM_s1_address),
      .byteenable  (onchip_ROM_s1_byteenable),
      .chipselect  (onchip_ROM_s1_chipselect),
      .clk         (clk_0),
      .clken       (onchip_ROM_s1_clken),
      .debugaccess (onchip_ROM_s1_debugaccess),
      .readdata    (onchip_ROM_s1_readdata),
      .write       (onchip_ROM_s1_write),
      .writedata   (onchip_ROM_s1_writedata)
    );

  pio_0_s1_arbitrator the_pio_0_s1
    (
      .clk                                          (clk_0),
      .cpu_0_data_master_address_to_slave           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                 (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_pio_0_s1           (cpu_0_data_master_granted_pio_0_s1),
      .cpu_0_data_master_latency_counter            (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pio_0_s1 (cpu_0_data_master_qualified_request_pio_0_s1),
      .cpu_0_data_master_read                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_0_s1   (cpu_0_data_master_read_data_valid_pio_0_s1),
      .cpu_0_data_master_requests_pio_0_s1          (cpu_0_data_master_requests_pio_0_s1),
      .cpu_0_data_master_write                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                  (cpu_0_data_master_writedata),
      .d1_pio_0_s1_end_xfer                         (d1_pio_0_s1_end_xfer),
      .pio_0_s1_address                             (pio_0_s1_address),
      .pio_0_s1_chipselect                          (pio_0_s1_chipselect),
      .pio_0_s1_readdata                            (pio_0_s1_readdata),
      .pio_0_s1_readdata_from_sa                    (pio_0_s1_readdata_from_sa),
      .pio_0_s1_reset_n                             (pio_0_s1_reset_n),
      .pio_0_s1_write_n                             (pio_0_s1_write_n),
      .pio_0_s1_writedata                           (pio_0_s1_writedata),
      .reset_n                                      (clk_0_reset_n)
    );

  pio_0 the_pio_0
    (
      .address    (pio_0_s1_address),
      .chipselect (pio_0_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_0),
      .readdata   (pio_0_s1_readdata),
      .reset_n    (pio_0_s1_reset_n),
      .write_n    (pio_0_s1_write_n),
      .writedata  (pio_0_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave           (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sysid_control_slave (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sysid_control_slave   (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave          (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                         (d1_sysid_control_slave_end_xfer),
      .reset_n                                                 (clk_0_reset_n),
      .sysid_control_slave_address                             (sysid_control_slave_address),
      .sysid_control_slave_readdata                            (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                    (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  hello_reset_clk_0_domain_synch_module hello_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa);

  //cpu_0_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_0_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/quartus/eda/sim_lib/220model.v"
`include "d:/altera/quartus/eda/sim_lib/sgate.v"
`include "sysid.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "onchip_ROM.v"
`include "pio_0.v"
`include "onchip_RAM.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire    [  7: 0] out_port_from_the_pio_0;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  hello DUT
    (
      .clk_0                   (clk_0),
      .out_port_from_the_pio_0 (out_port_from_the_pio_0),
      .reset_n                 (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on