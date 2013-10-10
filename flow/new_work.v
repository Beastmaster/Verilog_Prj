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

module altpll_0_pll_slave_arbitrator (
                                       // inputs:
                                        altpll_0_pll_slave_readdata,
                                        clk,
                                        cpu_0_data_master_address_to_slave,
                                        cpu_0_data_master_latency_counter,
                                        cpu_0_data_master_read,
                                        cpu_0_data_master_write,
                                        cpu_0_data_master_writedata,
                                        new_work_burst_1_downstream_address_to_slave,
                                        new_work_burst_1_downstream_arbitrationshare,
                                        new_work_burst_1_downstream_burstcount,
                                        new_work_burst_1_downstream_latency_counter,
                                        new_work_burst_1_downstream_read,
                                        new_work_burst_1_downstream_write,
                                        new_work_burst_1_downstream_writedata,
                                        reset_n,

                                       // outputs:
                                        altpll_0_pll_slave_address,
                                        altpll_0_pll_slave_read,
                                        altpll_0_pll_slave_readdata_from_sa,
                                        altpll_0_pll_slave_reset,
                                        altpll_0_pll_slave_write,
                                        altpll_0_pll_slave_writedata,
                                        cpu_0_data_master_granted_altpll_0_pll_slave,
                                        cpu_0_data_master_qualified_request_altpll_0_pll_slave,
                                        cpu_0_data_master_read_data_valid_altpll_0_pll_slave,
                                        cpu_0_data_master_requests_altpll_0_pll_slave,
                                        d1_altpll_0_pll_slave_end_xfer,
                                        new_work_burst_1_downstream_granted_altpll_0_pll_slave,
                                        new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave,
                                        new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave,
                                        new_work_burst_1_downstream_requests_altpll_0_pll_slave
                                     )
;

  output           altpll_0_pll_slave_address;
  output           altpll_0_pll_slave_read;
  output  [ 31: 0] altpll_0_pll_slave_readdata_from_sa;
  output           altpll_0_pll_slave_reset;
  output           altpll_0_pll_slave_write;
  output  [ 31: 0] altpll_0_pll_slave_writedata;
  output           cpu_0_data_master_granted_altpll_0_pll_slave;
  output           cpu_0_data_master_qualified_request_altpll_0_pll_slave;
  output           cpu_0_data_master_read_data_valid_altpll_0_pll_slave;
  output           cpu_0_data_master_requests_altpll_0_pll_slave;
  output           d1_altpll_0_pll_slave_end_xfer;
  output           new_work_burst_1_downstream_granted_altpll_0_pll_slave;
  output           new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave;
  output           new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave;
  output           new_work_burst_1_downstream_requests_altpll_0_pll_slave;
  input   [ 31: 0] altpll_0_pll_slave_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  2: 0] new_work_burst_1_downstream_address_to_slave;
  input   [  3: 0] new_work_burst_1_downstream_arbitrationshare;
  input            new_work_burst_1_downstream_burstcount;
  input            new_work_burst_1_downstream_latency_counter;
  input            new_work_burst_1_downstream_read;
  input            new_work_burst_1_downstream_write;
  input   [ 31: 0] new_work_burst_1_downstream_writedata;
  input            reset_n;

  wire             altpll_0_pll_slave_address;
  wire             altpll_0_pll_slave_allgrants;
  wire             altpll_0_pll_slave_allow_new_arb_cycle;
  wire             altpll_0_pll_slave_any_bursting_master_saved_grant;
  wire             altpll_0_pll_slave_any_continuerequest;
  reg     [  1: 0] altpll_0_pll_slave_arb_addend;
  wire             altpll_0_pll_slave_arb_counter_enable;
  reg     [  3: 0] altpll_0_pll_slave_arb_share_counter;
  wire    [  3: 0] altpll_0_pll_slave_arb_share_counter_next_value;
  wire    [  3: 0] altpll_0_pll_slave_arb_share_set_values;
  wire    [  1: 0] altpll_0_pll_slave_arb_winner;
  wire             altpll_0_pll_slave_arbitration_holdoff_internal;
  wire             altpll_0_pll_slave_beginbursttransfer_internal;
  wire             altpll_0_pll_slave_begins_xfer;
  wire    [  3: 0] altpll_0_pll_slave_chosen_master_double_vector;
  wire    [  1: 0] altpll_0_pll_slave_chosen_master_rot_left;
  wire             altpll_0_pll_slave_end_xfer;
  wire             altpll_0_pll_slave_firsttransfer;
  wire    [  1: 0] altpll_0_pll_slave_grant_vector;
  wire             altpll_0_pll_slave_in_a_read_cycle;
  wire             altpll_0_pll_slave_in_a_write_cycle;
  wire    [  1: 0] altpll_0_pll_slave_master_qreq_vector;
  wire             altpll_0_pll_slave_non_bursting_master_requests;
  wire             altpll_0_pll_slave_read;
  wire    [ 31: 0] altpll_0_pll_slave_readdata_from_sa;
  reg              altpll_0_pll_slave_reg_firsttransfer;
  wire             altpll_0_pll_slave_reset;
  reg     [  1: 0] altpll_0_pll_slave_saved_chosen_master_vector;
  reg              altpll_0_pll_slave_slavearbiterlockenable;
  wire             altpll_0_pll_slave_slavearbiterlockenable2;
  wire             altpll_0_pll_slave_unreg_firsttransfer;
  wire             altpll_0_pll_slave_waits_for_read;
  wire             altpll_0_pll_slave_waits_for_write;
  wire             altpll_0_pll_slave_write;
  wire    [ 31: 0] altpll_0_pll_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_altpll_0_pll_slave;
  wire             cpu_0_data_master_qualified_request_altpll_0_pll_slave;
  wire             cpu_0_data_master_read_data_valid_altpll_0_pll_slave;
  wire             cpu_0_data_master_requests_altpll_0_pll_slave;
  wire             cpu_0_data_master_saved_grant_altpll_0_pll_slave;
  reg              d1_altpll_0_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altpll_0_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_altpll_0_pll_slave;
  reg              last_cycle_new_work_burst_1_downstream_granted_slave_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_arbiterlock;
  wire             new_work_burst_1_downstream_arbiterlock2;
  wire             new_work_burst_1_downstream_continuerequest;
  wire             new_work_burst_1_downstream_granted_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_requests_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave;
  wire    [ 24: 0] shifted_address_to_altpll_0_pll_slave_from_cpu_0_data_master;
  wire    [  2: 0] shifted_address_to_altpll_0_pll_slave_from_new_work_burst_1_downstream;
  wire             wait_for_altpll_0_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altpll_0_pll_slave_end_xfer;
    end


  assign altpll_0_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_altpll_0_pll_slave | new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave));
  //assign altpll_0_pll_slave_readdata_from_sa = altpll_0_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altpll_0_pll_slave_readdata_from_sa = altpll_0_pll_slave_readdata;

  assign cpu_0_data_master_requests_altpll_0_pll_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801018) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //altpll_0_pll_slave_arb_share_counter set values, which is an e_mux
  assign altpll_0_pll_slave_arb_share_set_values = (new_work_burst_1_downstream_granted_altpll_0_pll_slave)? new_work_burst_1_downstream_arbitrationshare :
    (new_work_burst_1_downstream_granted_altpll_0_pll_slave)? new_work_burst_1_downstream_arbitrationshare :
    1;

  //altpll_0_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign altpll_0_pll_slave_non_bursting_master_requests = cpu_0_data_master_requests_altpll_0_pll_slave |
    cpu_0_data_master_requests_altpll_0_pll_slave;

  //altpll_0_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign altpll_0_pll_slave_any_bursting_master_saved_grant = 0 |
    new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave |
    new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave;

  //altpll_0_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign altpll_0_pll_slave_arb_share_counter_next_value = altpll_0_pll_slave_firsttransfer ? (altpll_0_pll_slave_arb_share_set_values - 1) : |altpll_0_pll_slave_arb_share_counter ? (altpll_0_pll_slave_arb_share_counter - 1) : 0;

  //altpll_0_pll_slave_allgrants all slave grants, which is an e_mux
  assign altpll_0_pll_slave_allgrants = (|altpll_0_pll_slave_grant_vector) |
    (|altpll_0_pll_slave_grant_vector) |
    (|altpll_0_pll_slave_grant_vector) |
    (|altpll_0_pll_slave_grant_vector);

  //altpll_0_pll_slave_end_xfer assignment, which is an e_assign
  assign altpll_0_pll_slave_end_xfer = ~(altpll_0_pll_slave_waits_for_read | altpll_0_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_altpll_0_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altpll_0_pll_slave = altpll_0_pll_slave_end_xfer & (~altpll_0_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altpll_0_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign altpll_0_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_altpll_0_pll_slave & altpll_0_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_altpll_0_pll_slave & ~altpll_0_pll_slave_non_bursting_master_requests);

  //altpll_0_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_0_pll_slave_arb_share_counter <= 0;
      else if (altpll_0_pll_slave_arb_counter_enable)
          altpll_0_pll_slave_arb_share_counter <= altpll_0_pll_slave_arb_share_counter_next_value;
    end


  //altpll_0_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_0_pll_slave_slavearbiterlockenable <= 0;
      else if ((|altpll_0_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_altpll_0_pll_slave) | (end_xfer_arb_share_counter_term_altpll_0_pll_slave & ~altpll_0_pll_slave_non_bursting_master_requests))
          altpll_0_pll_slave_slavearbiterlockenable <= |altpll_0_pll_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master altpll_0/pll_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = altpll_0_pll_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //altpll_0_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altpll_0_pll_slave_slavearbiterlockenable2 = |altpll_0_pll_slave_arb_share_counter_next_value;

  //cpu_0/data_master altpll_0/pll_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = altpll_0_pll_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_burst_1/downstream altpll_0/pll_slave arbiterlock, which is an e_assign
  assign new_work_burst_1_downstream_arbiterlock = altpll_0_pll_slave_slavearbiterlockenable & new_work_burst_1_downstream_continuerequest;

  //new_work_burst_1/downstream altpll_0/pll_slave arbiterlock2, which is an e_assign
  assign new_work_burst_1_downstream_arbiterlock2 = altpll_0_pll_slave_slavearbiterlockenable2 & new_work_burst_1_downstream_continuerequest;

  //new_work_burst_1/downstream granted altpll_0/pll_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_burst_1_downstream_granted_slave_altpll_0_pll_slave <= 0;
      else 
        last_cycle_new_work_burst_1_downstream_granted_slave_altpll_0_pll_slave <= new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave ? 1 : (altpll_0_pll_slave_arbitration_holdoff_internal | ~new_work_burst_1_downstream_requests_altpll_0_pll_slave) ? 0 : last_cycle_new_work_burst_1_downstream_granted_slave_altpll_0_pll_slave;
    end


  //new_work_burst_1_downstream_continuerequest continued request, which is an e_mux
  assign new_work_burst_1_downstream_continuerequest = last_cycle_new_work_burst_1_downstream_granted_slave_altpll_0_pll_slave & 1;

  //altpll_0_pll_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign altpll_0_pll_slave_any_continuerequest = new_work_burst_1_downstream_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_altpll_0_pll_slave = cpu_0_data_master_requests_altpll_0_pll_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | new_work_burst_1_downstream_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_altpll_0_pll_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_altpll_0_pll_slave = cpu_0_data_master_granted_altpll_0_pll_slave & cpu_0_data_master_read & ~altpll_0_pll_slave_waits_for_read;

  //altpll_0_pll_slave_writedata mux, which is an e_mux
  assign altpll_0_pll_slave_writedata = (cpu_0_data_master_granted_altpll_0_pll_slave)? cpu_0_data_master_writedata :
    new_work_burst_1_downstream_writedata;

  assign new_work_burst_1_downstream_requests_altpll_0_pll_slave = (1) & (new_work_burst_1_downstream_read | new_work_burst_1_downstream_write);
  //cpu_0/data_master granted altpll_0/pll_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_altpll_0_pll_slave <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_altpll_0_pll_slave <= cpu_0_data_master_saved_grant_altpll_0_pll_slave ? 1 : (altpll_0_pll_slave_arbitration_holdoff_internal | 0) ? 0 : last_cycle_cpu_0_data_master_granted_slave_altpll_0_pll_slave;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_altpll_0_pll_slave & cpu_0_data_master_requests_altpll_0_pll_slave;

  assign new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave = new_work_burst_1_downstream_requests_altpll_0_pll_slave & ~((new_work_burst_1_downstream_read & ((new_work_burst_1_downstream_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave, which is an e_mux
  assign new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave = new_work_burst_1_downstream_granted_altpll_0_pll_slave & new_work_burst_1_downstream_read & ~altpll_0_pll_slave_waits_for_read;

  //allow new arb cycle for altpll_0/pll_slave, which is an e_assign
  assign altpll_0_pll_slave_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~new_work_burst_1_downstream_arbiterlock;

  //new_work_burst_1/downstream assignment into master qualified-requests vector for altpll_0/pll_slave, which is an e_assign
  assign altpll_0_pll_slave_master_qreq_vector[0] = new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave;

  //new_work_burst_1/downstream grant altpll_0/pll_slave, which is an e_assign
  assign new_work_burst_1_downstream_granted_altpll_0_pll_slave = altpll_0_pll_slave_grant_vector[0];

  //new_work_burst_1/downstream saved-grant altpll_0/pll_slave, which is an e_assign
  assign new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave = altpll_0_pll_slave_arb_winner[0];

  //cpu_0/data_master assignment into master qualified-requests vector for altpll_0/pll_slave, which is an e_assign
  assign altpll_0_pll_slave_master_qreq_vector[1] = cpu_0_data_master_qualified_request_altpll_0_pll_slave;

  //cpu_0/data_master grant altpll_0/pll_slave, which is an e_assign
  assign cpu_0_data_master_granted_altpll_0_pll_slave = altpll_0_pll_slave_grant_vector[1];

  //cpu_0/data_master saved-grant altpll_0/pll_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_altpll_0_pll_slave = altpll_0_pll_slave_arb_winner[1] && cpu_0_data_master_requests_altpll_0_pll_slave;

  //altpll_0/pll_slave chosen-master double-vector, which is an e_assign
  assign altpll_0_pll_slave_chosen_master_double_vector = {altpll_0_pll_slave_master_qreq_vector, altpll_0_pll_slave_master_qreq_vector} & ({~altpll_0_pll_slave_master_qreq_vector, ~altpll_0_pll_slave_master_qreq_vector} + altpll_0_pll_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign altpll_0_pll_slave_arb_winner = (altpll_0_pll_slave_allow_new_arb_cycle & | altpll_0_pll_slave_grant_vector) ? altpll_0_pll_slave_grant_vector : altpll_0_pll_slave_saved_chosen_master_vector;

  //saved altpll_0_pll_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_0_pll_slave_saved_chosen_master_vector <= 0;
      else if (altpll_0_pll_slave_allow_new_arb_cycle)
          altpll_0_pll_slave_saved_chosen_master_vector <= |altpll_0_pll_slave_grant_vector ? altpll_0_pll_slave_grant_vector : altpll_0_pll_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign altpll_0_pll_slave_grant_vector = {(altpll_0_pll_slave_chosen_master_double_vector[1] | altpll_0_pll_slave_chosen_master_double_vector[3]),
    (altpll_0_pll_slave_chosen_master_double_vector[0] | altpll_0_pll_slave_chosen_master_double_vector[2])};

  //altpll_0/pll_slave chosen master rotated left, which is an e_assign
  assign altpll_0_pll_slave_chosen_master_rot_left = (altpll_0_pll_slave_arb_winner << 1) ? (altpll_0_pll_slave_arb_winner << 1) : 1;

  //altpll_0/pll_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_0_pll_slave_arb_addend <= 1;
      else if (|altpll_0_pll_slave_grant_vector)
          altpll_0_pll_slave_arb_addend <= altpll_0_pll_slave_end_xfer? altpll_0_pll_slave_chosen_master_rot_left : altpll_0_pll_slave_grant_vector;
    end


  //~altpll_0_pll_slave_reset assignment, which is an e_assign
  assign altpll_0_pll_slave_reset = ~reset_n;

  //altpll_0_pll_slave_firsttransfer first transaction, which is an e_assign
  assign altpll_0_pll_slave_firsttransfer = altpll_0_pll_slave_begins_xfer ? altpll_0_pll_slave_unreg_firsttransfer : altpll_0_pll_slave_reg_firsttransfer;

  //altpll_0_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign altpll_0_pll_slave_unreg_firsttransfer = ~(altpll_0_pll_slave_slavearbiterlockenable & altpll_0_pll_slave_any_continuerequest);

  //altpll_0_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_0_pll_slave_reg_firsttransfer <= 1'b1;
      else if (altpll_0_pll_slave_begins_xfer)
          altpll_0_pll_slave_reg_firsttransfer <= altpll_0_pll_slave_unreg_firsttransfer;
    end


  //altpll_0_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altpll_0_pll_slave_beginbursttransfer_internal = altpll_0_pll_slave_begins_xfer;

  //altpll_0_pll_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign altpll_0_pll_slave_arbitration_holdoff_internal = altpll_0_pll_slave_begins_xfer & altpll_0_pll_slave_firsttransfer;

  //altpll_0_pll_slave_read assignment, which is an e_mux
  assign altpll_0_pll_slave_read = (cpu_0_data_master_granted_altpll_0_pll_slave & cpu_0_data_master_read) | (new_work_burst_1_downstream_granted_altpll_0_pll_slave & new_work_burst_1_downstream_read);

  //altpll_0_pll_slave_write assignment, which is an e_mux
  assign altpll_0_pll_slave_write = (cpu_0_data_master_granted_altpll_0_pll_slave & cpu_0_data_master_write) | (new_work_burst_1_downstream_granted_altpll_0_pll_slave & new_work_burst_1_downstream_write);

  assign shifted_address_to_altpll_0_pll_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //altpll_0_pll_slave_address mux, which is an e_mux
  assign altpll_0_pll_slave_address = (cpu_0_data_master_granted_altpll_0_pll_slave)? (shifted_address_to_altpll_0_pll_slave_from_cpu_0_data_master >> 2) :
    (shifted_address_to_altpll_0_pll_slave_from_new_work_burst_1_downstream >> 2);

  assign shifted_address_to_altpll_0_pll_slave_from_new_work_burst_1_downstream = new_work_burst_1_downstream_address_to_slave;
  //d1_altpll_0_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altpll_0_pll_slave_end_xfer <= 1;
      else 
        d1_altpll_0_pll_slave_end_xfer <= altpll_0_pll_slave_end_xfer;
    end


  //altpll_0_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign altpll_0_pll_slave_waits_for_read = altpll_0_pll_slave_in_a_read_cycle & 0;

  //altpll_0_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign altpll_0_pll_slave_in_a_read_cycle = (cpu_0_data_master_granted_altpll_0_pll_slave & cpu_0_data_master_read) | (new_work_burst_1_downstream_granted_altpll_0_pll_slave & new_work_burst_1_downstream_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altpll_0_pll_slave_in_a_read_cycle;

  //altpll_0_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign altpll_0_pll_slave_waits_for_write = altpll_0_pll_slave_in_a_write_cycle & 0;

  //altpll_0_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign altpll_0_pll_slave_in_a_write_cycle = (cpu_0_data_master_granted_altpll_0_pll_slave & cpu_0_data_master_write) | (new_work_burst_1_downstream_granted_altpll_0_pll_slave & new_work_burst_1_downstream_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altpll_0_pll_slave_in_a_write_cycle;

  assign wait_for_altpll_0_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altpll_0/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //new_work_burst_1/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_1_downstream_requests_altpll_0_pll_slave && (new_work_burst_1_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_1/downstream drove 0 on its 'arbitrationshare' port while accessing slave altpll_0/pll_slave", $time);
          $stop;
        end
    end


  //new_work_burst_1/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_1_downstream_requests_altpll_0_pll_slave && (new_work_burst_1_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_1/downstream drove 0 on its 'burstcount' port while accessing slave altpll_0/pll_slave", $time);
          $stop;
        end
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_altpll_0_pll_slave + new_work_burst_1_downstream_granted_altpll_0_pll_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_altpll_0_pll_slave + new_work_burst_1_downstream_saved_grant_altpll_0_pll_slave > 1)
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
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             new_work_burst_0_downstream_address_to_slave,
                                             new_work_burst_0_downstream_arbitrationshare,
                                             new_work_burst_0_downstream_burstcount,
                                             new_work_burst_0_downstream_byteenable,
                                             new_work_burst_0_downstream_debugaccess,
                                             new_work_burst_0_downstream_latency_counter,
                                             new_work_burst_0_downstream_read,
                                             new_work_burst_0_downstream_write,
                                             new_work_burst_0_downstream_writedata,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
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
                                             d1_cpu_0_jtag_debug_module_end_xfer,
                                             new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module,
                                             new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module,
                                             new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module,
                                             new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
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
  output           new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;
  output           new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module;
  output           new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module;
  output           new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input   [ 10: 0] new_work_burst_0_downstream_address_to_slave;
  input   [  3: 0] new_work_burst_0_downstream_arbitrationshare;
  input            new_work_burst_0_downstream_burstcount;
  input   [  3: 0] new_work_burst_0_downstream_byteenable;
  input            new_work_burst_0_downstream_debugaccess;
  input            new_work_burst_0_downstream_latency_counter;
  input            new_work_burst_0_downstream_read;
  input            new_work_burst_0_downstream_write;
  input   [ 31: 0] new_work_burst_0_downstream_writedata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  3: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  3: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  3: 0] cpu_0_jtag_debug_module_arb_share_set_values;
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
  reg              last_cycle_new_work_burst_0_downstream_granted_slave_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_arbiterlock;
  wire             new_work_burst_0_downstream_arbiterlock2;
  wire             new_work_burst_0_downstream_continuerequest;
  wire             new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 10: 0] shifted_address_to_cpu_0_jtag_debug_module_from_new_work_burst_0_downstream;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1800800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module)? new_work_burst_0_downstream_arbitrationshare :
    (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module)? new_work_burst_0_downstream_arbitrationshare :
    1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0 |
    new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module |
    new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module;

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

  //new_work_burst_0/downstream cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign new_work_burst_0_downstream_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & new_work_burst_0_downstream_continuerequest;

  //new_work_burst_0/downstream cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign new_work_burst_0_downstream_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & new_work_burst_0_downstream_continuerequest;

  //new_work_burst_0/downstream granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_burst_0_downstream_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_new_work_burst_0_downstream_granted_slave_cpu_0_jtag_debug_module <= new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_new_work_burst_0_downstream_granted_slave_cpu_0_jtag_debug_module;
    end


  //new_work_burst_0_downstream_continuerequest continued request, which is an e_mux
  assign new_work_burst_0_downstream_continuerequest = last_cycle_new_work_burst_0_downstream_granted_slave_cpu_0_jtag_debug_module & 1;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = new_work_burst_0_downstream_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | new_work_burst_0_downstream_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_writedata :
    new_work_burst_0_downstream_writedata;

  assign new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module = (1) & (new_work_burst_0_downstream_read | new_work_burst_0_downstream_write);
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | 0) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module = new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module & ~((new_work_burst_0_downstream_read & ((new_work_burst_0_downstream_latency_counter != 0))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module = new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module & new_work_burst_0_downstream_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~new_work_burst_0_downstream_arbiterlock;

  //new_work_burst_0/downstream assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module;

  //new_work_burst_0/downstream grant cpu_0/jtag_debug_module, which is an e_assign
  assign new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //new_work_burst_0/downstream saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0];

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

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;
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
  assign cpu_0_jtag_debug_module_write = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write) | (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module & new_work_burst_0_downstream_write);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_new_work_burst_0_downstream >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_new_work_burst_0_downstream = new_work_burst_0_downstream_address_to_slave;
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
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module & new_work_burst_0_downstream_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write) | (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module & new_work_burst_0_downstream_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module)? new_work_burst_0_downstream_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module)? new_work_burst_0_downstream_debugaccess :
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


  //new_work_burst_0/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module && (new_work_burst_0_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_0/downstream drove 0 on its 'arbitrationshare' port while accessing slave cpu_0/jtag_debug_module", $time);
          $stop;
        end
    end


  //new_work_burst_0/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module && (new_work_burst_0_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_0/downstream drove 0 on its 'burstcount' port while accessing slave cpu_0/jtag_debug_module", $time);
          $stop;
        end
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + new_work_burst_0_downstream_saved_grant_cpu_0_jtag_debug_module > 1)
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

module jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_0_data_master_module (
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

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
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

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       altpll_0_pll_slave_readdata_from_sa,
                                       clk,
                                       clk_0,
                                       clk_0_reset_n,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_byteenable_new_work_clock_3_in,
                                       cpu_0_data_master_byteenable_new_work_clock_6_in,
                                       cpu_0_data_master_granted_altpll_0_pll_slave,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_new_work_clock_0_in,
                                       cpu_0_data_master_granted_new_work_clock_1_in,
                                       cpu_0_data_master_granted_new_work_clock_3_in,
                                       cpu_0_data_master_granted_new_work_clock_4_in,
                                       cpu_0_data_master_granted_new_work_clock_6_in,
                                       cpu_0_data_master_qualified_request_altpll_0_pll_slave,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_new_work_clock_0_in,
                                       cpu_0_data_master_qualified_request_new_work_clock_1_in,
                                       cpu_0_data_master_qualified_request_new_work_clock_3_in,
                                       cpu_0_data_master_qualified_request_new_work_clock_4_in,
                                       cpu_0_data_master_qualified_request_new_work_clock_6_in,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_altpll_0_pll_slave,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_new_work_clock_0_in,
                                       cpu_0_data_master_read_data_valid_new_work_clock_1_in,
                                       cpu_0_data_master_read_data_valid_new_work_clock_3_in,
                                       cpu_0_data_master_read_data_valid_new_work_clock_4_in,
                                       cpu_0_data_master_read_data_valid_new_work_clock_6_in,
                                       cpu_0_data_master_requests_altpll_0_pll_slave,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_new_work_clock_0_in,
                                       cpu_0_data_master_requests_new_work_clock_1_in,
                                       cpu_0_data_master_requests_new_work_clock_3_in,
                                       cpu_0_data_master_requests_new_work_clock_4_in,
                                       cpu_0_data_master_requests_new_work_clock_6_in,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_altpll_0_pll_slave_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_new_work_clock_0_in_end_xfer,
                                       d1_new_work_clock_1_in_end_xfer,
                                       d1_new_work_clock_3_in_end_xfer,
                                       d1_new_work_clock_4_in_end_xfer,
                                       d1_new_work_clock_6_in_end_xfer,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       new_work_clock_0_in_readdata_from_sa,
                                       new_work_clock_0_in_waitrequest_from_sa,
                                       new_work_clock_1_in_readdata_from_sa,
                                       new_work_clock_1_in_waitrequest_from_sa,
                                       new_work_clock_3_in_readdata_from_sa,
                                       new_work_clock_3_in_waitrequest_from_sa,
                                       new_work_clock_4_in_readdata_from_sa,
                                       new_work_clock_4_in_waitrequest_from_sa,
                                       new_work_clock_6_in_readdata_from_sa,
                                       new_work_clock_6_in_waitrequest_from_sa,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_readdatavalid,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 24: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_latency_counter;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_readdatavalid;
  output           cpu_0_data_master_waitrequest;
  input   [ 31: 0] altpll_0_pll_slave_readdata_from_sa;
  input            clk;
  input            clk_0;
  input            clk_0_reset_n;
  input   [ 24: 0] cpu_0_data_master_address;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in;
  input   [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in;
  input            cpu_0_data_master_granted_altpll_0_pll_slave;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_new_work_clock_0_in;
  input            cpu_0_data_master_granted_new_work_clock_1_in;
  input            cpu_0_data_master_granted_new_work_clock_3_in;
  input            cpu_0_data_master_granted_new_work_clock_4_in;
  input            cpu_0_data_master_granted_new_work_clock_6_in;
  input            cpu_0_data_master_qualified_request_altpll_0_pll_slave;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_new_work_clock_0_in;
  input            cpu_0_data_master_qualified_request_new_work_clock_1_in;
  input            cpu_0_data_master_qualified_request_new_work_clock_3_in;
  input            cpu_0_data_master_qualified_request_new_work_clock_4_in;
  input            cpu_0_data_master_qualified_request_new_work_clock_6_in;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_altpll_0_pll_slave;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_new_work_clock_0_in;
  input            cpu_0_data_master_read_data_valid_new_work_clock_1_in;
  input            cpu_0_data_master_read_data_valid_new_work_clock_3_in;
  input            cpu_0_data_master_read_data_valid_new_work_clock_4_in;
  input            cpu_0_data_master_read_data_valid_new_work_clock_6_in;
  input            cpu_0_data_master_requests_altpll_0_pll_slave;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_new_work_clock_0_in;
  input            cpu_0_data_master_requests_new_work_clock_1_in;
  input            cpu_0_data_master_requests_new_work_clock_3_in;
  input            cpu_0_data_master_requests_new_work_clock_4_in;
  input            cpu_0_data_master_requests_new_work_clock_6_in;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_altpll_0_pll_slave_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_new_work_clock_0_in_end_xfer;
  input            d1_new_work_clock_1_in_end_xfer;
  input            d1_new_work_clock_3_in_end_xfer;
  input            d1_new_work_clock_4_in_end_xfer;
  input            d1_new_work_clock_6_in_end_xfer;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] new_work_clock_0_in_readdata_from_sa;
  input            new_work_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] new_work_clock_1_in_readdata_from_sa;
  input            new_work_clock_1_in_waitrequest_from_sa;
  input   [ 15: 0] new_work_clock_3_in_readdata_from_sa;
  input            new_work_clock_3_in_waitrequest_from_sa;
  input   [  7: 0] new_work_clock_4_in_readdata_from_sa;
  input            new_work_clock_4_in_waitrequest_from_sa;
  input   [ 15: 0] new_work_clock_6_in_readdata_from_sa;
  input            new_work_clock_6_in_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             clk_0_jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  reg     [ 24: 0] cpu_0_data_master_address_last_time;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  reg     [  3: 0] cpu_0_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_is_granted_some_slave;
  reg              cpu_0_data_master_latency_counter;
  reg              cpu_0_data_master_read_but_no_slave_selected;
  reg              cpu_0_data_master_read_last_time;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_run;
  wire             cpu_0_data_master_waitrequest;
  reg              cpu_0_data_master_write_last_time;
  reg     [ 31: 0] cpu_0_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_0_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_altpll_0_pll_slave | ~cpu_0_data_master_requests_altpll_0_pll_slave) & (cpu_0_data_master_granted_altpll_0_pll_slave | ~cpu_0_data_master_qualified_request_altpll_0_pll_slave) & ((~cpu_0_data_master_qualified_request_altpll_0_pll_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_altpll_0_pll_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_new_work_clock_0_in | ~cpu_0_data_master_requests_new_work_clock_0_in) & ((~cpu_0_data_master_qualified_request_new_work_clock_0_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_new_work_clock_0_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_0_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_new_work_clock_1_in | ~cpu_0_data_master_requests_new_work_clock_1_in) & ((~cpu_0_data_master_qualified_request_new_work_clock_1_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_1_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_new_work_clock_1_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_1_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_new_work_clock_3_in | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_new_work_clock_3_in & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_new_work_clock_3_in);

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_new_work_clock_3_in | ~cpu_0_data_master_read | (1 & ~new_work_clock_3_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_new_work_clock_3_in | ~cpu_0_data_master_write | (1 & ~new_work_clock_3_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_new_work_clock_4_in | ~cpu_0_data_master_requests_new_work_clock_4_in) & ((~cpu_0_data_master_qualified_request_new_work_clock_4_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_4_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_new_work_clock_4_in | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~new_work_clock_4_in_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_new_work_clock_6_in | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_new_work_clock_6_in & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_new_work_clock_6_in) & ((~cpu_0_data_master_qualified_request_new_work_clock_6_in | ~cpu_0_data_master_read | (1 & ~new_work_clock_6_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_new_work_clock_6_in | ~cpu_0_data_master_write | (1 & ~new_work_clock_6_in_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[24 : 0];

  //cpu_0_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_data_master_read_but_no_slave_selected <= cpu_0_data_master_read & cpu_0_data_master_run & ~cpu_0_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_data_master_is_granted_some_slave = cpu_0_data_master_granted_altpll_0_pll_slave |
    cpu_0_data_master_granted_cpu_0_jtag_debug_module |
    cpu_0_data_master_granted_new_work_clock_0_in |
    cpu_0_data_master_granted_new_work_clock_1_in |
    cpu_0_data_master_granted_new_work_clock_3_in |
    cpu_0_data_master_granted_new_work_clock_4_in |
    cpu_0_data_master_granted_new_work_clock_6_in;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_data_master_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_data_master_readdatavalid = cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_altpll_0_pll_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_new_work_clock_0_in |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_new_work_clock_1_in |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    (cpu_0_data_master_read_data_valid_new_work_clock_3_in & dbs_counter_overflow) |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_new_work_clock_4_in |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    (cpu_0_data_master_read_data_valid_new_work_clock_6_in & dbs_counter_overflow);

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~(cpu_0_data_master_qualified_request_altpll_0_pll_slave & cpu_0_data_master_read)}} | altpll_0_pll_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_data_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_new_work_clock_0_in & cpu_0_data_master_read)}} | new_work_clock_0_in_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_new_work_clock_1_in & cpu_0_data_master_read)}} | new_work_clock_1_in_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_new_work_clock_3_in & cpu_0_data_master_read)}} | {new_work_clock_3_in_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(cpu_0_data_master_qualified_request_new_work_clock_4_in & cpu_0_data_master_read)}} | new_work_clock_4_in_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_new_work_clock_6_in & cpu_0_data_master_read)}} | {new_work_clock_6_in_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

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
  assign latency_load_value = 0;

  //jtag_uart_0_avalon_jtag_slave_irq_from_sa from altpll_0_c0_out to clk_0
  jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_0_data_master_module jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_cpu_0_data_master
    (
      .clk      (clk_0),
      .data_in  (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .data_out (clk_0_jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .reset_n  (clk_0_reset_n)
    );

  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    clk_0_jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_0_data_master_requests_new_work_clock_3_in & cpu_0_data_master_write & !cpu_0_data_master_byteenable_new_work_clock_3_in)) |
    (cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_read & 1 & 1 & ~new_work_clock_3_in_waitrequest_from_sa) |
    (cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_write & 1 & 1 & ~new_work_clock_3_in_waitrequest_from_sa) |
    (((~0) & cpu_0_data_master_requests_new_work_clock_6_in & cpu_0_data_master_write & !cpu_0_data_master_byteenable_new_work_clock_6_in)) |
    (cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_read & 1 & 1 & ~new_work_clock_6_in_waitrequest_from_sa) |
    (cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_write & 1 & 1 & ~new_work_clock_6_in_waitrequest_from_sa);

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = ((cpu_0_data_master_qualified_request_new_work_clock_3_in & cpu_0_data_master_read))? new_work_clock_3_in_readdata_from_sa :
    new_work_clock_6_in_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    (~(cpu_0_data_master_dbs_address[1]))? cpu_0_data_master_writedata[15 : 0] :
    (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_new_work_clock_3_in)? 2 :
    (cpu_0_data_master_requests_new_work_clock_6_in)? 2 :
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
                                              cpu_0_instruction_master_burstcount,
                                              cpu_0_instruction_master_granted_new_work_burst_0_upstream,
                                              cpu_0_instruction_master_granted_new_work_burst_1_upstream,
                                              cpu_0_instruction_master_granted_new_work_burst_2_upstream,
                                              cpu_0_instruction_master_granted_new_work_burst_3_upstream,
                                              cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream,
                                              cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream,
                                              cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream,
                                              cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream,
                                              cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register,
                                              cpu_0_instruction_master_requests_new_work_burst_0_upstream,
                                              cpu_0_instruction_master_requests_new_work_burst_1_upstream,
                                              cpu_0_instruction_master_requests_new_work_burst_2_upstream,
                                              cpu_0_instruction_master_requests_new_work_burst_3_upstream,
                                              d1_new_work_burst_0_upstream_end_xfer,
                                              d1_new_work_burst_1_upstream_end_xfer,
                                              d1_new_work_burst_2_upstream_end_xfer,
                                              d1_new_work_burst_3_upstream_end_xfer,
                                              new_work_burst_0_upstream_readdata_from_sa,
                                              new_work_burst_0_upstream_waitrequest_from_sa,
                                              new_work_burst_1_upstream_readdata_from_sa,
                                              new_work_burst_1_upstream_waitrequest_from_sa,
                                              new_work_burst_2_upstream_readdata_from_sa,
                                              new_work_burst_2_upstream_waitrequest_from_sa,
                                              new_work_burst_3_upstream_readdata_from_sa,
                                              new_work_burst_3_upstream_waitrequest_from_sa,
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

  output  [ 24: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output           cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address;
  input   [  3: 0] cpu_0_instruction_master_burstcount;
  input            cpu_0_instruction_master_granted_new_work_burst_0_upstream;
  input            cpu_0_instruction_master_granted_new_work_burst_1_upstream;
  input            cpu_0_instruction_master_granted_new_work_burst_2_upstream;
  input            cpu_0_instruction_master_granted_new_work_burst_3_upstream;
  input            cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream;
  input            cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream;
  input            cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream;
  input            cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  input            cpu_0_instruction_master_requests_new_work_burst_0_upstream;
  input            cpu_0_instruction_master_requests_new_work_burst_1_upstream;
  input            cpu_0_instruction_master_requests_new_work_burst_2_upstream;
  input            cpu_0_instruction_master_requests_new_work_burst_3_upstream;
  input            d1_new_work_burst_0_upstream_end_xfer;
  input            d1_new_work_burst_1_upstream_end_xfer;
  input            d1_new_work_burst_2_upstream_end_xfer;
  input            d1_new_work_burst_3_upstream_end_xfer;
  input   [ 31: 0] new_work_burst_0_upstream_readdata_from_sa;
  input            new_work_burst_0_upstream_waitrequest_from_sa;
  input   [ 31: 0] new_work_burst_1_upstream_readdata_from_sa;
  input            new_work_burst_1_upstream_waitrequest_from_sa;
  input   [ 15: 0] new_work_burst_2_upstream_readdata_from_sa;
  input            new_work_burst_2_upstream_waitrequest_from_sa;
  input   [ 15: 0] new_work_burst_3_upstream_readdata_from_sa;
  input            new_work_burst_3_upstream_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  3: 0] cpu_0_instruction_master_burstcount_last_time;
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
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream | ~cpu_0_instruction_master_requests_new_work_burst_0_upstream) & ((~cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream | ~(cpu_0_instruction_master_read) | (1 & ~new_work_burst_0_upstream_waitrequest_from_sa & (cpu_0_instruction_master_read)))) & 1 & (cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream | ~cpu_0_instruction_master_requests_new_work_burst_1_upstream) & ((~cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream | ~(cpu_0_instruction_master_read) | (1 & ~new_work_burst_1_upstream_waitrequest_from_sa & (cpu_0_instruction_master_read)))) & 1 & (cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream | ~cpu_0_instruction_master_requests_new_work_burst_2_upstream) & ((~cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream | ~cpu_0_instruction_master_read | (1 & ~new_work_burst_2_upstream_waitrequest_from_sa & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream | ~cpu_0_instruction_master_requests_new_work_burst_3_upstream) & ((~cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream | ~cpu_0_instruction_master_read | (1 & ~new_work_burst_3_upstream_waitrequest_from_sa & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[24 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_new_work_burst_0_upstream |
    cpu_0_instruction_master_granted_new_work_burst_1_upstream |
    cpu_0_instruction_master_granted_new_work_burst_2_upstream |
    cpu_0_instruction_master_granted_new_work_burst_3_upstream;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream |
    cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream |
    (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream & dbs_rdv_counter_overflow) |
    (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream}} | new_work_burst_0_upstream_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream}} | new_work_burst_1_upstream_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream}} | {new_work_burst_2_upstream_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream}} | {new_work_burst_3_upstream_readdata_from_sa[15 : 0],
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
  assign latency_load_value = 0;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream)? new_work_burst_2_upstream_readdata_from_sa :
    new_work_burst_3_upstream_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_new_work_burst_2_upstream)? 2 :
    (cpu_0_instruction_master_requests_new_work_burst_3_upstream)? 2 :
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
  assign cpu_0_instruction_master_dbs_rdv_counter_inc = (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream)? 2 :
    2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream |
    cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream;

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
  assign pre_dbs_count_enable = (cpu_0_instruction_master_granted_new_work_burst_2_upstream & cpu_0_instruction_master_read & 0 & 1 & ~new_work_burst_2_upstream_waitrequest_from_sa) |
    (cpu_0_instruction_master_granted_new_work_burst_3_upstream & cpu_0_instruction_master_read & 0 & 1 & ~new_work_burst_3_upstream_waitrequest_from_sa);


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


  //cpu_0_instruction_master_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_burstcount_last_time <= 0;
      else 
        cpu_0_instruction_master_burstcount_last_time <= cpu_0_instruction_master_burstcount;
    end


  //cpu_0_instruction_master_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_burstcount != cpu_0_instruction_master_burstcount_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_burstcount did not heed wait!!!", $time);
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

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   new_work_clock_1_out_address_to_slave,
                                                   new_work_clock_1_out_nativeaddress,
                                                   new_work_clock_1_out_read,
                                                   new_work_clock_1_out_write,
                                                   new_work_clock_1_out_writedata,
                                                   reset_n,

                                                  // outputs:
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata,
                                                   new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave,
                                                   new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave
                                                )
;

  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  output           new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  output           new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  input            clk;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input   [  2: 0] new_work_clock_1_out_address_to_slave;
  input            new_work_clock_1_out_nativeaddress;
  input            new_work_clock_1_out_read;
  input            new_work_clock_1_out_write;
  input   [ 31: 0] new_work_clock_1_out_writedata;
  input            reset_n;

  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             new_work_clock_1_out_arbiterlock;
  wire             new_work_clock_1_out_arbiterlock2;
  wire             new_work_clock_1_out_continuerequest;
  wire             new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_saved_grant_jtag_uart_0_avalon_jtag_slave;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave = (1) & (new_work_clock_1_out_read | new_work_clock_1_out_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //new_work_clock_1/out jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign new_work_clock_1_out_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & new_work_clock_1_out_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //new_work_clock_1/out jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign new_work_clock_1_out_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & new_work_clock_1_out_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //new_work_clock_1_out_continuerequest continued request, which is an e_assign
  assign new_work_clock_1_out_continuerequest = 1;

  assign new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave = new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = new_work_clock_1_out_writedata;

  //master is always granted when requested
  assign new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave = new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //new_work_clock_1/out saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign new_work_clock_1_out_saved_grant_jtag_uart_0_avalon_jtag_slave = new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & new_work_clock_1_out_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & new_work_clock_1_out_write);

  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = new_work_clock_1_out_nativeaddress;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & new_work_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & new_work_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
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

module burstcount_fifo_for_new_work_burst_0_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  3: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  3: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  3: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  3: 0] p0_stage_0;
  wire             p1_full_1;
  wire    [  3: 0] p1_stage_1;
  reg     [  3: 0] stage_0;
  reg     [  3: 0] stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_0_upstream_module (
                                                                                   // inputs:
                                                                                    clear_fifo,
                                                                                    clk,
                                                                                    data_in,
                                                                                    read,
                                                                                    reset_n,
                                                                                    sync_reset,
                                                                                    write,

                                                                                   // outputs:
                                                                                    data_out,
                                                                                    empty,
                                                                                    fifo_contains_ones_n,
                                                                                    full
                                                                                 )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_0_upstream_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_0_instruction_master_address_to_slave,
                                               cpu_0_instruction_master_burstcount,
                                               cpu_0_instruction_master_latency_counter,
                                               cpu_0_instruction_master_read,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register,
                                               new_work_burst_0_upstream_readdata,
                                               new_work_burst_0_upstream_readdatavalid,
                                               new_work_burst_0_upstream_waitrequest,
                                               reset_n,

                                              // outputs:
                                               cpu_0_instruction_master_granted_new_work_burst_0_upstream,
                                               cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register,
                                               cpu_0_instruction_master_requests_new_work_burst_0_upstream,
                                               d1_new_work_burst_0_upstream_end_xfer,
                                               new_work_burst_0_upstream_address,
                                               new_work_burst_0_upstream_byteaddress,
                                               new_work_burst_0_upstream_byteenable,
                                               new_work_burst_0_upstream_debugaccess,
                                               new_work_burst_0_upstream_read,
                                               new_work_burst_0_upstream_readdata_from_sa,
                                               new_work_burst_0_upstream_waitrequest_from_sa,
                                               new_work_burst_0_upstream_write
                                            )
;

  output           cpu_0_instruction_master_granted_new_work_burst_0_upstream;
  output           cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  output           cpu_0_instruction_master_requests_new_work_burst_0_upstream;
  output           d1_new_work_burst_0_upstream_end_xfer;
  output  [ 10: 0] new_work_burst_0_upstream_address;
  output  [ 12: 0] new_work_burst_0_upstream_byteaddress;
  output  [  3: 0] new_work_burst_0_upstream_byteenable;
  output           new_work_burst_0_upstream_debugaccess;
  output           new_work_burst_0_upstream_read;
  output  [ 31: 0] new_work_burst_0_upstream_readdata_from_sa;
  output           new_work_burst_0_upstream_waitrequest_from_sa;
  output           new_work_burst_0_upstream_write;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  3: 0] cpu_0_instruction_master_burstcount;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  input   [ 31: 0] new_work_burst_0_upstream_readdata;
  input            new_work_burst_0_upstream_readdatavalid;
  input            new_work_burst_0_upstream_waitrequest;
  input            reset_n;

  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  wire             cpu_0_instruction_master_requests_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_saved_grant_new_work_burst_0_upstream;
  reg              d1_new_work_burst_0_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_burst_0_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 10: 0] new_work_burst_0_upstream_address;
  wire             new_work_burst_0_upstream_allgrants;
  wire             new_work_burst_0_upstream_allow_new_arb_cycle;
  wire             new_work_burst_0_upstream_any_bursting_master_saved_grant;
  wire             new_work_burst_0_upstream_any_continuerequest;
  wire             new_work_burst_0_upstream_arb_counter_enable;
  reg     [  5: 0] new_work_burst_0_upstream_arb_share_counter;
  wire    [  5: 0] new_work_burst_0_upstream_arb_share_counter_next_value;
  wire    [  5: 0] new_work_burst_0_upstream_arb_share_set_values;
  wire             new_work_burst_0_upstream_beginbursttransfer_internal;
  wire             new_work_burst_0_upstream_begins_xfer;
  wire             new_work_burst_0_upstream_burstcount_fifo_empty;
  wire    [ 12: 0] new_work_burst_0_upstream_byteaddress;
  wire    [  3: 0] new_work_burst_0_upstream_byteenable;
  reg     [  3: 0] new_work_burst_0_upstream_current_burst;
  wire    [  3: 0] new_work_burst_0_upstream_current_burst_minus_one;
  wire             new_work_burst_0_upstream_debugaccess;
  wire             new_work_burst_0_upstream_end_xfer;
  wire             new_work_burst_0_upstream_firsttransfer;
  wire             new_work_burst_0_upstream_grant_vector;
  wire             new_work_burst_0_upstream_in_a_read_cycle;
  wire             new_work_burst_0_upstream_in_a_write_cycle;
  reg              new_work_burst_0_upstream_load_fifo;
  wire             new_work_burst_0_upstream_master_qreq_vector;
  wire             new_work_burst_0_upstream_move_on_to_next_transaction;
  wire    [  3: 0] new_work_burst_0_upstream_next_burst_count;
  wire             new_work_burst_0_upstream_non_bursting_master_requests;
  wire             new_work_burst_0_upstream_read;
  wire    [ 31: 0] new_work_burst_0_upstream_readdata_from_sa;
  wire             new_work_burst_0_upstream_readdatavalid_from_sa;
  reg              new_work_burst_0_upstream_reg_firsttransfer;
  wire    [  3: 0] new_work_burst_0_upstream_selected_burstcount;
  reg              new_work_burst_0_upstream_slavearbiterlockenable;
  wire             new_work_burst_0_upstream_slavearbiterlockenable2;
  wire             new_work_burst_0_upstream_this_cycle_is_the_last_burst;
  wire    [  3: 0] new_work_burst_0_upstream_transaction_burst_count;
  wire             new_work_burst_0_upstream_unreg_firsttransfer;
  wire             new_work_burst_0_upstream_waitrequest_from_sa;
  wire             new_work_burst_0_upstream_waits_for_read;
  wire             new_work_burst_0_upstream_waits_for_write;
  wire             new_work_burst_0_upstream_write;
  wire             p0_new_work_burst_0_upstream_load_fifo;
  wire             wait_for_new_work_burst_0_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_burst_0_upstream_end_xfer;
    end


  assign new_work_burst_0_upstream_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream));
  //assign new_work_burst_0_upstream_readdata_from_sa = new_work_burst_0_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_0_upstream_readdata_from_sa = new_work_burst_0_upstream_readdata;

  assign cpu_0_instruction_master_requests_new_work_burst_0_upstream = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1800800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //assign new_work_burst_0_upstream_waitrequest_from_sa = new_work_burst_0_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_0_upstream_waitrequest_from_sa = new_work_burst_0_upstream_waitrequest;

  //assign new_work_burst_0_upstream_readdatavalid_from_sa = new_work_burst_0_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_0_upstream_readdatavalid_from_sa = new_work_burst_0_upstream_readdatavalid;

  //new_work_burst_0_upstream_arb_share_counter set values, which is an e_mux
  assign new_work_burst_0_upstream_arb_share_set_values = 1;

  //new_work_burst_0_upstream_non_bursting_master_requests mux, which is an e_mux
  assign new_work_burst_0_upstream_non_bursting_master_requests = 0;

  //new_work_burst_0_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_burst_0_upstream_any_bursting_master_saved_grant = cpu_0_instruction_master_saved_grant_new_work_burst_0_upstream;

  //new_work_burst_0_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_burst_0_upstream_arb_share_counter_next_value = new_work_burst_0_upstream_firsttransfer ? (new_work_burst_0_upstream_arb_share_set_values - 1) : |new_work_burst_0_upstream_arb_share_counter ? (new_work_burst_0_upstream_arb_share_counter - 1) : 0;

  //new_work_burst_0_upstream_allgrants all slave grants, which is an e_mux
  assign new_work_burst_0_upstream_allgrants = |new_work_burst_0_upstream_grant_vector;

  //new_work_burst_0_upstream_end_xfer assignment, which is an e_assign
  assign new_work_burst_0_upstream_end_xfer = ~(new_work_burst_0_upstream_waits_for_read | new_work_burst_0_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_burst_0_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_burst_0_upstream = new_work_burst_0_upstream_end_xfer & (~new_work_burst_0_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_burst_0_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_burst_0_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_burst_0_upstream & new_work_burst_0_upstream_allgrants) | (end_xfer_arb_share_counter_term_new_work_burst_0_upstream & ~new_work_burst_0_upstream_non_bursting_master_requests);

  //new_work_burst_0_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_upstream_arb_share_counter <= 0;
      else if (new_work_burst_0_upstream_arb_counter_enable)
          new_work_burst_0_upstream_arb_share_counter <= new_work_burst_0_upstream_arb_share_counter_next_value;
    end


  //new_work_burst_0_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_upstream_slavearbiterlockenable <= 0;
      else if ((|new_work_burst_0_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_burst_0_upstream) | (end_xfer_arb_share_counter_term_new_work_burst_0_upstream & ~new_work_burst_0_upstream_non_bursting_master_requests))
          new_work_burst_0_upstream_slavearbiterlockenable <= |new_work_burst_0_upstream_arb_share_counter_next_value;
    end


  //cpu_0/instruction_master new_work_burst_0/upstream arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = new_work_burst_0_upstream_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //new_work_burst_0_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_burst_0_upstream_slavearbiterlockenable2 = |new_work_burst_0_upstream_arb_share_counter_next_value;

  //cpu_0/instruction_master new_work_burst_0/upstream arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = new_work_burst_0_upstream_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //new_work_burst_0_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_burst_0_upstream_any_continuerequest = 1;

  //cpu_0_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_0_instruction_master_continuerequest = 1;

  assign cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream = cpu_0_instruction_master_requests_new_work_burst_0_upstream & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register))));
  //unique name for new_work_burst_0_upstream_move_on_to_next_transaction, which is an e_assign
  assign new_work_burst_0_upstream_move_on_to_next_transaction = new_work_burst_0_upstream_this_cycle_is_the_last_burst & new_work_burst_0_upstream_load_fifo;

  //the currently selected burstcount for new_work_burst_0_upstream, which is an e_mux
  assign new_work_burst_0_upstream_selected_burstcount = (cpu_0_instruction_master_granted_new_work_burst_0_upstream)? cpu_0_instruction_master_burstcount :
    1;

  //burstcount_fifo_for_new_work_burst_0_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_new_work_burst_0_upstream_module burstcount_fifo_for_new_work_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_burst_0_upstream_selected_burstcount),
      .data_out             (new_work_burst_0_upstream_transaction_burst_count),
      .empty                (new_work_burst_0_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (new_work_burst_0_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read & new_work_burst_0_upstream_load_fifo & ~(new_work_burst_0_upstream_this_cycle_is_the_last_burst & new_work_burst_0_upstream_burstcount_fifo_empty))
    );

  //new_work_burst_0_upstream current burst minus one, which is an e_assign
  assign new_work_burst_0_upstream_current_burst_minus_one = new_work_burst_0_upstream_current_burst - 1;

  //what to load in current_burst, for new_work_burst_0_upstream, which is an e_mux
  assign new_work_burst_0_upstream_next_burst_count = (((in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read) & ~new_work_burst_0_upstream_load_fifo))? new_work_burst_0_upstream_selected_burstcount :
    ((in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read & new_work_burst_0_upstream_this_cycle_is_the_last_burst & new_work_burst_0_upstream_burstcount_fifo_empty))? new_work_burst_0_upstream_selected_burstcount :
    (new_work_burst_0_upstream_this_cycle_is_the_last_burst)? new_work_burst_0_upstream_transaction_burst_count :
    new_work_burst_0_upstream_current_burst_minus_one;

  //the current burst count for new_work_burst_0_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_upstream_current_burst <= 0;
      else if (new_work_burst_0_upstream_readdatavalid_from_sa | (~new_work_burst_0_upstream_load_fifo & (in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read)))
          new_work_burst_0_upstream_current_burst <= new_work_burst_0_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_new_work_burst_0_upstream_load_fifo = (~new_work_burst_0_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read) & new_work_burst_0_upstream_load_fifo))? 1 :
    ~new_work_burst_0_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read) & ~new_work_burst_0_upstream_load_fifo | new_work_burst_0_upstream_this_cycle_is_the_last_burst)
          new_work_burst_0_upstream_load_fifo <= p0_new_work_burst_0_upstream_load_fifo;
    end


  //the last cycle in the burst for new_work_burst_0_upstream, which is an e_assign
  assign new_work_burst_0_upstream_this_cycle_is_the_last_burst = ~(|new_work_burst_0_upstream_current_burst_minus_one) & new_work_burst_0_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_0_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_0_upstream_module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_new_work_burst_0_upstream),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_0_upstream),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_0_upstream),
      .full                 (),
      .read                 (new_work_burst_0_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_0_upstream_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_0_upstream;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream = new_work_burst_0_upstream_readdatavalid_from_sa;

  //byteaddress mux for new_work_burst_0/upstream, which is an e_mux
  assign new_work_burst_0_upstream_byteaddress = cpu_0_instruction_master_address_to_slave;

  //master is always granted when requested
  assign cpu_0_instruction_master_granted_new_work_burst_0_upstream = cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream;

  //cpu_0/instruction_master saved-grant new_work_burst_0/upstream, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_new_work_burst_0_upstream = cpu_0_instruction_master_requests_new_work_burst_0_upstream;

  //allow new arb cycle for new_work_burst_0/upstream, which is an e_assign
  assign new_work_burst_0_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_burst_0_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_burst_0_upstream_master_qreq_vector = 1;

  //new_work_burst_0_upstream_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_0_upstream_firsttransfer = new_work_burst_0_upstream_begins_xfer ? new_work_burst_0_upstream_unreg_firsttransfer : new_work_burst_0_upstream_reg_firsttransfer;

  //new_work_burst_0_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_0_upstream_unreg_firsttransfer = ~(new_work_burst_0_upstream_slavearbiterlockenable & new_work_burst_0_upstream_any_continuerequest);

  //new_work_burst_0_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_upstream_reg_firsttransfer <= 1'b1;
      else if (new_work_burst_0_upstream_begins_xfer)
          new_work_burst_0_upstream_reg_firsttransfer <= new_work_burst_0_upstream_unreg_firsttransfer;
    end


  //new_work_burst_0_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_burst_0_upstream_beginbursttransfer_internal = new_work_burst_0_upstream_begins_xfer;

  //new_work_burst_0_upstream_read assignment, which is an e_mux
  assign new_work_burst_0_upstream_read = cpu_0_instruction_master_granted_new_work_burst_0_upstream & cpu_0_instruction_master_read;

  //new_work_burst_0_upstream_write assignment, which is an e_mux
  assign new_work_burst_0_upstream_write = 0;

  //new_work_burst_0_upstream_address mux, which is an e_mux
  assign new_work_burst_0_upstream_address = cpu_0_instruction_master_address_to_slave;

  //d1_new_work_burst_0_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_burst_0_upstream_end_xfer <= 1;
      else 
        d1_new_work_burst_0_upstream_end_xfer <= new_work_burst_0_upstream_end_xfer;
    end


  //new_work_burst_0_upstream_waits_for_read in a cycle, which is an e_mux
  assign new_work_burst_0_upstream_waits_for_read = new_work_burst_0_upstream_in_a_read_cycle & new_work_burst_0_upstream_waitrequest_from_sa;

  //new_work_burst_0_upstream_in_a_read_cycle assignment, which is an e_assign
  assign new_work_burst_0_upstream_in_a_read_cycle = cpu_0_instruction_master_granted_new_work_burst_0_upstream & cpu_0_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_burst_0_upstream_in_a_read_cycle;

  //new_work_burst_0_upstream_waits_for_write in a cycle, which is an e_mux
  assign new_work_burst_0_upstream_waits_for_write = new_work_burst_0_upstream_in_a_write_cycle & new_work_burst_0_upstream_waitrequest_from_sa;

  //new_work_burst_0_upstream_in_a_write_cycle assignment, which is an e_assign
  assign new_work_burst_0_upstream_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_burst_0_upstream_in_a_write_cycle;

  assign wait_for_new_work_burst_0_upstream_counter = 0;
  //new_work_burst_0_upstream_byteenable byte enable port mux, which is an e_mux
  assign new_work_burst_0_upstream_byteenable = -1;

  //debugaccess mux, which is an e_mux
  assign new_work_burst_0_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_0/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //cpu_0/instruction_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_instruction_master_requests_new_work_burst_0_upstream && (cpu_0_instruction_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: cpu_0/instruction_master drove 0 on its 'burstcount' port while accessing slave new_work_burst_0/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_0_downstream_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_0_jtag_debug_module_readdata_from_sa,
                                                 d1_cpu_0_jtag_debug_module_end_xfer,
                                                 new_work_burst_0_downstream_address,
                                                 new_work_burst_0_downstream_burstcount,
                                                 new_work_burst_0_downstream_byteenable,
                                                 new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module,
                                                 new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module,
                                                 new_work_burst_0_downstream_read,
                                                 new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module,
                                                 new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module,
                                                 new_work_burst_0_downstream_write,
                                                 new_work_burst_0_downstream_writedata,
                                                 reset_n,

                                                // outputs:
                                                 new_work_burst_0_downstream_address_to_slave,
                                                 new_work_burst_0_downstream_latency_counter,
                                                 new_work_burst_0_downstream_readdata,
                                                 new_work_burst_0_downstream_readdatavalid,
                                                 new_work_burst_0_downstream_reset_n,
                                                 new_work_burst_0_downstream_waitrequest
                                              )
;

  output  [ 10: 0] new_work_burst_0_downstream_address_to_slave;
  output           new_work_burst_0_downstream_latency_counter;
  output  [ 31: 0] new_work_burst_0_downstream_readdata;
  output           new_work_burst_0_downstream_readdatavalid;
  output           new_work_burst_0_downstream_reset_n;
  output           new_work_burst_0_downstream_waitrequest;
  input            clk;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input   [ 10: 0] new_work_burst_0_downstream_address;
  input            new_work_burst_0_downstream_burstcount;
  input   [  3: 0] new_work_burst_0_downstream_byteenable;
  input            new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;
  input            new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module;
  input            new_work_burst_0_downstream_read;
  input            new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module;
  input            new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module;
  input            new_work_burst_0_downstream_write;
  input   [ 31: 0] new_work_burst_0_downstream_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  reg     [ 10: 0] new_work_burst_0_downstream_address_last_time;
  wire    [ 10: 0] new_work_burst_0_downstream_address_to_slave;
  reg              new_work_burst_0_downstream_burstcount_last_time;
  reg     [  3: 0] new_work_burst_0_downstream_byteenable_last_time;
  wire             new_work_burst_0_downstream_is_granted_some_slave;
  reg              new_work_burst_0_downstream_latency_counter;
  reg              new_work_burst_0_downstream_read_but_no_slave_selected;
  reg              new_work_burst_0_downstream_read_last_time;
  wire    [ 31: 0] new_work_burst_0_downstream_readdata;
  wire             new_work_burst_0_downstream_readdatavalid;
  wire             new_work_burst_0_downstream_reset_n;
  wire             new_work_burst_0_downstream_run;
  wire             new_work_burst_0_downstream_waitrequest;
  reg              new_work_burst_0_downstream_write_last_time;
  reg     [ 31: 0] new_work_burst_0_downstream_writedata_last_time;
  wire             p1_new_work_burst_0_downstream_latency_counter;
  wire             pre_flush_new_work_burst_0_downstream_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module | ~new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module) & (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module | ~new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module) & ((~new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module | ~new_work_burst_0_downstream_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & new_work_burst_0_downstream_read))) & ((~new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module | ~new_work_burst_0_downstream_write | (1 & new_work_burst_0_downstream_write)));

  //cascaded wait assignment, which is an e_assign
  assign new_work_burst_0_downstream_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_burst_0_downstream_address_to_slave = new_work_burst_0_downstream_address;

  //new_work_burst_0_downstream_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_read_but_no_slave_selected <= 0;
      else 
        new_work_burst_0_downstream_read_but_no_slave_selected <= new_work_burst_0_downstream_read & new_work_burst_0_downstream_run & ~new_work_burst_0_downstream_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign new_work_burst_0_downstream_is_granted_some_slave = new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_new_work_burst_0_downstream_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign new_work_burst_0_downstream_readdatavalid = new_work_burst_0_downstream_read_but_no_slave_selected |
    pre_flush_new_work_burst_0_downstream_readdatavalid |
    new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module;

  //new_work_burst_0/downstream readdata mux, which is an e_mux
  assign new_work_burst_0_downstream_readdata = cpu_0_jtag_debug_module_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_burst_0_downstream_waitrequest = ~new_work_burst_0_downstream_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_latency_counter <= 0;
      else 
        new_work_burst_0_downstream_latency_counter <= p1_new_work_burst_0_downstream_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_new_work_burst_0_downstream_latency_counter = ((new_work_burst_0_downstream_run & new_work_burst_0_downstream_read))? latency_load_value :
    (new_work_burst_0_downstream_latency_counter)? new_work_burst_0_downstream_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //new_work_burst_0_downstream_reset_n assignment, which is an e_assign
  assign new_work_burst_0_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_0_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_address_last_time <= 0;
      else 
        new_work_burst_0_downstream_address_last_time <= new_work_burst_0_downstream_address;
    end


  //new_work_burst_0/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_burst_0_downstream_waitrequest & (new_work_burst_0_downstream_read | new_work_burst_0_downstream_write);
    end


  //new_work_burst_0_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_address != new_work_burst_0_downstream_address_last_time))
        begin
          $write("%0d ns: new_work_burst_0_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_0_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_burstcount_last_time <= 0;
      else 
        new_work_burst_0_downstream_burstcount_last_time <= new_work_burst_0_downstream_burstcount;
    end


  //new_work_burst_0_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_burstcount != new_work_burst_0_downstream_burstcount_last_time))
        begin
          $write("%0d ns: new_work_burst_0_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_0_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_byteenable_last_time <= 0;
      else 
        new_work_burst_0_downstream_byteenable_last_time <= new_work_burst_0_downstream_byteenable;
    end


  //new_work_burst_0_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_byteenable != new_work_burst_0_downstream_byteenable_last_time))
        begin
          $write("%0d ns: new_work_burst_0_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_0_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_read_last_time <= 0;
      else 
        new_work_burst_0_downstream_read_last_time <= new_work_burst_0_downstream_read;
    end


  //new_work_burst_0_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_read != new_work_burst_0_downstream_read_last_time))
        begin
          $write("%0d ns: new_work_burst_0_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_0_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_write_last_time <= 0;
      else 
        new_work_burst_0_downstream_write_last_time <= new_work_burst_0_downstream_write;
    end


  //new_work_burst_0_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_write != new_work_burst_0_downstream_write_last_time))
        begin
          $write("%0d ns: new_work_burst_0_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_0_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_0_downstream_writedata_last_time <= 0;
      else 
        new_work_burst_0_downstream_writedata_last_time <= new_work_burst_0_downstream_writedata;
    end


  //new_work_burst_0_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_0_downstream_writedata != new_work_burst_0_downstream_writedata_last_time) & new_work_burst_0_downstream_write)
        begin
          $write("%0d ns: new_work_burst_0_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_new_work_burst_1_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  3: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  3: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  3: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  3: 0] p0_stage_0;
  wire             p1_full_1;
  wire    [  3: 0] p1_stage_1;
  reg     [  3: 0] stage_0;
  reg     [  3: 0] stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_1_upstream_module (
                                                                                   // inputs:
                                                                                    clear_fifo,
                                                                                    clk,
                                                                                    data_in,
                                                                                    read,
                                                                                    reset_n,
                                                                                    sync_reset,
                                                                                    write,

                                                                                   // outputs:
                                                                                    data_out,
                                                                                    empty,
                                                                                    fifo_contains_ones_n,
                                                                                    full
                                                                                 )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_1_upstream_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_0_instruction_master_address_to_slave,
                                               cpu_0_instruction_master_burstcount,
                                               cpu_0_instruction_master_latency_counter,
                                               cpu_0_instruction_master_read,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register,
                                               new_work_burst_1_upstream_readdata,
                                               new_work_burst_1_upstream_readdatavalid,
                                               new_work_burst_1_upstream_waitrequest,
                                               reset_n,

                                              // outputs:
                                               cpu_0_instruction_master_granted_new_work_burst_1_upstream,
                                               cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register,
                                               cpu_0_instruction_master_requests_new_work_burst_1_upstream,
                                               d1_new_work_burst_1_upstream_end_xfer,
                                               new_work_burst_1_upstream_address,
                                               new_work_burst_1_upstream_byteaddress,
                                               new_work_burst_1_upstream_byteenable,
                                               new_work_burst_1_upstream_debugaccess,
                                               new_work_burst_1_upstream_read,
                                               new_work_burst_1_upstream_readdata_from_sa,
                                               new_work_burst_1_upstream_waitrequest_from_sa,
                                               new_work_burst_1_upstream_write
                                            )
;

  output           cpu_0_instruction_master_granted_new_work_burst_1_upstream;
  output           cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  output           cpu_0_instruction_master_requests_new_work_burst_1_upstream;
  output           d1_new_work_burst_1_upstream_end_xfer;
  output  [  2: 0] new_work_burst_1_upstream_address;
  output  [  4: 0] new_work_burst_1_upstream_byteaddress;
  output  [  3: 0] new_work_burst_1_upstream_byteenable;
  output           new_work_burst_1_upstream_debugaccess;
  output           new_work_burst_1_upstream_read;
  output  [ 31: 0] new_work_burst_1_upstream_readdata_from_sa;
  output           new_work_burst_1_upstream_waitrequest_from_sa;
  output           new_work_burst_1_upstream_write;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  3: 0] cpu_0_instruction_master_burstcount;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  input   [ 31: 0] new_work_burst_1_upstream_readdata;
  input            new_work_burst_1_upstream_readdatavalid;
  input            new_work_burst_1_upstream_waitrequest;
  input            reset_n;

  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  wire             cpu_0_instruction_master_requests_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_saved_grant_new_work_burst_1_upstream;
  reg              d1_new_work_burst_1_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_burst_1_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] new_work_burst_1_upstream_address;
  wire             new_work_burst_1_upstream_allgrants;
  wire             new_work_burst_1_upstream_allow_new_arb_cycle;
  wire             new_work_burst_1_upstream_any_bursting_master_saved_grant;
  wire             new_work_burst_1_upstream_any_continuerequest;
  wire             new_work_burst_1_upstream_arb_counter_enable;
  reg     [  5: 0] new_work_burst_1_upstream_arb_share_counter;
  wire    [  5: 0] new_work_burst_1_upstream_arb_share_counter_next_value;
  wire    [  5: 0] new_work_burst_1_upstream_arb_share_set_values;
  wire             new_work_burst_1_upstream_beginbursttransfer_internal;
  wire             new_work_burst_1_upstream_begins_xfer;
  wire             new_work_burst_1_upstream_burstcount_fifo_empty;
  wire    [  4: 0] new_work_burst_1_upstream_byteaddress;
  wire    [  3: 0] new_work_burst_1_upstream_byteenable;
  reg     [  3: 0] new_work_burst_1_upstream_current_burst;
  wire    [  3: 0] new_work_burst_1_upstream_current_burst_minus_one;
  wire             new_work_burst_1_upstream_debugaccess;
  wire             new_work_burst_1_upstream_end_xfer;
  wire             new_work_burst_1_upstream_firsttransfer;
  wire             new_work_burst_1_upstream_grant_vector;
  wire             new_work_burst_1_upstream_in_a_read_cycle;
  wire             new_work_burst_1_upstream_in_a_write_cycle;
  reg              new_work_burst_1_upstream_load_fifo;
  wire             new_work_burst_1_upstream_master_qreq_vector;
  wire             new_work_burst_1_upstream_move_on_to_next_transaction;
  wire    [  3: 0] new_work_burst_1_upstream_next_burst_count;
  wire             new_work_burst_1_upstream_non_bursting_master_requests;
  wire             new_work_burst_1_upstream_read;
  wire    [ 31: 0] new_work_burst_1_upstream_readdata_from_sa;
  wire             new_work_burst_1_upstream_readdatavalid_from_sa;
  reg              new_work_burst_1_upstream_reg_firsttransfer;
  wire    [  3: 0] new_work_burst_1_upstream_selected_burstcount;
  reg              new_work_burst_1_upstream_slavearbiterlockenable;
  wire             new_work_burst_1_upstream_slavearbiterlockenable2;
  wire             new_work_burst_1_upstream_this_cycle_is_the_last_burst;
  wire    [  3: 0] new_work_burst_1_upstream_transaction_burst_count;
  wire             new_work_burst_1_upstream_unreg_firsttransfer;
  wire             new_work_burst_1_upstream_waitrequest_from_sa;
  wire             new_work_burst_1_upstream_waits_for_read;
  wire             new_work_burst_1_upstream_waits_for_write;
  wire             new_work_burst_1_upstream_write;
  wire             p0_new_work_burst_1_upstream_load_fifo;
  wire             wait_for_new_work_burst_1_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_burst_1_upstream_end_xfer;
    end


  assign new_work_burst_1_upstream_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream));
  //assign new_work_burst_1_upstream_readdatavalid_from_sa = new_work_burst_1_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_1_upstream_readdatavalid_from_sa = new_work_burst_1_upstream_readdatavalid;

  //assign new_work_burst_1_upstream_readdata_from_sa = new_work_burst_1_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_1_upstream_readdata_from_sa = new_work_burst_1_upstream_readdata;

  assign cpu_0_instruction_master_requests_new_work_burst_1_upstream = (({cpu_0_instruction_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801018) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //assign new_work_burst_1_upstream_waitrequest_from_sa = new_work_burst_1_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_1_upstream_waitrequest_from_sa = new_work_burst_1_upstream_waitrequest;

  //new_work_burst_1_upstream_arb_share_counter set values, which is an e_mux
  assign new_work_burst_1_upstream_arb_share_set_values = 1;

  //new_work_burst_1_upstream_non_bursting_master_requests mux, which is an e_mux
  assign new_work_burst_1_upstream_non_bursting_master_requests = 0;

  //new_work_burst_1_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_burst_1_upstream_any_bursting_master_saved_grant = cpu_0_instruction_master_saved_grant_new_work_burst_1_upstream;

  //new_work_burst_1_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_burst_1_upstream_arb_share_counter_next_value = new_work_burst_1_upstream_firsttransfer ? (new_work_burst_1_upstream_arb_share_set_values - 1) : |new_work_burst_1_upstream_arb_share_counter ? (new_work_burst_1_upstream_arb_share_counter - 1) : 0;

  //new_work_burst_1_upstream_allgrants all slave grants, which is an e_mux
  assign new_work_burst_1_upstream_allgrants = |new_work_burst_1_upstream_grant_vector;

  //new_work_burst_1_upstream_end_xfer assignment, which is an e_assign
  assign new_work_burst_1_upstream_end_xfer = ~(new_work_burst_1_upstream_waits_for_read | new_work_burst_1_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_burst_1_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_burst_1_upstream = new_work_burst_1_upstream_end_xfer & (~new_work_burst_1_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_burst_1_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_burst_1_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_burst_1_upstream & new_work_burst_1_upstream_allgrants) | (end_xfer_arb_share_counter_term_new_work_burst_1_upstream & ~new_work_burst_1_upstream_non_bursting_master_requests);

  //new_work_burst_1_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_upstream_arb_share_counter <= 0;
      else if (new_work_burst_1_upstream_arb_counter_enable)
          new_work_burst_1_upstream_arb_share_counter <= new_work_burst_1_upstream_arb_share_counter_next_value;
    end


  //new_work_burst_1_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_upstream_slavearbiterlockenable <= 0;
      else if ((|new_work_burst_1_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_burst_1_upstream) | (end_xfer_arb_share_counter_term_new_work_burst_1_upstream & ~new_work_burst_1_upstream_non_bursting_master_requests))
          new_work_burst_1_upstream_slavearbiterlockenable <= |new_work_burst_1_upstream_arb_share_counter_next_value;
    end


  //cpu_0/instruction_master new_work_burst_1/upstream arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = new_work_burst_1_upstream_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //new_work_burst_1_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_burst_1_upstream_slavearbiterlockenable2 = |new_work_burst_1_upstream_arb_share_counter_next_value;

  //cpu_0/instruction_master new_work_burst_1/upstream arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = new_work_burst_1_upstream_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //new_work_burst_1_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_burst_1_upstream_any_continuerequest = 1;

  //cpu_0_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_0_instruction_master_continuerequest = 1;

  assign cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream = cpu_0_instruction_master_requests_new_work_burst_1_upstream & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register))));
  //unique name for new_work_burst_1_upstream_move_on_to_next_transaction, which is an e_assign
  assign new_work_burst_1_upstream_move_on_to_next_transaction = new_work_burst_1_upstream_this_cycle_is_the_last_burst & new_work_burst_1_upstream_load_fifo;

  //the currently selected burstcount for new_work_burst_1_upstream, which is an e_mux
  assign new_work_burst_1_upstream_selected_burstcount = (cpu_0_instruction_master_granted_new_work_burst_1_upstream)? cpu_0_instruction_master_burstcount :
    1;

  //burstcount_fifo_for_new_work_burst_1_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_new_work_burst_1_upstream_module burstcount_fifo_for_new_work_burst_1_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_burst_1_upstream_selected_burstcount),
      .data_out             (new_work_burst_1_upstream_transaction_burst_count),
      .empty                (new_work_burst_1_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (new_work_burst_1_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read & new_work_burst_1_upstream_load_fifo & ~(new_work_burst_1_upstream_this_cycle_is_the_last_burst & new_work_burst_1_upstream_burstcount_fifo_empty))
    );

  //new_work_burst_1_upstream current burst minus one, which is an e_assign
  assign new_work_burst_1_upstream_current_burst_minus_one = new_work_burst_1_upstream_current_burst - 1;

  //what to load in current_burst, for new_work_burst_1_upstream, which is an e_mux
  assign new_work_burst_1_upstream_next_burst_count = (((in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read) & ~new_work_burst_1_upstream_load_fifo))? new_work_burst_1_upstream_selected_burstcount :
    ((in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read & new_work_burst_1_upstream_this_cycle_is_the_last_burst & new_work_burst_1_upstream_burstcount_fifo_empty))? new_work_burst_1_upstream_selected_burstcount :
    (new_work_burst_1_upstream_this_cycle_is_the_last_burst)? new_work_burst_1_upstream_transaction_burst_count :
    new_work_burst_1_upstream_current_burst_minus_one;

  //the current burst count for new_work_burst_1_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_upstream_current_burst <= 0;
      else if (new_work_burst_1_upstream_readdatavalid_from_sa | (~new_work_burst_1_upstream_load_fifo & (in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read)))
          new_work_burst_1_upstream_current_burst <= new_work_burst_1_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_new_work_burst_1_upstream_load_fifo = (~new_work_burst_1_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read) & new_work_burst_1_upstream_load_fifo))? 1 :
    ~new_work_burst_1_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read) & ~new_work_burst_1_upstream_load_fifo | new_work_burst_1_upstream_this_cycle_is_the_last_burst)
          new_work_burst_1_upstream_load_fifo <= p0_new_work_burst_1_upstream_load_fifo;
    end


  //the last cycle in the burst for new_work_burst_1_upstream, which is an e_assign
  assign new_work_burst_1_upstream_this_cycle_is_the_last_burst = ~(|new_work_burst_1_upstream_current_burst_minus_one) & new_work_burst_1_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_1_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_1_upstream_module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_1_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_new_work_burst_1_upstream),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_1_upstream),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_1_upstream),
      .full                 (),
      .read                 (new_work_burst_1_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_1_upstream_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_1_upstream;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream = new_work_burst_1_upstream_readdatavalid_from_sa;

  //byteaddress mux for new_work_burst_1/upstream, which is an e_mux
  assign new_work_burst_1_upstream_byteaddress = cpu_0_instruction_master_address_to_slave;

  //master is always granted when requested
  assign cpu_0_instruction_master_granted_new_work_burst_1_upstream = cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream;

  //cpu_0/instruction_master saved-grant new_work_burst_1/upstream, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_new_work_burst_1_upstream = cpu_0_instruction_master_requests_new_work_burst_1_upstream;

  //allow new arb cycle for new_work_burst_1/upstream, which is an e_assign
  assign new_work_burst_1_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_burst_1_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_burst_1_upstream_master_qreq_vector = 1;

  //new_work_burst_1_upstream_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_1_upstream_firsttransfer = new_work_burst_1_upstream_begins_xfer ? new_work_burst_1_upstream_unreg_firsttransfer : new_work_burst_1_upstream_reg_firsttransfer;

  //new_work_burst_1_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_1_upstream_unreg_firsttransfer = ~(new_work_burst_1_upstream_slavearbiterlockenable & new_work_burst_1_upstream_any_continuerequest);

  //new_work_burst_1_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_upstream_reg_firsttransfer <= 1'b1;
      else if (new_work_burst_1_upstream_begins_xfer)
          new_work_burst_1_upstream_reg_firsttransfer <= new_work_burst_1_upstream_unreg_firsttransfer;
    end


  //new_work_burst_1_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_burst_1_upstream_beginbursttransfer_internal = new_work_burst_1_upstream_begins_xfer;

  //new_work_burst_1_upstream_read assignment, which is an e_mux
  assign new_work_burst_1_upstream_read = cpu_0_instruction_master_granted_new_work_burst_1_upstream & cpu_0_instruction_master_read;

  //new_work_burst_1_upstream_write assignment, which is an e_mux
  assign new_work_burst_1_upstream_write = 0;

  //new_work_burst_1_upstream_address mux, which is an e_mux
  assign new_work_burst_1_upstream_address = cpu_0_instruction_master_address_to_slave;

  //d1_new_work_burst_1_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_burst_1_upstream_end_xfer <= 1;
      else 
        d1_new_work_burst_1_upstream_end_xfer <= new_work_burst_1_upstream_end_xfer;
    end


  //new_work_burst_1_upstream_waits_for_read in a cycle, which is an e_mux
  assign new_work_burst_1_upstream_waits_for_read = new_work_burst_1_upstream_in_a_read_cycle & new_work_burst_1_upstream_waitrequest_from_sa;

  //new_work_burst_1_upstream_in_a_read_cycle assignment, which is an e_assign
  assign new_work_burst_1_upstream_in_a_read_cycle = cpu_0_instruction_master_granted_new_work_burst_1_upstream & cpu_0_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_burst_1_upstream_in_a_read_cycle;

  //new_work_burst_1_upstream_waits_for_write in a cycle, which is an e_mux
  assign new_work_burst_1_upstream_waits_for_write = new_work_burst_1_upstream_in_a_write_cycle & new_work_burst_1_upstream_waitrequest_from_sa;

  //new_work_burst_1_upstream_in_a_write_cycle assignment, which is an e_assign
  assign new_work_burst_1_upstream_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_burst_1_upstream_in_a_write_cycle;

  assign wait_for_new_work_burst_1_upstream_counter = 0;
  //new_work_burst_1_upstream_byteenable byte enable port mux, which is an e_mux
  assign new_work_burst_1_upstream_byteenable = -1;

  //debugaccess mux, which is an e_mux
  assign new_work_burst_1_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_1/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //cpu_0/instruction_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_instruction_master_requests_new_work_burst_1_upstream && (cpu_0_instruction_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: cpu_0/instruction_master drove 0 on its 'burstcount' port while accessing slave new_work_burst_1/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_1_downstream_arbitrator (
                                                // inputs:
                                                 altpll_0_pll_slave_readdata_from_sa,
                                                 clk,
                                                 d1_altpll_0_pll_slave_end_xfer,
                                                 new_work_burst_1_downstream_address,
                                                 new_work_burst_1_downstream_burstcount,
                                                 new_work_burst_1_downstream_byteenable,
                                                 new_work_burst_1_downstream_granted_altpll_0_pll_slave,
                                                 new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave,
                                                 new_work_burst_1_downstream_read,
                                                 new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave,
                                                 new_work_burst_1_downstream_requests_altpll_0_pll_slave,
                                                 new_work_burst_1_downstream_write,
                                                 new_work_burst_1_downstream_writedata,
                                                 reset_n,

                                                // outputs:
                                                 new_work_burst_1_downstream_address_to_slave,
                                                 new_work_burst_1_downstream_latency_counter,
                                                 new_work_burst_1_downstream_readdata,
                                                 new_work_burst_1_downstream_readdatavalid,
                                                 new_work_burst_1_downstream_reset_n,
                                                 new_work_burst_1_downstream_waitrequest
                                              )
;

  output  [  2: 0] new_work_burst_1_downstream_address_to_slave;
  output           new_work_burst_1_downstream_latency_counter;
  output  [ 31: 0] new_work_burst_1_downstream_readdata;
  output           new_work_burst_1_downstream_readdatavalid;
  output           new_work_burst_1_downstream_reset_n;
  output           new_work_burst_1_downstream_waitrequest;
  input   [ 31: 0] altpll_0_pll_slave_readdata_from_sa;
  input            clk;
  input            d1_altpll_0_pll_slave_end_xfer;
  input   [  2: 0] new_work_burst_1_downstream_address;
  input            new_work_burst_1_downstream_burstcount;
  input   [  3: 0] new_work_burst_1_downstream_byteenable;
  input            new_work_burst_1_downstream_granted_altpll_0_pll_slave;
  input            new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave;
  input            new_work_burst_1_downstream_read;
  input            new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave;
  input            new_work_burst_1_downstream_requests_altpll_0_pll_slave;
  input            new_work_burst_1_downstream_write;
  input   [ 31: 0] new_work_burst_1_downstream_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  reg     [  2: 0] new_work_burst_1_downstream_address_last_time;
  wire    [  2: 0] new_work_burst_1_downstream_address_to_slave;
  reg              new_work_burst_1_downstream_burstcount_last_time;
  reg     [  3: 0] new_work_burst_1_downstream_byteenable_last_time;
  wire             new_work_burst_1_downstream_is_granted_some_slave;
  reg              new_work_burst_1_downstream_latency_counter;
  reg              new_work_burst_1_downstream_read_but_no_slave_selected;
  reg              new_work_burst_1_downstream_read_last_time;
  wire    [ 31: 0] new_work_burst_1_downstream_readdata;
  wire             new_work_burst_1_downstream_readdatavalid;
  wire             new_work_burst_1_downstream_reset_n;
  wire             new_work_burst_1_downstream_run;
  wire             new_work_burst_1_downstream_waitrequest;
  reg              new_work_burst_1_downstream_write_last_time;
  reg     [ 31: 0] new_work_burst_1_downstream_writedata_last_time;
  wire             p1_new_work_burst_1_downstream_latency_counter;
  wire             pre_flush_new_work_burst_1_downstream_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave | ~new_work_burst_1_downstream_requests_altpll_0_pll_slave) & (new_work_burst_1_downstream_granted_altpll_0_pll_slave | ~new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave) & ((~new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave | ~(new_work_burst_1_downstream_read | new_work_burst_1_downstream_write) | (1 & (new_work_burst_1_downstream_read | new_work_burst_1_downstream_write)))) & ((~new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave | ~(new_work_burst_1_downstream_read | new_work_burst_1_downstream_write) | (1 & (new_work_burst_1_downstream_read | new_work_burst_1_downstream_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_burst_1_downstream_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_burst_1_downstream_address_to_slave = new_work_burst_1_downstream_address;

  //new_work_burst_1_downstream_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_read_but_no_slave_selected <= 0;
      else 
        new_work_burst_1_downstream_read_but_no_slave_selected <= new_work_burst_1_downstream_read & new_work_burst_1_downstream_run & ~new_work_burst_1_downstream_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign new_work_burst_1_downstream_is_granted_some_slave = new_work_burst_1_downstream_granted_altpll_0_pll_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_new_work_burst_1_downstream_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign new_work_burst_1_downstream_readdatavalid = new_work_burst_1_downstream_read_but_no_slave_selected |
    pre_flush_new_work_burst_1_downstream_readdatavalid |
    new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave;

  //new_work_burst_1/downstream readdata mux, which is an e_mux
  assign new_work_burst_1_downstream_readdata = altpll_0_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_burst_1_downstream_waitrequest = ~new_work_burst_1_downstream_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_latency_counter <= 0;
      else 
        new_work_burst_1_downstream_latency_counter <= p1_new_work_burst_1_downstream_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_new_work_burst_1_downstream_latency_counter = ((new_work_burst_1_downstream_run & new_work_burst_1_downstream_read))? latency_load_value :
    (new_work_burst_1_downstream_latency_counter)? new_work_burst_1_downstream_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //new_work_burst_1_downstream_reset_n assignment, which is an e_assign
  assign new_work_burst_1_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_1_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_address_last_time <= 0;
      else 
        new_work_burst_1_downstream_address_last_time <= new_work_burst_1_downstream_address;
    end


  //new_work_burst_1/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_burst_1_downstream_waitrequest & (new_work_burst_1_downstream_read | new_work_burst_1_downstream_write);
    end


  //new_work_burst_1_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_address != new_work_burst_1_downstream_address_last_time))
        begin
          $write("%0d ns: new_work_burst_1_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_1_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_burstcount_last_time <= 0;
      else 
        new_work_burst_1_downstream_burstcount_last_time <= new_work_burst_1_downstream_burstcount;
    end


  //new_work_burst_1_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_burstcount != new_work_burst_1_downstream_burstcount_last_time))
        begin
          $write("%0d ns: new_work_burst_1_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_1_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_byteenable_last_time <= 0;
      else 
        new_work_burst_1_downstream_byteenable_last_time <= new_work_burst_1_downstream_byteenable;
    end


  //new_work_burst_1_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_byteenable != new_work_burst_1_downstream_byteenable_last_time))
        begin
          $write("%0d ns: new_work_burst_1_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_1_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_read_last_time <= 0;
      else 
        new_work_burst_1_downstream_read_last_time <= new_work_burst_1_downstream_read;
    end


  //new_work_burst_1_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_read != new_work_burst_1_downstream_read_last_time))
        begin
          $write("%0d ns: new_work_burst_1_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_1_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_write_last_time <= 0;
      else 
        new_work_burst_1_downstream_write_last_time <= new_work_burst_1_downstream_write;
    end


  //new_work_burst_1_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_write != new_work_burst_1_downstream_write_last_time))
        begin
          $write("%0d ns: new_work_burst_1_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_1_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_1_downstream_writedata_last_time <= 0;
      else 
        new_work_burst_1_downstream_writedata_last_time <= new_work_burst_1_downstream_writedata;
    end


  //new_work_burst_1_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_1_downstream_writedata != new_work_burst_1_downstream_writedata_last_time) & new_work_burst_1_downstream_write)
        begin
          $write("%0d ns: new_work_burst_1_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_new_work_burst_2_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  4: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  4: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  4: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  4: 0] p0_stage_0;
  wire             p1_full_1;
  wire    [  4: 0] p1_stage_1;
  wire             p2_full_2;
  wire    [  4: 0] p2_stage_2;
  wire             p3_full_3;
  wire    [  4: 0] p3_stage_3;
  wire             p4_full_4;
  wire    [  4: 0] p4_stage_4;
  wire             p5_full_5;
  wire    [  4: 0] p5_stage_5;
  wire             p6_full_6;
  wire    [  4: 0] p6_stage_6;
  reg     [  4: 0] stage_0;
  reg     [  4: 0] stage_1;
  reg     [  4: 0] stage_2;
  reg     [  4: 0] stage_3;
  reg     [  4: 0] stage_4;
  reg     [  4: 0] stage_5;
  reg     [  4: 0] stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_2_upstream_module (
                                                                                   // inputs:
                                                                                    clear_fifo,
                                                                                    clk,
                                                                                    data_in,
                                                                                    read,
                                                                                    reset_n,
                                                                                    sync_reset,
                                                                                    write,

                                                                                   // outputs:
                                                                                    data_out,
                                                                                    empty,
                                                                                    fifo_contains_ones_n,
                                                                                    full
                                                                                 )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_2_upstream_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_0_instruction_master_address_to_slave,
                                               cpu_0_instruction_master_burstcount,
                                               cpu_0_instruction_master_dbs_address,
                                               cpu_0_instruction_master_latency_counter,
                                               cpu_0_instruction_master_read,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register,
                                               new_work_burst_2_upstream_readdata,
                                               new_work_burst_2_upstream_readdatavalid,
                                               new_work_burst_2_upstream_waitrequest,
                                               reset_n,

                                              // outputs:
                                               cpu_0_instruction_master_granted_new_work_burst_2_upstream,
                                               cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register,
                                               cpu_0_instruction_master_requests_new_work_burst_2_upstream,
                                               d1_new_work_burst_2_upstream_end_xfer,
                                               new_work_burst_2_upstream_address,
                                               new_work_burst_2_upstream_byteaddress,
                                               new_work_burst_2_upstream_byteenable,
                                               new_work_burst_2_upstream_debugaccess,
                                               new_work_burst_2_upstream_read,
                                               new_work_burst_2_upstream_readdata_from_sa,
                                               new_work_burst_2_upstream_waitrequest_from_sa,
                                               new_work_burst_2_upstream_write
                                            )
;

  output           cpu_0_instruction_master_granted_new_work_burst_2_upstream;
  output           cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  output           cpu_0_instruction_master_requests_new_work_burst_2_upstream;
  output           d1_new_work_burst_2_upstream_end_xfer;
  output  [ 22: 0] new_work_burst_2_upstream_address;
  output  [ 23: 0] new_work_burst_2_upstream_byteaddress;
  output  [  1: 0] new_work_burst_2_upstream_byteenable;
  output           new_work_burst_2_upstream_debugaccess;
  output           new_work_burst_2_upstream_read;
  output  [ 15: 0] new_work_burst_2_upstream_readdata_from_sa;
  output           new_work_burst_2_upstream_waitrequest_from_sa;
  output           new_work_burst_2_upstream_write;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  3: 0] cpu_0_instruction_master_burstcount;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  input   [ 15: 0] new_work_burst_2_upstream_readdata;
  input            new_work_burst_2_upstream_readdatavalid;
  input            new_work_burst_2_upstream_waitrequest;
  input            reset_n;

  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  wire             cpu_0_instruction_master_requests_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_saved_grant_new_work_burst_2_upstream;
  reg              d1_new_work_burst_2_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_burst_2_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] new_work_burst_2_upstream_address;
  wire             new_work_burst_2_upstream_allgrants;
  wire             new_work_burst_2_upstream_allow_new_arb_cycle;
  wire             new_work_burst_2_upstream_any_bursting_master_saved_grant;
  wire             new_work_burst_2_upstream_any_continuerequest;
  wire             new_work_burst_2_upstream_arb_counter_enable;
  reg     [  5: 0] new_work_burst_2_upstream_arb_share_counter;
  wire    [  5: 0] new_work_burst_2_upstream_arb_share_counter_next_value;
  wire    [  5: 0] new_work_burst_2_upstream_arb_share_set_values;
  wire             new_work_burst_2_upstream_beginbursttransfer_internal;
  wire             new_work_burst_2_upstream_begins_xfer;
  wire             new_work_burst_2_upstream_burstcount_fifo_empty;
  wire    [ 23: 0] new_work_burst_2_upstream_byteaddress;
  wire    [  1: 0] new_work_burst_2_upstream_byteenable;
  reg     [  4: 0] new_work_burst_2_upstream_current_burst;
  wire    [  4: 0] new_work_burst_2_upstream_current_burst_minus_one;
  wire             new_work_burst_2_upstream_debugaccess;
  wire             new_work_burst_2_upstream_end_xfer;
  wire             new_work_burst_2_upstream_firsttransfer;
  wire             new_work_burst_2_upstream_grant_vector;
  wire             new_work_burst_2_upstream_in_a_read_cycle;
  wire             new_work_burst_2_upstream_in_a_write_cycle;
  reg              new_work_burst_2_upstream_load_fifo;
  wire             new_work_burst_2_upstream_master_qreq_vector;
  wire             new_work_burst_2_upstream_move_on_to_next_transaction;
  wire    [  4: 0] new_work_burst_2_upstream_next_burst_count;
  wire             new_work_burst_2_upstream_non_bursting_master_requests;
  wire             new_work_burst_2_upstream_read;
  wire    [ 15: 0] new_work_burst_2_upstream_readdata_from_sa;
  wire             new_work_burst_2_upstream_readdatavalid_from_sa;
  reg              new_work_burst_2_upstream_reg_firsttransfer;
  wire    [  4: 0] new_work_burst_2_upstream_selected_burstcount;
  reg              new_work_burst_2_upstream_slavearbiterlockenable;
  wire             new_work_burst_2_upstream_slavearbiterlockenable2;
  wire             new_work_burst_2_upstream_this_cycle_is_the_last_burst;
  wire    [  4: 0] new_work_burst_2_upstream_transaction_burst_count;
  wire             new_work_burst_2_upstream_unreg_firsttransfer;
  wire             new_work_burst_2_upstream_waitrequest_from_sa;
  wire             new_work_burst_2_upstream_waits_for_read;
  wire             new_work_burst_2_upstream_waits_for_write;
  wire             new_work_burst_2_upstream_write;
  wire             p0_new_work_burst_2_upstream_load_fifo;
  wire             wait_for_new_work_burst_2_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_burst_2_upstream_end_xfer;
    end


  assign new_work_burst_2_upstream_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream));
  //assign new_work_burst_2_upstream_readdatavalid_from_sa = new_work_burst_2_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_2_upstream_readdatavalid_from_sa = new_work_burst_2_upstream_readdatavalid;

  //assign new_work_burst_2_upstream_readdata_from_sa = new_work_burst_2_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_2_upstream_readdata_from_sa = new_work_burst_2_upstream_readdata;

  assign cpu_0_instruction_master_requests_new_work_burst_2_upstream = (({cpu_0_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //assign new_work_burst_2_upstream_waitrequest_from_sa = new_work_burst_2_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_2_upstream_waitrequest_from_sa = new_work_burst_2_upstream_waitrequest;

  //new_work_burst_2_upstream_arb_share_counter set values, which is an e_mux
  assign new_work_burst_2_upstream_arb_share_set_values = 1;

  //new_work_burst_2_upstream_non_bursting_master_requests mux, which is an e_mux
  assign new_work_burst_2_upstream_non_bursting_master_requests = 0;

  //new_work_burst_2_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_burst_2_upstream_any_bursting_master_saved_grant = cpu_0_instruction_master_saved_grant_new_work_burst_2_upstream;

  //new_work_burst_2_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_burst_2_upstream_arb_share_counter_next_value = new_work_burst_2_upstream_firsttransfer ? (new_work_burst_2_upstream_arb_share_set_values - 1) : |new_work_burst_2_upstream_arb_share_counter ? (new_work_burst_2_upstream_arb_share_counter - 1) : 0;

  //new_work_burst_2_upstream_allgrants all slave grants, which is an e_mux
  assign new_work_burst_2_upstream_allgrants = |new_work_burst_2_upstream_grant_vector;

  //new_work_burst_2_upstream_end_xfer assignment, which is an e_assign
  assign new_work_burst_2_upstream_end_xfer = ~(new_work_burst_2_upstream_waits_for_read | new_work_burst_2_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_burst_2_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_burst_2_upstream = new_work_burst_2_upstream_end_xfer & (~new_work_burst_2_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_burst_2_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_burst_2_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_burst_2_upstream & new_work_burst_2_upstream_allgrants) | (end_xfer_arb_share_counter_term_new_work_burst_2_upstream & ~new_work_burst_2_upstream_non_bursting_master_requests);

  //new_work_burst_2_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_upstream_arb_share_counter <= 0;
      else if (new_work_burst_2_upstream_arb_counter_enable)
          new_work_burst_2_upstream_arb_share_counter <= new_work_burst_2_upstream_arb_share_counter_next_value;
    end


  //new_work_burst_2_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_upstream_slavearbiterlockenable <= 0;
      else if ((|new_work_burst_2_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_burst_2_upstream) | (end_xfer_arb_share_counter_term_new_work_burst_2_upstream & ~new_work_burst_2_upstream_non_bursting_master_requests))
          new_work_burst_2_upstream_slavearbiterlockenable <= |new_work_burst_2_upstream_arb_share_counter_next_value;
    end


  //cpu_0/instruction_master new_work_burst_2/upstream arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = new_work_burst_2_upstream_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //new_work_burst_2_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_burst_2_upstream_slavearbiterlockenable2 = |new_work_burst_2_upstream_arb_share_counter_next_value;

  //cpu_0/instruction_master new_work_burst_2/upstream arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = new_work_burst_2_upstream_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //new_work_burst_2_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_burst_2_upstream_any_continuerequest = 1;

  //cpu_0_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_0_instruction_master_continuerequest = 1;

  assign cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream = cpu_0_instruction_master_requests_new_work_burst_2_upstream & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register))));
  //unique name for new_work_burst_2_upstream_move_on_to_next_transaction, which is an e_assign
  assign new_work_burst_2_upstream_move_on_to_next_transaction = new_work_burst_2_upstream_this_cycle_is_the_last_burst & new_work_burst_2_upstream_load_fifo;

  //the currently selected burstcount for new_work_burst_2_upstream, which is an e_mux
  assign new_work_burst_2_upstream_selected_burstcount = (cpu_0_instruction_master_granted_new_work_burst_2_upstream)? cpu_0_instruction_master_burstcount :
    1;

  //burstcount_fifo_for_new_work_burst_2_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_new_work_burst_2_upstream_module burstcount_fifo_for_new_work_burst_2_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_burst_2_upstream_selected_burstcount),
      .data_out             (new_work_burst_2_upstream_transaction_burst_count),
      .empty                (new_work_burst_2_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (new_work_burst_2_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read & new_work_burst_2_upstream_load_fifo & ~(new_work_burst_2_upstream_this_cycle_is_the_last_burst & new_work_burst_2_upstream_burstcount_fifo_empty))
    );

  //new_work_burst_2_upstream current burst minus one, which is an e_assign
  assign new_work_burst_2_upstream_current_burst_minus_one = new_work_burst_2_upstream_current_burst - 1;

  //what to load in current_burst, for new_work_burst_2_upstream, which is an e_mux
  assign new_work_burst_2_upstream_next_burst_count = (((in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read) & ~new_work_burst_2_upstream_load_fifo))? {new_work_burst_2_upstream_selected_burstcount, 1'b0} :
    ((in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read & new_work_burst_2_upstream_this_cycle_is_the_last_burst & new_work_burst_2_upstream_burstcount_fifo_empty))? {new_work_burst_2_upstream_selected_burstcount, 1'b0} :
    (new_work_burst_2_upstream_this_cycle_is_the_last_burst)? {new_work_burst_2_upstream_transaction_burst_count,  1'b0} :
    new_work_burst_2_upstream_current_burst_minus_one;

  //the current burst count for new_work_burst_2_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_upstream_current_burst <= 0;
      else if (new_work_burst_2_upstream_readdatavalid_from_sa | (~new_work_burst_2_upstream_load_fifo & (in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read)))
          new_work_burst_2_upstream_current_burst <= new_work_burst_2_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_new_work_burst_2_upstream_load_fifo = (~new_work_burst_2_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read) & new_work_burst_2_upstream_load_fifo))? 1 :
    ~new_work_burst_2_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read) & ~new_work_burst_2_upstream_load_fifo | new_work_burst_2_upstream_this_cycle_is_the_last_burst)
          new_work_burst_2_upstream_load_fifo <= p0_new_work_burst_2_upstream_load_fifo;
    end


  //the last cycle in the burst for new_work_burst_2_upstream, which is an e_assign
  assign new_work_burst_2_upstream_this_cycle_is_the_last_burst = ~(|new_work_burst_2_upstream_current_burst_minus_one) & new_work_burst_2_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_2_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_2_upstream_module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_2_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_new_work_burst_2_upstream),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_2_upstream),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_2_upstream),
      .full                 (),
      .read                 (new_work_burst_2_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_2_upstream_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_2_upstream;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream = new_work_burst_2_upstream_readdatavalid_from_sa;

  //byteaddress mux for new_work_burst_2/upstream, which is an e_mux
  assign new_work_burst_2_upstream_byteaddress = cpu_0_instruction_master_address_to_slave;

  //master is always granted when requested
  assign cpu_0_instruction_master_granted_new_work_burst_2_upstream = cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream;

  //cpu_0/instruction_master saved-grant new_work_burst_2/upstream, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_new_work_burst_2_upstream = cpu_0_instruction_master_requests_new_work_burst_2_upstream;

  //allow new arb cycle for new_work_burst_2/upstream, which is an e_assign
  assign new_work_burst_2_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_burst_2_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_burst_2_upstream_master_qreq_vector = 1;

  //new_work_burst_2_upstream_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_2_upstream_firsttransfer = new_work_burst_2_upstream_begins_xfer ? new_work_burst_2_upstream_unreg_firsttransfer : new_work_burst_2_upstream_reg_firsttransfer;

  //new_work_burst_2_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_2_upstream_unreg_firsttransfer = ~(new_work_burst_2_upstream_slavearbiterlockenable & new_work_burst_2_upstream_any_continuerequest);

  //new_work_burst_2_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_upstream_reg_firsttransfer <= 1'b1;
      else if (new_work_burst_2_upstream_begins_xfer)
          new_work_burst_2_upstream_reg_firsttransfer <= new_work_burst_2_upstream_unreg_firsttransfer;
    end


  //new_work_burst_2_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_burst_2_upstream_beginbursttransfer_internal = new_work_burst_2_upstream_begins_xfer;

  //new_work_burst_2_upstream_read assignment, which is an e_mux
  assign new_work_burst_2_upstream_read = cpu_0_instruction_master_granted_new_work_burst_2_upstream & cpu_0_instruction_master_read;

  //new_work_burst_2_upstream_write assignment, which is an e_mux
  assign new_work_burst_2_upstream_write = 0;

  //new_work_burst_2_upstream_address mux, which is an e_mux
  assign new_work_burst_2_upstream_address = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_new_work_burst_2_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_burst_2_upstream_end_xfer <= 1;
      else 
        d1_new_work_burst_2_upstream_end_xfer <= new_work_burst_2_upstream_end_xfer;
    end


  //new_work_burst_2_upstream_waits_for_read in a cycle, which is an e_mux
  assign new_work_burst_2_upstream_waits_for_read = new_work_burst_2_upstream_in_a_read_cycle & new_work_burst_2_upstream_waitrequest_from_sa;

  //new_work_burst_2_upstream_in_a_read_cycle assignment, which is an e_assign
  assign new_work_burst_2_upstream_in_a_read_cycle = cpu_0_instruction_master_granted_new_work_burst_2_upstream & cpu_0_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_burst_2_upstream_in_a_read_cycle;

  //new_work_burst_2_upstream_waits_for_write in a cycle, which is an e_mux
  assign new_work_burst_2_upstream_waits_for_write = new_work_burst_2_upstream_in_a_write_cycle & new_work_burst_2_upstream_waitrequest_from_sa;

  //new_work_burst_2_upstream_in_a_write_cycle assignment, which is an e_assign
  assign new_work_burst_2_upstream_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_burst_2_upstream_in_a_write_cycle;

  assign wait_for_new_work_burst_2_upstream_counter = 0;
  //new_work_burst_2_upstream_byteenable byte enable port mux, which is an e_mux
  assign new_work_burst_2_upstream_byteenable = -1;

  //debugaccess mux, which is an e_mux
  assign new_work_burst_2_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_2/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //cpu_0/instruction_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_instruction_master_requests_new_work_burst_2_upstream && (cpu_0_instruction_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: cpu_0/instruction_master drove 0 on its 'burstcount' port while accessing slave new_work_burst_2/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_2_downstream_arbitrator (
                                                // inputs:
                                                 clk,
                                                 d1_new_work_clock_2_in_end_xfer,
                                                 new_work_burst_2_downstream_address,
                                                 new_work_burst_2_downstream_burstcount,
                                                 new_work_burst_2_downstream_byteenable,
                                                 new_work_burst_2_downstream_granted_new_work_clock_2_in,
                                                 new_work_burst_2_downstream_qualified_request_new_work_clock_2_in,
                                                 new_work_burst_2_downstream_read,
                                                 new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in,
                                                 new_work_burst_2_downstream_requests_new_work_clock_2_in,
                                                 new_work_burst_2_downstream_write,
                                                 new_work_burst_2_downstream_writedata,
                                                 new_work_clock_2_in_readdata_from_sa,
                                                 new_work_clock_2_in_waitrequest_from_sa,
                                                 reset_n,

                                                // outputs:
                                                 new_work_burst_2_downstream_address_to_slave,
                                                 new_work_burst_2_downstream_latency_counter,
                                                 new_work_burst_2_downstream_readdata,
                                                 new_work_burst_2_downstream_readdatavalid,
                                                 new_work_burst_2_downstream_reset_n,
                                                 new_work_burst_2_downstream_waitrequest
                                              )
;

  output  [ 22: 0] new_work_burst_2_downstream_address_to_slave;
  output           new_work_burst_2_downstream_latency_counter;
  output  [ 15: 0] new_work_burst_2_downstream_readdata;
  output           new_work_burst_2_downstream_readdatavalid;
  output           new_work_burst_2_downstream_reset_n;
  output           new_work_burst_2_downstream_waitrequest;
  input            clk;
  input            d1_new_work_clock_2_in_end_xfer;
  input   [ 22: 0] new_work_burst_2_downstream_address;
  input            new_work_burst_2_downstream_burstcount;
  input   [  1: 0] new_work_burst_2_downstream_byteenable;
  input            new_work_burst_2_downstream_granted_new_work_clock_2_in;
  input            new_work_burst_2_downstream_qualified_request_new_work_clock_2_in;
  input            new_work_burst_2_downstream_read;
  input            new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in;
  input            new_work_burst_2_downstream_requests_new_work_clock_2_in;
  input            new_work_burst_2_downstream_write;
  input   [ 15: 0] new_work_burst_2_downstream_writedata;
  input   [ 15: 0] new_work_clock_2_in_readdata_from_sa;
  input            new_work_clock_2_in_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] new_work_burst_2_downstream_address_last_time;
  wire    [ 22: 0] new_work_burst_2_downstream_address_to_slave;
  reg              new_work_burst_2_downstream_burstcount_last_time;
  reg     [  1: 0] new_work_burst_2_downstream_byteenable_last_time;
  wire             new_work_burst_2_downstream_latency_counter;
  reg              new_work_burst_2_downstream_read_last_time;
  wire    [ 15: 0] new_work_burst_2_downstream_readdata;
  wire             new_work_burst_2_downstream_readdatavalid;
  wire             new_work_burst_2_downstream_reset_n;
  wire             new_work_burst_2_downstream_run;
  wire             new_work_burst_2_downstream_waitrequest;
  reg              new_work_burst_2_downstream_write_last_time;
  reg     [ 15: 0] new_work_burst_2_downstream_writedata_last_time;
  wire             pre_flush_new_work_burst_2_downstream_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (new_work_burst_2_downstream_qualified_request_new_work_clock_2_in | ~new_work_burst_2_downstream_requests_new_work_clock_2_in) & ((~new_work_burst_2_downstream_qualified_request_new_work_clock_2_in | ~(new_work_burst_2_downstream_read | new_work_burst_2_downstream_write) | (1 & ~new_work_clock_2_in_waitrequest_from_sa & (new_work_burst_2_downstream_read | new_work_burst_2_downstream_write)))) & ((~new_work_burst_2_downstream_qualified_request_new_work_clock_2_in | ~(new_work_burst_2_downstream_read | new_work_burst_2_downstream_write) | (1 & ~new_work_clock_2_in_waitrequest_from_sa & (new_work_burst_2_downstream_read | new_work_burst_2_downstream_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_burst_2_downstream_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_burst_2_downstream_address_to_slave = new_work_burst_2_downstream_address;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_new_work_burst_2_downstream_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign new_work_burst_2_downstream_readdatavalid = 0 |
    pre_flush_new_work_burst_2_downstream_readdatavalid |
    new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in;

  //new_work_burst_2/downstream readdata mux, which is an e_mux
  assign new_work_burst_2_downstream_readdata = new_work_clock_2_in_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_burst_2_downstream_waitrequest = ~new_work_burst_2_downstream_run;

  //latent max counter, which is an e_assign
  assign new_work_burst_2_downstream_latency_counter = 0;

  //new_work_burst_2_downstream_reset_n assignment, which is an e_assign
  assign new_work_burst_2_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_2_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_address_last_time <= 0;
      else 
        new_work_burst_2_downstream_address_last_time <= new_work_burst_2_downstream_address;
    end


  //new_work_burst_2/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_burst_2_downstream_waitrequest & (new_work_burst_2_downstream_read | new_work_burst_2_downstream_write);
    end


  //new_work_burst_2_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_address != new_work_burst_2_downstream_address_last_time))
        begin
          $write("%0d ns: new_work_burst_2_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_2_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_burstcount_last_time <= 0;
      else 
        new_work_burst_2_downstream_burstcount_last_time <= new_work_burst_2_downstream_burstcount;
    end


  //new_work_burst_2_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_burstcount != new_work_burst_2_downstream_burstcount_last_time))
        begin
          $write("%0d ns: new_work_burst_2_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_2_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_byteenable_last_time <= 0;
      else 
        new_work_burst_2_downstream_byteenable_last_time <= new_work_burst_2_downstream_byteenable;
    end


  //new_work_burst_2_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_byteenable != new_work_burst_2_downstream_byteenable_last_time))
        begin
          $write("%0d ns: new_work_burst_2_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_2_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_read_last_time <= 0;
      else 
        new_work_burst_2_downstream_read_last_time <= new_work_burst_2_downstream_read;
    end


  //new_work_burst_2_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_read != new_work_burst_2_downstream_read_last_time))
        begin
          $write("%0d ns: new_work_burst_2_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_2_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_write_last_time <= 0;
      else 
        new_work_burst_2_downstream_write_last_time <= new_work_burst_2_downstream_write;
    end


  //new_work_burst_2_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_write != new_work_burst_2_downstream_write_last_time))
        begin
          $write("%0d ns: new_work_burst_2_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_2_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_2_downstream_writedata_last_time <= 0;
      else 
        new_work_burst_2_downstream_writedata_last_time <= new_work_burst_2_downstream_writedata;
    end


  //new_work_burst_2_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_2_downstream_writedata != new_work_burst_2_downstream_writedata_last_time) & new_work_burst_2_downstream_write)
        begin
          $write("%0d ns: new_work_burst_2_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_new_work_burst_3_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  4: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  4: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  4: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  4: 0] p0_stage_0;
  wire             p1_full_1;
  wire    [  4: 0] p1_stage_1;
  reg     [  4: 0] stage_0;
  reg     [  4: 0] stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_3_upstream_module (
                                                                                   // inputs:
                                                                                    clear_fifo,
                                                                                    clk,
                                                                                    data_in,
                                                                                    read,
                                                                                    reset_n,
                                                                                    sync_reset,
                                                                                    write,

                                                                                   // outputs:
                                                                                    data_out,
                                                                                    empty,
                                                                                    fifo_contains_ones_n,
                                                                                    full
                                                                                 )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_3_upstream_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_0_instruction_master_address_to_slave,
                                               cpu_0_instruction_master_burstcount,
                                               cpu_0_instruction_master_dbs_address,
                                               cpu_0_instruction_master_latency_counter,
                                               cpu_0_instruction_master_read,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register,
                                               new_work_burst_3_upstream_readdata,
                                               new_work_burst_3_upstream_readdatavalid,
                                               new_work_burst_3_upstream_waitrequest,
                                               reset_n,

                                              // outputs:
                                               cpu_0_instruction_master_granted_new_work_burst_3_upstream,
                                               cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream,
                                               cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register,
                                               cpu_0_instruction_master_requests_new_work_burst_3_upstream,
                                               d1_new_work_burst_3_upstream_end_xfer,
                                               new_work_burst_3_upstream_address,
                                               new_work_burst_3_upstream_byteaddress,
                                               new_work_burst_3_upstream_byteenable,
                                               new_work_burst_3_upstream_debugaccess,
                                               new_work_burst_3_upstream_read,
                                               new_work_burst_3_upstream_readdata_from_sa,
                                               new_work_burst_3_upstream_waitrequest_from_sa,
                                               new_work_burst_3_upstream_write
                                            )
;

  output           cpu_0_instruction_master_granted_new_work_burst_3_upstream;
  output           cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream;
  output           cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  output           cpu_0_instruction_master_requests_new_work_burst_3_upstream;
  output           d1_new_work_burst_3_upstream_end_xfer;
  output  [ 21: 0] new_work_burst_3_upstream_address;
  output  [ 22: 0] new_work_burst_3_upstream_byteaddress;
  output  [  1: 0] new_work_burst_3_upstream_byteenable;
  output           new_work_burst_3_upstream_debugaccess;
  output           new_work_burst_3_upstream_read;
  output  [ 15: 0] new_work_burst_3_upstream_readdata_from_sa;
  output           new_work_burst_3_upstream_waitrequest_from_sa;
  output           new_work_burst_3_upstream_write;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  3: 0] cpu_0_instruction_master_burstcount;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input            cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  input            cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  input   [ 15: 0] new_work_burst_3_upstream_readdata;
  input            new_work_burst_3_upstream_readdatavalid;
  input            new_work_burst_3_upstream_waitrequest;
  input            reset_n;

  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  wire             cpu_0_instruction_master_requests_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_saved_grant_new_work_burst_3_upstream;
  reg              d1_new_work_burst_3_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_burst_3_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 21: 0] new_work_burst_3_upstream_address;
  wire             new_work_burst_3_upstream_allgrants;
  wire             new_work_burst_3_upstream_allow_new_arb_cycle;
  wire             new_work_burst_3_upstream_any_bursting_master_saved_grant;
  wire             new_work_burst_3_upstream_any_continuerequest;
  wire             new_work_burst_3_upstream_arb_counter_enable;
  reg     [  5: 0] new_work_burst_3_upstream_arb_share_counter;
  wire    [  5: 0] new_work_burst_3_upstream_arb_share_counter_next_value;
  wire    [  5: 0] new_work_burst_3_upstream_arb_share_set_values;
  wire             new_work_burst_3_upstream_beginbursttransfer_internal;
  wire             new_work_burst_3_upstream_begins_xfer;
  wire             new_work_burst_3_upstream_burstcount_fifo_empty;
  wire    [ 22: 0] new_work_burst_3_upstream_byteaddress;
  wire    [  1: 0] new_work_burst_3_upstream_byteenable;
  reg     [  4: 0] new_work_burst_3_upstream_current_burst;
  wire    [  4: 0] new_work_burst_3_upstream_current_burst_minus_one;
  wire             new_work_burst_3_upstream_debugaccess;
  wire             new_work_burst_3_upstream_end_xfer;
  wire             new_work_burst_3_upstream_firsttransfer;
  wire             new_work_burst_3_upstream_grant_vector;
  wire             new_work_burst_3_upstream_in_a_read_cycle;
  wire             new_work_burst_3_upstream_in_a_write_cycle;
  reg              new_work_burst_3_upstream_load_fifo;
  wire             new_work_burst_3_upstream_master_qreq_vector;
  wire             new_work_burst_3_upstream_move_on_to_next_transaction;
  wire    [  4: 0] new_work_burst_3_upstream_next_burst_count;
  wire             new_work_burst_3_upstream_non_bursting_master_requests;
  wire             new_work_burst_3_upstream_read;
  wire    [ 15: 0] new_work_burst_3_upstream_readdata_from_sa;
  wire             new_work_burst_3_upstream_readdatavalid_from_sa;
  reg              new_work_burst_3_upstream_reg_firsttransfer;
  wire    [  4: 0] new_work_burst_3_upstream_selected_burstcount;
  reg              new_work_burst_3_upstream_slavearbiterlockenable;
  wire             new_work_burst_3_upstream_slavearbiterlockenable2;
  wire             new_work_burst_3_upstream_this_cycle_is_the_last_burst;
  wire    [  4: 0] new_work_burst_3_upstream_transaction_burst_count;
  wire             new_work_burst_3_upstream_unreg_firsttransfer;
  wire             new_work_burst_3_upstream_waitrequest_from_sa;
  wire             new_work_burst_3_upstream_waits_for_read;
  wire             new_work_burst_3_upstream_waits_for_write;
  wire             new_work_burst_3_upstream_write;
  wire             p0_new_work_burst_3_upstream_load_fifo;
  wire             wait_for_new_work_burst_3_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_burst_3_upstream_end_xfer;
    end


  assign new_work_burst_3_upstream_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream));
  //assign new_work_burst_3_upstream_readdatavalid_from_sa = new_work_burst_3_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_3_upstream_readdatavalid_from_sa = new_work_burst_3_upstream_readdatavalid;

  //assign new_work_burst_3_upstream_readdata_from_sa = new_work_burst_3_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_3_upstream_readdata_from_sa = new_work_burst_3_upstream_readdata;

  assign cpu_0_instruction_master_requests_new_work_burst_3_upstream = (({cpu_0_instruction_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //assign new_work_burst_3_upstream_waitrequest_from_sa = new_work_burst_3_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_burst_3_upstream_waitrequest_from_sa = new_work_burst_3_upstream_waitrequest;

  //new_work_burst_3_upstream_arb_share_counter set values, which is an e_mux
  assign new_work_burst_3_upstream_arb_share_set_values = 1;

  //new_work_burst_3_upstream_non_bursting_master_requests mux, which is an e_mux
  assign new_work_burst_3_upstream_non_bursting_master_requests = 0;

  //new_work_burst_3_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_burst_3_upstream_any_bursting_master_saved_grant = cpu_0_instruction_master_saved_grant_new_work_burst_3_upstream;

  //new_work_burst_3_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_burst_3_upstream_arb_share_counter_next_value = new_work_burst_3_upstream_firsttransfer ? (new_work_burst_3_upstream_arb_share_set_values - 1) : |new_work_burst_3_upstream_arb_share_counter ? (new_work_burst_3_upstream_arb_share_counter - 1) : 0;

  //new_work_burst_3_upstream_allgrants all slave grants, which is an e_mux
  assign new_work_burst_3_upstream_allgrants = |new_work_burst_3_upstream_grant_vector;

  //new_work_burst_3_upstream_end_xfer assignment, which is an e_assign
  assign new_work_burst_3_upstream_end_xfer = ~(new_work_burst_3_upstream_waits_for_read | new_work_burst_3_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_burst_3_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_burst_3_upstream = new_work_burst_3_upstream_end_xfer & (~new_work_burst_3_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_burst_3_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_burst_3_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_burst_3_upstream & new_work_burst_3_upstream_allgrants) | (end_xfer_arb_share_counter_term_new_work_burst_3_upstream & ~new_work_burst_3_upstream_non_bursting_master_requests);

  //new_work_burst_3_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_upstream_arb_share_counter <= 0;
      else if (new_work_burst_3_upstream_arb_counter_enable)
          new_work_burst_3_upstream_arb_share_counter <= new_work_burst_3_upstream_arb_share_counter_next_value;
    end


  //new_work_burst_3_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_upstream_slavearbiterlockenable <= 0;
      else if ((|new_work_burst_3_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_burst_3_upstream) | (end_xfer_arb_share_counter_term_new_work_burst_3_upstream & ~new_work_burst_3_upstream_non_bursting_master_requests))
          new_work_burst_3_upstream_slavearbiterlockenable <= |new_work_burst_3_upstream_arb_share_counter_next_value;
    end


  //cpu_0/instruction_master new_work_burst_3/upstream arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = new_work_burst_3_upstream_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //new_work_burst_3_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_burst_3_upstream_slavearbiterlockenable2 = |new_work_burst_3_upstream_arb_share_counter_next_value;

  //cpu_0/instruction_master new_work_burst_3/upstream arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = new_work_burst_3_upstream_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //new_work_burst_3_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_burst_3_upstream_any_continuerequest = 1;

  //cpu_0_instruction_master_continuerequest continued request, which is an e_assign
  assign cpu_0_instruction_master_continuerequest = 1;

  assign cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream = cpu_0_instruction_master_requests_new_work_burst_3_upstream & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register) | (|cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register))));
  //unique name for new_work_burst_3_upstream_move_on_to_next_transaction, which is an e_assign
  assign new_work_burst_3_upstream_move_on_to_next_transaction = new_work_burst_3_upstream_this_cycle_is_the_last_burst & new_work_burst_3_upstream_load_fifo;

  //the currently selected burstcount for new_work_burst_3_upstream, which is an e_mux
  assign new_work_burst_3_upstream_selected_burstcount = (cpu_0_instruction_master_granted_new_work_burst_3_upstream)? cpu_0_instruction_master_burstcount :
    1;

  //burstcount_fifo_for_new_work_burst_3_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_new_work_burst_3_upstream_module burstcount_fifo_for_new_work_burst_3_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_burst_3_upstream_selected_burstcount),
      .data_out             (new_work_burst_3_upstream_transaction_burst_count),
      .empty                (new_work_burst_3_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (new_work_burst_3_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read & new_work_burst_3_upstream_load_fifo & ~(new_work_burst_3_upstream_this_cycle_is_the_last_burst & new_work_burst_3_upstream_burstcount_fifo_empty))
    );

  //new_work_burst_3_upstream current burst minus one, which is an e_assign
  assign new_work_burst_3_upstream_current_burst_minus_one = new_work_burst_3_upstream_current_burst - 1;

  //what to load in current_burst, for new_work_burst_3_upstream, which is an e_mux
  assign new_work_burst_3_upstream_next_burst_count = (((in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read) & ~new_work_burst_3_upstream_load_fifo))? {new_work_burst_3_upstream_selected_burstcount, 1'b0} :
    ((in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read & new_work_burst_3_upstream_this_cycle_is_the_last_burst & new_work_burst_3_upstream_burstcount_fifo_empty))? {new_work_burst_3_upstream_selected_burstcount, 1'b0} :
    (new_work_burst_3_upstream_this_cycle_is_the_last_burst)? {new_work_burst_3_upstream_transaction_burst_count,  1'b0} :
    new_work_burst_3_upstream_current_burst_minus_one;

  //the current burst count for new_work_burst_3_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_upstream_current_burst <= 0;
      else if (new_work_burst_3_upstream_readdatavalid_from_sa | (~new_work_burst_3_upstream_load_fifo & (in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read)))
          new_work_burst_3_upstream_current_burst <= new_work_burst_3_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_new_work_burst_3_upstream_load_fifo = (~new_work_burst_3_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read) & new_work_burst_3_upstream_load_fifo))? 1 :
    ~new_work_burst_3_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read) & ~new_work_burst_3_upstream_load_fifo | new_work_burst_3_upstream_this_cycle_is_the_last_burst)
          new_work_burst_3_upstream_load_fifo <= p0_new_work_burst_3_upstream_load_fifo;
    end


  //the last cycle in the burst for new_work_burst_3_upstream, which is an e_assign
  assign new_work_burst_3_upstream_this_cycle_is_the_last_burst = ~(|new_work_burst_3_upstream_current_burst_minus_one) & new_work_burst_3_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_3_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_3_upstream_module rdv_fifo_for_cpu_0_instruction_master_to_new_work_burst_3_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_new_work_burst_3_upstream),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_new_work_burst_3_upstream),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_3_upstream),
      .full                 (),
      .read                 (new_work_burst_3_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~new_work_burst_3_upstream_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_new_work_burst_3_upstream;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream = new_work_burst_3_upstream_readdatavalid_from_sa;

  //byteaddress mux for new_work_burst_3/upstream, which is an e_mux
  assign new_work_burst_3_upstream_byteaddress = cpu_0_instruction_master_address_to_slave;

  //master is always granted when requested
  assign cpu_0_instruction_master_granted_new_work_burst_3_upstream = cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream;

  //cpu_0/instruction_master saved-grant new_work_burst_3/upstream, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_new_work_burst_3_upstream = cpu_0_instruction_master_requests_new_work_burst_3_upstream;

  //allow new arb cycle for new_work_burst_3/upstream, which is an e_assign
  assign new_work_burst_3_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_burst_3_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_burst_3_upstream_master_qreq_vector = 1;

  //new_work_burst_3_upstream_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_3_upstream_firsttransfer = new_work_burst_3_upstream_begins_xfer ? new_work_burst_3_upstream_unreg_firsttransfer : new_work_burst_3_upstream_reg_firsttransfer;

  //new_work_burst_3_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_burst_3_upstream_unreg_firsttransfer = ~(new_work_burst_3_upstream_slavearbiterlockenable & new_work_burst_3_upstream_any_continuerequest);

  //new_work_burst_3_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_upstream_reg_firsttransfer <= 1'b1;
      else if (new_work_burst_3_upstream_begins_xfer)
          new_work_burst_3_upstream_reg_firsttransfer <= new_work_burst_3_upstream_unreg_firsttransfer;
    end


  //new_work_burst_3_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_burst_3_upstream_beginbursttransfer_internal = new_work_burst_3_upstream_begins_xfer;

  //new_work_burst_3_upstream_read assignment, which is an e_mux
  assign new_work_burst_3_upstream_read = cpu_0_instruction_master_granted_new_work_burst_3_upstream & cpu_0_instruction_master_read;

  //new_work_burst_3_upstream_write assignment, which is an e_mux
  assign new_work_burst_3_upstream_write = 0;

  //new_work_burst_3_upstream_address mux, which is an e_mux
  assign new_work_burst_3_upstream_address = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_new_work_burst_3_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_burst_3_upstream_end_xfer <= 1;
      else 
        d1_new_work_burst_3_upstream_end_xfer <= new_work_burst_3_upstream_end_xfer;
    end


  //new_work_burst_3_upstream_waits_for_read in a cycle, which is an e_mux
  assign new_work_burst_3_upstream_waits_for_read = new_work_burst_3_upstream_in_a_read_cycle & new_work_burst_3_upstream_waitrequest_from_sa;

  //new_work_burst_3_upstream_in_a_read_cycle assignment, which is an e_assign
  assign new_work_burst_3_upstream_in_a_read_cycle = cpu_0_instruction_master_granted_new_work_burst_3_upstream & cpu_0_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_burst_3_upstream_in_a_read_cycle;

  //new_work_burst_3_upstream_waits_for_write in a cycle, which is an e_mux
  assign new_work_burst_3_upstream_waits_for_write = new_work_burst_3_upstream_in_a_write_cycle & new_work_burst_3_upstream_waitrequest_from_sa;

  //new_work_burst_3_upstream_in_a_write_cycle assignment, which is an e_assign
  assign new_work_burst_3_upstream_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_burst_3_upstream_in_a_write_cycle;

  assign wait_for_new_work_burst_3_upstream_counter = 0;
  //new_work_burst_3_upstream_byteenable byte enable port mux, which is an e_mux
  assign new_work_burst_3_upstream_byteenable = -1;

  //debugaccess mux, which is an e_mux
  assign new_work_burst_3_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_3/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //cpu_0/instruction_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_instruction_master_requests_new_work_burst_3_upstream && (cpu_0_instruction_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: cpu_0/instruction_master drove 0 on its 'burstcount' port while accessing slave new_work_burst_3/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_burst_3_downstream_arbitrator (
                                                // inputs:
                                                 clk,
                                                 d1_new_work_clock_5_in_end_xfer,
                                                 new_work_burst_3_downstream_address,
                                                 new_work_burst_3_downstream_burstcount,
                                                 new_work_burst_3_downstream_byteenable,
                                                 new_work_burst_3_downstream_granted_new_work_clock_5_in,
                                                 new_work_burst_3_downstream_qualified_request_new_work_clock_5_in,
                                                 new_work_burst_3_downstream_read,
                                                 new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in,
                                                 new_work_burst_3_downstream_requests_new_work_clock_5_in,
                                                 new_work_burst_3_downstream_write,
                                                 new_work_burst_3_downstream_writedata,
                                                 new_work_clock_5_in_readdata_from_sa,
                                                 new_work_clock_5_in_waitrequest_from_sa,
                                                 reset_n,

                                                // outputs:
                                                 new_work_burst_3_downstream_address_to_slave,
                                                 new_work_burst_3_downstream_latency_counter,
                                                 new_work_burst_3_downstream_readdata,
                                                 new_work_burst_3_downstream_readdatavalid,
                                                 new_work_burst_3_downstream_reset_n,
                                                 new_work_burst_3_downstream_waitrequest
                                              )
;

  output  [ 21: 0] new_work_burst_3_downstream_address_to_slave;
  output           new_work_burst_3_downstream_latency_counter;
  output  [ 15: 0] new_work_burst_3_downstream_readdata;
  output           new_work_burst_3_downstream_readdatavalid;
  output           new_work_burst_3_downstream_reset_n;
  output           new_work_burst_3_downstream_waitrequest;
  input            clk;
  input            d1_new_work_clock_5_in_end_xfer;
  input   [ 21: 0] new_work_burst_3_downstream_address;
  input            new_work_burst_3_downstream_burstcount;
  input   [  1: 0] new_work_burst_3_downstream_byteenable;
  input            new_work_burst_3_downstream_granted_new_work_clock_5_in;
  input            new_work_burst_3_downstream_qualified_request_new_work_clock_5_in;
  input            new_work_burst_3_downstream_read;
  input            new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in;
  input            new_work_burst_3_downstream_requests_new_work_clock_5_in;
  input            new_work_burst_3_downstream_write;
  input   [ 15: 0] new_work_burst_3_downstream_writedata;
  input   [ 15: 0] new_work_clock_5_in_readdata_from_sa;
  input            new_work_clock_5_in_waitrequest_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 21: 0] new_work_burst_3_downstream_address_last_time;
  wire    [ 21: 0] new_work_burst_3_downstream_address_to_slave;
  reg              new_work_burst_3_downstream_burstcount_last_time;
  reg     [  1: 0] new_work_burst_3_downstream_byteenable_last_time;
  wire             new_work_burst_3_downstream_latency_counter;
  reg              new_work_burst_3_downstream_read_last_time;
  wire    [ 15: 0] new_work_burst_3_downstream_readdata;
  wire             new_work_burst_3_downstream_readdatavalid;
  wire             new_work_burst_3_downstream_reset_n;
  wire             new_work_burst_3_downstream_run;
  wire             new_work_burst_3_downstream_waitrequest;
  reg              new_work_burst_3_downstream_write_last_time;
  reg     [ 15: 0] new_work_burst_3_downstream_writedata_last_time;
  wire             pre_flush_new_work_burst_3_downstream_readdatavalid;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (new_work_burst_3_downstream_qualified_request_new_work_clock_5_in | ~new_work_burst_3_downstream_requests_new_work_clock_5_in) & ((~new_work_burst_3_downstream_qualified_request_new_work_clock_5_in | ~(new_work_burst_3_downstream_read | new_work_burst_3_downstream_write) | (1 & ~new_work_clock_5_in_waitrequest_from_sa & (new_work_burst_3_downstream_read | new_work_burst_3_downstream_write)))) & ((~new_work_burst_3_downstream_qualified_request_new_work_clock_5_in | ~(new_work_burst_3_downstream_read | new_work_burst_3_downstream_write) | (1 & ~new_work_clock_5_in_waitrequest_from_sa & (new_work_burst_3_downstream_read | new_work_burst_3_downstream_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_burst_3_downstream_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_burst_3_downstream_address_to_slave = new_work_burst_3_downstream_address;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_new_work_burst_3_downstream_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign new_work_burst_3_downstream_readdatavalid = 0 |
    pre_flush_new_work_burst_3_downstream_readdatavalid |
    new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in;

  //new_work_burst_3/downstream readdata mux, which is an e_mux
  assign new_work_burst_3_downstream_readdata = new_work_clock_5_in_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_burst_3_downstream_waitrequest = ~new_work_burst_3_downstream_run;

  //latent max counter, which is an e_assign
  assign new_work_burst_3_downstream_latency_counter = 0;

  //new_work_burst_3_downstream_reset_n assignment, which is an e_assign
  assign new_work_burst_3_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_burst_3_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_address_last_time <= 0;
      else 
        new_work_burst_3_downstream_address_last_time <= new_work_burst_3_downstream_address;
    end


  //new_work_burst_3/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_burst_3_downstream_waitrequest & (new_work_burst_3_downstream_read | new_work_burst_3_downstream_write);
    end


  //new_work_burst_3_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_address != new_work_burst_3_downstream_address_last_time))
        begin
          $write("%0d ns: new_work_burst_3_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_3_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_burstcount_last_time <= 0;
      else 
        new_work_burst_3_downstream_burstcount_last_time <= new_work_burst_3_downstream_burstcount;
    end


  //new_work_burst_3_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_burstcount != new_work_burst_3_downstream_burstcount_last_time))
        begin
          $write("%0d ns: new_work_burst_3_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_3_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_byteenable_last_time <= 0;
      else 
        new_work_burst_3_downstream_byteenable_last_time <= new_work_burst_3_downstream_byteenable;
    end


  //new_work_burst_3_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_byteenable != new_work_burst_3_downstream_byteenable_last_time))
        begin
          $write("%0d ns: new_work_burst_3_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_3_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_read_last_time <= 0;
      else 
        new_work_burst_3_downstream_read_last_time <= new_work_burst_3_downstream_read;
    end


  //new_work_burst_3_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_read != new_work_burst_3_downstream_read_last_time))
        begin
          $write("%0d ns: new_work_burst_3_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_3_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_write_last_time <= 0;
      else 
        new_work_burst_3_downstream_write_last_time <= new_work_burst_3_downstream_write;
    end


  //new_work_burst_3_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_write != new_work_burst_3_downstream_write_last_time))
        begin
          $write("%0d ns: new_work_burst_3_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_burst_3_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_burst_3_downstream_writedata_last_time <= 0;
      else 
        new_work_burst_3_downstream_writedata_last_time <= new_work_burst_3_downstream_writedata;
    end


  //new_work_burst_3_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_burst_3_downstream_writedata != new_work_burst_3_downstream_writedata_last_time) & new_work_burst_3_downstream_write)
        begin
          $write("%0d ns: new_work_burst_3_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_0_in_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         new_work_clock_0_in_endofpacket,
                                         new_work_clock_0_in_readdata,
                                         new_work_clock_0_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_new_work_clock_0_in,
                                         cpu_0_data_master_qualified_request_new_work_clock_0_in,
                                         cpu_0_data_master_read_data_valid_new_work_clock_0_in,
                                         cpu_0_data_master_requests_new_work_clock_0_in,
                                         d1_new_work_clock_0_in_end_xfer,
                                         new_work_clock_0_in_address,
                                         new_work_clock_0_in_byteenable,
                                         new_work_clock_0_in_endofpacket_from_sa,
                                         new_work_clock_0_in_nativeaddress,
                                         new_work_clock_0_in_read,
                                         new_work_clock_0_in_readdata_from_sa,
                                         new_work_clock_0_in_reset_n,
                                         new_work_clock_0_in_waitrequest_from_sa,
                                         new_work_clock_0_in_write,
                                         new_work_clock_0_in_writedata
                                      )
;

  output           cpu_0_data_master_granted_new_work_clock_0_in;
  output           cpu_0_data_master_qualified_request_new_work_clock_0_in;
  output           cpu_0_data_master_read_data_valid_new_work_clock_0_in;
  output           cpu_0_data_master_requests_new_work_clock_0_in;
  output           d1_new_work_clock_0_in_end_xfer;
  output  [  2: 0] new_work_clock_0_in_address;
  output  [  3: 0] new_work_clock_0_in_byteenable;
  output           new_work_clock_0_in_endofpacket_from_sa;
  output           new_work_clock_0_in_nativeaddress;
  output           new_work_clock_0_in_read;
  output  [ 31: 0] new_work_clock_0_in_readdata_from_sa;
  output           new_work_clock_0_in_reset_n;
  output           new_work_clock_0_in_waitrequest_from_sa;
  output           new_work_clock_0_in_write;
  output  [ 31: 0] new_work_clock_0_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            new_work_clock_0_in_endofpacket;
  input   [ 31: 0] new_work_clock_0_in_readdata;
  input            new_work_clock_0_in_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_new_work_clock_0_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_0_in;
  wire             cpu_0_data_master_requests_new_work_clock_0_in;
  wire             cpu_0_data_master_saved_grant_new_work_clock_0_in;
  reg              d1_new_work_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] new_work_clock_0_in_address;
  wire             new_work_clock_0_in_allgrants;
  wire             new_work_clock_0_in_allow_new_arb_cycle;
  wire             new_work_clock_0_in_any_bursting_master_saved_grant;
  wire             new_work_clock_0_in_any_continuerequest;
  wire             new_work_clock_0_in_arb_counter_enable;
  reg     [  1: 0] new_work_clock_0_in_arb_share_counter;
  wire    [  1: 0] new_work_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] new_work_clock_0_in_arb_share_set_values;
  wire             new_work_clock_0_in_beginbursttransfer_internal;
  wire             new_work_clock_0_in_begins_xfer;
  wire    [  3: 0] new_work_clock_0_in_byteenable;
  wire             new_work_clock_0_in_end_xfer;
  wire             new_work_clock_0_in_endofpacket_from_sa;
  wire             new_work_clock_0_in_firsttransfer;
  wire             new_work_clock_0_in_grant_vector;
  wire             new_work_clock_0_in_in_a_read_cycle;
  wire             new_work_clock_0_in_in_a_write_cycle;
  wire             new_work_clock_0_in_master_qreq_vector;
  wire             new_work_clock_0_in_nativeaddress;
  wire             new_work_clock_0_in_non_bursting_master_requests;
  wire             new_work_clock_0_in_read;
  wire    [ 31: 0] new_work_clock_0_in_readdata_from_sa;
  reg              new_work_clock_0_in_reg_firsttransfer;
  wire             new_work_clock_0_in_reset_n;
  reg              new_work_clock_0_in_slavearbiterlockenable;
  wire             new_work_clock_0_in_slavearbiterlockenable2;
  wire             new_work_clock_0_in_unreg_firsttransfer;
  wire             new_work_clock_0_in_waitrequest_from_sa;
  wire             new_work_clock_0_in_waits_for_read;
  wire             new_work_clock_0_in_waits_for_write;
  wire             new_work_clock_0_in_write;
  wire    [ 31: 0] new_work_clock_0_in_writedata;
  wire    [ 24: 0] shifted_address_to_new_work_clock_0_in_from_cpu_0_data_master;
  wire             wait_for_new_work_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_0_in_end_xfer;
    end


  assign new_work_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_new_work_clock_0_in));
  //assign new_work_clock_0_in_readdata_from_sa = new_work_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_0_in_readdata_from_sa = new_work_clock_0_in_readdata;

  assign cpu_0_data_master_requests_new_work_clock_0_in = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801020) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign new_work_clock_0_in_waitrequest_from_sa = new_work_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_0_in_waitrequest_from_sa = new_work_clock_0_in_waitrequest;

  //new_work_clock_0_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_0_in_arb_share_set_values = 1;

  //new_work_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_0_in_non_bursting_master_requests = cpu_0_data_master_requests_new_work_clock_0_in;

  //new_work_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_0_in_any_bursting_master_saved_grant = 0;

  //new_work_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_0_in_arb_share_counter_next_value = new_work_clock_0_in_firsttransfer ? (new_work_clock_0_in_arb_share_set_values - 1) : |new_work_clock_0_in_arb_share_counter ? (new_work_clock_0_in_arb_share_counter - 1) : 0;

  //new_work_clock_0_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_0_in_allgrants = |new_work_clock_0_in_grant_vector;

  //new_work_clock_0_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_0_in_end_xfer = ~(new_work_clock_0_in_waits_for_read | new_work_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_0_in = new_work_clock_0_in_end_xfer & (~new_work_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_0_in & new_work_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_0_in & ~new_work_clock_0_in_non_bursting_master_requests);

  //new_work_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_in_arb_share_counter <= 0;
      else if (new_work_clock_0_in_arb_counter_enable)
          new_work_clock_0_in_arb_share_counter <= new_work_clock_0_in_arb_share_counter_next_value;
    end


  //new_work_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_0_in) | (end_xfer_arb_share_counter_term_new_work_clock_0_in & ~new_work_clock_0_in_non_bursting_master_requests))
          new_work_clock_0_in_slavearbiterlockenable <= |new_work_clock_0_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master new_work_clock_0/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = new_work_clock_0_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //new_work_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_0_in_slavearbiterlockenable2 = |new_work_clock_0_in_arb_share_counter_next_value;

  //cpu_0/data_master new_work_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = new_work_clock_0_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_0_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_new_work_clock_0_in = cpu_0_data_master_requests_new_work_clock_0_in & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_new_work_clock_0_in, which is an e_mux
  assign cpu_0_data_master_read_data_valid_new_work_clock_0_in = cpu_0_data_master_granted_new_work_clock_0_in & cpu_0_data_master_read & ~new_work_clock_0_in_waits_for_read;

  //new_work_clock_0_in_writedata mux, which is an e_mux
  assign new_work_clock_0_in_writedata = cpu_0_data_master_writedata;

  //assign new_work_clock_0_in_endofpacket_from_sa = new_work_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_0_in_endofpacket_from_sa = new_work_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_new_work_clock_0_in = cpu_0_data_master_qualified_request_new_work_clock_0_in;

  //cpu_0/data_master saved-grant new_work_clock_0/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_new_work_clock_0_in = cpu_0_data_master_requests_new_work_clock_0_in;

  //allow new arb cycle for new_work_clock_0/in, which is an e_assign
  assign new_work_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_0_in_master_qreq_vector = 1;

  //new_work_clock_0_in_reset_n assignment, which is an e_assign
  assign new_work_clock_0_in_reset_n = reset_n;

  //new_work_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_0_in_firsttransfer = new_work_clock_0_in_begins_xfer ? new_work_clock_0_in_unreg_firsttransfer : new_work_clock_0_in_reg_firsttransfer;

  //new_work_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_0_in_unreg_firsttransfer = ~(new_work_clock_0_in_slavearbiterlockenable & new_work_clock_0_in_any_continuerequest);

  //new_work_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_0_in_begins_xfer)
          new_work_clock_0_in_reg_firsttransfer <= new_work_clock_0_in_unreg_firsttransfer;
    end


  //new_work_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_0_in_beginbursttransfer_internal = new_work_clock_0_in_begins_xfer;

  //new_work_clock_0_in_read assignment, which is an e_mux
  assign new_work_clock_0_in_read = cpu_0_data_master_granted_new_work_clock_0_in & cpu_0_data_master_read;

  //new_work_clock_0_in_write assignment, which is an e_mux
  assign new_work_clock_0_in_write = cpu_0_data_master_granted_new_work_clock_0_in & cpu_0_data_master_write;

  assign shifted_address_to_new_work_clock_0_in_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //new_work_clock_0_in_address mux, which is an e_mux
  assign new_work_clock_0_in_address = shifted_address_to_new_work_clock_0_in_from_cpu_0_data_master >> 2;

  //slaveid new_work_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_0_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_new_work_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_0_in_end_xfer <= 1;
      else 
        d1_new_work_clock_0_in_end_xfer <= new_work_clock_0_in_end_xfer;
    end


  //new_work_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_0_in_waits_for_read = new_work_clock_0_in_in_a_read_cycle & new_work_clock_0_in_waitrequest_from_sa;

  //new_work_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_0_in_in_a_read_cycle = cpu_0_data_master_granted_new_work_clock_0_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_0_in_in_a_read_cycle;

  //new_work_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_0_in_waits_for_write = new_work_clock_0_in_in_a_write_cycle & new_work_clock_0_in_waitrequest_from_sa;

  //new_work_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_0_in_in_a_write_cycle = cpu_0_data_master_granted_new_work_clock_0_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_0_in_in_a_write_cycle;

  assign wait_for_new_work_clock_0_in_counter = 0;
  //new_work_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_0_in_byteenable = (cpu_0_data_master_granted_new_work_clock_0_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_0/in enable non-zero assertions, which is an e_register
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

module new_work_clock_0_out_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_sysid_0_control_slave_end_xfer,
                                          new_work_clock_0_out_address,
                                          new_work_clock_0_out_byteenable,
                                          new_work_clock_0_out_granted_sysid_0_control_slave,
                                          new_work_clock_0_out_qualified_request_sysid_0_control_slave,
                                          new_work_clock_0_out_read,
                                          new_work_clock_0_out_read_data_valid_sysid_0_control_slave,
                                          new_work_clock_0_out_requests_sysid_0_control_slave,
                                          new_work_clock_0_out_write,
                                          new_work_clock_0_out_writedata,
                                          reset_n,
                                          sysid_0_control_slave_readdata_from_sa,

                                         // outputs:
                                          new_work_clock_0_out_address_to_slave,
                                          new_work_clock_0_out_readdata,
                                          new_work_clock_0_out_reset_n,
                                          new_work_clock_0_out_waitrequest
                                       )
;

  output  [  2: 0] new_work_clock_0_out_address_to_slave;
  output  [ 31: 0] new_work_clock_0_out_readdata;
  output           new_work_clock_0_out_reset_n;
  output           new_work_clock_0_out_waitrequest;
  input            clk;
  input            d1_sysid_0_control_slave_end_xfer;
  input   [  2: 0] new_work_clock_0_out_address;
  input   [  3: 0] new_work_clock_0_out_byteenable;
  input            new_work_clock_0_out_granted_sysid_0_control_slave;
  input            new_work_clock_0_out_qualified_request_sysid_0_control_slave;
  input            new_work_clock_0_out_read;
  input            new_work_clock_0_out_read_data_valid_sysid_0_control_slave;
  input            new_work_clock_0_out_requests_sysid_0_control_slave;
  input            new_work_clock_0_out_write;
  input   [ 31: 0] new_work_clock_0_out_writedata;
  input            reset_n;
  input   [ 31: 0] sysid_0_control_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [  2: 0] new_work_clock_0_out_address_last_time;
  wire    [  2: 0] new_work_clock_0_out_address_to_slave;
  reg     [  3: 0] new_work_clock_0_out_byteenable_last_time;
  reg              new_work_clock_0_out_read_last_time;
  wire    [ 31: 0] new_work_clock_0_out_readdata;
  wire             new_work_clock_0_out_reset_n;
  wire             new_work_clock_0_out_run;
  wire             new_work_clock_0_out_waitrequest;
  reg              new_work_clock_0_out_write_last_time;
  reg     [ 31: 0] new_work_clock_0_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~new_work_clock_0_out_qualified_request_sysid_0_control_slave | ~new_work_clock_0_out_read | (1 & ~d1_sysid_0_control_slave_end_xfer & new_work_clock_0_out_read))) & ((~new_work_clock_0_out_qualified_request_sysid_0_control_slave | ~new_work_clock_0_out_write | (1 & new_work_clock_0_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_0_out_address_to_slave = new_work_clock_0_out_address;

  //new_work_clock_0/out readdata mux, which is an e_mux
  assign new_work_clock_0_out_readdata = sysid_0_control_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_0_out_waitrequest = ~new_work_clock_0_out_run;

  //new_work_clock_0_out_reset_n assignment, which is an e_assign
  assign new_work_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_out_address_last_time <= 0;
      else 
        new_work_clock_0_out_address_last_time <= new_work_clock_0_out_address;
    end


  //new_work_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_0_out_waitrequest & (new_work_clock_0_out_read | new_work_clock_0_out_write);
    end


  //new_work_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_0_out_address != new_work_clock_0_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_out_byteenable_last_time <= 0;
      else 
        new_work_clock_0_out_byteenable_last_time <= new_work_clock_0_out_byteenable;
    end


  //new_work_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_0_out_byteenable != new_work_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_out_read_last_time <= 0;
      else 
        new_work_clock_0_out_read_last_time <= new_work_clock_0_out_read;
    end


  //new_work_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_0_out_read != new_work_clock_0_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_out_write_last_time <= 0;
      else 
        new_work_clock_0_out_write_last_time <= new_work_clock_0_out_write;
    end


  //new_work_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_0_out_write != new_work_clock_0_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_0_out_writedata_last_time <= 0;
      else 
        new_work_clock_0_out_writedata_last_time <= new_work_clock_0_out_writedata;
    end


  //new_work_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_0_out_writedata != new_work_clock_0_out_writedata_last_time) & new_work_clock_0_out_write)
        begin
          $write("%0d ns: new_work_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_1_in_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         new_work_clock_1_in_endofpacket,
                                         new_work_clock_1_in_readdata,
                                         new_work_clock_1_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_new_work_clock_1_in,
                                         cpu_0_data_master_qualified_request_new_work_clock_1_in,
                                         cpu_0_data_master_read_data_valid_new_work_clock_1_in,
                                         cpu_0_data_master_requests_new_work_clock_1_in,
                                         d1_new_work_clock_1_in_end_xfer,
                                         new_work_clock_1_in_address,
                                         new_work_clock_1_in_byteenable,
                                         new_work_clock_1_in_endofpacket_from_sa,
                                         new_work_clock_1_in_nativeaddress,
                                         new_work_clock_1_in_read,
                                         new_work_clock_1_in_readdata_from_sa,
                                         new_work_clock_1_in_reset_n,
                                         new_work_clock_1_in_waitrequest_from_sa,
                                         new_work_clock_1_in_write,
                                         new_work_clock_1_in_writedata
                                      )
;

  output           cpu_0_data_master_granted_new_work_clock_1_in;
  output           cpu_0_data_master_qualified_request_new_work_clock_1_in;
  output           cpu_0_data_master_read_data_valid_new_work_clock_1_in;
  output           cpu_0_data_master_requests_new_work_clock_1_in;
  output           d1_new_work_clock_1_in_end_xfer;
  output  [  2: 0] new_work_clock_1_in_address;
  output  [  3: 0] new_work_clock_1_in_byteenable;
  output           new_work_clock_1_in_endofpacket_from_sa;
  output           new_work_clock_1_in_nativeaddress;
  output           new_work_clock_1_in_read;
  output  [ 31: 0] new_work_clock_1_in_readdata_from_sa;
  output           new_work_clock_1_in_reset_n;
  output           new_work_clock_1_in_waitrequest_from_sa;
  output           new_work_clock_1_in_write;
  output  [ 31: 0] new_work_clock_1_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            new_work_clock_1_in_endofpacket;
  input   [ 31: 0] new_work_clock_1_in_readdata;
  input            new_work_clock_1_in_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_new_work_clock_1_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_1_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_1_in;
  wire             cpu_0_data_master_requests_new_work_clock_1_in;
  wire             cpu_0_data_master_saved_grant_new_work_clock_1_in;
  reg              d1_new_work_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] new_work_clock_1_in_address;
  wire             new_work_clock_1_in_allgrants;
  wire             new_work_clock_1_in_allow_new_arb_cycle;
  wire             new_work_clock_1_in_any_bursting_master_saved_grant;
  wire             new_work_clock_1_in_any_continuerequest;
  wire             new_work_clock_1_in_arb_counter_enable;
  reg     [  1: 0] new_work_clock_1_in_arb_share_counter;
  wire    [  1: 0] new_work_clock_1_in_arb_share_counter_next_value;
  wire    [  1: 0] new_work_clock_1_in_arb_share_set_values;
  wire             new_work_clock_1_in_beginbursttransfer_internal;
  wire             new_work_clock_1_in_begins_xfer;
  wire    [  3: 0] new_work_clock_1_in_byteenable;
  wire             new_work_clock_1_in_end_xfer;
  wire             new_work_clock_1_in_endofpacket_from_sa;
  wire             new_work_clock_1_in_firsttransfer;
  wire             new_work_clock_1_in_grant_vector;
  wire             new_work_clock_1_in_in_a_read_cycle;
  wire             new_work_clock_1_in_in_a_write_cycle;
  wire             new_work_clock_1_in_master_qreq_vector;
  wire             new_work_clock_1_in_nativeaddress;
  wire             new_work_clock_1_in_non_bursting_master_requests;
  wire             new_work_clock_1_in_read;
  wire    [ 31: 0] new_work_clock_1_in_readdata_from_sa;
  reg              new_work_clock_1_in_reg_firsttransfer;
  wire             new_work_clock_1_in_reset_n;
  reg              new_work_clock_1_in_slavearbiterlockenable;
  wire             new_work_clock_1_in_slavearbiterlockenable2;
  wire             new_work_clock_1_in_unreg_firsttransfer;
  wire             new_work_clock_1_in_waitrequest_from_sa;
  wire             new_work_clock_1_in_waits_for_read;
  wire             new_work_clock_1_in_waits_for_write;
  wire             new_work_clock_1_in_write;
  wire    [ 31: 0] new_work_clock_1_in_writedata;
  wire    [ 24: 0] shifted_address_to_new_work_clock_1_in_from_cpu_0_data_master;
  wire             wait_for_new_work_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_1_in_end_xfer;
    end


  assign new_work_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_new_work_clock_1_in));
  //assign new_work_clock_1_in_readdata_from_sa = new_work_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_1_in_readdata_from_sa = new_work_clock_1_in_readdata;

  assign cpu_0_data_master_requests_new_work_clock_1_in = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1801028) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign new_work_clock_1_in_waitrequest_from_sa = new_work_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_1_in_waitrequest_from_sa = new_work_clock_1_in_waitrequest;

  //new_work_clock_1_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_1_in_arb_share_set_values = 1;

  //new_work_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_1_in_non_bursting_master_requests = cpu_0_data_master_requests_new_work_clock_1_in;

  //new_work_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_1_in_any_bursting_master_saved_grant = 0;

  //new_work_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_1_in_arb_share_counter_next_value = new_work_clock_1_in_firsttransfer ? (new_work_clock_1_in_arb_share_set_values - 1) : |new_work_clock_1_in_arb_share_counter ? (new_work_clock_1_in_arb_share_counter - 1) : 0;

  //new_work_clock_1_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_1_in_allgrants = |new_work_clock_1_in_grant_vector;

  //new_work_clock_1_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_1_in_end_xfer = ~(new_work_clock_1_in_waits_for_read | new_work_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_1_in = new_work_clock_1_in_end_xfer & (~new_work_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_1_in & new_work_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_1_in & ~new_work_clock_1_in_non_bursting_master_requests);

  //new_work_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_in_arb_share_counter <= 0;
      else if (new_work_clock_1_in_arb_counter_enable)
          new_work_clock_1_in_arb_share_counter <= new_work_clock_1_in_arb_share_counter_next_value;
    end


  //new_work_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_1_in) | (end_xfer_arb_share_counter_term_new_work_clock_1_in & ~new_work_clock_1_in_non_bursting_master_requests))
          new_work_clock_1_in_slavearbiterlockenable <= |new_work_clock_1_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master new_work_clock_1/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = new_work_clock_1_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //new_work_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_1_in_slavearbiterlockenable2 = |new_work_clock_1_in_arb_share_counter_next_value;

  //cpu_0/data_master new_work_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = new_work_clock_1_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_1_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_new_work_clock_1_in = cpu_0_data_master_requests_new_work_clock_1_in & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_new_work_clock_1_in, which is an e_mux
  assign cpu_0_data_master_read_data_valid_new_work_clock_1_in = cpu_0_data_master_granted_new_work_clock_1_in & cpu_0_data_master_read & ~new_work_clock_1_in_waits_for_read;

  //new_work_clock_1_in_writedata mux, which is an e_mux
  assign new_work_clock_1_in_writedata = cpu_0_data_master_writedata;

  //assign new_work_clock_1_in_endofpacket_from_sa = new_work_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_1_in_endofpacket_from_sa = new_work_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_new_work_clock_1_in = cpu_0_data_master_qualified_request_new_work_clock_1_in;

  //cpu_0/data_master saved-grant new_work_clock_1/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_new_work_clock_1_in = cpu_0_data_master_requests_new_work_clock_1_in;

  //allow new arb cycle for new_work_clock_1/in, which is an e_assign
  assign new_work_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_1_in_master_qreq_vector = 1;

  //new_work_clock_1_in_reset_n assignment, which is an e_assign
  assign new_work_clock_1_in_reset_n = reset_n;

  //new_work_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_1_in_firsttransfer = new_work_clock_1_in_begins_xfer ? new_work_clock_1_in_unreg_firsttransfer : new_work_clock_1_in_reg_firsttransfer;

  //new_work_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_1_in_unreg_firsttransfer = ~(new_work_clock_1_in_slavearbiterlockenable & new_work_clock_1_in_any_continuerequest);

  //new_work_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_1_in_begins_xfer)
          new_work_clock_1_in_reg_firsttransfer <= new_work_clock_1_in_unreg_firsttransfer;
    end


  //new_work_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_1_in_beginbursttransfer_internal = new_work_clock_1_in_begins_xfer;

  //new_work_clock_1_in_read assignment, which is an e_mux
  assign new_work_clock_1_in_read = cpu_0_data_master_granted_new_work_clock_1_in & cpu_0_data_master_read;

  //new_work_clock_1_in_write assignment, which is an e_mux
  assign new_work_clock_1_in_write = cpu_0_data_master_granted_new_work_clock_1_in & cpu_0_data_master_write;

  assign shifted_address_to_new_work_clock_1_in_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //new_work_clock_1_in_address mux, which is an e_mux
  assign new_work_clock_1_in_address = shifted_address_to_new_work_clock_1_in_from_cpu_0_data_master >> 2;

  //slaveid new_work_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_1_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_new_work_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_1_in_end_xfer <= 1;
      else 
        d1_new_work_clock_1_in_end_xfer <= new_work_clock_1_in_end_xfer;
    end


  //new_work_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_1_in_waits_for_read = new_work_clock_1_in_in_a_read_cycle & new_work_clock_1_in_waitrequest_from_sa;

  //new_work_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_1_in_in_a_read_cycle = cpu_0_data_master_granted_new_work_clock_1_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_1_in_in_a_read_cycle;

  //new_work_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_1_in_waits_for_write = new_work_clock_1_in_in_a_write_cycle & new_work_clock_1_in_waitrequest_from_sa;

  //new_work_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_1_in_in_a_write_cycle = cpu_0_data_master_granted_new_work_clock_1_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_1_in_in_a_write_cycle;

  assign wait_for_new_work_clock_1_in_counter = 0;
  //new_work_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_1_in_byteenable = (cpu_0_data_master_granted_new_work_clock_1_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_1/in enable non-zero assertions, which is an e_register
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

module new_work_clock_1_out_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                          jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                          jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                          new_work_clock_1_out_address,
                                          new_work_clock_1_out_byteenable,
                                          new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave,
                                          new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                          new_work_clock_1_out_read,
                                          new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                          new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave,
                                          new_work_clock_1_out_write,
                                          new_work_clock_1_out_writedata,
                                          reset_n,

                                         // outputs:
                                          new_work_clock_1_out_address_to_slave,
                                          new_work_clock_1_out_readdata,
                                          new_work_clock_1_out_reset_n,
                                          new_work_clock_1_out_waitrequest
                                       )
;

  output  [  2: 0] new_work_clock_1_out_address_to_slave;
  output  [ 31: 0] new_work_clock_1_out_readdata;
  output           new_work_clock_1_out_reset_n;
  output           new_work_clock_1_out_waitrequest;
  input            clk;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [  2: 0] new_work_clock_1_out_address;
  input   [  3: 0] new_work_clock_1_out_byteenable;
  input            new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  input            new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            new_work_clock_1_out_read;
  input            new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  input            new_work_clock_1_out_write;
  input   [ 31: 0] new_work_clock_1_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  2: 0] new_work_clock_1_out_address_last_time;
  wire    [  2: 0] new_work_clock_1_out_address_to_slave;
  reg     [  3: 0] new_work_clock_1_out_byteenable_last_time;
  reg              new_work_clock_1_out_read_last_time;
  wire    [ 31: 0] new_work_clock_1_out_readdata;
  wire             new_work_clock_1_out_reset_n;
  wire             new_work_clock_1_out_run;
  wire             new_work_clock_1_out_waitrequest;
  reg              new_work_clock_1_out_write_last_time;
  reg     [ 31: 0] new_work_clock_1_out_writedata_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(new_work_clock_1_out_read | new_work_clock_1_out_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (new_work_clock_1_out_read | new_work_clock_1_out_write)))) & ((~new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(new_work_clock_1_out_read | new_work_clock_1_out_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (new_work_clock_1_out_read | new_work_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_1_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_1_out_address_to_slave = new_work_clock_1_out_address;

  //new_work_clock_1/out readdata mux, which is an e_mux
  assign new_work_clock_1_out_readdata = jtag_uart_0_avalon_jtag_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_1_out_waitrequest = ~new_work_clock_1_out_run;

  //new_work_clock_1_out_reset_n assignment, which is an e_assign
  assign new_work_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_out_address_last_time <= 0;
      else 
        new_work_clock_1_out_address_last_time <= new_work_clock_1_out_address;
    end


  //new_work_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_1_out_waitrequest & (new_work_clock_1_out_read | new_work_clock_1_out_write);
    end


  //new_work_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_1_out_address != new_work_clock_1_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_out_byteenable_last_time <= 0;
      else 
        new_work_clock_1_out_byteenable_last_time <= new_work_clock_1_out_byteenable;
    end


  //new_work_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_1_out_byteenable != new_work_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_out_read_last_time <= 0;
      else 
        new_work_clock_1_out_read_last_time <= new_work_clock_1_out_read;
    end


  //new_work_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_1_out_read != new_work_clock_1_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_out_write_last_time <= 0;
      else 
        new_work_clock_1_out_write_last_time <= new_work_clock_1_out_write;
    end


  //new_work_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_1_out_write != new_work_clock_1_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_1_out_writedata_last_time <= 0;
      else 
        new_work_clock_1_out_writedata_last_time <= new_work_clock_1_out_writedata;
    end


  //new_work_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_1_out_writedata != new_work_clock_1_out_writedata_last_time) & new_work_clock_1_out_write)
        begin
          $write("%0d ns: new_work_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_2_in_arbitrator (
                                        // inputs:
                                         clk,
                                         new_work_burst_2_downstream_address_to_slave,
                                         new_work_burst_2_downstream_arbitrationshare,
                                         new_work_burst_2_downstream_burstcount,
                                         new_work_burst_2_downstream_byteenable,
                                         new_work_burst_2_downstream_latency_counter,
                                         new_work_burst_2_downstream_nativeaddress,
                                         new_work_burst_2_downstream_read,
                                         new_work_burst_2_downstream_write,
                                         new_work_burst_2_downstream_writedata,
                                         new_work_clock_2_in_endofpacket,
                                         new_work_clock_2_in_readdata,
                                         new_work_clock_2_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         d1_new_work_clock_2_in_end_xfer,
                                         new_work_burst_2_downstream_granted_new_work_clock_2_in,
                                         new_work_burst_2_downstream_qualified_request_new_work_clock_2_in,
                                         new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in,
                                         new_work_burst_2_downstream_requests_new_work_clock_2_in,
                                         new_work_clock_2_in_address,
                                         new_work_clock_2_in_byteenable,
                                         new_work_clock_2_in_endofpacket_from_sa,
                                         new_work_clock_2_in_nativeaddress,
                                         new_work_clock_2_in_read,
                                         new_work_clock_2_in_readdata_from_sa,
                                         new_work_clock_2_in_reset_n,
                                         new_work_clock_2_in_waitrequest_from_sa,
                                         new_work_clock_2_in_write,
                                         new_work_clock_2_in_writedata
                                      )
;

  output           d1_new_work_clock_2_in_end_xfer;
  output           new_work_burst_2_downstream_granted_new_work_clock_2_in;
  output           new_work_burst_2_downstream_qualified_request_new_work_clock_2_in;
  output           new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in;
  output           new_work_burst_2_downstream_requests_new_work_clock_2_in;
  output  [ 22: 0] new_work_clock_2_in_address;
  output  [  1: 0] new_work_clock_2_in_byteenable;
  output           new_work_clock_2_in_endofpacket_from_sa;
  output  [ 21: 0] new_work_clock_2_in_nativeaddress;
  output           new_work_clock_2_in_read;
  output  [ 15: 0] new_work_clock_2_in_readdata_from_sa;
  output           new_work_clock_2_in_reset_n;
  output           new_work_clock_2_in_waitrequest_from_sa;
  output           new_work_clock_2_in_write;
  output  [ 15: 0] new_work_clock_2_in_writedata;
  input            clk;
  input   [ 22: 0] new_work_burst_2_downstream_address_to_slave;
  input   [  4: 0] new_work_burst_2_downstream_arbitrationshare;
  input            new_work_burst_2_downstream_burstcount;
  input   [  1: 0] new_work_burst_2_downstream_byteenable;
  input            new_work_burst_2_downstream_latency_counter;
  input   [ 22: 0] new_work_burst_2_downstream_nativeaddress;
  input            new_work_burst_2_downstream_read;
  input            new_work_burst_2_downstream_write;
  input   [ 15: 0] new_work_burst_2_downstream_writedata;
  input            new_work_clock_2_in_endofpacket;
  input   [ 15: 0] new_work_clock_2_in_readdata;
  input            new_work_clock_2_in_waitrequest;
  input            reset_n;

  reg              d1_new_work_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             new_work_burst_2_downstream_arbiterlock;
  wire             new_work_burst_2_downstream_arbiterlock2;
  wire             new_work_burst_2_downstream_continuerequest;
  wire             new_work_burst_2_downstream_granted_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_qualified_request_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_requests_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_saved_grant_new_work_clock_2_in;
  wire    [ 22: 0] new_work_clock_2_in_address;
  wire             new_work_clock_2_in_allgrants;
  wire             new_work_clock_2_in_allow_new_arb_cycle;
  wire             new_work_clock_2_in_any_bursting_master_saved_grant;
  wire             new_work_clock_2_in_any_continuerequest;
  wire             new_work_clock_2_in_arb_counter_enable;
  reg     [  4: 0] new_work_clock_2_in_arb_share_counter;
  wire    [  4: 0] new_work_clock_2_in_arb_share_counter_next_value;
  wire    [  4: 0] new_work_clock_2_in_arb_share_set_values;
  wire             new_work_clock_2_in_beginbursttransfer_internal;
  wire             new_work_clock_2_in_begins_xfer;
  wire    [  1: 0] new_work_clock_2_in_byteenable;
  wire             new_work_clock_2_in_end_xfer;
  wire             new_work_clock_2_in_endofpacket_from_sa;
  wire             new_work_clock_2_in_firsttransfer;
  wire             new_work_clock_2_in_grant_vector;
  wire             new_work_clock_2_in_in_a_read_cycle;
  wire             new_work_clock_2_in_in_a_write_cycle;
  wire             new_work_clock_2_in_master_qreq_vector;
  wire    [ 21: 0] new_work_clock_2_in_nativeaddress;
  wire             new_work_clock_2_in_non_bursting_master_requests;
  wire             new_work_clock_2_in_read;
  wire    [ 15: 0] new_work_clock_2_in_readdata_from_sa;
  reg              new_work_clock_2_in_reg_firsttransfer;
  wire             new_work_clock_2_in_reset_n;
  reg              new_work_clock_2_in_slavearbiterlockenable;
  wire             new_work_clock_2_in_slavearbiterlockenable2;
  wire             new_work_clock_2_in_unreg_firsttransfer;
  wire             new_work_clock_2_in_waitrequest_from_sa;
  wire             new_work_clock_2_in_waits_for_read;
  wire             new_work_clock_2_in_waits_for_write;
  wire             new_work_clock_2_in_write;
  wire    [ 15: 0] new_work_clock_2_in_writedata;
  wire             wait_for_new_work_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_2_in_end_xfer;
    end


  assign new_work_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((new_work_burst_2_downstream_qualified_request_new_work_clock_2_in));
  //assign new_work_clock_2_in_readdata_from_sa = new_work_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_2_in_readdata_from_sa = new_work_clock_2_in_readdata;

  assign new_work_burst_2_downstream_requests_new_work_clock_2_in = (1) & (new_work_burst_2_downstream_read | new_work_burst_2_downstream_write);
  //assign new_work_clock_2_in_waitrequest_from_sa = new_work_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_2_in_waitrequest_from_sa = new_work_clock_2_in_waitrequest;

  //new_work_clock_2_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_2_in_arb_share_set_values = (new_work_burst_2_downstream_granted_new_work_clock_2_in)? new_work_burst_2_downstream_arbitrationshare :
    1;

  //new_work_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_2_in_non_bursting_master_requests = 0;

  //new_work_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_2_in_any_bursting_master_saved_grant = new_work_burst_2_downstream_saved_grant_new_work_clock_2_in;

  //new_work_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_2_in_arb_share_counter_next_value = new_work_clock_2_in_firsttransfer ? (new_work_clock_2_in_arb_share_set_values - 1) : |new_work_clock_2_in_arb_share_counter ? (new_work_clock_2_in_arb_share_counter - 1) : 0;

  //new_work_clock_2_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_2_in_allgrants = |new_work_clock_2_in_grant_vector;

  //new_work_clock_2_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_2_in_end_xfer = ~(new_work_clock_2_in_waits_for_read | new_work_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_2_in = new_work_clock_2_in_end_xfer & (~new_work_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_2_in & new_work_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_2_in & ~new_work_clock_2_in_non_bursting_master_requests);

  //new_work_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_in_arb_share_counter <= 0;
      else if (new_work_clock_2_in_arb_counter_enable)
          new_work_clock_2_in_arb_share_counter <= new_work_clock_2_in_arb_share_counter_next_value;
    end


  //new_work_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_2_in) | (end_xfer_arb_share_counter_term_new_work_clock_2_in & ~new_work_clock_2_in_non_bursting_master_requests))
          new_work_clock_2_in_slavearbiterlockenable <= |new_work_clock_2_in_arb_share_counter_next_value;
    end


  //new_work_burst_2/downstream new_work_clock_2/in arbiterlock, which is an e_assign
  assign new_work_burst_2_downstream_arbiterlock = new_work_clock_2_in_slavearbiterlockenable & new_work_burst_2_downstream_continuerequest;

  //new_work_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_2_in_slavearbiterlockenable2 = |new_work_clock_2_in_arb_share_counter_next_value;

  //new_work_burst_2/downstream new_work_clock_2/in arbiterlock2, which is an e_assign
  assign new_work_burst_2_downstream_arbiterlock2 = new_work_clock_2_in_slavearbiterlockenable2 & new_work_burst_2_downstream_continuerequest;

  //new_work_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_2_in_any_continuerequest = 1;

  //new_work_burst_2_downstream_continuerequest continued request, which is an e_assign
  assign new_work_burst_2_downstream_continuerequest = 1;

  assign new_work_burst_2_downstream_qualified_request_new_work_clock_2_in = new_work_burst_2_downstream_requests_new_work_clock_2_in & ~((new_work_burst_2_downstream_read & ((new_work_burst_2_downstream_latency_counter != 0))));
  //local readdatavalid new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in, which is an e_mux
  assign new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in = new_work_burst_2_downstream_granted_new_work_clock_2_in & new_work_burst_2_downstream_read & ~new_work_clock_2_in_waits_for_read;

  //new_work_clock_2_in_writedata mux, which is an e_mux
  assign new_work_clock_2_in_writedata = new_work_burst_2_downstream_writedata;

  //assign new_work_clock_2_in_endofpacket_from_sa = new_work_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_2_in_endofpacket_from_sa = new_work_clock_2_in_endofpacket;

  //master is always granted when requested
  assign new_work_burst_2_downstream_granted_new_work_clock_2_in = new_work_burst_2_downstream_qualified_request_new_work_clock_2_in;

  //new_work_burst_2/downstream saved-grant new_work_clock_2/in, which is an e_assign
  assign new_work_burst_2_downstream_saved_grant_new_work_clock_2_in = new_work_burst_2_downstream_requests_new_work_clock_2_in;

  //allow new arb cycle for new_work_clock_2/in, which is an e_assign
  assign new_work_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_2_in_master_qreq_vector = 1;

  //new_work_clock_2_in_reset_n assignment, which is an e_assign
  assign new_work_clock_2_in_reset_n = reset_n;

  //new_work_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_2_in_firsttransfer = new_work_clock_2_in_begins_xfer ? new_work_clock_2_in_unreg_firsttransfer : new_work_clock_2_in_reg_firsttransfer;

  //new_work_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_2_in_unreg_firsttransfer = ~(new_work_clock_2_in_slavearbiterlockenable & new_work_clock_2_in_any_continuerequest);

  //new_work_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_2_in_begins_xfer)
          new_work_clock_2_in_reg_firsttransfer <= new_work_clock_2_in_unreg_firsttransfer;
    end


  //new_work_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_2_in_beginbursttransfer_internal = new_work_clock_2_in_begins_xfer;

  //new_work_clock_2_in_read assignment, which is an e_mux
  assign new_work_clock_2_in_read = new_work_burst_2_downstream_granted_new_work_clock_2_in & new_work_burst_2_downstream_read;

  //new_work_clock_2_in_write assignment, which is an e_mux
  assign new_work_clock_2_in_write = new_work_burst_2_downstream_granted_new_work_clock_2_in & new_work_burst_2_downstream_write;

  //new_work_clock_2_in_address mux, which is an e_mux
  assign new_work_clock_2_in_address = new_work_burst_2_downstream_address_to_slave;

  //slaveid new_work_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_2_in_nativeaddress = new_work_burst_2_downstream_nativeaddress;

  //d1_new_work_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_2_in_end_xfer <= 1;
      else 
        d1_new_work_clock_2_in_end_xfer <= new_work_clock_2_in_end_xfer;
    end


  //new_work_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_2_in_waits_for_read = new_work_clock_2_in_in_a_read_cycle & new_work_clock_2_in_waitrequest_from_sa;

  //new_work_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_2_in_in_a_read_cycle = new_work_burst_2_downstream_granted_new_work_clock_2_in & new_work_burst_2_downstream_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_2_in_in_a_read_cycle;

  //new_work_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_2_in_waits_for_write = new_work_clock_2_in_in_a_write_cycle & new_work_clock_2_in_waitrequest_from_sa;

  //new_work_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_2_in_in_a_write_cycle = new_work_burst_2_downstream_granted_new_work_clock_2_in & new_work_burst_2_downstream_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_2_in_in_a_write_cycle;

  assign wait_for_new_work_clock_2_in_counter = 0;
  //new_work_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_2_in_byteenable = (new_work_burst_2_downstream_granted_new_work_clock_2_in)? new_work_burst_2_downstream_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_2/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //new_work_burst_2/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_2_downstream_requests_new_work_clock_2_in && (new_work_burst_2_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_2/downstream drove 0 on its 'arbitrationshare' port while accessing slave new_work_clock_2/in", $time);
          $stop;
        end
    end


  //new_work_burst_2/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_2_downstream_requests_new_work_clock_2_in && (new_work_burst_2_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_2/downstream drove 0 on its 'burstcount' port while accessing slave new_work_clock_2/in", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_2_out_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_sdram_0_s1_end_xfer,
                                          new_work_clock_2_out_address,
                                          new_work_clock_2_out_byteenable,
                                          new_work_clock_2_out_granted_sdram_0_s1,
                                          new_work_clock_2_out_qualified_request_sdram_0_s1,
                                          new_work_clock_2_out_read,
                                          new_work_clock_2_out_read_data_valid_sdram_0_s1,
                                          new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register,
                                          new_work_clock_2_out_requests_sdram_0_s1,
                                          new_work_clock_2_out_write,
                                          new_work_clock_2_out_writedata,
                                          reset_n,
                                          sdram_0_s1_readdata_from_sa,
                                          sdram_0_s1_waitrequest_from_sa,

                                         // outputs:
                                          new_work_clock_2_out_address_to_slave,
                                          new_work_clock_2_out_readdata,
                                          new_work_clock_2_out_reset_n,
                                          new_work_clock_2_out_waitrequest
                                       )
;

  output  [ 22: 0] new_work_clock_2_out_address_to_slave;
  output  [ 15: 0] new_work_clock_2_out_readdata;
  output           new_work_clock_2_out_reset_n;
  output           new_work_clock_2_out_waitrequest;
  input            clk;
  input            d1_sdram_0_s1_end_xfer;
  input   [ 22: 0] new_work_clock_2_out_address;
  input   [  1: 0] new_work_clock_2_out_byteenable;
  input            new_work_clock_2_out_granted_sdram_0_s1;
  input            new_work_clock_2_out_qualified_request_sdram_0_s1;
  input            new_work_clock_2_out_read;
  input            new_work_clock_2_out_read_data_valid_sdram_0_s1;
  input            new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register;
  input            new_work_clock_2_out_requests_sdram_0_s1;
  input            new_work_clock_2_out_write;
  input   [ 15: 0] new_work_clock_2_out_writedata;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] new_work_clock_2_out_address_last_time;
  wire    [ 22: 0] new_work_clock_2_out_address_to_slave;
  reg     [  1: 0] new_work_clock_2_out_byteenable_last_time;
  reg              new_work_clock_2_out_read_last_time;
  wire    [ 15: 0] new_work_clock_2_out_readdata;
  wire             new_work_clock_2_out_reset_n;
  wire             new_work_clock_2_out_run;
  wire             new_work_clock_2_out_waitrequest;
  reg              new_work_clock_2_out_write_last_time;
  reg     [ 15: 0] new_work_clock_2_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (new_work_clock_2_out_qualified_request_sdram_0_s1 | new_work_clock_2_out_read_data_valid_sdram_0_s1 | ~new_work_clock_2_out_requests_sdram_0_s1) & (new_work_clock_2_out_granted_sdram_0_s1 | ~new_work_clock_2_out_qualified_request_sdram_0_s1) & ((~new_work_clock_2_out_qualified_request_sdram_0_s1 | ~new_work_clock_2_out_read | (new_work_clock_2_out_read_data_valid_sdram_0_s1 & new_work_clock_2_out_read))) & ((~new_work_clock_2_out_qualified_request_sdram_0_s1 | ~(new_work_clock_2_out_read | new_work_clock_2_out_write) | (1 & ~sdram_0_s1_waitrequest_from_sa & (new_work_clock_2_out_read | new_work_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_2_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_2_out_address_to_slave = new_work_clock_2_out_address;

  //new_work_clock_2/out readdata mux, which is an e_mux
  assign new_work_clock_2_out_readdata = sdram_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_2_out_waitrequest = ~new_work_clock_2_out_run;

  //new_work_clock_2_out_reset_n assignment, which is an e_assign
  assign new_work_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_out_address_last_time <= 0;
      else 
        new_work_clock_2_out_address_last_time <= new_work_clock_2_out_address;
    end


  //new_work_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_2_out_waitrequest & (new_work_clock_2_out_read | new_work_clock_2_out_write);
    end


  //new_work_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_2_out_address != new_work_clock_2_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_out_byteenable_last_time <= 0;
      else 
        new_work_clock_2_out_byteenable_last_time <= new_work_clock_2_out_byteenable;
    end


  //new_work_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_2_out_byteenable != new_work_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_out_read_last_time <= 0;
      else 
        new_work_clock_2_out_read_last_time <= new_work_clock_2_out_read;
    end


  //new_work_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_2_out_read != new_work_clock_2_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_out_write_last_time <= 0;
      else 
        new_work_clock_2_out_write_last_time <= new_work_clock_2_out_write;
    end


  //new_work_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_2_out_write != new_work_clock_2_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_2_out_writedata_last_time <= 0;
      else 
        new_work_clock_2_out_writedata_last_time <= new_work_clock_2_out_writedata;
    end


  //new_work_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_2_out_writedata != new_work_clock_2_out_writedata_last_time) & new_work_clock_2_out_write)
        begin
          $write("%0d ns: new_work_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_3_in_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_dbs_address,
                                         cpu_0_data_master_dbs_write_16,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         new_work_clock_3_in_endofpacket,
                                         new_work_clock_3_in_readdata,
                                         new_work_clock_3_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_byteenable_new_work_clock_3_in,
                                         cpu_0_data_master_granted_new_work_clock_3_in,
                                         cpu_0_data_master_qualified_request_new_work_clock_3_in,
                                         cpu_0_data_master_read_data_valid_new_work_clock_3_in,
                                         cpu_0_data_master_requests_new_work_clock_3_in,
                                         d1_new_work_clock_3_in_end_xfer,
                                         new_work_clock_3_in_address,
                                         new_work_clock_3_in_byteenable,
                                         new_work_clock_3_in_endofpacket_from_sa,
                                         new_work_clock_3_in_nativeaddress,
                                         new_work_clock_3_in_read,
                                         new_work_clock_3_in_readdata_from_sa,
                                         new_work_clock_3_in_reset_n,
                                         new_work_clock_3_in_waitrequest_from_sa,
                                         new_work_clock_3_in_write,
                                         new_work_clock_3_in_writedata
                                      )
;

  output  [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in;
  output           cpu_0_data_master_granted_new_work_clock_3_in;
  output           cpu_0_data_master_qualified_request_new_work_clock_3_in;
  output           cpu_0_data_master_read_data_valid_new_work_clock_3_in;
  output           cpu_0_data_master_requests_new_work_clock_3_in;
  output           d1_new_work_clock_3_in_end_xfer;
  output  [ 22: 0] new_work_clock_3_in_address;
  output  [  1: 0] new_work_clock_3_in_byteenable;
  output           new_work_clock_3_in_endofpacket_from_sa;
  output  [ 21: 0] new_work_clock_3_in_nativeaddress;
  output           new_work_clock_3_in_read;
  output  [ 15: 0] new_work_clock_3_in_readdata_from_sa;
  output           new_work_clock_3_in_reset_n;
  output           new_work_clock_3_in_waitrequest_from_sa;
  output           new_work_clock_3_in_write;
  output  [ 15: 0] new_work_clock_3_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            new_work_clock_3_in_endofpacket;
  input   [ 15: 0] new_work_clock_3_in_readdata;
  input            new_work_clock_3_in_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_new_work_clock_3_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_3_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_3_in;
  wire             cpu_0_data_master_requests_new_work_clock_3_in;
  wire             cpu_0_data_master_saved_grant_new_work_clock_3_in;
  reg              d1_new_work_clock_3_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_3_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 22: 0] new_work_clock_3_in_address;
  wire             new_work_clock_3_in_allgrants;
  wire             new_work_clock_3_in_allow_new_arb_cycle;
  wire             new_work_clock_3_in_any_bursting_master_saved_grant;
  wire             new_work_clock_3_in_any_continuerequest;
  wire             new_work_clock_3_in_arb_counter_enable;
  reg     [  1: 0] new_work_clock_3_in_arb_share_counter;
  wire    [  1: 0] new_work_clock_3_in_arb_share_counter_next_value;
  wire    [  1: 0] new_work_clock_3_in_arb_share_set_values;
  wire             new_work_clock_3_in_beginbursttransfer_internal;
  wire             new_work_clock_3_in_begins_xfer;
  wire    [  1: 0] new_work_clock_3_in_byteenable;
  wire             new_work_clock_3_in_end_xfer;
  wire             new_work_clock_3_in_endofpacket_from_sa;
  wire             new_work_clock_3_in_firsttransfer;
  wire             new_work_clock_3_in_grant_vector;
  wire             new_work_clock_3_in_in_a_read_cycle;
  wire             new_work_clock_3_in_in_a_write_cycle;
  wire             new_work_clock_3_in_master_qreq_vector;
  wire    [ 21: 0] new_work_clock_3_in_nativeaddress;
  wire             new_work_clock_3_in_non_bursting_master_requests;
  wire             new_work_clock_3_in_read;
  wire    [ 15: 0] new_work_clock_3_in_readdata_from_sa;
  reg              new_work_clock_3_in_reg_firsttransfer;
  wire             new_work_clock_3_in_reset_n;
  reg              new_work_clock_3_in_slavearbiterlockenable;
  wire             new_work_clock_3_in_slavearbiterlockenable2;
  wire             new_work_clock_3_in_unreg_firsttransfer;
  wire             new_work_clock_3_in_waitrequest_from_sa;
  wire             new_work_clock_3_in_waits_for_read;
  wire             new_work_clock_3_in_waits_for_write;
  wire             new_work_clock_3_in_write;
  wire    [ 15: 0] new_work_clock_3_in_writedata;
  wire             wait_for_new_work_clock_3_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_3_in_end_xfer;
    end


  assign new_work_clock_3_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_new_work_clock_3_in));
  //assign new_work_clock_3_in_readdata_from_sa = new_work_clock_3_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_3_in_readdata_from_sa = new_work_clock_3_in_readdata;

  assign cpu_0_data_master_requests_new_work_clock_3_in = ({cpu_0_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign new_work_clock_3_in_waitrequest_from_sa = new_work_clock_3_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_3_in_waitrequest_from_sa = new_work_clock_3_in_waitrequest;

  //new_work_clock_3_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_3_in_arb_share_set_values = (cpu_0_data_master_granted_new_work_clock_3_in)? 2 :
    1;

  //new_work_clock_3_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_3_in_non_bursting_master_requests = cpu_0_data_master_requests_new_work_clock_3_in;

  //new_work_clock_3_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_3_in_any_bursting_master_saved_grant = 0;

  //new_work_clock_3_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_3_in_arb_share_counter_next_value = new_work_clock_3_in_firsttransfer ? (new_work_clock_3_in_arb_share_set_values - 1) : |new_work_clock_3_in_arb_share_counter ? (new_work_clock_3_in_arb_share_counter - 1) : 0;

  //new_work_clock_3_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_3_in_allgrants = |new_work_clock_3_in_grant_vector;

  //new_work_clock_3_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_3_in_end_xfer = ~(new_work_clock_3_in_waits_for_read | new_work_clock_3_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_3_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_3_in = new_work_clock_3_in_end_xfer & (~new_work_clock_3_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_3_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_3_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_3_in & new_work_clock_3_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_3_in & ~new_work_clock_3_in_non_bursting_master_requests);

  //new_work_clock_3_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_in_arb_share_counter <= 0;
      else if (new_work_clock_3_in_arb_counter_enable)
          new_work_clock_3_in_arb_share_counter <= new_work_clock_3_in_arb_share_counter_next_value;
    end


  //new_work_clock_3_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_3_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_3_in) | (end_xfer_arb_share_counter_term_new_work_clock_3_in & ~new_work_clock_3_in_non_bursting_master_requests))
          new_work_clock_3_in_slavearbiterlockenable <= |new_work_clock_3_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master new_work_clock_3/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = new_work_clock_3_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //new_work_clock_3_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_3_in_slavearbiterlockenable2 = |new_work_clock_3_in_arb_share_counter_next_value;

  //cpu_0/data_master new_work_clock_3/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = new_work_clock_3_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_clock_3_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_3_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_new_work_clock_3_in = cpu_0_data_master_requests_new_work_clock_3_in & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | ((!cpu_0_data_master_byteenable_new_work_clock_3_in) & cpu_0_data_master_write));
  //local readdatavalid cpu_0_data_master_read_data_valid_new_work_clock_3_in, which is an e_mux
  assign cpu_0_data_master_read_data_valid_new_work_clock_3_in = cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_read & ~new_work_clock_3_in_waits_for_read;

  //new_work_clock_3_in_writedata mux, which is an e_mux
  assign new_work_clock_3_in_writedata = cpu_0_data_master_dbs_write_16;

  //assign new_work_clock_3_in_endofpacket_from_sa = new_work_clock_3_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_3_in_endofpacket_from_sa = new_work_clock_3_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_new_work_clock_3_in = cpu_0_data_master_qualified_request_new_work_clock_3_in;

  //cpu_0/data_master saved-grant new_work_clock_3/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_new_work_clock_3_in = cpu_0_data_master_requests_new_work_clock_3_in;

  //allow new arb cycle for new_work_clock_3/in, which is an e_assign
  assign new_work_clock_3_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_3_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_3_in_master_qreq_vector = 1;

  //new_work_clock_3_in_reset_n assignment, which is an e_assign
  assign new_work_clock_3_in_reset_n = reset_n;

  //new_work_clock_3_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_3_in_firsttransfer = new_work_clock_3_in_begins_xfer ? new_work_clock_3_in_unreg_firsttransfer : new_work_clock_3_in_reg_firsttransfer;

  //new_work_clock_3_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_3_in_unreg_firsttransfer = ~(new_work_clock_3_in_slavearbiterlockenable & new_work_clock_3_in_any_continuerequest);

  //new_work_clock_3_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_3_in_begins_xfer)
          new_work_clock_3_in_reg_firsttransfer <= new_work_clock_3_in_unreg_firsttransfer;
    end


  //new_work_clock_3_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_3_in_beginbursttransfer_internal = new_work_clock_3_in_begins_xfer;

  //new_work_clock_3_in_read assignment, which is an e_mux
  assign new_work_clock_3_in_read = cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_read;

  //new_work_clock_3_in_write assignment, which is an e_mux
  assign new_work_clock_3_in_write = cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_write;

  //new_work_clock_3_in_address mux, which is an e_mux
  assign new_work_clock_3_in_address = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //slaveid new_work_clock_3_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_3_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_new_work_clock_3_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_3_in_end_xfer <= 1;
      else 
        d1_new_work_clock_3_in_end_xfer <= new_work_clock_3_in_end_xfer;
    end


  //new_work_clock_3_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_3_in_waits_for_read = new_work_clock_3_in_in_a_read_cycle & new_work_clock_3_in_waitrequest_from_sa;

  //new_work_clock_3_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_3_in_in_a_read_cycle = cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_3_in_in_a_read_cycle;

  //new_work_clock_3_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_3_in_waits_for_write = new_work_clock_3_in_in_a_write_cycle & new_work_clock_3_in_waitrequest_from_sa;

  //new_work_clock_3_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_3_in_in_a_write_cycle = cpu_0_data_master_granted_new_work_clock_3_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_3_in_in_a_write_cycle;

  assign wait_for_new_work_clock_3_in_counter = 0;
  //new_work_clock_3_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_3_in_byteenable = (cpu_0_data_master_granted_new_work_clock_3_in)? cpu_0_data_master_byteenable_new_work_clock_3_in :
    -1;

  assign {cpu_0_data_master_byteenable_new_work_clock_3_in_segment_1,
cpu_0_data_master_byteenable_new_work_clock_3_in_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_new_work_clock_3_in = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_new_work_clock_3_in_segment_0 :
    cpu_0_data_master_byteenable_new_work_clock_3_in_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_3/in enable non-zero assertions, which is an e_register
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

module new_work_clock_3_out_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_sdram_0_s1_end_xfer,
                                          new_work_clock_3_out_address,
                                          new_work_clock_3_out_byteenable,
                                          new_work_clock_3_out_granted_sdram_0_s1,
                                          new_work_clock_3_out_qualified_request_sdram_0_s1,
                                          new_work_clock_3_out_read,
                                          new_work_clock_3_out_read_data_valid_sdram_0_s1,
                                          new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register,
                                          new_work_clock_3_out_requests_sdram_0_s1,
                                          new_work_clock_3_out_write,
                                          new_work_clock_3_out_writedata,
                                          reset_n,
                                          sdram_0_s1_readdata_from_sa,
                                          sdram_0_s1_waitrequest_from_sa,

                                         // outputs:
                                          new_work_clock_3_out_address_to_slave,
                                          new_work_clock_3_out_readdata,
                                          new_work_clock_3_out_reset_n,
                                          new_work_clock_3_out_waitrequest
                                       )
;

  output  [ 22: 0] new_work_clock_3_out_address_to_slave;
  output  [ 15: 0] new_work_clock_3_out_readdata;
  output           new_work_clock_3_out_reset_n;
  output           new_work_clock_3_out_waitrequest;
  input            clk;
  input            d1_sdram_0_s1_end_xfer;
  input   [ 22: 0] new_work_clock_3_out_address;
  input   [  1: 0] new_work_clock_3_out_byteenable;
  input            new_work_clock_3_out_granted_sdram_0_s1;
  input            new_work_clock_3_out_qualified_request_sdram_0_s1;
  input            new_work_clock_3_out_read;
  input            new_work_clock_3_out_read_data_valid_sdram_0_s1;
  input            new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register;
  input            new_work_clock_3_out_requests_sdram_0_s1;
  input            new_work_clock_3_out_write;
  input   [ 15: 0] new_work_clock_3_out_writedata;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] new_work_clock_3_out_address_last_time;
  wire    [ 22: 0] new_work_clock_3_out_address_to_slave;
  reg     [  1: 0] new_work_clock_3_out_byteenable_last_time;
  reg              new_work_clock_3_out_read_last_time;
  wire    [ 15: 0] new_work_clock_3_out_readdata;
  wire             new_work_clock_3_out_reset_n;
  wire             new_work_clock_3_out_run;
  wire             new_work_clock_3_out_waitrequest;
  reg              new_work_clock_3_out_write_last_time;
  reg     [ 15: 0] new_work_clock_3_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (new_work_clock_3_out_qualified_request_sdram_0_s1 | new_work_clock_3_out_read_data_valid_sdram_0_s1 | ~new_work_clock_3_out_requests_sdram_0_s1) & (new_work_clock_3_out_granted_sdram_0_s1 | ~new_work_clock_3_out_qualified_request_sdram_0_s1) & ((~new_work_clock_3_out_qualified_request_sdram_0_s1 | ~new_work_clock_3_out_read | (new_work_clock_3_out_read_data_valid_sdram_0_s1 & new_work_clock_3_out_read))) & ((~new_work_clock_3_out_qualified_request_sdram_0_s1 | ~(new_work_clock_3_out_read | new_work_clock_3_out_write) | (1 & ~sdram_0_s1_waitrequest_from_sa & (new_work_clock_3_out_read | new_work_clock_3_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_3_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_3_out_address_to_slave = new_work_clock_3_out_address;

  //new_work_clock_3/out readdata mux, which is an e_mux
  assign new_work_clock_3_out_readdata = sdram_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_3_out_waitrequest = ~new_work_clock_3_out_run;

  //new_work_clock_3_out_reset_n assignment, which is an e_assign
  assign new_work_clock_3_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_3_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_out_address_last_time <= 0;
      else 
        new_work_clock_3_out_address_last_time <= new_work_clock_3_out_address;
    end


  //new_work_clock_3/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_3_out_waitrequest & (new_work_clock_3_out_read | new_work_clock_3_out_write);
    end


  //new_work_clock_3_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_3_out_address != new_work_clock_3_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_3_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_3_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_out_byteenable_last_time <= 0;
      else 
        new_work_clock_3_out_byteenable_last_time <= new_work_clock_3_out_byteenable;
    end


  //new_work_clock_3_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_3_out_byteenable != new_work_clock_3_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_3_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_3_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_out_read_last_time <= 0;
      else 
        new_work_clock_3_out_read_last_time <= new_work_clock_3_out_read;
    end


  //new_work_clock_3_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_3_out_read != new_work_clock_3_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_3_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_3_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_out_write_last_time <= 0;
      else 
        new_work_clock_3_out_write_last_time <= new_work_clock_3_out_write;
    end


  //new_work_clock_3_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_3_out_write != new_work_clock_3_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_3_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_3_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_3_out_writedata_last_time <= 0;
      else 
        new_work_clock_3_out_writedata_last_time <= new_work_clock_3_out_writedata;
    end


  //new_work_clock_3_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_3_out_writedata != new_work_clock_3_out_writedata_last_time) & new_work_clock_3_out_write)
        begin
          $write("%0d ns: new_work_clock_3_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_4_in_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         new_work_clock_4_in_endofpacket,
                                         new_work_clock_4_in_readdata,
                                         new_work_clock_4_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_new_work_clock_4_in,
                                         cpu_0_data_master_qualified_request_new_work_clock_4_in,
                                         cpu_0_data_master_read_data_valid_new_work_clock_4_in,
                                         cpu_0_data_master_requests_new_work_clock_4_in,
                                         d1_new_work_clock_4_in_end_xfer,
                                         new_work_clock_4_in_address,
                                         new_work_clock_4_in_endofpacket_from_sa,
                                         new_work_clock_4_in_nativeaddress,
                                         new_work_clock_4_in_read,
                                         new_work_clock_4_in_readdata_from_sa,
                                         new_work_clock_4_in_reset_n,
                                         new_work_clock_4_in_waitrequest_from_sa,
                                         new_work_clock_4_in_write,
                                         new_work_clock_4_in_writedata
                                      )
;

  output           cpu_0_data_master_granted_new_work_clock_4_in;
  output           cpu_0_data_master_qualified_request_new_work_clock_4_in;
  output           cpu_0_data_master_read_data_valid_new_work_clock_4_in;
  output           cpu_0_data_master_requests_new_work_clock_4_in;
  output           d1_new_work_clock_4_in_end_xfer;
  output  [  1: 0] new_work_clock_4_in_address;
  output           new_work_clock_4_in_endofpacket_from_sa;
  output  [  1: 0] new_work_clock_4_in_nativeaddress;
  output           new_work_clock_4_in_read;
  output  [  7: 0] new_work_clock_4_in_readdata_from_sa;
  output           new_work_clock_4_in_reset_n;
  output           new_work_clock_4_in_waitrequest_from_sa;
  output           new_work_clock_4_in_write;
  output  [  7: 0] new_work_clock_4_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            new_work_clock_4_in_endofpacket;
  input   [  7: 0] new_work_clock_4_in_readdata;
  input            new_work_clock_4_in_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_new_work_clock_4_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_4_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_4_in;
  wire             cpu_0_data_master_requests_new_work_clock_4_in;
  wire             cpu_0_data_master_saved_grant_new_work_clock_4_in;
  reg              d1_new_work_clock_4_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_4_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] new_work_clock_4_in_address;
  wire             new_work_clock_4_in_allgrants;
  wire             new_work_clock_4_in_allow_new_arb_cycle;
  wire             new_work_clock_4_in_any_bursting_master_saved_grant;
  wire             new_work_clock_4_in_any_continuerequest;
  wire             new_work_clock_4_in_arb_counter_enable;
  reg     [  1: 0] new_work_clock_4_in_arb_share_counter;
  wire    [  1: 0] new_work_clock_4_in_arb_share_counter_next_value;
  wire    [  1: 0] new_work_clock_4_in_arb_share_set_values;
  wire             new_work_clock_4_in_beginbursttransfer_internal;
  wire             new_work_clock_4_in_begins_xfer;
  wire             new_work_clock_4_in_end_xfer;
  wire             new_work_clock_4_in_endofpacket_from_sa;
  wire             new_work_clock_4_in_firsttransfer;
  wire             new_work_clock_4_in_grant_vector;
  wire             new_work_clock_4_in_in_a_read_cycle;
  wire             new_work_clock_4_in_in_a_write_cycle;
  wire             new_work_clock_4_in_master_qreq_vector;
  wire    [  1: 0] new_work_clock_4_in_nativeaddress;
  wire             new_work_clock_4_in_non_bursting_master_requests;
  wire             new_work_clock_4_in_pretend_byte_enable;
  wire             new_work_clock_4_in_read;
  wire    [  7: 0] new_work_clock_4_in_readdata_from_sa;
  reg              new_work_clock_4_in_reg_firsttransfer;
  wire             new_work_clock_4_in_reset_n;
  reg              new_work_clock_4_in_slavearbiterlockenable;
  wire             new_work_clock_4_in_slavearbiterlockenable2;
  wire             new_work_clock_4_in_unreg_firsttransfer;
  wire             new_work_clock_4_in_waitrequest_from_sa;
  wire             new_work_clock_4_in_waits_for_read;
  wire             new_work_clock_4_in_waits_for_write;
  wire             new_work_clock_4_in_write;
  wire    [  7: 0] new_work_clock_4_in_writedata;
  wire    [ 24: 0] shifted_address_to_new_work_clock_4_in_from_cpu_0_data_master;
  wire             wait_for_new_work_clock_4_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_4_in_end_xfer;
    end


  assign new_work_clock_4_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_new_work_clock_4_in));
  //assign new_work_clock_4_in_readdata_from_sa = new_work_clock_4_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_4_in_readdata_from_sa = new_work_clock_4_in_readdata;

  assign cpu_0_data_master_requests_new_work_clock_4_in = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1801000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign new_work_clock_4_in_waitrequest_from_sa = new_work_clock_4_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_4_in_waitrequest_from_sa = new_work_clock_4_in_waitrequest;

  //new_work_clock_4_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_4_in_arb_share_set_values = 1;

  //new_work_clock_4_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_4_in_non_bursting_master_requests = cpu_0_data_master_requests_new_work_clock_4_in;

  //new_work_clock_4_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_4_in_any_bursting_master_saved_grant = 0;

  //new_work_clock_4_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_4_in_arb_share_counter_next_value = new_work_clock_4_in_firsttransfer ? (new_work_clock_4_in_arb_share_set_values - 1) : |new_work_clock_4_in_arb_share_counter ? (new_work_clock_4_in_arb_share_counter - 1) : 0;

  //new_work_clock_4_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_4_in_allgrants = |new_work_clock_4_in_grant_vector;

  //new_work_clock_4_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_4_in_end_xfer = ~(new_work_clock_4_in_waits_for_read | new_work_clock_4_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_4_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_4_in = new_work_clock_4_in_end_xfer & (~new_work_clock_4_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_4_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_4_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_4_in & new_work_clock_4_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_4_in & ~new_work_clock_4_in_non_bursting_master_requests);

  //new_work_clock_4_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_in_arb_share_counter <= 0;
      else if (new_work_clock_4_in_arb_counter_enable)
          new_work_clock_4_in_arb_share_counter <= new_work_clock_4_in_arb_share_counter_next_value;
    end


  //new_work_clock_4_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_4_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_4_in) | (end_xfer_arb_share_counter_term_new_work_clock_4_in & ~new_work_clock_4_in_non_bursting_master_requests))
          new_work_clock_4_in_slavearbiterlockenable <= |new_work_clock_4_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master new_work_clock_4/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = new_work_clock_4_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //new_work_clock_4_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_4_in_slavearbiterlockenable2 = |new_work_clock_4_in_arb_share_counter_next_value;

  //cpu_0/data_master new_work_clock_4/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = new_work_clock_4_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_clock_4_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_4_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_new_work_clock_4_in = cpu_0_data_master_requests_new_work_clock_4_in & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))));
  //local readdatavalid cpu_0_data_master_read_data_valid_new_work_clock_4_in, which is an e_mux
  assign cpu_0_data_master_read_data_valid_new_work_clock_4_in = cpu_0_data_master_granted_new_work_clock_4_in & cpu_0_data_master_read & ~new_work_clock_4_in_waits_for_read;

  //new_work_clock_4_in_writedata mux, which is an e_mux
  assign new_work_clock_4_in_writedata = cpu_0_data_master_writedata;

  //assign new_work_clock_4_in_endofpacket_from_sa = new_work_clock_4_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_4_in_endofpacket_from_sa = new_work_clock_4_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_new_work_clock_4_in = cpu_0_data_master_qualified_request_new_work_clock_4_in;

  //cpu_0/data_master saved-grant new_work_clock_4/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_new_work_clock_4_in = cpu_0_data_master_requests_new_work_clock_4_in;

  //allow new arb cycle for new_work_clock_4/in, which is an e_assign
  assign new_work_clock_4_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_4_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_4_in_master_qreq_vector = 1;

  //new_work_clock_4_in_reset_n assignment, which is an e_assign
  assign new_work_clock_4_in_reset_n = reset_n;

  //new_work_clock_4_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_4_in_firsttransfer = new_work_clock_4_in_begins_xfer ? new_work_clock_4_in_unreg_firsttransfer : new_work_clock_4_in_reg_firsttransfer;

  //new_work_clock_4_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_4_in_unreg_firsttransfer = ~(new_work_clock_4_in_slavearbiterlockenable & new_work_clock_4_in_any_continuerequest);

  //new_work_clock_4_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_4_in_begins_xfer)
          new_work_clock_4_in_reg_firsttransfer <= new_work_clock_4_in_unreg_firsttransfer;
    end


  //new_work_clock_4_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_4_in_beginbursttransfer_internal = new_work_clock_4_in_begins_xfer;

  //new_work_clock_4_in_read assignment, which is an e_mux
  assign new_work_clock_4_in_read = cpu_0_data_master_granted_new_work_clock_4_in & cpu_0_data_master_read;

  //new_work_clock_4_in_write assignment, which is an e_mux
  assign new_work_clock_4_in_write = ((cpu_0_data_master_granted_new_work_clock_4_in & cpu_0_data_master_write)) & new_work_clock_4_in_pretend_byte_enable;

  assign shifted_address_to_new_work_clock_4_in_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //new_work_clock_4_in_address mux, which is an e_mux
  assign new_work_clock_4_in_address = shifted_address_to_new_work_clock_4_in_from_cpu_0_data_master >> 2;

  //slaveid new_work_clock_4_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_4_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_new_work_clock_4_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_4_in_end_xfer <= 1;
      else 
        d1_new_work_clock_4_in_end_xfer <= new_work_clock_4_in_end_xfer;
    end


  //new_work_clock_4_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_4_in_waits_for_read = new_work_clock_4_in_in_a_read_cycle & new_work_clock_4_in_waitrequest_from_sa;

  //new_work_clock_4_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_4_in_in_a_read_cycle = cpu_0_data_master_granted_new_work_clock_4_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_4_in_in_a_read_cycle;

  //new_work_clock_4_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_4_in_waits_for_write = new_work_clock_4_in_in_a_write_cycle & new_work_clock_4_in_waitrequest_from_sa;

  //new_work_clock_4_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_4_in_in_a_write_cycle = cpu_0_data_master_granted_new_work_clock_4_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_4_in_in_a_write_cycle;

  assign wait_for_new_work_clock_4_in_counter = 0;
  //new_work_clock_4_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign new_work_clock_4_in_pretend_byte_enable = (cpu_0_data_master_granted_new_work_clock_4_in)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_4/in enable non-zero assertions, which is an e_register
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

module new_work_clock_4_out_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_pio_0_s1_end_xfer,
                                          new_work_clock_4_out_address,
                                          new_work_clock_4_out_granted_pio_0_s1,
                                          new_work_clock_4_out_qualified_request_pio_0_s1,
                                          new_work_clock_4_out_read,
                                          new_work_clock_4_out_read_data_valid_pio_0_s1,
                                          new_work_clock_4_out_requests_pio_0_s1,
                                          new_work_clock_4_out_write,
                                          new_work_clock_4_out_writedata,
                                          pio_0_s1_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          new_work_clock_4_out_address_to_slave,
                                          new_work_clock_4_out_readdata,
                                          new_work_clock_4_out_reset_n,
                                          new_work_clock_4_out_waitrequest
                                       )
;

  output  [  1: 0] new_work_clock_4_out_address_to_slave;
  output  [  7: 0] new_work_clock_4_out_readdata;
  output           new_work_clock_4_out_reset_n;
  output           new_work_clock_4_out_waitrequest;
  input            clk;
  input            d1_pio_0_s1_end_xfer;
  input   [  1: 0] new_work_clock_4_out_address;
  input            new_work_clock_4_out_granted_pio_0_s1;
  input            new_work_clock_4_out_qualified_request_pio_0_s1;
  input            new_work_clock_4_out_read;
  input            new_work_clock_4_out_read_data_valid_pio_0_s1;
  input            new_work_clock_4_out_requests_pio_0_s1;
  input            new_work_clock_4_out_write;
  input   [  7: 0] new_work_clock_4_out_writedata;
  input   [  7: 0] pio_0_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  1: 0] new_work_clock_4_out_address_last_time;
  wire    [  1: 0] new_work_clock_4_out_address_to_slave;
  reg              new_work_clock_4_out_read_last_time;
  wire    [  7: 0] new_work_clock_4_out_readdata;
  wire             new_work_clock_4_out_reset_n;
  wire             new_work_clock_4_out_run;
  wire             new_work_clock_4_out_waitrequest;
  reg              new_work_clock_4_out_write_last_time;
  reg     [  7: 0] new_work_clock_4_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~new_work_clock_4_out_qualified_request_pio_0_s1 | ~new_work_clock_4_out_read | (1 & ~d1_pio_0_s1_end_xfer & new_work_clock_4_out_read))) & ((~new_work_clock_4_out_qualified_request_pio_0_s1 | ~new_work_clock_4_out_write | (1 & new_work_clock_4_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_4_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_4_out_address_to_slave = new_work_clock_4_out_address;

  //new_work_clock_4/out readdata mux, which is an e_mux
  assign new_work_clock_4_out_readdata = pio_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_4_out_waitrequest = ~new_work_clock_4_out_run;

  //new_work_clock_4_out_reset_n assignment, which is an e_assign
  assign new_work_clock_4_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_4_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_out_address_last_time <= 0;
      else 
        new_work_clock_4_out_address_last_time <= new_work_clock_4_out_address;
    end


  //new_work_clock_4/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_4_out_waitrequest & (new_work_clock_4_out_read | new_work_clock_4_out_write);
    end


  //new_work_clock_4_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_4_out_address != new_work_clock_4_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_4_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_4_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_out_read_last_time <= 0;
      else 
        new_work_clock_4_out_read_last_time <= new_work_clock_4_out_read;
    end


  //new_work_clock_4_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_4_out_read != new_work_clock_4_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_4_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_4_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_out_write_last_time <= 0;
      else 
        new_work_clock_4_out_write_last_time <= new_work_clock_4_out_write;
    end


  //new_work_clock_4_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_4_out_write != new_work_clock_4_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_4_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_4_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_4_out_writedata_last_time <= 0;
      else 
        new_work_clock_4_out_writedata_last_time <= new_work_clock_4_out_writedata;
    end


  //new_work_clock_4_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_4_out_writedata != new_work_clock_4_out_writedata_last_time) & new_work_clock_4_out_write)
        begin
          $write("%0d ns: new_work_clock_4_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_5_in_arbitrator (
                                        // inputs:
                                         clk,
                                         new_work_burst_3_downstream_address_to_slave,
                                         new_work_burst_3_downstream_arbitrationshare,
                                         new_work_burst_3_downstream_burstcount,
                                         new_work_burst_3_downstream_byteenable,
                                         new_work_burst_3_downstream_latency_counter,
                                         new_work_burst_3_downstream_nativeaddress,
                                         new_work_burst_3_downstream_read,
                                         new_work_burst_3_downstream_write,
                                         new_work_burst_3_downstream_writedata,
                                         new_work_clock_5_in_endofpacket,
                                         new_work_clock_5_in_readdata,
                                         new_work_clock_5_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         d1_new_work_clock_5_in_end_xfer,
                                         new_work_burst_3_downstream_granted_new_work_clock_5_in,
                                         new_work_burst_3_downstream_qualified_request_new_work_clock_5_in,
                                         new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in,
                                         new_work_burst_3_downstream_requests_new_work_clock_5_in,
                                         new_work_clock_5_in_address,
                                         new_work_clock_5_in_byteenable,
                                         new_work_clock_5_in_endofpacket_from_sa,
                                         new_work_clock_5_in_nativeaddress,
                                         new_work_clock_5_in_read,
                                         new_work_clock_5_in_readdata_from_sa,
                                         new_work_clock_5_in_reset_n,
                                         new_work_clock_5_in_waitrequest_from_sa,
                                         new_work_clock_5_in_write,
                                         new_work_clock_5_in_writedata
                                      )
;

  output           d1_new_work_clock_5_in_end_xfer;
  output           new_work_burst_3_downstream_granted_new_work_clock_5_in;
  output           new_work_burst_3_downstream_qualified_request_new_work_clock_5_in;
  output           new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in;
  output           new_work_burst_3_downstream_requests_new_work_clock_5_in;
  output  [ 21: 0] new_work_clock_5_in_address;
  output  [  1: 0] new_work_clock_5_in_byteenable;
  output           new_work_clock_5_in_endofpacket_from_sa;
  output  [ 20: 0] new_work_clock_5_in_nativeaddress;
  output           new_work_clock_5_in_read;
  output  [ 15: 0] new_work_clock_5_in_readdata_from_sa;
  output           new_work_clock_5_in_reset_n;
  output           new_work_clock_5_in_waitrequest_from_sa;
  output           new_work_clock_5_in_write;
  output  [ 15: 0] new_work_clock_5_in_writedata;
  input            clk;
  input   [ 21: 0] new_work_burst_3_downstream_address_to_slave;
  input   [  4: 0] new_work_burst_3_downstream_arbitrationshare;
  input            new_work_burst_3_downstream_burstcount;
  input   [  1: 0] new_work_burst_3_downstream_byteenable;
  input            new_work_burst_3_downstream_latency_counter;
  input   [ 21: 0] new_work_burst_3_downstream_nativeaddress;
  input            new_work_burst_3_downstream_read;
  input            new_work_burst_3_downstream_write;
  input   [ 15: 0] new_work_burst_3_downstream_writedata;
  input            new_work_clock_5_in_endofpacket;
  input   [ 15: 0] new_work_clock_5_in_readdata;
  input            new_work_clock_5_in_waitrequest;
  input            reset_n;

  reg              d1_new_work_clock_5_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_5_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             new_work_burst_3_downstream_arbiterlock;
  wire             new_work_burst_3_downstream_arbiterlock2;
  wire             new_work_burst_3_downstream_continuerequest;
  wire             new_work_burst_3_downstream_granted_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_qualified_request_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_requests_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_saved_grant_new_work_clock_5_in;
  wire    [ 21: 0] new_work_clock_5_in_address;
  wire             new_work_clock_5_in_allgrants;
  wire             new_work_clock_5_in_allow_new_arb_cycle;
  wire             new_work_clock_5_in_any_bursting_master_saved_grant;
  wire             new_work_clock_5_in_any_continuerequest;
  wire             new_work_clock_5_in_arb_counter_enable;
  reg     [  4: 0] new_work_clock_5_in_arb_share_counter;
  wire    [  4: 0] new_work_clock_5_in_arb_share_counter_next_value;
  wire    [  4: 0] new_work_clock_5_in_arb_share_set_values;
  wire             new_work_clock_5_in_beginbursttransfer_internal;
  wire             new_work_clock_5_in_begins_xfer;
  wire    [  1: 0] new_work_clock_5_in_byteenable;
  wire             new_work_clock_5_in_end_xfer;
  wire             new_work_clock_5_in_endofpacket_from_sa;
  wire             new_work_clock_5_in_firsttransfer;
  wire             new_work_clock_5_in_grant_vector;
  wire             new_work_clock_5_in_in_a_read_cycle;
  wire             new_work_clock_5_in_in_a_write_cycle;
  wire             new_work_clock_5_in_master_qreq_vector;
  wire    [ 20: 0] new_work_clock_5_in_nativeaddress;
  wire             new_work_clock_5_in_non_bursting_master_requests;
  wire             new_work_clock_5_in_read;
  wire    [ 15: 0] new_work_clock_5_in_readdata_from_sa;
  reg              new_work_clock_5_in_reg_firsttransfer;
  wire             new_work_clock_5_in_reset_n;
  reg              new_work_clock_5_in_slavearbiterlockenable;
  wire             new_work_clock_5_in_slavearbiterlockenable2;
  wire             new_work_clock_5_in_unreg_firsttransfer;
  wire             new_work_clock_5_in_waitrequest_from_sa;
  wire             new_work_clock_5_in_waits_for_read;
  wire             new_work_clock_5_in_waits_for_write;
  wire             new_work_clock_5_in_write;
  wire    [ 15: 0] new_work_clock_5_in_writedata;
  wire             wait_for_new_work_clock_5_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_5_in_end_xfer;
    end


  assign new_work_clock_5_in_begins_xfer = ~d1_reasons_to_wait & ((new_work_burst_3_downstream_qualified_request_new_work_clock_5_in));
  //assign new_work_clock_5_in_readdata_from_sa = new_work_clock_5_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_5_in_readdata_from_sa = new_work_clock_5_in_readdata;

  assign new_work_burst_3_downstream_requests_new_work_clock_5_in = (1) & (new_work_burst_3_downstream_read | new_work_burst_3_downstream_write);
  //assign new_work_clock_5_in_waitrequest_from_sa = new_work_clock_5_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_5_in_waitrequest_from_sa = new_work_clock_5_in_waitrequest;

  //new_work_clock_5_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_5_in_arb_share_set_values = (new_work_burst_3_downstream_granted_new_work_clock_5_in)? new_work_burst_3_downstream_arbitrationshare :
    1;

  //new_work_clock_5_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_5_in_non_bursting_master_requests = 0;

  //new_work_clock_5_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_5_in_any_bursting_master_saved_grant = new_work_burst_3_downstream_saved_grant_new_work_clock_5_in;

  //new_work_clock_5_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_5_in_arb_share_counter_next_value = new_work_clock_5_in_firsttransfer ? (new_work_clock_5_in_arb_share_set_values - 1) : |new_work_clock_5_in_arb_share_counter ? (new_work_clock_5_in_arb_share_counter - 1) : 0;

  //new_work_clock_5_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_5_in_allgrants = |new_work_clock_5_in_grant_vector;

  //new_work_clock_5_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_5_in_end_xfer = ~(new_work_clock_5_in_waits_for_read | new_work_clock_5_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_5_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_5_in = new_work_clock_5_in_end_xfer & (~new_work_clock_5_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_5_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_5_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_5_in & new_work_clock_5_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_5_in & ~new_work_clock_5_in_non_bursting_master_requests);

  //new_work_clock_5_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_in_arb_share_counter <= 0;
      else if (new_work_clock_5_in_arb_counter_enable)
          new_work_clock_5_in_arb_share_counter <= new_work_clock_5_in_arb_share_counter_next_value;
    end


  //new_work_clock_5_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_5_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_5_in) | (end_xfer_arb_share_counter_term_new_work_clock_5_in & ~new_work_clock_5_in_non_bursting_master_requests))
          new_work_clock_5_in_slavearbiterlockenable <= |new_work_clock_5_in_arb_share_counter_next_value;
    end


  //new_work_burst_3/downstream new_work_clock_5/in arbiterlock, which is an e_assign
  assign new_work_burst_3_downstream_arbiterlock = new_work_clock_5_in_slavearbiterlockenable & new_work_burst_3_downstream_continuerequest;

  //new_work_clock_5_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_5_in_slavearbiterlockenable2 = |new_work_clock_5_in_arb_share_counter_next_value;

  //new_work_burst_3/downstream new_work_clock_5/in arbiterlock2, which is an e_assign
  assign new_work_burst_3_downstream_arbiterlock2 = new_work_clock_5_in_slavearbiterlockenable2 & new_work_burst_3_downstream_continuerequest;

  //new_work_clock_5_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_5_in_any_continuerequest = 1;

  //new_work_burst_3_downstream_continuerequest continued request, which is an e_assign
  assign new_work_burst_3_downstream_continuerequest = 1;

  assign new_work_burst_3_downstream_qualified_request_new_work_clock_5_in = new_work_burst_3_downstream_requests_new_work_clock_5_in & ~((new_work_burst_3_downstream_read & ((new_work_burst_3_downstream_latency_counter != 0))));
  //local readdatavalid new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in, which is an e_mux
  assign new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in = new_work_burst_3_downstream_granted_new_work_clock_5_in & new_work_burst_3_downstream_read & ~new_work_clock_5_in_waits_for_read;

  //new_work_clock_5_in_writedata mux, which is an e_mux
  assign new_work_clock_5_in_writedata = new_work_burst_3_downstream_writedata;

  //assign new_work_clock_5_in_endofpacket_from_sa = new_work_clock_5_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_5_in_endofpacket_from_sa = new_work_clock_5_in_endofpacket;

  //master is always granted when requested
  assign new_work_burst_3_downstream_granted_new_work_clock_5_in = new_work_burst_3_downstream_qualified_request_new_work_clock_5_in;

  //new_work_burst_3/downstream saved-grant new_work_clock_5/in, which is an e_assign
  assign new_work_burst_3_downstream_saved_grant_new_work_clock_5_in = new_work_burst_3_downstream_requests_new_work_clock_5_in;

  //allow new arb cycle for new_work_clock_5/in, which is an e_assign
  assign new_work_clock_5_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_5_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_5_in_master_qreq_vector = 1;

  //new_work_clock_5_in_reset_n assignment, which is an e_assign
  assign new_work_clock_5_in_reset_n = reset_n;

  //new_work_clock_5_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_5_in_firsttransfer = new_work_clock_5_in_begins_xfer ? new_work_clock_5_in_unreg_firsttransfer : new_work_clock_5_in_reg_firsttransfer;

  //new_work_clock_5_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_5_in_unreg_firsttransfer = ~(new_work_clock_5_in_slavearbiterlockenable & new_work_clock_5_in_any_continuerequest);

  //new_work_clock_5_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_5_in_begins_xfer)
          new_work_clock_5_in_reg_firsttransfer <= new_work_clock_5_in_unreg_firsttransfer;
    end


  //new_work_clock_5_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_5_in_beginbursttransfer_internal = new_work_clock_5_in_begins_xfer;

  //new_work_clock_5_in_read assignment, which is an e_mux
  assign new_work_clock_5_in_read = new_work_burst_3_downstream_granted_new_work_clock_5_in & new_work_burst_3_downstream_read;

  //new_work_clock_5_in_write assignment, which is an e_mux
  assign new_work_clock_5_in_write = new_work_burst_3_downstream_granted_new_work_clock_5_in & new_work_burst_3_downstream_write;

  //new_work_clock_5_in_address mux, which is an e_mux
  assign new_work_clock_5_in_address = new_work_burst_3_downstream_address_to_slave;

  //slaveid new_work_clock_5_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_5_in_nativeaddress = new_work_burst_3_downstream_nativeaddress;

  //d1_new_work_clock_5_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_5_in_end_xfer <= 1;
      else 
        d1_new_work_clock_5_in_end_xfer <= new_work_clock_5_in_end_xfer;
    end


  //new_work_clock_5_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_5_in_waits_for_read = new_work_clock_5_in_in_a_read_cycle & new_work_clock_5_in_waitrequest_from_sa;

  //new_work_clock_5_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_5_in_in_a_read_cycle = new_work_burst_3_downstream_granted_new_work_clock_5_in & new_work_burst_3_downstream_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_5_in_in_a_read_cycle;

  //new_work_clock_5_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_5_in_waits_for_write = new_work_clock_5_in_in_a_write_cycle & new_work_clock_5_in_waitrequest_from_sa;

  //new_work_clock_5_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_5_in_in_a_write_cycle = new_work_burst_3_downstream_granted_new_work_clock_5_in & new_work_burst_3_downstream_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_5_in_in_a_write_cycle;

  assign wait_for_new_work_clock_5_in_counter = 0;
  //new_work_clock_5_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_5_in_byteenable = (new_work_burst_3_downstream_granted_new_work_clock_5_in)? new_work_burst_3_downstream_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_5/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //new_work_burst_3/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_3_downstream_requests_new_work_clock_5_in && (new_work_burst_3_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_3/downstream drove 0 on its 'arbitrationshare' port while accessing slave new_work_clock_5/in", $time);
          $stop;
        end
    end


  //new_work_burst_3/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_burst_3_downstream_requests_new_work_clock_5_in && (new_work_burst_3_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: new_work_burst_3/downstream drove 0 on its 'burstcount' port while accessing slave new_work_clock_5/in", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_5_out_arbitrator (
                                         // inputs:
                                          cfi_flash_0_s1_wait_counter_eq_0,
                                          clk,
                                          d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                          incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0,
                                          new_work_clock_5_out_address,
                                          new_work_clock_5_out_byteenable,
                                          new_work_clock_5_out_granted_cfi_flash_0_s1,
                                          new_work_clock_5_out_qualified_request_cfi_flash_0_s1,
                                          new_work_clock_5_out_read,
                                          new_work_clock_5_out_read_data_valid_cfi_flash_0_s1,
                                          new_work_clock_5_out_requests_cfi_flash_0_s1,
                                          new_work_clock_5_out_write,
                                          new_work_clock_5_out_writedata,
                                          reset_n,

                                         // outputs:
                                          new_work_clock_5_out_address_to_slave,
                                          new_work_clock_5_out_readdata,
                                          new_work_clock_5_out_reset_n,
                                          new_work_clock_5_out_waitrequest
                                       )
;

  output  [ 21: 0] new_work_clock_5_out_address_to_slave;
  output  [ 15: 0] new_work_clock_5_out_readdata;
  output           new_work_clock_5_out_reset_n;
  output           new_work_clock_5_out_waitrequest;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            clk;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;
  input   [ 21: 0] new_work_clock_5_out_address;
  input   [  1: 0] new_work_clock_5_out_byteenable;
  input            new_work_clock_5_out_granted_cfi_flash_0_s1;
  input            new_work_clock_5_out_qualified_request_cfi_flash_0_s1;
  input            new_work_clock_5_out_read;
  input            new_work_clock_5_out_read_data_valid_cfi_flash_0_s1;
  input            new_work_clock_5_out_requests_cfi_flash_0_s1;
  input            new_work_clock_5_out_write;
  input   [ 15: 0] new_work_clock_5_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 21: 0] new_work_clock_5_out_address_last_time;
  wire    [ 21: 0] new_work_clock_5_out_address_to_slave;
  reg     [  1: 0] new_work_clock_5_out_byteenable_last_time;
  reg              new_work_clock_5_out_read_last_time;
  wire    [ 15: 0] new_work_clock_5_out_readdata;
  wire             new_work_clock_5_out_reset_n;
  wire             new_work_clock_5_out_run;
  wire             new_work_clock_5_out_waitrequest;
  reg              new_work_clock_5_out_write_last_time;
  reg     [ 15: 0] new_work_clock_5_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (new_work_clock_5_out_qualified_request_cfi_flash_0_s1 | new_work_clock_5_out_read_data_valid_cfi_flash_0_s1 | ~new_work_clock_5_out_requests_cfi_flash_0_s1) & (new_work_clock_5_out_granted_cfi_flash_0_s1 | ~new_work_clock_5_out_qualified_request_cfi_flash_0_s1) & ((~new_work_clock_5_out_qualified_request_cfi_flash_0_s1 | ~new_work_clock_5_out_read | (new_work_clock_5_out_read_data_valid_cfi_flash_0_s1 & new_work_clock_5_out_read))) & ((~new_work_clock_5_out_qualified_request_cfi_flash_0_s1 | ~new_work_clock_5_out_write | (1 & ((cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer)) & new_work_clock_5_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_5_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_5_out_address_to_slave = new_work_clock_5_out_address;

  //new_work_clock_5/out readdata mux, which is an e_mux
  assign new_work_clock_5_out_readdata = incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_5_out_waitrequest = ~new_work_clock_5_out_run;

  //new_work_clock_5_out_reset_n assignment, which is an e_assign
  assign new_work_clock_5_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_5_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_address_last_time <= 0;
      else 
        new_work_clock_5_out_address_last_time <= new_work_clock_5_out_address;
    end


  //new_work_clock_5/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_5_out_waitrequest & (new_work_clock_5_out_read | new_work_clock_5_out_write);
    end


  //new_work_clock_5_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_5_out_address != new_work_clock_5_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_5_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_5_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_byteenable_last_time <= 0;
      else 
        new_work_clock_5_out_byteenable_last_time <= new_work_clock_5_out_byteenable;
    end


  //new_work_clock_5_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_5_out_byteenable != new_work_clock_5_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_5_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_5_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_read_last_time <= 0;
      else 
        new_work_clock_5_out_read_last_time <= new_work_clock_5_out_read;
    end


  //new_work_clock_5_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_5_out_read != new_work_clock_5_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_5_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_5_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_write_last_time <= 0;
      else 
        new_work_clock_5_out_write_last_time <= new_work_clock_5_out_write;
    end


  //new_work_clock_5_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_5_out_write != new_work_clock_5_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_5_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_5_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_writedata_last_time <= 0;
      else 
        new_work_clock_5_out_writedata_last_time <= new_work_clock_5_out_writedata;
    end


  //new_work_clock_5_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_5_out_writedata != new_work_clock_5_out_writedata_last_time) & new_work_clock_5_out_write)
        begin
          $write("%0d ns: new_work_clock_5_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_clock_6_in_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_dbs_address,
                                         cpu_0_data_master_dbs_write_16,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         new_work_clock_6_in_endofpacket,
                                         new_work_clock_6_in_readdata,
                                         new_work_clock_6_in_waitrequest,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_byteenable_new_work_clock_6_in,
                                         cpu_0_data_master_granted_new_work_clock_6_in,
                                         cpu_0_data_master_qualified_request_new_work_clock_6_in,
                                         cpu_0_data_master_read_data_valid_new_work_clock_6_in,
                                         cpu_0_data_master_requests_new_work_clock_6_in,
                                         d1_new_work_clock_6_in_end_xfer,
                                         new_work_clock_6_in_address,
                                         new_work_clock_6_in_byteenable,
                                         new_work_clock_6_in_endofpacket_from_sa,
                                         new_work_clock_6_in_nativeaddress,
                                         new_work_clock_6_in_read,
                                         new_work_clock_6_in_readdata_from_sa,
                                         new_work_clock_6_in_reset_n,
                                         new_work_clock_6_in_waitrequest_from_sa,
                                         new_work_clock_6_in_write,
                                         new_work_clock_6_in_writedata
                                      )
;

  output  [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in;
  output           cpu_0_data_master_granted_new_work_clock_6_in;
  output           cpu_0_data_master_qualified_request_new_work_clock_6_in;
  output           cpu_0_data_master_read_data_valid_new_work_clock_6_in;
  output           cpu_0_data_master_requests_new_work_clock_6_in;
  output           d1_new_work_clock_6_in_end_xfer;
  output  [ 21: 0] new_work_clock_6_in_address;
  output  [  1: 0] new_work_clock_6_in_byteenable;
  output           new_work_clock_6_in_endofpacket_from_sa;
  output  [ 20: 0] new_work_clock_6_in_nativeaddress;
  output           new_work_clock_6_in_read;
  output  [ 15: 0] new_work_clock_6_in_readdata_from_sa;
  output           new_work_clock_6_in_reset_n;
  output           new_work_clock_6_in_waitrequest_from_sa;
  output           new_work_clock_6_in_write;
  output  [ 15: 0] new_work_clock_6_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            new_work_clock_6_in_endofpacket;
  input   [ 15: 0] new_work_clock_6_in_readdata;
  input            new_work_clock_6_in_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_new_work_clock_6_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_6_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_6_in;
  wire             cpu_0_data_master_requests_new_work_clock_6_in;
  wire             cpu_0_data_master_saved_grant_new_work_clock_6_in;
  reg              d1_new_work_clock_6_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_new_work_clock_6_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 21: 0] new_work_clock_6_in_address;
  wire             new_work_clock_6_in_allgrants;
  wire             new_work_clock_6_in_allow_new_arb_cycle;
  wire             new_work_clock_6_in_any_bursting_master_saved_grant;
  wire             new_work_clock_6_in_any_continuerequest;
  wire             new_work_clock_6_in_arb_counter_enable;
  reg     [  1: 0] new_work_clock_6_in_arb_share_counter;
  wire    [  1: 0] new_work_clock_6_in_arb_share_counter_next_value;
  wire    [  1: 0] new_work_clock_6_in_arb_share_set_values;
  wire             new_work_clock_6_in_beginbursttransfer_internal;
  wire             new_work_clock_6_in_begins_xfer;
  wire    [  1: 0] new_work_clock_6_in_byteenable;
  wire             new_work_clock_6_in_end_xfer;
  wire             new_work_clock_6_in_endofpacket_from_sa;
  wire             new_work_clock_6_in_firsttransfer;
  wire             new_work_clock_6_in_grant_vector;
  wire             new_work_clock_6_in_in_a_read_cycle;
  wire             new_work_clock_6_in_in_a_write_cycle;
  wire             new_work_clock_6_in_master_qreq_vector;
  wire    [ 20: 0] new_work_clock_6_in_nativeaddress;
  wire             new_work_clock_6_in_non_bursting_master_requests;
  wire             new_work_clock_6_in_read;
  wire    [ 15: 0] new_work_clock_6_in_readdata_from_sa;
  reg              new_work_clock_6_in_reg_firsttransfer;
  wire             new_work_clock_6_in_reset_n;
  reg              new_work_clock_6_in_slavearbiterlockenable;
  wire             new_work_clock_6_in_slavearbiterlockenable2;
  wire             new_work_clock_6_in_unreg_firsttransfer;
  wire             new_work_clock_6_in_waitrequest_from_sa;
  wire             new_work_clock_6_in_waits_for_read;
  wire             new_work_clock_6_in_waits_for_write;
  wire             new_work_clock_6_in_write;
  wire    [ 15: 0] new_work_clock_6_in_writedata;
  wire             wait_for_new_work_clock_6_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~new_work_clock_6_in_end_xfer;
    end


  assign new_work_clock_6_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_new_work_clock_6_in));
  //assign new_work_clock_6_in_readdata_from_sa = new_work_clock_6_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_6_in_readdata_from_sa = new_work_clock_6_in_readdata;

  assign cpu_0_data_master_requests_new_work_clock_6_in = ({cpu_0_data_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign new_work_clock_6_in_waitrequest_from_sa = new_work_clock_6_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_6_in_waitrequest_from_sa = new_work_clock_6_in_waitrequest;

  //new_work_clock_6_in_arb_share_counter set values, which is an e_mux
  assign new_work_clock_6_in_arb_share_set_values = (cpu_0_data_master_granted_new_work_clock_6_in)? 2 :
    1;

  //new_work_clock_6_in_non_bursting_master_requests mux, which is an e_mux
  assign new_work_clock_6_in_non_bursting_master_requests = cpu_0_data_master_requests_new_work_clock_6_in;

  //new_work_clock_6_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign new_work_clock_6_in_any_bursting_master_saved_grant = 0;

  //new_work_clock_6_in_arb_share_counter_next_value assignment, which is an e_assign
  assign new_work_clock_6_in_arb_share_counter_next_value = new_work_clock_6_in_firsttransfer ? (new_work_clock_6_in_arb_share_set_values - 1) : |new_work_clock_6_in_arb_share_counter ? (new_work_clock_6_in_arb_share_counter - 1) : 0;

  //new_work_clock_6_in_allgrants all slave grants, which is an e_mux
  assign new_work_clock_6_in_allgrants = |new_work_clock_6_in_grant_vector;

  //new_work_clock_6_in_end_xfer assignment, which is an e_assign
  assign new_work_clock_6_in_end_xfer = ~(new_work_clock_6_in_waits_for_read | new_work_clock_6_in_waits_for_write);

  //end_xfer_arb_share_counter_term_new_work_clock_6_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_new_work_clock_6_in = new_work_clock_6_in_end_xfer & (~new_work_clock_6_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //new_work_clock_6_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign new_work_clock_6_in_arb_counter_enable = (end_xfer_arb_share_counter_term_new_work_clock_6_in & new_work_clock_6_in_allgrants) | (end_xfer_arb_share_counter_term_new_work_clock_6_in & ~new_work_clock_6_in_non_bursting_master_requests);

  //new_work_clock_6_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_in_arb_share_counter <= 0;
      else if (new_work_clock_6_in_arb_counter_enable)
          new_work_clock_6_in_arb_share_counter <= new_work_clock_6_in_arb_share_counter_next_value;
    end


  //new_work_clock_6_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_in_slavearbiterlockenable <= 0;
      else if ((|new_work_clock_6_in_master_qreq_vector & end_xfer_arb_share_counter_term_new_work_clock_6_in) | (end_xfer_arb_share_counter_term_new_work_clock_6_in & ~new_work_clock_6_in_non_bursting_master_requests))
          new_work_clock_6_in_slavearbiterlockenable <= |new_work_clock_6_in_arb_share_counter_next_value;
    end


  //cpu_0/data_master new_work_clock_6/in arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = new_work_clock_6_in_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //new_work_clock_6_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign new_work_clock_6_in_slavearbiterlockenable2 = |new_work_clock_6_in_arb_share_counter_next_value;

  //cpu_0/data_master new_work_clock_6/in arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = new_work_clock_6_in_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //new_work_clock_6_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign new_work_clock_6_in_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_new_work_clock_6_in = cpu_0_data_master_requests_new_work_clock_6_in & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0))) | ((!cpu_0_data_master_byteenable_new_work_clock_6_in) & cpu_0_data_master_write));
  //local readdatavalid cpu_0_data_master_read_data_valid_new_work_clock_6_in, which is an e_mux
  assign cpu_0_data_master_read_data_valid_new_work_clock_6_in = cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_read & ~new_work_clock_6_in_waits_for_read;

  //new_work_clock_6_in_writedata mux, which is an e_mux
  assign new_work_clock_6_in_writedata = cpu_0_data_master_dbs_write_16;

  //assign new_work_clock_6_in_endofpacket_from_sa = new_work_clock_6_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign new_work_clock_6_in_endofpacket_from_sa = new_work_clock_6_in_endofpacket;

  //master is always granted when requested
  assign cpu_0_data_master_granted_new_work_clock_6_in = cpu_0_data_master_qualified_request_new_work_clock_6_in;

  //cpu_0/data_master saved-grant new_work_clock_6/in, which is an e_assign
  assign cpu_0_data_master_saved_grant_new_work_clock_6_in = cpu_0_data_master_requests_new_work_clock_6_in;

  //allow new arb cycle for new_work_clock_6/in, which is an e_assign
  assign new_work_clock_6_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign new_work_clock_6_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign new_work_clock_6_in_master_qreq_vector = 1;

  //new_work_clock_6_in_reset_n assignment, which is an e_assign
  assign new_work_clock_6_in_reset_n = reset_n;

  //new_work_clock_6_in_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_6_in_firsttransfer = new_work_clock_6_in_begins_xfer ? new_work_clock_6_in_unreg_firsttransfer : new_work_clock_6_in_reg_firsttransfer;

  //new_work_clock_6_in_unreg_firsttransfer first transaction, which is an e_assign
  assign new_work_clock_6_in_unreg_firsttransfer = ~(new_work_clock_6_in_slavearbiterlockenable & new_work_clock_6_in_any_continuerequest);

  //new_work_clock_6_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_in_reg_firsttransfer <= 1'b1;
      else if (new_work_clock_6_in_begins_xfer)
          new_work_clock_6_in_reg_firsttransfer <= new_work_clock_6_in_unreg_firsttransfer;
    end


  //new_work_clock_6_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign new_work_clock_6_in_beginbursttransfer_internal = new_work_clock_6_in_begins_xfer;

  //new_work_clock_6_in_read assignment, which is an e_mux
  assign new_work_clock_6_in_read = cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_read;

  //new_work_clock_6_in_write assignment, which is an e_mux
  assign new_work_clock_6_in_write = cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_write;

  //new_work_clock_6_in_address mux, which is an e_mux
  assign new_work_clock_6_in_address = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //slaveid new_work_clock_6_in_nativeaddress nativeaddress mux, which is an e_mux
  assign new_work_clock_6_in_nativeaddress = cpu_0_data_master_address_to_slave >> 2;

  //d1_new_work_clock_6_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_new_work_clock_6_in_end_xfer <= 1;
      else 
        d1_new_work_clock_6_in_end_xfer <= new_work_clock_6_in_end_xfer;
    end


  //new_work_clock_6_in_waits_for_read in a cycle, which is an e_mux
  assign new_work_clock_6_in_waits_for_read = new_work_clock_6_in_in_a_read_cycle & new_work_clock_6_in_waitrequest_from_sa;

  //new_work_clock_6_in_in_a_read_cycle assignment, which is an e_assign
  assign new_work_clock_6_in_in_a_read_cycle = cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = new_work_clock_6_in_in_a_read_cycle;

  //new_work_clock_6_in_waits_for_write in a cycle, which is an e_mux
  assign new_work_clock_6_in_waits_for_write = new_work_clock_6_in_in_a_write_cycle & new_work_clock_6_in_waitrequest_from_sa;

  //new_work_clock_6_in_in_a_write_cycle assignment, which is an e_assign
  assign new_work_clock_6_in_in_a_write_cycle = cpu_0_data_master_granted_new_work_clock_6_in & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = new_work_clock_6_in_in_a_write_cycle;

  assign wait_for_new_work_clock_6_in_counter = 0;
  //new_work_clock_6_in_byteenable byte enable port mux, which is an e_mux
  assign new_work_clock_6_in_byteenable = (cpu_0_data_master_granted_new_work_clock_6_in)? cpu_0_data_master_byteenable_new_work_clock_6_in :
    -1;

  assign {cpu_0_data_master_byteenable_new_work_clock_6_in_segment_1,
cpu_0_data_master_byteenable_new_work_clock_6_in_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_new_work_clock_6_in = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_new_work_clock_6_in_segment_0 :
    cpu_0_data_master_byteenable_new_work_clock_6_in_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_6/in enable non-zero assertions, which is an e_register
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

module new_work_clock_6_out_arbitrator (
                                         // inputs:
                                          cfi_flash_0_s1_wait_counter_eq_0,
                                          clk,
                                          d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                          incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0,
                                          new_work_clock_6_out_address,
                                          new_work_clock_6_out_byteenable,
                                          new_work_clock_6_out_granted_cfi_flash_0_s1,
                                          new_work_clock_6_out_qualified_request_cfi_flash_0_s1,
                                          new_work_clock_6_out_read,
                                          new_work_clock_6_out_read_data_valid_cfi_flash_0_s1,
                                          new_work_clock_6_out_requests_cfi_flash_0_s1,
                                          new_work_clock_6_out_write,
                                          new_work_clock_6_out_writedata,
                                          reset_n,

                                         // outputs:
                                          new_work_clock_6_out_address_to_slave,
                                          new_work_clock_6_out_readdata,
                                          new_work_clock_6_out_reset_n,
                                          new_work_clock_6_out_waitrequest
                                       )
;

  output  [ 21: 0] new_work_clock_6_out_address_to_slave;
  output  [ 15: 0] new_work_clock_6_out_readdata;
  output           new_work_clock_6_out_reset_n;
  output           new_work_clock_6_out_waitrequest;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            clk;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;
  input   [ 21: 0] new_work_clock_6_out_address;
  input   [  1: 0] new_work_clock_6_out_byteenable;
  input            new_work_clock_6_out_granted_cfi_flash_0_s1;
  input            new_work_clock_6_out_qualified_request_cfi_flash_0_s1;
  input            new_work_clock_6_out_read;
  input            new_work_clock_6_out_read_data_valid_cfi_flash_0_s1;
  input            new_work_clock_6_out_requests_cfi_flash_0_s1;
  input            new_work_clock_6_out_write;
  input   [ 15: 0] new_work_clock_6_out_writedata;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 21: 0] new_work_clock_6_out_address_last_time;
  wire    [ 21: 0] new_work_clock_6_out_address_to_slave;
  reg     [  1: 0] new_work_clock_6_out_byteenable_last_time;
  reg              new_work_clock_6_out_read_last_time;
  wire    [ 15: 0] new_work_clock_6_out_readdata;
  wire             new_work_clock_6_out_reset_n;
  wire             new_work_clock_6_out_run;
  wire             new_work_clock_6_out_waitrequest;
  reg              new_work_clock_6_out_write_last_time;
  reg     [ 15: 0] new_work_clock_6_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (new_work_clock_6_out_qualified_request_cfi_flash_0_s1 | new_work_clock_6_out_read_data_valid_cfi_flash_0_s1 | ~new_work_clock_6_out_requests_cfi_flash_0_s1) & (new_work_clock_6_out_granted_cfi_flash_0_s1 | ~new_work_clock_6_out_qualified_request_cfi_flash_0_s1) & ((~new_work_clock_6_out_qualified_request_cfi_flash_0_s1 | ~new_work_clock_6_out_read | (new_work_clock_6_out_read_data_valid_cfi_flash_0_s1 & new_work_clock_6_out_read))) & ((~new_work_clock_6_out_qualified_request_cfi_flash_0_s1 | ~new_work_clock_6_out_write | (1 & ((cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer)) & new_work_clock_6_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign new_work_clock_6_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign new_work_clock_6_out_address_to_slave = new_work_clock_6_out_address;

  //new_work_clock_6/out readdata mux, which is an e_mux
  assign new_work_clock_6_out_readdata = incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;

  //actual waitrequest port, which is an e_assign
  assign new_work_clock_6_out_waitrequest = ~new_work_clock_6_out_run;

  //new_work_clock_6_out_reset_n assignment, which is an e_assign
  assign new_work_clock_6_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //new_work_clock_6_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_address_last_time <= 0;
      else 
        new_work_clock_6_out_address_last_time <= new_work_clock_6_out_address;
    end


  //new_work_clock_6/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= new_work_clock_6_out_waitrequest & (new_work_clock_6_out_read | new_work_clock_6_out_write);
    end


  //new_work_clock_6_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_6_out_address != new_work_clock_6_out_address_last_time))
        begin
          $write("%0d ns: new_work_clock_6_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_6_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_byteenable_last_time <= 0;
      else 
        new_work_clock_6_out_byteenable_last_time <= new_work_clock_6_out_byteenable;
    end


  //new_work_clock_6_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_6_out_byteenable != new_work_clock_6_out_byteenable_last_time))
        begin
          $write("%0d ns: new_work_clock_6_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_6_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_read_last_time <= 0;
      else 
        new_work_clock_6_out_read_last_time <= new_work_clock_6_out_read;
    end


  //new_work_clock_6_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_6_out_read != new_work_clock_6_out_read_last_time))
        begin
          $write("%0d ns: new_work_clock_6_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_6_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_write_last_time <= 0;
      else 
        new_work_clock_6_out_write_last_time <= new_work_clock_6_out_write;
    end


  //new_work_clock_6_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_6_out_write != new_work_clock_6_out_write_last_time))
        begin
          $write("%0d ns: new_work_clock_6_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //new_work_clock_6_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_writedata_last_time <= 0;
      else 
        new_work_clock_6_out_writedata_last_time <= new_work_clock_6_out_writedata;
    end


  //new_work_clock_6_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (new_work_clock_6_out_writedata != new_work_clock_6_out_writedata_last_time) & new_work_clock_6_out_write)
        begin
          $write("%0d ns: new_work_clock_6_out_writedata did not heed wait!!!", $time);
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
                              new_work_clock_4_out_address_to_slave,
                              new_work_clock_4_out_nativeaddress,
                              new_work_clock_4_out_read,
                              new_work_clock_4_out_write,
                              new_work_clock_4_out_writedata,
                              pio_0_s1_readdata,
                              reset_n,

                             // outputs:
                              d1_pio_0_s1_end_xfer,
                              new_work_clock_4_out_granted_pio_0_s1,
                              new_work_clock_4_out_qualified_request_pio_0_s1,
                              new_work_clock_4_out_read_data_valid_pio_0_s1,
                              new_work_clock_4_out_requests_pio_0_s1,
                              pio_0_s1_address,
                              pio_0_s1_chipselect,
                              pio_0_s1_readdata_from_sa,
                              pio_0_s1_reset_n,
                              pio_0_s1_write_n,
                              pio_0_s1_writedata
                           )
;

  output           d1_pio_0_s1_end_xfer;
  output           new_work_clock_4_out_granted_pio_0_s1;
  output           new_work_clock_4_out_qualified_request_pio_0_s1;
  output           new_work_clock_4_out_read_data_valid_pio_0_s1;
  output           new_work_clock_4_out_requests_pio_0_s1;
  output  [  1: 0] pio_0_s1_address;
  output           pio_0_s1_chipselect;
  output  [  7: 0] pio_0_s1_readdata_from_sa;
  output           pio_0_s1_reset_n;
  output           pio_0_s1_write_n;
  output  [  7: 0] pio_0_s1_writedata;
  input            clk;
  input   [  1: 0] new_work_clock_4_out_address_to_slave;
  input   [  1: 0] new_work_clock_4_out_nativeaddress;
  input            new_work_clock_4_out_read;
  input            new_work_clock_4_out_write;
  input   [  7: 0] new_work_clock_4_out_writedata;
  input   [  7: 0] pio_0_s1_readdata;
  input            reset_n;

  reg              d1_pio_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             new_work_clock_4_out_arbiterlock;
  wire             new_work_clock_4_out_arbiterlock2;
  wire             new_work_clock_4_out_continuerequest;
  wire             new_work_clock_4_out_granted_pio_0_s1;
  wire             new_work_clock_4_out_qualified_request_pio_0_s1;
  wire             new_work_clock_4_out_read_data_valid_pio_0_s1;
  wire             new_work_clock_4_out_requests_pio_0_s1;
  wire             new_work_clock_4_out_saved_grant_pio_0_s1;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_allgrants;
  wire             pio_0_s1_allow_new_arb_cycle;
  wire             pio_0_s1_any_bursting_master_saved_grant;
  wire             pio_0_s1_any_continuerequest;
  wire             pio_0_s1_arb_counter_enable;
  reg              pio_0_s1_arb_share_counter;
  wire             pio_0_s1_arb_share_counter_next_value;
  wire             pio_0_s1_arb_share_set_values;
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
  wire             wait_for_pio_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_0_s1_end_xfer;
    end


  assign pio_0_s1_begins_xfer = ~d1_reasons_to_wait & ((new_work_clock_4_out_qualified_request_pio_0_s1));
  //assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata;

  assign new_work_clock_4_out_requests_pio_0_s1 = (1) & (new_work_clock_4_out_read | new_work_clock_4_out_write);
  //pio_0_s1_arb_share_counter set values, which is an e_mux
  assign pio_0_s1_arb_share_set_values = 1;

  //pio_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_0_s1_non_bursting_master_requests = new_work_clock_4_out_requests_pio_0_s1;

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


  //new_work_clock_4/out pio_0/s1 arbiterlock, which is an e_assign
  assign new_work_clock_4_out_arbiterlock = pio_0_s1_slavearbiterlockenable & new_work_clock_4_out_continuerequest;

  //pio_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_0_s1_slavearbiterlockenable2 = |pio_0_s1_arb_share_counter_next_value;

  //new_work_clock_4/out pio_0/s1 arbiterlock2, which is an e_assign
  assign new_work_clock_4_out_arbiterlock2 = pio_0_s1_slavearbiterlockenable2 & new_work_clock_4_out_continuerequest;

  //pio_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_0_s1_any_continuerequest = 1;

  //new_work_clock_4_out_continuerequest continued request, which is an e_assign
  assign new_work_clock_4_out_continuerequest = 1;

  assign new_work_clock_4_out_qualified_request_pio_0_s1 = new_work_clock_4_out_requests_pio_0_s1;
  //pio_0_s1_writedata mux, which is an e_mux
  assign pio_0_s1_writedata = new_work_clock_4_out_writedata;

  //master is always granted when requested
  assign new_work_clock_4_out_granted_pio_0_s1 = new_work_clock_4_out_qualified_request_pio_0_s1;

  //new_work_clock_4/out saved-grant pio_0/s1, which is an e_assign
  assign new_work_clock_4_out_saved_grant_pio_0_s1 = new_work_clock_4_out_requests_pio_0_s1;

  //allow new arb cycle for pio_0/s1, which is an e_assign
  assign pio_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_0_s1_master_qreq_vector = 1;

  //pio_0_s1_reset_n assignment, which is an e_assign
  assign pio_0_s1_reset_n = reset_n;

  assign pio_0_s1_chipselect = new_work_clock_4_out_granted_pio_0_s1;
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
  assign pio_0_s1_write_n = ~(((new_work_clock_4_out_granted_pio_0_s1 & new_work_clock_4_out_write)) & pio_0_s1_pretend_byte_enable);

  //pio_0_s1_address mux, which is an e_mux
  assign pio_0_s1_address = new_work_clock_4_out_nativeaddress;

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
  assign pio_0_s1_in_a_read_cycle = new_work_clock_4_out_granted_pio_0_s1 & new_work_clock_4_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_0_s1_in_a_read_cycle;

  //pio_0_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_write = pio_0_s1_in_a_write_cycle & 0;

  //pio_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_write_cycle = new_work_clock_4_out_granted_pio_0_s1 & new_work_clock_4_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_0_s1_in_a_write_cycle;

  assign wait_for_pio_0_s1_counter = 0;
  //pio_0_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign pio_0_s1_pretend_byte_enable = (new_work_clock_4_out_granted_pio_0_s1)? {1 {1'b1}} :
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

module rdv_fifo_for_new_work_clock_2_out_to_sdram_0_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_new_work_clock_3_out_to_sdram_0_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_0_s1_arbitrator (
                               // inputs:
                                clk,
                                new_work_clock_2_out_address_to_slave,
                                new_work_clock_2_out_byteenable,
                                new_work_clock_2_out_read,
                                new_work_clock_2_out_write,
                                new_work_clock_2_out_writedata,
                                new_work_clock_3_out_address_to_slave,
                                new_work_clock_3_out_byteenable,
                                new_work_clock_3_out_read,
                                new_work_clock_3_out_write,
                                new_work_clock_3_out_writedata,
                                reset_n,
                                sdram_0_s1_readdata,
                                sdram_0_s1_readdatavalid,
                                sdram_0_s1_waitrequest,

                               // outputs:
                                d1_sdram_0_s1_end_xfer,
                                new_work_clock_2_out_granted_sdram_0_s1,
                                new_work_clock_2_out_qualified_request_sdram_0_s1,
                                new_work_clock_2_out_read_data_valid_sdram_0_s1,
                                new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register,
                                new_work_clock_2_out_requests_sdram_0_s1,
                                new_work_clock_3_out_granted_sdram_0_s1,
                                new_work_clock_3_out_qualified_request_sdram_0_s1,
                                new_work_clock_3_out_read_data_valid_sdram_0_s1,
                                new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register,
                                new_work_clock_3_out_requests_sdram_0_s1,
                                sdram_0_s1_address,
                                sdram_0_s1_byteenable_n,
                                sdram_0_s1_chipselect,
                                sdram_0_s1_read_n,
                                sdram_0_s1_readdata_from_sa,
                                sdram_0_s1_reset_n,
                                sdram_0_s1_waitrequest_from_sa,
                                sdram_0_s1_write_n,
                                sdram_0_s1_writedata
                             )
;

  output           d1_sdram_0_s1_end_xfer;
  output           new_work_clock_2_out_granted_sdram_0_s1;
  output           new_work_clock_2_out_qualified_request_sdram_0_s1;
  output           new_work_clock_2_out_read_data_valid_sdram_0_s1;
  output           new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register;
  output           new_work_clock_2_out_requests_sdram_0_s1;
  output           new_work_clock_3_out_granted_sdram_0_s1;
  output           new_work_clock_3_out_qualified_request_sdram_0_s1;
  output           new_work_clock_3_out_read_data_valid_sdram_0_s1;
  output           new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register;
  output           new_work_clock_3_out_requests_sdram_0_s1;
  output  [ 21: 0] sdram_0_s1_address;
  output  [  1: 0] sdram_0_s1_byteenable_n;
  output           sdram_0_s1_chipselect;
  output           sdram_0_s1_read_n;
  output  [ 15: 0] sdram_0_s1_readdata_from_sa;
  output           sdram_0_s1_reset_n;
  output           sdram_0_s1_waitrequest_from_sa;
  output           sdram_0_s1_write_n;
  output  [ 15: 0] sdram_0_s1_writedata;
  input            clk;
  input   [ 22: 0] new_work_clock_2_out_address_to_slave;
  input   [  1: 0] new_work_clock_2_out_byteenable;
  input            new_work_clock_2_out_read;
  input            new_work_clock_2_out_write;
  input   [ 15: 0] new_work_clock_2_out_writedata;
  input   [ 22: 0] new_work_clock_3_out_address_to_slave;
  input   [  1: 0] new_work_clock_3_out_byteenable;
  input            new_work_clock_3_out_read;
  input            new_work_clock_3_out_write;
  input   [ 15: 0] new_work_clock_3_out_writedata;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata;
  input            sdram_0_s1_readdatavalid;
  input            sdram_0_s1_waitrequest;

  reg              d1_reasons_to_wait;
  reg              d1_sdram_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_new_work_clock_2_out_granted_slave_sdram_0_s1;
  reg              last_cycle_new_work_clock_3_out_granted_slave_sdram_0_s1;
  wire             new_work_clock_2_out_arbiterlock;
  wire             new_work_clock_2_out_arbiterlock2;
  wire             new_work_clock_2_out_continuerequest;
  wire             new_work_clock_2_out_granted_sdram_0_s1;
  wire             new_work_clock_2_out_qualified_request_sdram_0_s1;
  wire             new_work_clock_2_out_rdv_fifo_empty_sdram_0_s1;
  wire             new_work_clock_2_out_rdv_fifo_output_from_sdram_0_s1;
  wire             new_work_clock_2_out_read_data_valid_sdram_0_s1;
  wire             new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register;
  wire             new_work_clock_2_out_requests_sdram_0_s1;
  wire             new_work_clock_2_out_saved_grant_sdram_0_s1;
  wire             new_work_clock_3_out_arbiterlock;
  wire             new_work_clock_3_out_arbiterlock2;
  wire             new_work_clock_3_out_continuerequest;
  wire             new_work_clock_3_out_granted_sdram_0_s1;
  wire             new_work_clock_3_out_qualified_request_sdram_0_s1;
  wire             new_work_clock_3_out_rdv_fifo_empty_sdram_0_s1;
  wire             new_work_clock_3_out_rdv_fifo_output_from_sdram_0_s1;
  wire             new_work_clock_3_out_read_data_valid_sdram_0_s1;
  wire             new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register;
  wire             new_work_clock_3_out_requests_sdram_0_s1;
  wire             new_work_clock_3_out_saved_grant_sdram_0_s1;
  wire    [ 21: 0] sdram_0_s1_address;
  wire             sdram_0_s1_allgrants;
  wire             sdram_0_s1_allow_new_arb_cycle;
  wire             sdram_0_s1_any_bursting_master_saved_grant;
  wire             sdram_0_s1_any_continuerequest;
  reg     [  1: 0] sdram_0_s1_arb_addend;
  wire             sdram_0_s1_arb_counter_enable;
  reg              sdram_0_s1_arb_share_counter;
  wire             sdram_0_s1_arb_share_counter_next_value;
  wire             sdram_0_s1_arb_share_set_values;
  wire    [  1: 0] sdram_0_s1_arb_winner;
  wire             sdram_0_s1_arbitration_holdoff_internal;
  wire             sdram_0_s1_beginbursttransfer_internal;
  wire             sdram_0_s1_begins_xfer;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire    [  3: 0] sdram_0_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_0_s1_chosen_master_rot_left;
  wire             sdram_0_s1_end_xfer;
  wire             sdram_0_s1_firsttransfer;
  wire    [  1: 0] sdram_0_s1_grant_vector;
  wire             sdram_0_s1_in_a_read_cycle;
  wire             sdram_0_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_0_s1_master_qreq_vector;
  wire             sdram_0_s1_move_on_to_next_transaction;
  wire             sdram_0_s1_non_bursting_master_requests;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid_from_sa;
  reg              sdram_0_s1_reg_firsttransfer;
  wire             sdram_0_s1_reset_n;
  reg     [  1: 0] sdram_0_s1_saved_chosen_master_vector;
  reg              sdram_0_s1_slavearbiterlockenable;
  wire             sdram_0_s1_slavearbiterlockenable2;
  wire             sdram_0_s1_unreg_firsttransfer;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_waits_for_read;
  wire             sdram_0_s1_waits_for_write;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 22: 0] shifted_address_to_sdram_0_s1_from_new_work_clock_2_out;
  wire    [ 22: 0] shifted_address_to_sdram_0_s1_from_new_work_clock_3_out;
  wire             wait_for_sdram_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_0_s1_end_xfer;
    end


  assign sdram_0_s1_begins_xfer = ~d1_reasons_to_wait & ((new_work_clock_2_out_qualified_request_sdram_0_s1 | new_work_clock_3_out_qualified_request_sdram_0_s1));
  //assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata;

  assign new_work_clock_2_out_requests_sdram_0_s1 = (1) & (new_work_clock_2_out_read | new_work_clock_2_out_write);
  //assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest;

  //assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid;

  //sdram_0_s1_arb_share_counter set values, which is an e_mux
  assign sdram_0_s1_arb_share_set_values = 1;

  //sdram_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_0_s1_non_bursting_master_requests = new_work_clock_2_out_requests_sdram_0_s1 |
    new_work_clock_3_out_requests_sdram_0_s1 |
    new_work_clock_2_out_requests_sdram_0_s1 |
    new_work_clock_3_out_requests_sdram_0_s1;

  //sdram_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_0_s1_any_bursting_master_saved_grant = 0;

  //sdram_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_0_s1_arb_share_counter_next_value = sdram_0_s1_firsttransfer ? (sdram_0_s1_arb_share_set_values - 1) : |sdram_0_s1_arb_share_counter ? (sdram_0_s1_arb_share_counter - 1) : 0;

  //sdram_0_s1_allgrants all slave grants, which is an e_mux
  assign sdram_0_s1_allgrants = (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector);

  //sdram_0_s1_end_xfer assignment, which is an e_assign
  assign sdram_0_s1_end_xfer = ~(sdram_0_s1_waits_for_read | sdram_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_0_s1 = sdram_0_s1_end_xfer & (~sdram_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_0_s1 & sdram_0_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests);

  //sdram_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_share_counter <= 0;
      else if (sdram_0_s1_arb_counter_enable)
          sdram_0_s1_arb_share_counter <= sdram_0_s1_arb_share_counter_next_value;
    end


  //sdram_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_0_s1) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests))
          sdram_0_s1_slavearbiterlockenable <= |sdram_0_s1_arb_share_counter_next_value;
    end


  //new_work_clock_2/out sdram_0/s1 arbiterlock, which is an e_assign
  assign new_work_clock_2_out_arbiterlock = sdram_0_s1_slavearbiterlockenable & new_work_clock_2_out_continuerequest;

  //sdram_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_0_s1_slavearbiterlockenable2 = |sdram_0_s1_arb_share_counter_next_value;

  //new_work_clock_2/out sdram_0/s1 arbiterlock2, which is an e_assign
  assign new_work_clock_2_out_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & new_work_clock_2_out_continuerequest;

  //new_work_clock_3/out sdram_0/s1 arbiterlock, which is an e_assign
  assign new_work_clock_3_out_arbiterlock = sdram_0_s1_slavearbiterlockenable & new_work_clock_3_out_continuerequest;

  //new_work_clock_3/out sdram_0/s1 arbiterlock2, which is an e_assign
  assign new_work_clock_3_out_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & new_work_clock_3_out_continuerequest;

  //new_work_clock_3/out granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_clock_3_out_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_new_work_clock_3_out_granted_slave_sdram_0_s1 <= new_work_clock_3_out_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~new_work_clock_3_out_requests_sdram_0_s1) ? 0 : last_cycle_new_work_clock_3_out_granted_slave_sdram_0_s1;
    end


  //new_work_clock_3_out_continuerequest continued request, which is an e_mux
  assign new_work_clock_3_out_continuerequest = last_cycle_new_work_clock_3_out_granted_slave_sdram_0_s1 & new_work_clock_3_out_requests_sdram_0_s1;

  //sdram_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_0_s1_any_continuerequest = new_work_clock_3_out_continuerequest |
    new_work_clock_2_out_continuerequest;

  assign new_work_clock_2_out_qualified_request_sdram_0_s1 = new_work_clock_2_out_requests_sdram_0_s1 & ~((new_work_clock_2_out_read & ((|new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register))) | new_work_clock_3_out_arbiterlock);
  //unique name for sdram_0_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_0_s1_move_on_to_next_transaction = sdram_0_s1_readdatavalid_from_sa;

  //rdv_fifo_for_new_work_clock_2_out_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_new_work_clock_2_out_to_sdram_0_s1_module rdv_fifo_for_new_work_clock_2_out_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_clock_2_out_granted_sdram_0_s1),
      .data_out             (new_work_clock_2_out_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (new_work_clock_2_out_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register = ~new_work_clock_2_out_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid new_work_clock_2_out_read_data_valid_sdram_0_s1, which is an e_mux
  assign new_work_clock_2_out_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & new_work_clock_2_out_rdv_fifo_output_from_sdram_0_s1) & ~ new_work_clock_2_out_rdv_fifo_empty_sdram_0_s1;

  //sdram_0_s1_writedata mux, which is an e_mux
  assign sdram_0_s1_writedata = (new_work_clock_2_out_granted_sdram_0_s1)? new_work_clock_2_out_writedata :
    new_work_clock_3_out_writedata;

  assign new_work_clock_3_out_requests_sdram_0_s1 = (1) & (new_work_clock_3_out_read | new_work_clock_3_out_write);
  //new_work_clock_2/out granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_clock_2_out_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_new_work_clock_2_out_granted_slave_sdram_0_s1 <= new_work_clock_2_out_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~new_work_clock_2_out_requests_sdram_0_s1) ? 0 : last_cycle_new_work_clock_2_out_granted_slave_sdram_0_s1;
    end


  //new_work_clock_2_out_continuerequest continued request, which is an e_mux
  assign new_work_clock_2_out_continuerequest = last_cycle_new_work_clock_2_out_granted_slave_sdram_0_s1 & new_work_clock_2_out_requests_sdram_0_s1;

  assign new_work_clock_3_out_qualified_request_sdram_0_s1 = new_work_clock_3_out_requests_sdram_0_s1 & ~((new_work_clock_3_out_read & ((|new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register))) | new_work_clock_2_out_arbiterlock);
  //rdv_fifo_for_new_work_clock_3_out_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_new_work_clock_3_out_to_sdram_0_s1_module rdv_fifo_for_new_work_clock_3_out_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (new_work_clock_3_out_granted_sdram_0_s1),
      .data_out             (new_work_clock_3_out_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (new_work_clock_3_out_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register = ~new_work_clock_3_out_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid new_work_clock_3_out_read_data_valid_sdram_0_s1, which is an e_mux
  assign new_work_clock_3_out_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & new_work_clock_3_out_rdv_fifo_output_from_sdram_0_s1) & ~ new_work_clock_3_out_rdv_fifo_empty_sdram_0_s1;

  //allow new arb cycle for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_allow_new_arb_cycle = ~new_work_clock_2_out_arbiterlock & ~new_work_clock_3_out_arbiterlock;

  //new_work_clock_3/out assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[0] = new_work_clock_3_out_qualified_request_sdram_0_s1;

  //new_work_clock_3/out grant sdram_0/s1, which is an e_assign
  assign new_work_clock_3_out_granted_sdram_0_s1 = sdram_0_s1_grant_vector[0];

  //new_work_clock_3/out saved-grant sdram_0/s1, which is an e_assign
  assign new_work_clock_3_out_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[0] && new_work_clock_3_out_requests_sdram_0_s1;

  //new_work_clock_2/out assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[1] = new_work_clock_2_out_qualified_request_sdram_0_s1;

  //new_work_clock_2/out grant sdram_0/s1, which is an e_assign
  assign new_work_clock_2_out_granted_sdram_0_s1 = sdram_0_s1_grant_vector[1];

  //new_work_clock_2/out saved-grant sdram_0/s1, which is an e_assign
  assign new_work_clock_2_out_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[1] && new_work_clock_2_out_requests_sdram_0_s1;

  //sdram_0/s1 chosen-master double-vector, which is an e_assign
  assign sdram_0_s1_chosen_master_double_vector = {sdram_0_s1_master_qreq_vector, sdram_0_s1_master_qreq_vector} & ({~sdram_0_s1_master_qreq_vector, ~sdram_0_s1_master_qreq_vector} + sdram_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_0_s1_arb_winner = (sdram_0_s1_allow_new_arb_cycle & | sdram_0_s1_grant_vector) ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;

  //saved sdram_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_saved_chosen_master_vector <= 0;
      else if (sdram_0_s1_allow_new_arb_cycle)
          sdram_0_s1_saved_chosen_master_vector <= |sdram_0_s1_grant_vector ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_0_s1_grant_vector = {(sdram_0_s1_chosen_master_double_vector[1] | sdram_0_s1_chosen_master_double_vector[3]),
    (sdram_0_s1_chosen_master_double_vector[0] | sdram_0_s1_chosen_master_double_vector[2])};

  //sdram_0/s1 chosen master rotated left, which is an e_assign
  assign sdram_0_s1_chosen_master_rot_left = (sdram_0_s1_arb_winner << 1) ? (sdram_0_s1_arb_winner << 1) : 1;

  //sdram_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_addend <= 1;
      else if (|sdram_0_s1_grant_vector)
          sdram_0_s1_arb_addend <= sdram_0_s1_end_xfer? sdram_0_s1_chosen_master_rot_left : sdram_0_s1_grant_vector;
    end


  //sdram_0_s1_reset_n assignment, which is an e_assign
  assign sdram_0_s1_reset_n = reset_n;

  assign sdram_0_s1_chipselect = new_work_clock_2_out_granted_sdram_0_s1 | new_work_clock_3_out_granted_sdram_0_s1;
  //sdram_0_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_firsttransfer = sdram_0_s1_begins_xfer ? sdram_0_s1_unreg_firsttransfer : sdram_0_s1_reg_firsttransfer;

  //sdram_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_unreg_firsttransfer = ~(sdram_0_s1_slavearbiterlockenable & sdram_0_s1_any_continuerequest);

  //sdram_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_0_s1_begins_xfer)
          sdram_0_s1_reg_firsttransfer <= sdram_0_s1_unreg_firsttransfer;
    end


  //sdram_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_0_s1_beginbursttransfer_internal = sdram_0_s1_begins_xfer;

  //sdram_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_0_s1_arbitration_holdoff_internal = sdram_0_s1_begins_xfer & sdram_0_s1_firsttransfer;

  //~sdram_0_s1_read_n assignment, which is an e_mux
  assign sdram_0_s1_read_n = ~((new_work_clock_2_out_granted_sdram_0_s1 & new_work_clock_2_out_read) | (new_work_clock_3_out_granted_sdram_0_s1 & new_work_clock_3_out_read));

  //~sdram_0_s1_write_n assignment, which is an e_mux
  assign sdram_0_s1_write_n = ~((new_work_clock_2_out_granted_sdram_0_s1 & new_work_clock_2_out_write) | (new_work_clock_3_out_granted_sdram_0_s1 & new_work_clock_3_out_write));

  assign shifted_address_to_sdram_0_s1_from_new_work_clock_2_out = new_work_clock_2_out_address_to_slave;
  //sdram_0_s1_address mux, which is an e_mux
  assign sdram_0_s1_address = (new_work_clock_2_out_granted_sdram_0_s1)? (shifted_address_to_sdram_0_s1_from_new_work_clock_2_out >> 1) :
    (shifted_address_to_sdram_0_s1_from_new_work_clock_3_out >> 1);

  assign shifted_address_to_sdram_0_s1_from_new_work_clock_3_out = new_work_clock_3_out_address_to_slave;
  //d1_sdram_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_0_s1_end_xfer <= 1;
      else 
        d1_sdram_0_s1_end_xfer <= sdram_0_s1_end_xfer;
    end


  //sdram_0_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_read = sdram_0_s1_in_a_read_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_read_cycle = (new_work_clock_2_out_granted_sdram_0_s1 & new_work_clock_2_out_read) | (new_work_clock_3_out_granted_sdram_0_s1 & new_work_clock_3_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_0_s1_in_a_read_cycle;

  //sdram_0_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_write = sdram_0_s1_in_a_write_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_write_cycle = (new_work_clock_2_out_granted_sdram_0_s1 & new_work_clock_2_out_write) | (new_work_clock_3_out_granted_sdram_0_s1 & new_work_clock_3_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_0_s1_in_a_write_cycle;

  assign wait_for_sdram_0_s1_counter = 0;
  //~sdram_0_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_0_s1_byteenable_n = ~((new_work_clock_2_out_granted_sdram_0_s1)? new_work_clock_2_out_byteenable :
    (new_work_clock_3_out_granted_sdram_0_s1)? new_work_clock_3_out_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram_0/s1 enable non-zero assertions, which is an e_register
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
      if (new_work_clock_2_out_granted_sdram_0_s1 + new_work_clock_3_out_granted_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_clock_2_out_saved_grant_sdram_0_s1 + new_work_clock_3_out_saved_grant_sdram_0_s1 > 1)
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

module sysid_0_control_slave_arbitrator (
                                          // inputs:
                                           clk,
                                           new_work_clock_0_out_address_to_slave,
                                           new_work_clock_0_out_nativeaddress,
                                           new_work_clock_0_out_read,
                                           new_work_clock_0_out_write,
                                           reset_n,
                                           sysid_0_control_slave_readdata,

                                          // outputs:
                                           d1_sysid_0_control_slave_end_xfer,
                                           new_work_clock_0_out_granted_sysid_0_control_slave,
                                           new_work_clock_0_out_qualified_request_sysid_0_control_slave,
                                           new_work_clock_0_out_read_data_valid_sysid_0_control_slave,
                                           new_work_clock_0_out_requests_sysid_0_control_slave,
                                           sysid_0_control_slave_address,
                                           sysid_0_control_slave_readdata_from_sa
                                        )
;

  output           d1_sysid_0_control_slave_end_xfer;
  output           new_work_clock_0_out_granted_sysid_0_control_slave;
  output           new_work_clock_0_out_qualified_request_sysid_0_control_slave;
  output           new_work_clock_0_out_read_data_valid_sysid_0_control_slave;
  output           new_work_clock_0_out_requests_sysid_0_control_slave;
  output           sysid_0_control_slave_address;
  output  [ 31: 0] sysid_0_control_slave_readdata_from_sa;
  input            clk;
  input   [  2: 0] new_work_clock_0_out_address_to_slave;
  input            new_work_clock_0_out_nativeaddress;
  input            new_work_clock_0_out_read;
  input            new_work_clock_0_out_write;
  input            reset_n;
  input   [ 31: 0] sysid_0_control_slave_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sysid_0_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_0_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             new_work_clock_0_out_arbiterlock;
  wire             new_work_clock_0_out_arbiterlock2;
  wire             new_work_clock_0_out_continuerequest;
  wire             new_work_clock_0_out_granted_sysid_0_control_slave;
  wire             new_work_clock_0_out_qualified_request_sysid_0_control_slave;
  wire             new_work_clock_0_out_read_data_valid_sysid_0_control_slave;
  wire             new_work_clock_0_out_requests_sysid_0_control_slave;
  wire             new_work_clock_0_out_saved_grant_sysid_0_control_slave;
  wire             sysid_0_control_slave_address;
  wire             sysid_0_control_slave_allgrants;
  wire             sysid_0_control_slave_allow_new_arb_cycle;
  wire             sysid_0_control_slave_any_bursting_master_saved_grant;
  wire             sysid_0_control_slave_any_continuerequest;
  wire             sysid_0_control_slave_arb_counter_enable;
  reg              sysid_0_control_slave_arb_share_counter;
  wire             sysid_0_control_slave_arb_share_counter_next_value;
  wire             sysid_0_control_slave_arb_share_set_values;
  wire             sysid_0_control_slave_beginbursttransfer_internal;
  wire             sysid_0_control_slave_begins_xfer;
  wire             sysid_0_control_slave_end_xfer;
  wire             sysid_0_control_slave_firsttransfer;
  wire             sysid_0_control_slave_grant_vector;
  wire             sysid_0_control_slave_in_a_read_cycle;
  wire             sysid_0_control_slave_in_a_write_cycle;
  wire             sysid_0_control_slave_master_qreq_vector;
  wire             sysid_0_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_0_control_slave_readdata_from_sa;
  reg              sysid_0_control_slave_reg_firsttransfer;
  reg              sysid_0_control_slave_slavearbiterlockenable;
  wire             sysid_0_control_slave_slavearbiterlockenable2;
  wire             sysid_0_control_slave_unreg_firsttransfer;
  wire             sysid_0_control_slave_waits_for_read;
  wire             sysid_0_control_slave_waits_for_write;
  wire             wait_for_sysid_0_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_0_control_slave_end_xfer;
    end


  assign sysid_0_control_slave_begins_xfer = ~d1_reasons_to_wait & ((new_work_clock_0_out_qualified_request_sysid_0_control_slave));
  //assign sysid_0_control_slave_readdata_from_sa = sysid_0_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_0_control_slave_readdata_from_sa = sysid_0_control_slave_readdata;

  assign new_work_clock_0_out_requests_sysid_0_control_slave = ((1) & (new_work_clock_0_out_read | new_work_clock_0_out_write)) & new_work_clock_0_out_read;
  //sysid_0_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_0_control_slave_arb_share_set_values = 1;

  //sysid_0_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_0_control_slave_non_bursting_master_requests = new_work_clock_0_out_requests_sysid_0_control_slave;

  //sysid_0_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_0_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_0_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_0_control_slave_arb_share_counter_next_value = sysid_0_control_slave_firsttransfer ? (sysid_0_control_slave_arb_share_set_values - 1) : |sysid_0_control_slave_arb_share_counter ? (sysid_0_control_slave_arb_share_counter - 1) : 0;

  //sysid_0_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_0_control_slave_allgrants = |sysid_0_control_slave_grant_vector;

  //sysid_0_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_0_control_slave_end_xfer = ~(sysid_0_control_slave_waits_for_read | sysid_0_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_0_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_0_control_slave = sysid_0_control_slave_end_xfer & (~sysid_0_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_0_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_0_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_0_control_slave & sysid_0_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_0_control_slave & ~sysid_0_control_slave_non_bursting_master_requests);

  //sysid_0_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_0_control_slave_arb_share_counter <= 0;
      else if (sysid_0_control_slave_arb_counter_enable)
          sysid_0_control_slave_arb_share_counter <= sysid_0_control_slave_arb_share_counter_next_value;
    end


  //sysid_0_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_0_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_0_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_0_control_slave) | (end_xfer_arb_share_counter_term_sysid_0_control_slave & ~sysid_0_control_slave_non_bursting_master_requests))
          sysid_0_control_slave_slavearbiterlockenable <= |sysid_0_control_slave_arb_share_counter_next_value;
    end


  //new_work_clock_0/out sysid_0/control_slave arbiterlock, which is an e_assign
  assign new_work_clock_0_out_arbiterlock = sysid_0_control_slave_slavearbiterlockenable & new_work_clock_0_out_continuerequest;

  //sysid_0_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_0_control_slave_slavearbiterlockenable2 = |sysid_0_control_slave_arb_share_counter_next_value;

  //new_work_clock_0/out sysid_0/control_slave arbiterlock2, which is an e_assign
  assign new_work_clock_0_out_arbiterlock2 = sysid_0_control_slave_slavearbiterlockenable2 & new_work_clock_0_out_continuerequest;

  //sysid_0_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_0_control_slave_any_continuerequest = 1;

  //new_work_clock_0_out_continuerequest continued request, which is an e_assign
  assign new_work_clock_0_out_continuerequest = 1;

  assign new_work_clock_0_out_qualified_request_sysid_0_control_slave = new_work_clock_0_out_requests_sysid_0_control_slave;
  //master is always granted when requested
  assign new_work_clock_0_out_granted_sysid_0_control_slave = new_work_clock_0_out_qualified_request_sysid_0_control_slave;

  //new_work_clock_0/out saved-grant sysid_0/control_slave, which is an e_assign
  assign new_work_clock_0_out_saved_grant_sysid_0_control_slave = new_work_clock_0_out_requests_sysid_0_control_slave;

  //allow new arb cycle for sysid_0/control_slave, which is an e_assign
  assign sysid_0_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_0_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_0_control_slave_master_qreq_vector = 1;

  //sysid_0_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_0_control_slave_firsttransfer = sysid_0_control_slave_begins_xfer ? sysid_0_control_slave_unreg_firsttransfer : sysid_0_control_slave_reg_firsttransfer;

  //sysid_0_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_0_control_slave_unreg_firsttransfer = ~(sysid_0_control_slave_slavearbiterlockenable & sysid_0_control_slave_any_continuerequest);

  //sysid_0_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_0_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_0_control_slave_begins_xfer)
          sysid_0_control_slave_reg_firsttransfer <= sysid_0_control_slave_unreg_firsttransfer;
    end


  //sysid_0_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_0_control_slave_beginbursttransfer_internal = sysid_0_control_slave_begins_xfer;

  //sysid_0_control_slave_address mux, which is an e_mux
  assign sysid_0_control_slave_address = new_work_clock_0_out_nativeaddress;

  //d1_sysid_0_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_0_control_slave_end_xfer <= 1;
      else 
        d1_sysid_0_control_slave_end_xfer <= sysid_0_control_slave_end_xfer;
    end


  //sysid_0_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_0_control_slave_waits_for_read = sysid_0_control_slave_in_a_read_cycle & sysid_0_control_slave_begins_xfer;

  //sysid_0_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_0_control_slave_in_a_read_cycle = new_work_clock_0_out_granted_sysid_0_control_slave & new_work_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_0_control_slave_in_a_read_cycle;

  //sysid_0_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_0_control_slave_waits_for_write = sysid_0_control_slave_in_a_write_cycle & 0;

  //sysid_0_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_0_control_slave_in_a_write_cycle = new_work_clock_0_out_granted_sysid_0_control_slave & new_work_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_0_control_slave_in_a_write_cycle;

  assign wait_for_sysid_0_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid_0/control_slave enable non-zero assertions, which is an e_register
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

module tri_state_bridge_0_avalon_slave_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     new_work_clock_5_out_address_to_slave,
                                                     new_work_clock_5_out_read,
                                                     new_work_clock_5_out_write,
                                                     new_work_clock_5_out_writedata,
                                                     new_work_clock_6_out_address_to_slave,
                                                     new_work_clock_6_out_read,
                                                     new_work_clock_6_out_write,
                                                     new_work_clock_6_out_writedata,
                                                     reset_n,

                                                    // outputs:
                                                     address_to_the_cfi_flash_0,
                                                     cfi_flash_0_s1_wait_counter_eq_0,
                                                     d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                                     data_to_and_from_the_cfi_flash_0,
                                                     incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0,
                                                     new_work_clock_5_out_granted_cfi_flash_0_s1,
                                                     new_work_clock_5_out_qualified_request_cfi_flash_0_s1,
                                                     new_work_clock_5_out_read_data_valid_cfi_flash_0_s1,
                                                     new_work_clock_5_out_requests_cfi_flash_0_s1,
                                                     new_work_clock_6_out_granted_cfi_flash_0_s1,
                                                     new_work_clock_6_out_qualified_request_cfi_flash_0_s1,
                                                     new_work_clock_6_out_read_data_valid_cfi_flash_0_s1,
                                                     new_work_clock_6_out_requests_cfi_flash_0_s1,
                                                     read_n_to_the_cfi_flash_0,
                                                     select_n_to_the_cfi_flash_0,
                                                     write_n_to_the_cfi_flash_0
                                                  )
;

  output  [ 21: 0] address_to_the_cfi_flash_0;
  output           cfi_flash_0_s1_wait_counter_eq_0;
  output           d1_tri_state_bridge_0_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash_0;
  output  [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;
  output           new_work_clock_5_out_granted_cfi_flash_0_s1;
  output           new_work_clock_5_out_qualified_request_cfi_flash_0_s1;
  output           new_work_clock_5_out_read_data_valid_cfi_flash_0_s1;
  output           new_work_clock_5_out_requests_cfi_flash_0_s1;
  output           new_work_clock_6_out_granted_cfi_flash_0_s1;
  output           new_work_clock_6_out_qualified_request_cfi_flash_0_s1;
  output           new_work_clock_6_out_read_data_valid_cfi_flash_0_s1;
  output           new_work_clock_6_out_requests_cfi_flash_0_s1;
  output           read_n_to_the_cfi_flash_0;
  output           select_n_to_the_cfi_flash_0;
  output           write_n_to_the_cfi_flash_0;
  input            clk;
  input   [ 21: 0] new_work_clock_5_out_address_to_slave;
  input            new_work_clock_5_out_read;
  input            new_work_clock_5_out_write;
  input   [ 15: 0] new_work_clock_5_out_writedata;
  input   [ 21: 0] new_work_clock_6_out_address_to_slave;
  input            new_work_clock_6_out_read;
  input            new_work_clock_6_out_write;
  input   [ 15: 0] new_work_clock_6_out_writedata;
  input            reset_n;

  reg     [ 21: 0] address_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  3: 0] cfi_flash_0_s1_counter_load_value;
  wire             cfi_flash_0_s1_in_a_read_cycle;
  wire             cfi_flash_0_s1_in_a_write_cycle;
  reg     [  3: 0] cfi_flash_0_s1_wait_counter;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             cfi_flash_0_s1_waits_for_read;
  wire             cfi_flash_0_s1_waits_for_write;
  wire             cfi_flash_0_s1_with_write_latency;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash_0;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_10_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_11_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_12_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_13_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_14_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_15_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_7_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_8_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_0_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;
  reg              last_cycle_new_work_clock_5_out_granted_slave_cfi_flash_0_s1;
  reg              last_cycle_new_work_clock_6_out_granted_slave_cfi_flash_0_s1;
  wire             new_work_clock_5_out_arbiterlock;
  wire             new_work_clock_5_out_arbiterlock2;
  wire             new_work_clock_5_out_continuerequest;
  wire             new_work_clock_5_out_granted_cfi_flash_0_s1;
  wire             new_work_clock_5_out_qualified_request_cfi_flash_0_s1;
  wire             new_work_clock_5_out_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             new_work_clock_5_out_requests_cfi_flash_0_s1;
  wire             new_work_clock_5_out_saved_grant_cfi_flash_0_s1;
  wire             new_work_clock_6_out_arbiterlock;
  wire             new_work_clock_6_out_arbiterlock2;
  wire             new_work_clock_6_out_continuerequest;
  wire             new_work_clock_6_out_granted_cfi_flash_0_s1;
  wire             new_work_clock_6_out_qualified_request_cfi_flash_0_s1;
  wire             new_work_clock_6_out_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             new_work_clock_6_out_requests_cfi_flash_0_s1;
  wire             new_work_clock_6_out_saved_grant_cfi_flash_0_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_cfi_flash_0;
  wire    [ 21: 0] p1_address_to_the_cfi_flash_0;
  wire    [  1: 0] p1_new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register;
  wire    [  1: 0] p1_new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash_0;
  wire             p1_select_n_to_the_cfi_flash_0;
  wire             p1_write_n_to_the_cfi_flash_0;
  reg              read_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tri_state_bridge_0_avalon_slave_allgrants;
  wire             tri_state_bridge_0_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_0_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_arb_addend;
  wire             tri_state_bridge_0_avalon_slave_arb_counter_enable;
  reg              tri_state_bridge_0_avalon_slave_arb_share_counter;
  wire             tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
  wire             tri_state_bridge_0_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_arb_winner;
  wire             tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_0_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_0_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_0_avalon_slave_end_xfer;
  wire             tri_state_bridge_0_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_0_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_0_avalon_slave_read_pending;
  reg              tri_state_bridge_0_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_0_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_0_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_0_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_0_s1_counter;
  reg              write_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_0_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_0_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((new_work_clock_5_out_qualified_request_cfi_flash_0_s1 | new_work_clock_6_out_qualified_request_cfi_flash_0_s1));
  assign new_work_clock_5_out_requests_cfi_flash_0_s1 = (1) & (new_work_clock_5_out_read | new_work_clock_5_out_write);
  //~select_n_to_the_cfi_flash_0 of type chipselect to ~p1_select_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash_0 <= ~0;
      else 
        select_n_to_the_cfi_flash_0 <= p1_select_n_to_the_cfi_flash_0;
    end


  assign tri_state_bridge_0_avalon_slave_write_pending = 0;
  //tri_state_bridge_0/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_read_pending = 0;

  //tri_state_bridge_0_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_arb_share_set_values = 1;

  //tri_state_bridge_0_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_non_bursting_master_requests = new_work_clock_5_out_requests_cfi_flash_0_s1 |
    new_work_clock_6_out_requests_cfi_flash_0_s1 |
    new_work_clock_5_out_requests_cfi_flash_0_s1 |
    new_work_clock_6_out_requests_cfi_flash_0_s1;

  //tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_0_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_share_counter_next_value = tri_state_bridge_0_avalon_slave_firsttransfer ? (tri_state_bridge_0_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_0_avalon_slave_arb_share_counter ? (tri_state_bridge_0_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_0_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_allgrants = (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector);

  //tri_state_bridge_0_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_end_xfer = ~(cfi_flash_0_s1_waits_for_read | cfi_flash_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave = tri_state_bridge_0_avalon_slave_end_xfer & (~tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_0_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & tri_state_bridge_0_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_0_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_0_avalon_slave_arb_counter_enable)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_0_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //new_work_clock_5/out tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign new_work_clock_5_out_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & new_work_clock_5_out_continuerequest;

  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;

  //new_work_clock_5/out tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign new_work_clock_5_out_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & new_work_clock_5_out_continuerequest;

  //new_work_clock_6/out tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign new_work_clock_6_out_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & new_work_clock_6_out_continuerequest;

  //new_work_clock_6/out tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign new_work_clock_6_out_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & new_work_clock_6_out_continuerequest;

  //new_work_clock_6/out granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_clock_6_out_granted_slave_cfi_flash_0_s1 <= 0;
      else 
        last_cycle_new_work_clock_6_out_granted_slave_cfi_flash_0_s1 <= new_work_clock_6_out_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~new_work_clock_6_out_requests_cfi_flash_0_s1) ? 0 : last_cycle_new_work_clock_6_out_granted_slave_cfi_flash_0_s1;
    end


  //new_work_clock_6_out_continuerequest continued request, which is an e_mux
  assign new_work_clock_6_out_continuerequest = last_cycle_new_work_clock_6_out_granted_slave_cfi_flash_0_s1 & new_work_clock_6_out_requests_cfi_flash_0_s1;

  //tri_state_bridge_0_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_continuerequest = new_work_clock_6_out_continuerequest |
    new_work_clock_5_out_continuerequest;

  assign new_work_clock_5_out_qualified_request_cfi_flash_0_s1 = new_work_clock_5_out_requests_cfi_flash_0_s1 & ~((new_work_clock_5_out_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register))) | ((tri_state_bridge_0_avalon_slave_read_pending) & new_work_clock_5_out_write) | new_work_clock_6_out_arbiterlock);
  //new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register_in = new_work_clock_5_out_granted_cfi_flash_0_s1 & new_work_clock_5_out_read & ~cfi_flash_0_s1_waits_for_read & ~(|new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register);

  //shift register p1 new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register = {new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register, new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else 
        new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register <= p1_new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid new_work_clock_5_out_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign new_work_clock_5_out_read_data_valid_cfi_flash_0_s1 = new_work_clock_5_out_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //data_to_and_from_the_cfi_flash_0 register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_cfi_flash_0 <= 0;
      else 
        incoming_data_to_and_from_the_cfi_flash_0 <= data_to_and_from_the_cfi_flash_0;
    end


  //cfi_flash_0_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_0_s1_with_write_latency = in_a_write_cycle & (new_work_clock_5_out_qualified_request_cfi_flash_0_s1 | new_work_clock_6_out_qualified_request_cfi_flash_0_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_0_s1_with_write_latency)? 1 :
    (cfi_flash_0_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash_0 register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash_0 <= 0;
      else 
        d1_outgoing_data_to_and_from_the_cfi_flash_0 <= outgoing_data_to_and_from_the_cfi_flash_0;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash_0 tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash_0 = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash_0:{16{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash_0 mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash_0 = (new_work_clock_5_out_granted_cfi_flash_0_s1)? new_work_clock_5_out_writedata :
    new_work_clock_6_out_writedata;

  assign new_work_clock_6_out_requests_cfi_flash_0_s1 = (1) & (new_work_clock_6_out_read | new_work_clock_6_out_write);
  //new_work_clock_5/out granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_new_work_clock_5_out_granted_slave_cfi_flash_0_s1 <= 0;
      else 
        last_cycle_new_work_clock_5_out_granted_slave_cfi_flash_0_s1 <= new_work_clock_5_out_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~new_work_clock_5_out_requests_cfi_flash_0_s1) ? 0 : last_cycle_new_work_clock_5_out_granted_slave_cfi_flash_0_s1;
    end


  //new_work_clock_5_out_continuerequest continued request, which is an e_mux
  assign new_work_clock_5_out_continuerequest = last_cycle_new_work_clock_5_out_granted_slave_cfi_flash_0_s1 & new_work_clock_5_out_requests_cfi_flash_0_s1;

  assign new_work_clock_6_out_qualified_request_cfi_flash_0_s1 = new_work_clock_6_out_requests_cfi_flash_0_s1 & ~((new_work_clock_6_out_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register))) | ((tri_state_bridge_0_avalon_slave_read_pending) & new_work_clock_6_out_write) | new_work_clock_5_out_arbiterlock);
  //new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register_in = new_work_clock_6_out_granted_cfi_flash_0_s1 & new_work_clock_6_out_read & ~cfi_flash_0_s1_waits_for_read & ~(|new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register);

  //shift register p1 new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register = {new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register, new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else 
        new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register <= p1_new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid new_work_clock_6_out_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign new_work_clock_6_out_read_data_valid_cfi_flash_0_s1 = new_work_clock_6_out_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_0/avalon_slave, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_allow_new_arb_cycle = ~new_work_clock_5_out_arbiterlock & ~new_work_clock_6_out_arbiterlock;

  //new_work_clock_6/out assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[0] = new_work_clock_6_out_qualified_request_cfi_flash_0_s1;

  //new_work_clock_6/out grant cfi_flash_0/s1, which is an e_assign
  assign new_work_clock_6_out_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[0];

  //new_work_clock_6/out saved-grant cfi_flash_0/s1, which is an e_assign
  assign new_work_clock_6_out_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[0] && new_work_clock_6_out_requests_cfi_flash_0_s1;

  //new_work_clock_5/out assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[1] = new_work_clock_5_out_qualified_request_cfi_flash_0_s1;

  //new_work_clock_5/out grant cfi_flash_0/s1, which is an e_assign
  assign new_work_clock_5_out_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[1];

  //new_work_clock_5/out saved-grant cfi_flash_0/s1, which is an e_assign
  assign new_work_clock_5_out_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[1] && new_work_clock_5_out_requests_cfi_flash_0_s1;

  //tri_state_bridge_0/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_double_vector = {tri_state_bridge_0_avalon_slave_master_qreq_vector, tri_state_bridge_0_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_0_avalon_slave_master_qreq_vector, ~tri_state_bridge_0_avalon_slave_master_qreq_vector} + tri_state_bridge_0_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_0_avalon_slave_arb_winner = (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_0_avalon_slave_grant_vector) ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_0_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_0_avalon_slave_grant_vector ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_0_avalon_slave_grant_vector = {(tri_state_bridge_0_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_0/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_rot_left = (tri_state_bridge_0_avalon_slave_arb_winner << 1) ? (tri_state_bridge_0_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_0/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_0_avalon_slave_grant_vector)
          tri_state_bridge_0_avalon_slave_arb_addend <= tri_state_bridge_0_avalon_slave_end_xfer? tri_state_bridge_0_avalon_slave_chosen_master_rot_left : tri_state_bridge_0_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash_0 = ~(new_work_clock_5_out_granted_cfi_flash_0_s1 | new_work_clock_6_out_granted_cfi_flash_0_s1);
  //tri_state_bridge_0_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_firsttransfer = tri_state_bridge_0_avalon_slave_begins_xfer ? tri_state_bridge_0_avalon_slave_unreg_firsttransfer : tri_state_bridge_0_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_0_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_0_avalon_slave_slavearbiterlockenable & tri_state_bridge_0_avalon_slave_any_continuerequest);

  //tri_state_bridge_0_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_0_avalon_slave_begins_xfer)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_0_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_beginbursttransfer_internal = tri_state_bridge_0_avalon_slave_begins_xfer;

  //tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_0_avalon_slave_begins_xfer & tri_state_bridge_0_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash_0 of type read to ~p1_read_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash_0 <= ~0;
      else 
        read_n_to_the_cfi_flash_0 <= p1_read_n_to_the_cfi_flash_0;
    end


  //~p1_read_n_to_the_cfi_flash_0 assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash_0 = ~(((new_work_clock_5_out_granted_cfi_flash_0_s1 & new_work_clock_5_out_read) | (new_work_clock_6_out_granted_cfi_flash_0_s1 & new_work_clock_6_out_read))& ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter < 8));

  //~write_n_to_the_cfi_flash_0 of type write to ~p1_write_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash_0 <= ~0;
      else 
        write_n_to_the_cfi_flash_0 <= p1_write_n_to_the_cfi_flash_0;
    end


  //~p1_write_n_to_the_cfi_flash_0 assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash_0 = ~(((new_work_clock_5_out_granted_cfi_flash_0_s1 & new_work_clock_5_out_write) | (new_work_clock_6_out_granted_cfi_flash_0_s1 & new_work_clock_6_out_write)) & ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter >= 2) & (cfi_flash_0_s1_wait_counter < 10));

  //address_to_the_cfi_flash_0 of type address to p1_address_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash_0 <= 0;
      else 
        address_to_the_cfi_flash_0 <= p1_address_to_the_cfi_flash_0;
    end


  //p1_address_to_the_cfi_flash_0 mux, which is an e_mux
  assign p1_address_to_the_cfi_flash_0 = (new_work_clock_5_out_granted_cfi_flash_0_s1)? new_work_clock_5_out_address_to_slave :
    new_work_clock_6_out_address_to_slave;

  //d1_tri_state_bridge_0_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_0_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_0_avalon_slave_end_xfer <= tri_state_bridge_0_avalon_slave_end_xfer;
    end


  //cfi_flash_0_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_read = cfi_flash_0_s1_in_a_read_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_read_cycle = (new_work_clock_5_out_granted_cfi_flash_0_s1 & new_work_clock_5_out_read) | (new_work_clock_6_out_granted_cfi_flash_0_s1 & new_work_clock_6_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_0_s1_in_a_read_cycle;

  //cfi_flash_0_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_write = cfi_flash_0_s1_in_a_write_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_write_cycle = (new_work_clock_5_out_granted_cfi_flash_0_s1 & new_work_clock_5_out_write) | (new_work_clock_6_out_granted_cfi_flash_0_s1 & new_work_clock_6_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_0_s1_in_a_write_cycle;

  assign cfi_flash_0_s1_wait_counter_eq_0 = cfi_flash_0_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_0_s1_wait_counter <= 0;
      else 
        cfi_flash_0_s1_wait_counter <= cfi_flash_0_s1_counter_load_value;
    end


  assign cfi_flash_0_s1_counter_load_value = ((cfi_flash_0_s1_in_a_write_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 10 :
    ((cfi_flash_0_s1_in_a_read_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 8 :
    (~cfi_flash_0_s1_wait_counter_eq_0)? cfi_flash_0_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_0_s1_counter = tri_state_bridge_0_avalon_slave_begins_xfer | ~cfi_flash_0_s1_wait_counter_eq_0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_0_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_0_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[0];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_0_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[1];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_0_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[2];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_0_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[3];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_0_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[4];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_0_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[5];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_0_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[6];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_0_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[7];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_8_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_cfi_flash_0_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[8];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_9_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_cfi_flash_0_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[9];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_10_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_cfi_flash_0_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[10];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_11_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_cfi_flash_0_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[11];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_12_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_cfi_flash_0_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[12];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_13_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_cfi_flash_0_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[13];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_14_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_cfi_flash_0_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[14];

  //incoming_data_to_and_from_the_cfi_flash_0_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_0_bit_15_is_x = ^(incoming_data_to_and_from_the_cfi_flash_0[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_cfi_flash_0_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash_0[15];

  //cfi_flash_0/s1 enable non-zero assertions, which is an e_register
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
      if (new_work_clock_5_out_granted_cfi_flash_0_s1 + new_work_clock_6_out_granted_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (new_work_clock_5_out_saved_grant_cfi_flash_0_s1 + new_work_clock_6_out_saved_grant_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash_0;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_0_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module new_work_reset_clk_0_domain_synch_module (
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

module new_work_reset_altpll_0_c0_out_domain_synch_module (
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

module new_work (
                  // 1) global signals:
                   altpll_0_c0_out,
                   clk_0,
                   reset_n,

                  // the_altpll_0
                   locked_from_the_altpll_0,

                  // the_cpu_0
                   cpu_resetrequest_to_the_cpu_0,
                   cpu_resettaken_from_the_cpu_0,

                  // the_pio_0
                   out_port_from_the_pio_0,

                  // the_sdram_0
                   zs_addr_from_the_sdram_0,
                   zs_ba_from_the_sdram_0,
                   zs_cas_n_from_the_sdram_0,
                   zs_cke_from_the_sdram_0,
                   zs_cs_n_from_the_sdram_0,
                   zs_dq_to_and_from_the_sdram_0,
                   zs_dqm_from_the_sdram_0,
                   zs_ras_n_from_the_sdram_0,
                   zs_we_n_from_the_sdram_0,

                  // the_tri_state_bridge_0_avalon_slave
                   address_to_the_cfi_flash_0,
                   data_to_and_from_the_cfi_flash_0,
                   read_n_to_the_cfi_flash_0,
                   select_n_to_the_cfi_flash_0,
                   write_n_to_the_cfi_flash_0
                )
;

  output  [ 21: 0] address_to_the_cfi_flash_0;
  output           altpll_0_c0_out;
  output           cpu_resettaken_from_the_cpu_0;
  inout   [ 15: 0] data_to_and_from_the_cfi_flash_0;
  output           locked_from_the_altpll_0;
  output  [  7: 0] out_port_from_the_pio_0;
  output           read_n_to_the_cfi_flash_0;
  output           select_n_to_the_cfi_flash_0;
  output           write_n_to_the_cfi_flash_0;
  output  [ 11: 0] zs_addr_from_the_sdram_0;
  output  [  1: 0] zs_ba_from_the_sdram_0;
  output           zs_cas_n_from_the_sdram_0;
  output           zs_cke_from_the_sdram_0;
  output           zs_cs_n_from_the_sdram_0;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  output  [  1: 0] zs_dqm_from_the_sdram_0;
  output           zs_ras_n_from_the_sdram_0;
  output           zs_we_n_from_the_sdram_0;
  input            clk_0;
  input            cpu_resetrequest_to_the_cpu_0;
  input            reset_n;

  wire    [ 21: 0] address_to_the_cfi_flash_0;
  wire             altpll_0_c0_out;
  wire             altpll_0_c0_out_reset_n;
  wire             altpll_0_pll_slave_address;
  wire             altpll_0_pll_slave_read;
  wire    [ 31: 0] altpll_0_pll_slave_readdata;
  wire    [ 31: 0] altpll_0_pll_slave_readdata_from_sa;
  wire             altpll_0_pll_slave_reset;
  wire             altpll_0_pll_slave_write;
  wire    [ 31: 0] altpll_0_pll_slave_writedata;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             clk_0_reset_n;
  wire    [ 24: 0] cpu_0_data_master_address;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_3_in;
  wire    [  1: 0] cpu_0_data_master_byteenable_new_work_clock_6_in;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_altpll_0_pll_slave;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_new_work_clock_0_in;
  wire             cpu_0_data_master_granted_new_work_clock_1_in;
  wire             cpu_0_data_master_granted_new_work_clock_3_in;
  wire             cpu_0_data_master_granted_new_work_clock_4_in;
  wire             cpu_0_data_master_granted_new_work_clock_6_in;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_latency_counter;
  wire             cpu_0_data_master_qualified_request_altpll_0_pll_slave;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_new_work_clock_0_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_1_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_3_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_4_in;
  wire             cpu_0_data_master_qualified_request_new_work_clock_6_in;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_altpll_0_pll_slave;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_0_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_1_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_3_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_4_in;
  wire             cpu_0_data_master_read_data_valid_new_work_clock_6_in;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_requests_altpll_0_pll_slave;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_new_work_clock_0_in;
  wire             cpu_0_data_master_requests_new_work_clock_1_in;
  wire             cpu_0_data_master_requests_new_work_clock_3_in;
  wire             cpu_0_data_master_requests_new_work_clock_4_in;
  wire             cpu_0_data_master_requests_new_work_clock_6_in;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 24: 0] cpu_0_instruction_master_address;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  3: 0] cpu_0_instruction_master_burstcount;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_granted_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_granted_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_granted_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream;
  wire             cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_new_work_burst_0_upstream;
  wire             cpu_0_instruction_master_requests_new_work_burst_1_upstream;
  wire             cpu_0_instruction_master_requests_new_work_burst_2_upstream;
  wire             cpu_0_instruction_master_requests_new_work_burst_3_upstream;
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
  wire             cpu_resettaken_from_the_cpu_0;
  wire             d1_altpll_0_pll_slave_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_new_work_burst_0_upstream_end_xfer;
  wire             d1_new_work_burst_1_upstream_end_xfer;
  wire             d1_new_work_burst_2_upstream_end_xfer;
  wire             d1_new_work_burst_3_upstream_end_xfer;
  wire             d1_new_work_clock_0_in_end_xfer;
  wire             d1_new_work_clock_1_in_end_xfer;
  wire             d1_new_work_clock_2_in_end_xfer;
  wire             d1_new_work_clock_3_in_end_xfer;
  wire             d1_new_work_clock_4_in_end_xfer;
  wire             d1_new_work_clock_5_in_end_xfer;
  wire             d1_new_work_clock_6_in_end_xfer;
  wire             d1_pio_0_s1_end_xfer;
  wire             d1_sdram_0_s1_end_xfer;
  wire             d1_sysid_0_control_slave_end_xfer;
  wire             d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash_0;
  wire    [ 15: 0] incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             locked_from_the_altpll_0;
  wire    [ 10: 0] new_work_burst_0_downstream_address;
  wire    [ 10: 0] new_work_burst_0_downstream_address_to_slave;
  wire    [  3: 0] new_work_burst_0_downstream_arbitrationshare;
  wire             new_work_burst_0_downstream_burstcount;
  wire    [  3: 0] new_work_burst_0_downstream_byteenable;
  wire             new_work_burst_0_downstream_debugaccess;
  wire             new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_latency_counter;
  wire    [ 10: 0] new_work_burst_0_downstream_nativeaddress;
  wire             new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_read;
  wire             new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module;
  wire    [ 31: 0] new_work_burst_0_downstream_readdata;
  wire             new_work_burst_0_downstream_readdatavalid;
  wire             new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module;
  wire             new_work_burst_0_downstream_reset_n;
  wire             new_work_burst_0_downstream_waitrequest;
  wire             new_work_burst_0_downstream_write;
  wire    [ 31: 0] new_work_burst_0_downstream_writedata;
  wire    [ 10: 0] new_work_burst_0_upstream_address;
  wire    [ 12: 0] new_work_burst_0_upstream_byteaddress;
  wire    [  3: 0] new_work_burst_0_upstream_byteenable;
  wire             new_work_burst_0_upstream_debugaccess;
  wire             new_work_burst_0_upstream_read;
  wire    [ 31: 0] new_work_burst_0_upstream_readdata;
  wire    [ 31: 0] new_work_burst_0_upstream_readdata_from_sa;
  wire             new_work_burst_0_upstream_readdatavalid;
  wire             new_work_burst_0_upstream_waitrequest;
  wire             new_work_burst_0_upstream_waitrequest_from_sa;
  wire             new_work_burst_0_upstream_write;
  wire    [ 31: 0] new_work_burst_0_upstream_writedata;
  wire    [  2: 0] new_work_burst_1_downstream_address;
  wire    [  2: 0] new_work_burst_1_downstream_address_to_slave;
  wire    [  3: 0] new_work_burst_1_downstream_arbitrationshare;
  wire             new_work_burst_1_downstream_burstcount;
  wire    [  3: 0] new_work_burst_1_downstream_byteenable;
  wire             new_work_burst_1_downstream_debugaccess;
  wire             new_work_burst_1_downstream_granted_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_latency_counter;
  wire    [  2: 0] new_work_burst_1_downstream_nativeaddress;
  wire             new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_read;
  wire             new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave;
  wire    [ 31: 0] new_work_burst_1_downstream_readdata;
  wire             new_work_burst_1_downstream_readdatavalid;
  wire             new_work_burst_1_downstream_requests_altpll_0_pll_slave;
  wire             new_work_burst_1_downstream_reset_n;
  wire             new_work_burst_1_downstream_waitrequest;
  wire             new_work_burst_1_downstream_write;
  wire    [ 31: 0] new_work_burst_1_downstream_writedata;
  wire    [  2: 0] new_work_burst_1_upstream_address;
  wire    [  4: 0] new_work_burst_1_upstream_byteaddress;
  wire    [  3: 0] new_work_burst_1_upstream_byteenable;
  wire             new_work_burst_1_upstream_debugaccess;
  wire             new_work_burst_1_upstream_read;
  wire    [ 31: 0] new_work_burst_1_upstream_readdata;
  wire    [ 31: 0] new_work_burst_1_upstream_readdata_from_sa;
  wire             new_work_burst_1_upstream_readdatavalid;
  wire             new_work_burst_1_upstream_waitrequest;
  wire             new_work_burst_1_upstream_waitrequest_from_sa;
  wire             new_work_burst_1_upstream_write;
  wire    [ 31: 0] new_work_burst_1_upstream_writedata;
  wire    [ 22: 0] new_work_burst_2_downstream_address;
  wire    [ 22: 0] new_work_burst_2_downstream_address_to_slave;
  wire    [  4: 0] new_work_burst_2_downstream_arbitrationshare;
  wire             new_work_burst_2_downstream_burstcount;
  wire    [  1: 0] new_work_burst_2_downstream_byteenable;
  wire             new_work_burst_2_downstream_debugaccess;
  wire             new_work_burst_2_downstream_granted_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_latency_counter;
  wire    [ 22: 0] new_work_burst_2_downstream_nativeaddress;
  wire             new_work_burst_2_downstream_qualified_request_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_read;
  wire             new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in;
  wire    [ 15: 0] new_work_burst_2_downstream_readdata;
  wire             new_work_burst_2_downstream_readdatavalid;
  wire             new_work_burst_2_downstream_requests_new_work_clock_2_in;
  wire             new_work_burst_2_downstream_reset_n;
  wire             new_work_burst_2_downstream_waitrequest;
  wire             new_work_burst_2_downstream_write;
  wire    [ 15: 0] new_work_burst_2_downstream_writedata;
  wire    [ 22: 0] new_work_burst_2_upstream_address;
  wire    [ 23: 0] new_work_burst_2_upstream_byteaddress;
  wire    [  1: 0] new_work_burst_2_upstream_byteenable;
  wire             new_work_burst_2_upstream_debugaccess;
  wire             new_work_burst_2_upstream_read;
  wire    [ 15: 0] new_work_burst_2_upstream_readdata;
  wire    [ 15: 0] new_work_burst_2_upstream_readdata_from_sa;
  wire             new_work_burst_2_upstream_readdatavalid;
  wire             new_work_burst_2_upstream_waitrequest;
  wire             new_work_burst_2_upstream_waitrequest_from_sa;
  wire             new_work_burst_2_upstream_write;
  wire    [ 15: 0] new_work_burst_2_upstream_writedata;
  wire    [ 21: 0] new_work_burst_3_downstream_address;
  wire    [ 21: 0] new_work_burst_3_downstream_address_to_slave;
  wire    [  4: 0] new_work_burst_3_downstream_arbitrationshare;
  wire             new_work_burst_3_downstream_burstcount;
  wire    [  1: 0] new_work_burst_3_downstream_byteenable;
  wire             new_work_burst_3_downstream_debugaccess;
  wire             new_work_burst_3_downstream_granted_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_latency_counter;
  wire    [ 21: 0] new_work_burst_3_downstream_nativeaddress;
  wire             new_work_burst_3_downstream_qualified_request_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_read;
  wire             new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in;
  wire    [ 15: 0] new_work_burst_3_downstream_readdata;
  wire             new_work_burst_3_downstream_readdatavalid;
  wire             new_work_burst_3_downstream_requests_new_work_clock_5_in;
  wire             new_work_burst_3_downstream_reset_n;
  wire             new_work_burst_3_downstream_waitrequest;
  wire             new_work_burst_3_downstream_write;
  wire    [ 15: 0] new_work_burst_3_downstream_writedata;
  wire    [ 21: 0] new_work_burst_3_upstream_address;
  wire    [ 22: 0] new_work_burst_3_upstream_byteaddress;
  wire    [  1: 0] new_work_burst_3_upstream_byteenable;
  wire             new_work_burst_3_upstream_debugaccess;
  wire             new_work_burst_3_upstream_read;
  wire    [ 15: 0] new_work_burst_3_upstream_readdata;
  wire    [ 15: 0] new_work_burst_3_upstream_readdata_from_sa;
  wire             new_work_burst_3_upstream_readdatavalid;
  wire             new_work_burst_3_upstream_waitrequest;
  wire             new_work_burst_3_upstream_waitrequest_from_sa;
  wire             new_work_burst_3_upstream_write;
  wire    [ 15: 0] new_work_burst_3_upstream_writedata;
  wire    [  2: 0] new_work_clock_0_in_address;
  wire    [  3: 0] new_work_clock_0_in_byteenable;
  wire             new_work_clock_0_in_endofpacket;
  wire             new_work_clock_0_in_endofpacket_from_sa;
  wire             new_work_clock_0_in_nativeaddress;
  wire             new_work_clock_0_in_read;
  wire    [ 31: 0] new_work_clock_0_in_readdata;
  wire    [ 31: 0] new_work_clock_0_in_readdata_from_sa;
  wire             new_work_clock_0_in_reset_n;
  wire             new_work_clock_0_in_waitrequest;
  wire             new_work_clock_0_in_waitrequest_from_sa;
  wire             new_work_clock_0_in_write;
  wire    [ 31: 0] new_work_clock_0_in_writedata;
  wire    [  2: 0] new_work_clock_0_out_address;
  wire    [  2: 0] new_work_clock_0_out_address_to_slave;
  wire    [  3: 0] new_work_clock_0_out_byteenable;
  wire             new_work_clock_0_out_endofpacket;
  wire             new_work_clock_0_out_granted_sysid_0_control_slave;
  wire             new_work_clock_0_out_nativeaddress;
  wire             new_work_clock_0_out_qualified_request_sysid_0_control_slave;
  wire             new_work_clock_0_out_read;
  wire             new_work_clock_0_out_read_data_valid_sysid_0_control_slave;
  wire    [ 31: 0] new_work_clock_0_out_readdata;
  wire             new_work_clock_0_out_requests_sysid_0_control_slave;
  wire             new_work_clock_0_out_reset_n;
  wire             new_work_clock_0_out_waitrequest;
  wire             new_work_clock_0_out_write;
  wire    [ 31: 0] new_work_clock_0_out_writedata;
  wire    [  2: 0] new_work_clock_1_in_address;
  wire    [  3: 0] new_work_clock_1_in_byteenable;
  wire             new_work_clock_1_in_endofpacket;
  wire             new_work_clock_1_in_endofpacket_from_sa;
  wire             new_work_clock_1_in_nativeaddress;
  wire             new_work_clock_1_in_read;
  wire    [ 31: 0] new_work_clock_1_in_readdata;
  wire    [ 31: 0] new_work_clock_1_in_readdata_from_sa;
  wire             new_work_clock_1_in_reset_n;
  wire             new_work_clock_1_in_waitrequest;
  wire             new_work_clock_1_in_waitrequest_from_sa;
  wire             new_work_clock_1_in_write;
  wire    [ 31: 0] new_work_clock_1_in_writedata;
  wire    [  2: 0] new_work_clock_1_out_address;
  wire    [  2: 0] new_work_clock_1_out_address_to_slave;
  wire    [  3: 0] new_work_clock_1_out_byteenable;
  wire             new_work_clock_1_out_endofpacket;
  wire             new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_nativeaddress;
  wire             new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_read;
  wire             new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire    [ 31: 0] new_work_clock_1_out_readdata;
  wire             new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  wire             new_work_clock_1_out_reset_n;
  wire             new_work_clock_1_out_waitrequest;
  wire             new_work_clock_1_out_write;
  wire    [ 31: 0] new_work_clock_1_out_writedata;
  wire    [ 22: 0] new_work_clock_2_in_address;
  wire    [  1: 0] new_work_clock_2_in_byteenable;
  wire             new_work_clock_2_in_endofpacket;
  wire             new_work_clock_2_in_endofpacket_from_sa;
  wire    [ 21: 0] new_work_clock_2_in_nativeaddress;
  wire             new_work_clock_2_in_read;
  wire    [ 15: 0] new_work_clock_2_in_readdata;
  wire    [ 15: 0] new_work_clock_2_in_readdata_from_sa;
  wire             new_work_clock_2_in_reset_n;
  wire             new_work_clock_2_in_waitrequest;
  wire             new_work_clock_2_in_waitrequest_from_sa;
  wire             new_work_clock_2_in_write;
  wire    [ 15: 0] new_work_clock_2_in_writedata;
  wire    [ 22: 0] new_work_clock_2_out_address;
  wire    [ 22: 0] new_work_clock_2_out_address_to_slave;
  wire    [  1: 0] new_work_clock_2_out_byteenable;
  wire             new_work_clock_2_out_endofpacket;
  wire             new_work_clock_2_out_granted_sdram_0_s1;
  wire    [ 21: 0] new_work_clock_2_out_nativeaddress;
  wire             new_work_clock_2_out_qualified_request_sdram_0_s1;
  wire             new_work_clock_2_out_read;
  wire             new_work_clock_2_out_read_data_valid_sdram_0_s1;
  wire             new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register;
  wire    [ 15: 0] new_work_clock_2_out_readdata;
  wire             new_work_clock_2_out_requests_sdram_0_s1;
  wire             new_work_clock_2_out_reset_n;
  wire             new_work_clock_2_out_waitrequest;
  wire             new_work_clock_2_out_write;
  wire    [ 15: 0] new_work_clock_2_out_writedata;
  wire    [ 22: 0] new_work_clock_3_in_address;
  wire    [  1: 0] new_work_clock_3_in_byteenable;
  wire             new_work_clock_3_in_endofpacket;
  wire             new_work_clock_3_in_endofpacket_from_sa;
  wire    [ 21: 0] new_work_clock_3_in_nativeaddress;
  wire             new_work_clock_3_in_read;
  wire    [ 15: 0] new_work_clock_3_in_readdata;
  wire    [ 15: 0] new_work_clock_3_in_readdata_from_sa;
  wire             new_work_clock_3_in_reset_n;
  wire             new_work_clock_3_in_waitrequest;
  wire             new_work_clock_3_in_waitrequest_from_sa;
  wire             new_work_clock_3_in_write;
  wire    [ 15: 0] new_work_clock_3_in_writedata;
  wire    [ 22: 0] new_work_clock_3_out_address;
  wire    [ 22: 0] new_work_clock_3_out_address_to_slave;
  wire    [  1: 0] new_work_clock_3_out_byteenable;
  wire             new_work_clock_3_out_endofpacket;
  wire             new_work_clock_3_out_granted_sdram_0_s1;
  wire    [ 21: 0] new_work_clock_3_out_nativeaddress;
  wire             new_work_clock_3_out_qualified_request_sdram_0_s1;
  wire             new_work_clock_3_out_read;
  wire             new_work_clock_3_out_read_data_valid_sdram_0_s1;
  wire             new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register;
  wire    [ 15: 0] new_work_clock_3_out_readdata;
  wire             new_work_clock_3_out_requests_sdram_0_s1;
  wire             new_work_clock_3_out_reset_n;
  wire             new_work_clock_3_out_waitrequest;
  wire             new_work_clock_3_out_write;
  wire    [ 15: 0] new_work_clock_3_out_writedata;
  wire    [  1: 0] new_work_clock_4_in_address;
  wire             new_work_clock_4_in_endofpacket;
  wire             new_work_clock_4_in_endofpacket_from_sa;
  wire    [  1: 0] new_work_clock_4_in_nativeaddress;
  wire             new_work_clock_4_in_read;
  wire    [  7: 0] new_work_clock_4_in_readdata;
  wire    [  7: 0] new_work_clock_4_in_readdata_from_sa;
  wire             new_work_clock_4_in_reset_n;
  wire             new_work_clock_4_in_waitrequest;
  wire             new_work_clock_4_in_waitrequest_from_sa;
  wire             new_work_clock_4_in_write;
  wire    [  7: 0] new_work_clock_4_in_writedata;
  wire    [  1: 0] new_work_clock_4_out_address;
  wire    [  1: 0] new_work_clock_4_out_address_to_slave;
  wire             new_work_clock_4_out_endofpacket;
  wire             new_work_clock_4_out_granted_pio_0_s1;
  wire    [  1: 0] new_work_clock_4_out_nativeaddress;
  wire             new_work_clock_4_out_qualified_request_pio_0_s1;
  wire             new_work_clock_4_out_read;
  wire             new_work_clock_4_out_read_data_valid_pio_0_s1;
  wire    [  7: 0] new_work_clock_4_out_readdata;
  wire             new_work_clock_4_out_requests_pio_0_s1;
  wire             new_work_clock_4_out_reset_n;
  wire             new_work_clock_4_out_waitrequest;
  wire             new_work_clock_4_out_write;
  wire    [  7: 0] new_work_clock_4_out_writedata;
  wire    [ 21: 0] new_work_clock_5_in_address;
  wire    [  1: 0] new_work_clock_5_in_byteenable;
  wire             new_work_clock_5_in_endofpacket;
  wire             new_work_clock_5_in_endofpacket_from_sa;
  wire    [ 20: 0] new_work_clock_5_in_nativeaddress;
  wire             new_work_clock_5_in_read;
  wire    [ 15: 0] new_work_clock_5_in_readdata;
  wire    [ 15: 0] new_work_clock_5_in_readdata_from_sa;
  wire             new_work_clock_5_in_reset_n;
  wire             new_work_clock_5_in_waitrequest;
  wire             new_work_clock_5_in_waitrequest_from_sa;
  wire             new_work_clock_5_in_write;
  wire    [ 15: 0] new_work_clock_5_in_writedata;
  wire    [ 21: 0] new_work_clock_5_out_address;
  wire    [ 21: 0] new_work_clock_5_out_address_to_slave;
  wire    [  1: 0] new_work_clock_5_out_byteenable;
  wire             new_work_clock_5_out_endofpacket;
  wire             new_work_clock_5_out_granted_cfi_flash_0_s1;
  wire    [ 20: 0] new_work_clock_5_out_nativeaddress;
  wire             new_work_clock_5_out_qualified_request_cfi_flash_0_s1;
  wire             new_work_clock_5_out_read;
  wire             new_work_clock_5_out_read_data_valid_cfi_flash_0_s1;
  wire    [ 15: 0] new_work_clock_5_out_readdata;
  wire             new_work_clock_5_out_requests_cfi_flash_0_s1;
  wire             new_work_clock_5_out_reset_n;
  wire             new_work_clock_5_out_waitrequest;
  wire             new_work_clock_5_out_write;
  wire    [ 15: 0] new_work_clock_5_out_writedata;
  wire    [ 21: 0] new_work_clock_6_in_address;
  wire    [  1: 0] new_work_clock_6_in_byteenable;
  wire             new_work_clock_6_in_endofpacket;
  wire             new_work_clock_6_in_endofpacket_from_sa;
  wire    [ 20: 0] new_work_clock_6_in_nativeaddress;
  wire             new_work_clock_6_in_read;
  wire    [ 15: 0] new_work_clock_6_in_readdata;
  wire    [ 15: 0] new_work_clock_6_in_readdata_from_sa;
  wire             new_work_clock_6_in_reset_n;
  wire             new_work_clock_6_in_waitrequest;
  wire             new_work_clock_6_in_waitrequest_from_sa;
  wire             new_work_clock_6_in_write;
  wire    [ 15: 0] new_work_clock_6_in_writedata;
  wire    [ 21: 0] new_work_clock_6_out_address;
  wire    [ 21: 0] new_work_clock_6_out_address_to_slave;
  wire    [  1: 0] new_work_clock_6_out_byteenable;
  wire             new_work_clock_6_out_endofpacket;
  wire             new_work_clock_6_out_granted_cfi_flash_0_s1;
  wire    [ 20: 0] new_work_clock_6_out_nativeaddress;
  wire             new_work_clock_6_out_qualified_request_cfi_flash_0_s1;
  wire             new_work_clock_6_out_read;
  wire             new_work_clock_6_out_read_data_valid_cfi_flash_0_s1;
  wire    [ 15: 0] new_work_clock_6_out_readdata;
  wire             new_work_clock_6_out_requests_cfi_flash_0_s1;
  wire             new_work_clock_6_out_reset_n;
  wire             new_work_clock_6_out_waitrequest;
  wire             new_work_clock_6_out_write;
  wire    [ 15: 0] new_work_clock_6_out_writedata;
  wire             out_clk_altpll_0_c0;
  wire    [  7: 0] out_port_from_the_pio_0;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_chipselect;
  wire    [  7: 0] pio_0_s1_readdata;
  wire    [  7: 0] pio_0_s1_readdata_from_sa;
  wire             pio_0_s1_reset_n;
  wire             pio_0_s1_write_n;
  wire    [  7: 0] pio_0_s1_writedata;
  wire             read_n_to_the_cfi_flash_0;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_0_s1_address;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid;
  wire             sdram_0_s1_reset_n;
  wire             sdram_0_s1_waitrequest;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire             select_n_to_the_cfi_flash_0;
  wire             sysid_0_control_slave_address;
  wire    [ 31: 0] sysid_0_control_slave_readdata;
  wire    [ 31: 0] sysid_0_control_slave_readdata_from_sa;
  wire             write_n_to_the_cfi_flash_0;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;
  altpll_0_pll_slave_arbitrator the_altpll_0_pll_slave
    (
      .altpll_0_pll_slave_address                                       (altpll_0_pll_slave_address),
      .altpll_0_pll_slave_read                                          (altpll_0_pll_slave_read),
      .altpll_0_pll_slave_readdata                                      (altpll_0_pll_slave_readdata),
      .altpll_0_pll_slave_readdata_from_sa                              (altpll_0_pll_slave_readdata_from_sa),
      .altpll_0_pll_slave_reset                                         (altpll_0_pll_slave_reset),
      .altpll_0_pll_slave_write                                         (altpll_0_pll_slave_write),
      .altpll_0_pll_slave_writedata                                     (altpll_0_pll_slave_writedata),
      .clk                                                              (clk_0),
      .cpu_0_data_master_address_to_slave                               (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_altpll_0_pll_slave                     (cpu_0_data_master_granted_altpll_0_pll_slave),
      .cpu_0_data_master_latency_counter                                (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_altpll_0_pll_slave           (cpu_0_data_master_qualified_request_altpll_0_pll_slave),
      .cpu_0_data_master_read                                           (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_altpll_0_pll_slave             (cpu_0_data_master_read_data_valid_altpll_0_pll_slave),
      .cpu_0_data_master_requests_altpll_0_pll_slave                    (cpu_0_data_master_requests_altpll_0_pll_slave),
      .cpu_0_data_master_write                                          (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                      (cpu_0_data_master_writedata),
      .d1_altpll_0_pll_slave_end_xfer                                   (d1_altpll_0_pll_slave_end_xfer),
      .new_work_burst_1_downstream_address_to_slave                     (new_work_burst_1_downstream_address_to_slave),
      .new_work_burst_1_downstream_arbitrationshare                     (new_work_burst_1_downstream_arbitrationshare),
      .new_work_burst_1_downstream_burstcount                           (new_work_burst_1_downstream_burstcount),
      .new_work_burst_1_downstream_granted_altpll_0_pll_slave           (new_work_burst_1_downstream_granted_altpll_0_pll_slave),
      .new_work_burst_1_downstream_latency_counter                      (new_work_burst_1_downstream_latency_counter),
      .new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave (new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave),
      .new_work_burst_1_downstream_read                                 (new_work_burst_1_downstream_read),
      .new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave   (new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave),
      .new_work_burst_1_downstream_requests_altpll_0_pll_slave          (new_work_burst_1_downstream_requests_altpll_0_pll_slave),
      .new_work_burst_1_downstream_write                                (new_work_burst_1_downstream_write),
      .new_work_burst_1_downstream_writedata                            (new_work_burst_1_downstream_writedata),
      .reset_n                                                          (clk_0_reset_n)
    );

  //altpll_0_c0_out out_clk assignment, which is an e_assign
  assign altpll_0_c0_out = out_clk_altpll_0_c0;

  altpll_0 the_altpll_0
    (
      .address   (altpll_0_pll_slave_address),
      .c0        (out_clk_altpll_0_c0),
      .clk       (clk_0),
      .locked    (locked_from_the_altpll_0),
      .read      (altpll_0_pll_slave_read),
      .readdata  (altpll_0_pll_slave_readdata),
      .reset     (altpll_0_pll_slave_reset),
      .write     (altpll_0_pll_slave_write),
      .writedata (altpll_0_pll_slave_writedata)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                   (clk_0),
      .cpu_0_data_master_address_to_slave                                    (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                          (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                         (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                     (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_latency_counter                                     (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module           (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                                (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module             (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                    (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_write                                               (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                           (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_address                                       (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                                 (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                    (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                    (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                   (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                      (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                              (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset                                         (cpu_0_jtag_debug_module_reset),
      .cpu_0_jtag_debug_module_reset_n                                       (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                                  (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                          (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                         (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                     (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                   (d1_cpu_0_jtag_debug_module_end_xfer),
      .new_work_burst_0_downstream_address_to_slave                          (new_work_burst_0_downstream_address_to_slave),
      .new_work_burst_0_downstream_arbitrationshare                          (new_work_burst_0_downstream_arbitrationshare),
      .new_work_burst_0_downstream_burstcount                                (new_work_burst_0_downstream_burstcount),
      .new_work_burst_0_downstream_byteenable                                (new_work_burst_0_downstream_byteenable),
      .new_work_burst_0_downstream_debugaccess                               (new_work_burst_0_downstream_debugaccess),
      .new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module           (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_latency_counter                           (new_work_burst_0_downstream_latency_counter),
      .new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module (new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_read                                      (new_work_burst_0_downstream_read),
      .new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module   (new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module          (new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_write                                     (new_work_burst_0_downstream_write),
      .new_work_burst_0_downstream_writedata                                 (new_work_burst_0_downstream_writedata),
      .reset_n                                                               (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .altpll_0_pll_slave_readdata_from_sa                         (altpll_0_pll_slave_readdata_from_sa),
      .clk                                                         (clk_0),
      .clk_0                                                       (clk_0),
      .clk_0_reset_n                                               (clk_0_reset_n),
      .cpu_0_data_master_address                                   (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_new_work_clock_3_in            (cpu_0_data_master_byteenable_new_work_clock_3_in),
      .cpu_0_data_master_byteenable_new_work_clock_6_in            (cpu_0_data_master_byteenable_new_work_clock_6_in),
      .cpu_0_data_master_dbs_address                               (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                              (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_altpll_0_pll_slave                (cpu_0_data_master_granted_altpll_0_pll_slave),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module           (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_new_work_clock_0_in               (cpu_0_data_master_granted_new_work_clock_0_in),
      .cpu_0_data_master_granted_new_work_clock_1_in               (cpu_0_data_master_granted_new_work_clock_1_in),
      .cpu_0_data_master_granted_new_work_clock_3_in               (cpu_0_data_master_granted_new_work_clock_3_in),
      .cpu_0_data_master_granted_new_work_clock_4_in               (cpu_0_data_master_granted_new_work_clock_4_in),
      .cpu_0_data_master_granted_new_work_clock_6_in               (cpu_0_data_master_granted_new_work_clock_6_in),
      .cpu_0_data_master_irq                                       (cpu_0_data_master_irq),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_altpll_0_pll_slave      (cpu_0_data_master_qualified_request_altpll_0_pll_slave),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_new_work_clock_0_in     (cpu_0_data_master_qualified_request_new_work_clock_0_in),
      .cpu_0_data_master_qualified_request_new_work_clock_1_in     (cpu_0_data_master_qualified_request_new_work_clock_1_in),
      .cpu_0_data_master_qualified_request_new_work_clock_3_in     (cpu_0_data_master_qualified_request_new_work_clock_3_in),
      .cpu_0_data_master_qualified_request_new_work_clock_4_in     (cpu_0_data_master_qualified_request_new_work_clock_4_in),
      .cpu_0_data_master_qualified_request_new_work_clock_6_in     (cpu_0_data_master_qualified_request_new_work_clock_6_in),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_altpll_0_pll_slave        (cpu_0_data_master_read_data_valid_altpll_0_pll_slave),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_new_work_clock_0_in       (cpu_0_data_master_read_data_valid_new_work_clock_0_in),
      .cpu_0_data_master_read_data_valid_new_work_clock_1_in       (cpu_0_data_master_read_data_valid_new_work_clock_1_in),
      .cpu_0_data_master_read_data_valid_new_work_clock_3_in       (cpu_0_data_master_read_data_valid_new_work_clock_3_in),
      .cpu_0_data_master_read_data_valid_new_work_clock_4_in       (cpu_0_data_master_read_data_valid_new_work_clock_4_in),
      .cpu_0_data_master_read_data_valid_new_work_clock_6_in       (cpu_0_data_master_read_data_valid_new_work_clock_6_in),
      .cpu_0_data_master_readdata                                  (cpu_0_data_master_readdata),
      .cpu_0_data_master_readdatavalid                             (cpu_0_data_master_readdatavalid),
      .cpu_0_data_master_requests_altpll_0_pll_slave               (cpu_0_data_master_requests_altpll_0_pll_slave),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module          (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_new_work_clock_0_in              (cpu_0_data_master_requests_new_work_clock_0_in),
      .cpu_0_data_master_requests_new_work_clock_1_in              (cpu_0_data_master_requests_new_work_clock_1_in),
      .cpu_0_data_master_requests_new_work_clock_3_in              (cpu_0_data_master_requests_new_work_clock_3_in),
      .cpu_0_data_master_requests_new_work_clock_4_in              (cpu_0_data_master_requests_new_work_clock_4_in),
      .cpu_0_data_master_requests_new_work_clock_6_in              (cpu_0_data_master_requests_new_work_clock_6_in),
      .cpu_0_data_master_waitrequest                               (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                    (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_altpll_0_pll_slave_end_xfer                              (d1_altpll_0_pll_slave_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                         (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_new_work_clock_0_in_end_xfer                             (d1_new_work_clock_0_in_end_xfer),
      .d1_new_work_clock_1_in_end_xfer                             (d1_new_work_clock_1_in_end_xfer),
      .d1_new_work_clock_3_in_end_xfer                             (d1_new_work_clock_3_in_end_xfer),
      .d1_new_work_clock_4_in_end_xfer                             (d1_new_work_clock_4_in_end_xfer),
      .d1_new_work_clock_6_in_end_xfer                             (d1_new_work_clock_6_in_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                   (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .new_work_clock_0_in_readdata_from_sa                        (new_work_clock_0_in_readdata_from_sa),
      .new_work_clock_0_in_waitrequest_from_sa                     (new_work_clock_0_in_waitrequest_from_sa),
      .new_work_clock_1_in_readdata_from_sa                        (new_work_clock_1_in_readdata_from_sa),
      .new_work_clock_1_in_waitrequest_from_sa                     (new_work_clock_1_in_waitrequest_from_sa),
      .new_work_clock_3_in_readdata_from_sa                        (new_work_clock_3_in_readdata_from_sa),
      .new_work_clock_3_in_waitrequest_from_sa                     (new_work_clock_3_in_waitrequest_from_sa),
      .new_work_clock_4_in_readdata_from_sa                        (new_work_clock_4_in_readdata_from_sa),
      .new_work_clock_4_in_waitrequest_from_sa                     (new_work_clock_4_in_waitrequest_from_sa),
      .new_work_clock_6_in_readdata_from_sa                        (new_work_clock_6_in_readdata_from_sa),
      .new_work_clock_6_in_waitrequest_from_sa                     (new_work_clock_6_in_waitrequest_from_sa),
      .reset_n                                                     (clk_0_reset_n)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                               (clk_0),
      .cpu_0_instruction_master_address                                                  (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                                         (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_burstcount                                               (cpu_0_instruction_master_burstcount),
      .cpu_0_instruction_master_dbs_address                                              (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_new_work_burst_0_upstream                        (cpu_0_instruction_master_granted_new_work_burst_0_upstream),
      .cpu_0_instruction_master_granted_new_work_burst_1_upstream                        (cpu_0_instruction_master_granted_new_work_burst_1_upstream),
      .cpu_0_instruction_master_granted_new_work_burst_2_upstream                        (cpu_0_instruction_master_granted_new_work_burst_2_upstream),
      .cpu_0_instruction_master_granted_new_work_burst_3_upstream                        (cpu_0_instruction_master_granted_new_work_burst_3_upstream),
      .cpu_0_instruction_master_latency_counter                                          (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream),
      .cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream),
      .cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream),
      .cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream),
      .cpu_0_instruction_master_read                                                     (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register),
      .cpu_0_instruction_master_readdata                                                 (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                                            (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_new_work_burst_0_upstream                       (cpu_0_instruction_master_requests_new_work_burst_0_upstream),
      .cpu_0_instruction_master_requests_new_work_burst_1_upstream                       (cpu_0_instruction_master_requests_new_work_burst_1_upstream),
      .cpu_0_instruction_master_requests_new_work_burst_2_upstream                       (cpu_0_instruction_master_requests_new_work_burst_2_upstream),
      .cpu_0_instruction_master_requests_new_work_burst_3_upstream                       (cpu_0_instruction_master_requests_new_work_burst_3_upstream),
      .cpu_0_instruction_master_waitrequest                                              (cpu_0_instruction_master_waitrequest),
      .d1_new_work_burst_0_upstream_end_xfer                                             (d1_new_work_burst_0_upstream_end_xfer),
      .d1_new_work_burst_1_upstream_end_xfer                                             (d1_new_work_burst_1_upstream_end_xfer),
      .d1_new_work_burst_2_upstream_end_xfer                                             (d1_new_work_burst_2_upstream_end_xfer),
      .d1_new_work_burst_3_upstream_end_xfer                                             (d1_new_work_burst_3_upstream_end_xfer),
      .new_work_burst_0_upstream_readdata_from_sa                                        (new_work_burst_0_upstream_readdata_from_sa),
      .new_work_burst_0_upstream_waitrequest_from_sa                                     (new_work_burst_0_upstream_waitrequest_from_sa),
      .new_work_burst_1_upstream_readdata_from_sa                                        (new_work_burst_1_upstream_readdata_from_sa),
      .new_work_burst_1_upstream_waitrequest_from_sa                                     (new_work_burst_1_upstream_waitrequest_from_sa),
      .new_work_burst_2_upstream_readdata_from_sa                                        (new_work_burst_2_upstream_readdata_from_sa),
      .new_work_burst_2_upstream_waitrequest_from_sa                                     (new_work_burst_2_upstream_waitrequest_from_sa),
      .new_work_burst_3_upstream_readdata_from_sa                                        (new_work_burst_3_upstream_readdata_from_sa),
      .new_work_burst_3_upstream_waitrequest_from_sa                                     (new_work_burst_3_upstream_waitrequest_from_sa),
      .reset_n                                                                           (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .cpu_resetrequest                      (cpu_resetrequest_to_the_cpu_0),
      .cpu_resettaken                        (cpu_resettaken_from_the_cpu_0),
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
      .i_burstcount                          (cpu_0_instruction_master_burstcount),
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

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                                  (altpll_0_c0_out),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                            (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                                (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                             (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                          (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa                  (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                    (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                            (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                                 (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                               (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                       (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                           (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                   (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                                (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                            (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                    (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                                (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                              (jtag_uart_0_avalon_jtag_slave_writedata),
      .new_work_clock_1_out_address_to_slave                                (new_work_clock_1_out_address_to_slave),
      .new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave           (new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_nativeaddress                                   (new_work_clock_1_out_nativeaddress),
      .new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave (new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_read                                            (new_work_clock_1_out_read),
      .new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave   (new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave          (new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_write                                           (new_work_clock_1_out_write),
      .new_work_clock_1_out_writedata                                       (new_work_clock_1_out_writedata),
      .reset_n                                                              (altpll_0_c0_out_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (altpll_0_c0_out),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  new_work_burst_0_upstream_arbitrator the_new_work_burst_0_upstream
    (
      .clk                                                                               (clk_0),
      .cpu_0_instruction_master_address_to_slave                                         (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_burstcount                                               (cpu_0_instruction_master_burstcount),
      .cpu_0_instruction_master_granted_new_work_burst_0_upstream                        (cpu_0_instruction_master_granted_new_work_burst_0_upstream),
      .cpu_0_instruction_master_latency_counter                                          (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_0_upstream),
      .cpu_0_instruction_master_read                                                     (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register),
      .cpu_0_instruction_master_requests_new_work_burst_0_upstream                       (cpu_0_instruction_master_requests_new_work_burst_0_upstream),
      .d1_new_work_burst_0_upstream_end_xfer                                             (d1_new_work_burst_0_upstream_end_xfer),
      .new_work_burst_0_upstream_address                                                 (new_work_burst_0_upstream_address),
      .new_work_burst_0_upstream_byteaddress                                             (new_work_burst_0_upstream_byteaddress),
      .new_work_burst_0_upstream_byteenable                                              (new_work_burst_0_upstream_byteenable),
      .new_work_burst_0_upstream_debugaccess                                             (new_work_burst_0_upstream_debugaccess),
      .new_work_burst_0_upstream_read                                                    (new_work_burst_0_upstream_read),
      .new_work_burst_0_upstream_readdata                                                (new_work_burst_0_upstream_readdata),
      .new_work_burst_0_upstream_readdata_from_sa                                        (new_work_burst_0_upstream_readdata_from_sa),
      .new_work_burst_0_upstream_readdatavalid                                           (new_work_burst_0_upstream_readdatavalid),
      .new_work_burst_0_upstream_waitrequest                                             (new_work_burst_0_upstream_waitrequest),
      .new_work_burst_0_upstream_waitrequest_from_sa                                     (new_work_burst_0_upstream_waitrequest_from_sa),
      .new_work_burst_0_upstream_write                                                   (new_work_burst_0_upstream_write),
      .reset_n                                                                           (clk_0_reset_n)
    );

  new_work_burst_0_downstream_arbitrator the_new_work_burst_0_downstream
    (
      .clk                                                                   (clk_0),
      .cpu_0_jtag_debug_module_readdata_from_sa                              (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                   (d1_cpu_0_jtag_debug_module_end_xfer),
      .new_work_burst_0_downstream_address                                   (new_work_burst_0_downstream_address),
      .new_work_burst_0_downstream_address_to_slave                          (new_work_burst_0_downstream_address_to_slave),
      .new_work_burst_0_downstream_burstcount                                (new_work_burst_0_downstream_burstcount),
      .new_work_burst_0_downstream_byteenable                                (new_work_burst_0_downstream_byteenable),
      .new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module           (new_work_burst_0_downstream_granted_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_latency_counter                           (new_work_burst_0_downstream_latency_counter),
      .new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module (new_work_burst_0_downstream_qualified_request_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_read                                      (new_work_burst_0_downstream_read),
      .new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module   (new_work_burst_0_downstream_read_data_valid_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_readdata                                  (new_work_burst_0_downstream_readdata),
      .new_work_burst_0_downstream_readdatavalid                             (new_work_burst_0_downstream_readdatavalid),
      .new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module          (new_work_burst_0_downstream_requests_cpu_0_jtag_debug_module),
      .new_work_burst_0_downstream_reset_n                                   (new_work_burst_0_downstream_reset_n),
      .new_work_burst_0_downstream_waitrequest                               (new_work_burst_0_downstream_waitrequest),
      .new_work_burst_0_downstream_write                                     (new_work_burst_0_downstream_write),
      .new_work_burst_0_downstream_writedata                                 (new_work_burst_0_downstream_writedata),
      .reset_n                                                               (clk_0_reset_n)
    );

  new_work_burst_0 the_new_work_burst_0
    (
      .clk                             (clk_0),
      .downstream_readdata             (new_work_burst_0_downstream_readdata),
      .downstream_readdatavalid        (new_work_burst_0_downstream_readdatavalid),
      .downstream_waitrequest          (new_work_burst_0_downstream_waitrequest),
      .reg_downstream_address          (new_work_burst_0_downstream_address),
      .reg_downstream_arbitrationshare (new_work_burst_0_downstream_arbitrationshare),
      .reg_downstream_burstcount       (new_work_burst_0_downstream_burstcount),
      .reg_downstream_byteenable       (new_work_burst_0_downstream_byteenable),
      .reg_downstream_debugaccess      (new_work_burst_0_downstream_debugaccess),
      .reg_downstream_nativeaddress    (new_work_burst_0_downstream_nativeaddress),
      .reg_downstream_read             (new_work_burst_0_downstream_read),
      .reg_downstream_write            (new_work_burst_0_downstream_write),
      .reg_downstream_writedata        (new_work_burst_0_downstream_writedata),
      .reset_n                         (new_work_burst_0_downstream_reset_n),
      .upstream_address                (new_work_burst_0_upstream_byteaddress),
      .upstream_byteenable             (new_work_burst_0_upstream_byteenable),
      .upstream_debugaccess            (new_work_burst_0_upstream_debugaccess),
      .upstream_nativeaddress          (new_work_burst_0_upstream_address),
      .upstream_read                   (new_work_burst_0_upstream_read),
      .upstream_readdata               (new_work_burst_0_upstream_readdata),
      .upstream_readdatavalid          (new_work_burst_0_upstream_readdatavalid),
      .upstream_waitrequest            (new_work_burst_0_upstream_waitrequest),
      .upstream_write                  (new_work_burst_0_upstream_write),
      .upstream_writedata              (new_work_burst_0_upstream_writedata)
    );

  new_work_burst_1_upstream_arbitrator the_new_work_burst_1_upstream
    (
      .clk                                                                               (clk_0),
      .cpu_0_instruction_master_address_to_slave                                         (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_burstcount                                               (cpu_0_instruction_master_burstcount),
      .cpu_0_instruction_master_granted_new_work_burst_1_upstream                        (cpu_0_instruction_master_granted_new_work_burst_1_upstream),
      .cpu_0_instruction_master_latency_counter                                          (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_1_upstream),
      .cpu_0_instruction_master_read                                                     (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register),
      .cpu_0_instruction_master_requests_new_work_burst_1_upstream                       (cpu_0_instruction_master_requests_new_work_burst_1_upstream),
      .d1_new_work_burst_1_upstream_end_xfer                                             (d1_new_work_burst_1_upstream_end_xfer),
      .new_work_burst_1_upstream_address                                                 (new_work_burst_1_upstream_address),
      .new_work_burst_1_upstream_byteaddress                                             (new_work_burst_1_upstream_byteaddress),
      .new_work_burst_1_upstream_byteenable                                              (new_work_burst_1_upstream_byteenable),
      .new_work_burst_1_upstream_debugaccess                                             (new_work_burst_1_upstream_debugaccess),
      .new_work_burst_1_upstream_read                                                    (new_work_burst_1_upstream_read),
      .new_work_burst_1_upstream_readdata                                                (new_work_burst_1_upstream_readdata),
      .new_work_burst_1_upstream_readdata_from_sa                                        (new_work_burst_1_upstream_readdata_from_sa),
      .new_work_burst_1_upstream_readdatavalid                                           (new_work_burst_1_upstream_readdatavalid),
      .new_work_burst_1_upstream_waitrequest                                             (new_work_burst_1_upstream_waitrequest),
      .new_work_burst_1_upstream_waitrequest_from_sa                                     (new_work_burst_1_upstream_waitrequest_from_sa),
      .new_work_burst_1_upstream_write                                                   (new_work_burst_1_upstream_write),
      .reset_n                                                                           (clk_0_reset_n)
    );

  new_work_burst_1_downstream_arbitrator the_new_work_burst_1_downstream
    (
      .altpll_0_pll_slave_readdata_from_sa                              (altpll_0_pll_slave_readdata_from_sa),
      .clk                                                              (clk_0),
      .d1_altpll_0_pll_slave_end_xfer                                   (d1_altpll_0_pll_slave_end_xfer),
      .new_work_burst_1_downstream_address                              (new_work_burst_1_downstream_address),
      .new_work_burst_1_downstream_address_to_slave                     (new_work_burst_1_downstream_address_to_slave),
      .new_work_burst_1_downstream_burstcount                           (new_work_burst_1_downstream_burstcount),
      .new_work_burst_1_downstream_byteenable                           (new_work_burst_1_downstream_byteenable),
      .new_work_burst_1_downstream_granted_altpll_0_pll_slave           (new_work_burst_1_downstream_granted_altpll_0_pll_slave),
      .new_work_burst_1_downstream_latency_counter                      (new_work_burst_1_downstream_latency_counter),
      .new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave (new_work_burst_1_downstream_qualified_request_altpll_0_pll_slave),
      .new_work_burst_1_downstream_read                                 (new_work_burst_1_downstream_read),
      .new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave   (new_work_burst_1_downstream_read_data_valid_altpll_0_pll_slave),
      .new_work_burst_1_downstream_readdata                             (new_work_burst_1_downstream_readdata),
      .new_work_burst_1_downstream_readdatavalid                        (new_work_burst_1_downstream_readdatavalid),
      .new_work_burst_1_downstream_requests_altpll_0_pll_slave          (new_work_burst_1_downstream_requests_altpll_0_pll_slave),
      .new_work_burst_1_downstream_reset_n                              (new_work_burst_1_downstream_reset_n),
      .new_work_burst_1_downstream_waitrequest                          (new_work_burst_1_downstream_waitrequest),
      .new_work_burst_1_downstream_write                                (new_work_burst_1_downstream_write),
      .new_work_burst_1_downstream_writedata                            (new_work_burst_1_downstream_writedata),
      .reset_n                                                          (clk_0_reset_n)
    );

  new_work_burst_1 the_new_work_burst_1
    (
      .clk                             (clk_0),
      .downstream_readdata             (new_work_burst_1_downstream_readdata),
      .downstream_readdatavalid        (new_work_burst_1_downstream_readdatavalid),
      .downstream_waitrequest          (new_work_burst_1_downstream_waitrequest),
      .reg_downstream_address          (new_work_burst_1_downstream_address),
      .reg_downstream_arbitrationshare (new_work_burst_1_downstream_arbitrationshare),
      .reg_downstream_burstcount       (new_work_burst_1_downstream_burstcount),
      .reg_downstream_byteenable       (new_work_burst_1_downstream_byteenable),
      .reg_downstream_debugaccess      (new_work_burst_1_downstream_debugaccess),
      .reg_downstream_nativeaddress    (new_work_burst_1_downstream_nativeaddress),
      .reg_downstream_read             (new_work_burst_1_downstream_read),
      .reg_downstream_write            (new_work_burst_1_downstream_write),
      .reg_downstream_writedata        (new_work_burst_1_downstream_writedata),
      .reset_n                         (new_work_burst_1_downstream_reset_n),
      .upstream_address                (new_work_burst_1_upstream_byteaddress),
      .upstream_byteenable             (new_work_burst_1_upstream_byteenable),
      .upstream_debugaccess            (new_work_burst_1_upstream_debugaccess),
      .upstream_nativeaddress          (new_work_burst_1_upstream_address),
      .upstream_read                   (new_work_burst_1_upstream_read),
      .upstream_readdata               (new_work_burst_1_upstream_readdata),
      .upstream_readdatavalid          (new_work_burst_1_upstream_readdatavalid),
      .upstream_waitrequest            (new_work_burst_1_upstream_waitrequest),
      .upstream_write                  (new_work_burst_1_upstream_write),
      .upstream_writedata              (new_work_burst_1_upstream_writedata)
    );

  new_work_burst_2_upstream_arbitrator the_new_work_burst_2_upstream
    (
      .clk                                                                               (clk_0),
      .cpu_0_instruction_master_address_to_slave                                         (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_burstcount                                               (cpu_0_instruction_master_burstcount),
      .cpu_0_instruction_master_dbs_address                                              (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_new_work_burst_2_upstream                        (cpu_0_instruction_master_granted_new_work_burst_2_upstream),
      .cpu_0_instruction_master_latency_counter                                          (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_2_upstream),
      .cpu_0_instruction_master_read                                                     (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register),
      .cpu_0_instruction_master_requests_new_work_burst_2_upstream                       (cpu_0_instruction_master_requests_new_work_burst_2_upstream),
      .d1_new_work_burst_2_upstream_end_xfer                                             (d1_new_work_burst_2_upstream_end_xfer),
      .new_work_burst_2_upstream_address                                                 (new_work_burst_2_upstream_address),
      .new_work_burst_2_upstream_byteaddress                                             (new_work_burst_2_upstream_byteaddress),
      .new_work_burst_2_upstream_byteenable                                              (new_work_burst_2_upstream_byteenable),
      .new_work_burst_2_upstream_debugaccess                                             (new_work_burst_2_upstream_debugaccess),
      .new_work_burst_2_upstream_read                                                    (new_work_burst_2_upstream_read),
      .new_work_burst_2_upstream_readdata                                                (new_work_burst_2_upstream_readdata),
      .new_work_burst_2_upstream_readdata_from_sa                                        (new_work_burst_2_upstream_readdata_from_sa),
      .new_work_burst_2_upstream_readdatavalid                                           (new_work_burst_2_upstream_readdatavalid),
      .new_work_burst_2_upstream_waitrequest                                             (new_work_burst_2_upstream_waitrequest),
      .new_work_burst_2_upstream_waitrequest_from_sa                                     (new_work_burst_2_upstream_waitrequest_from_sa),
      .new_work_burst_2_upstream_write                                                   (new_work_burst_2_upstream_write),
      .reset_n                                                                           (clk_0_reset_n)
    );

  new_work_burst_2_downstream_arbitrator the_new_work_burst_2_downstream
    (
      .clk                                                               (clk_0),
      .d1_new_work_clock_2_in_end_xfer                                   (d1_new_work_clock_2_in_end_xfer),
      .new_work_burst_2_downstream_address                               (new_work_burst_2_downstream_address),
      .new_work_burst_2_downstream_address_to_slave                      (new_work_burst_2_downstream_address_to_slave),
      .new_work_burst_2_downstream_burstcount                            (new_work_burst_2_downstream_burstcount),
      .new_work_burst_2_downstream_byteenable                            (new_work_burst_2_downstream_byteenable),
      .new_work_burst_2_downstream_granted_new_work_clock_2_in           (new_work_burst_2_downstream_granted_new_work_clock_2_in),
      .new_work_burst_2_downstream_latency_counter                       (new_work_burst_2_downstream_latency_counter),
      .new_work_burst_2_downstream_qualified_request_new_work_clock_2_in (new_work_burst_2_downstream_qualified_request_new_work_clock_2_in),
      .new_work_burst_2_downstream_read                                  (new_work_burst_2_downstream_read),
      .new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in   (new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in),
      .new_work_burst_2_downstream_readdata                              (new_work_burst_2_downstream_readdata),
      .new_work_burst_2_downstream_readdatavalid                         (new_work_burst_2_downstream_readdatavalid),
      .new_work_burst_2_downstream_requests_new_work_clock_2_in          (new_work_burst_2_downstream_requests_new_work_clock_2_in),
      .new_work_burst_2_downstream_reset_n                               (new_work_burst_2_downstream_reset_n),
      .new_work_burst_2_downstream_waitrequest                           (new_work_burst_2_downstream_waitrequest),
      .new_work_burst_2_downstream_write                                 (new_work_burst_2_downstream_write),
      .new_work_burst_2_downstream_writedata                             (new_work_burst_2_downstream_writedata),
      .new_work_clock_2_in_readdata_from_sa                              (new_work_clock_2_in_readdata_from_sa),
      .new_work_clock_2_in_waitrequest_from_sa                           (new_work_clock_2_in_waitrequest_from_sa),
      .reset_n                                                           (clk_0_reset_n)
    );

  new_work_burst_2 the_new_work_burst_2
    (
      .clk                             (clk_0),
      .downstream_readdata             (new_work_burst_2_downstream_readdata),
      .downstream_readdatavalid        (new_work_burst_2_downstream_readdatavalid),
      .downstream_waitrequest          (new_work_burst_2_downstream_waitrequest),
      .reg_downstream_address          (new_work_burst_2_downstream_address),
      .reg_downstream_arbitrationshare (new_work_burst_2_downstream_arbitrationshare),
      .reg_downstream_burstcount       (new_work_burst_2_downstream_burstcount),
      .reg_downstream_byteenable       (new_work_burst_2_downstream_byteenable),
      .reg_downstream_debugaccess      (new_work_burst_2_downstream_debugaccess),
      .reg_downstream_nativeaddress    (new_work_burst_2_downstream_nativeaddress),
      .reg_downstream_read             (new_work_burst_2_downstream_read),
      .reg_downstream_write            (new_work_burst_2_downstream_write),
      .reg_downstream_writedata        (new_work_burst_2_downstream_writedata),
      .reset_n                         (new_work_burst_2_downstream_reset_n),
      .upstream_address                (new_work_burst_2_upstream_byteaddress),
      .upstream_byteenable             (new_work_burst_2_upstream_byteenable),
      .upstream_debugaccess            (new_work_burst_2_upstream_debugaccess),
      .upstream_nativeaddress          (new_work_burst_2_upstream_address),
      .upstream_read                   (new_work_burst_2_upstream_read),
      .upstream_readdata               (new_work_burst_2_upstream_readdata),
      .upstream_readdatavalid          (new_work_burst_2_upstream_readdatavalid),
      .upstream_waitrequest            (new_work_burst_2_upstream_waitrequest),
      .upstream_write                  (new_work_burst_2_upstream_write),
      .upstream_writedata              (new_work_burst_2_upstream_writedata)
    );

  new_work_burst_3_upstream_arbitrator the_new_work_burst_3_upstream
    (
      .clk                                                                               (clk_0),
      .cpu_0_instruction_master_address_to_slave                                         (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_burstcount                                               (cpu_0_instruction_master_burstcount),
      .cpu_0_instruction_master_dbs_address                                              (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_new_work_burst_3_upstream                        (cpu_0_instruction_master_granted_new_work_burst_3_upstream),
      .cpu_0_instruction_master_latency_counter                                          (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream              (cpu_0_instruction_master_qualified_request_new_work_burst_3_upstream),
      .cpu_0_instruction_master_read                                                     (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_0_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_1_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_2_upstream_shift_register),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream                (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream),
      .cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register (cpu_0_instruction_master_read_data_valid_new_work_burst_3_upstream_shift_register),
      .cpu_0_instruction_master_requests_new_work_burst_3_upstream                       (cpu_0_instruction_master_requests_new_work_burst_3_upstream),
      .d1_new_work_burst_3_upstream_end_xfer                                             (d1_new_work_burst_3_upstream_end_xfer),
      .new_work_burst_3_upstream_address                                                 (new_work_burst_3_upstream_address),
      .new_work_burst_3_upstream_byteaddress                                             (new_work_burst_3_upstream_byteaddress),
      .new_work_burst_3_upstream_byteenable                                              (new_work_burst_3_upstream_byteenable),
      .new_work_burst_3_upstream_debugaccess                                             (new_work_burst_3_upstream_debugaccess),
      .new_work_burst_3_upstream_read                                                    (new_work_burst_3_upstream_read),
      .new_work_burst_3_upstream_readdata                                                (new_work_burst_3_upstream_readdata),
      .new_work_burst_3_upstream_readdata_from_sa                                        (new_work_burst_3_upstream_readdata_from_sa),
      .new_work_burst_3_upstream_readdatavalid                                           (new_work_burst_3_upstream_readdatavalid),
      .new_work_burst_3_upstream_waitrequest                                             (new_work_burst_3_upstream_waitrequest),
      .new_work_burst_3_upstream_waitrequest_from_sa                                     (new_work_burst_3_upstream_waitrequest_from_sa),
      .new_work_burst_3_upstream_write                                                   (new_work_burst_3_upstream_write),
      .reset_n                                                                           (clk_0_reset_n)
    );

  new_work_burst_3_downstream_arbitrator the_new_work_burst_3_downstream
    (
      .clk                                                               (clk_0),
      .d1_new_work_clock_5_in_end_xfer                                   (d1_new_work_clock_5_in_end_xfer),
      .new_work_burst_3_downstream_address                               (new_work_burst_3_downstream_address),
      .new_work_burst_3_downstream_address_to_slave                      (new_work_burst_3_downstream_address_to_slave),
      .new_work_burst_3_downstream_burstcount                            (new_work_burst_3_downstream_burstcount),
      .new_work_burst_3_downstream_byteenable                            (new_work_burst_3_downstream_byteenable),
      .new_work_burst_3_downstream_granted_new_work_clock_5_in           (new_work_burst_3_downstream_granted_new_work_clock_5_in),
      .new_work_burst_3_downstream_latency_counter                       (new_work_burst_3_downstream_latency_counter),
      .new_work_burst_3_downstream_qualified_request_new_work_clock_5_in (new_work_burst_3_downstream_qualified_request_new_work_clock_5_in),
      .new_work_burst_3_downstream_read                                  (new_work_burst_3_downstream_read),
      .new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in   (new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in),
      .new_work_burst_3_downstream_readdata                              (new_work_burst_3_downstream_readdata),
      .new_work_burst_3_downstream_readdatavalid                         (new_work_burst_3_downstream_readdatavalid),
      .new_work_burst_3_downstream_requests_new_work_clock_5_in          (new_work_burst_3_downstream_requests_new_work_clock_5_in),
      .new_work_burst_3_downstream_reset_n                               (new_work_burst_3_downstream_reset_n),
      .new_work_burst_3_downstream_waitrequest                           (new_work_burst_3_downstream_waitrequest),
      .new_work_burst_3_downstream_write                                 (new_work_burst_3_downstream_write),
      .new_work_burst_3_downstream_writedata                             (new_work_burst_3_downstream_writedata),
      .new_work_clock_5_in_readdata_from_sa                              (new_work_clock_5_in_readdata_from_sa),
      .new_work_clock_5_in_waitrequest_from_sa                           (new_work_clock_5_in_waitrequest_from_sa),
      .reset_n                                                           (clk_0_reset_n)
    );

  new_work_burst_3 the_new_work_burst_3
    (
      .clk                             (clk_0),
      .downstream_readdata             (new_work_burst_3_downstream_readdata),
      .downstream_readdatavalid        (new_work_burst_3_downstream_readdatavalid),
      .downstream_waitrequest          (new_work_burst_3_downstream_waitrequest),
      .reg_downstream_address          (new_work_burst_3_downstream_address),
      .reg_downstream_arbitrationshare (new_work_burst_3_downstream_arbitrationshare),
      .reg_downstream_burstcount       (new_work_burst_3_downstream_burstcount),
      .reg_downstream_byteenable       (new_work_burst_3_downstream_byteenable),
      .reg_downstream_debugaccess      (new_work_burst_3_downstream_debugaccess),
      .reg_downstream_nativeaddress    (new_work_burst_3_downstream_nativeaddress),
      .reg_downstream_read             (new_work_burst_3_downstream_read),
      .reg_downstream_write            (new_work_burst_3_downstream_write),
      .reg_downstream_writedata        (new_work_burst_3_downstream_writedata),
      .reset_n                         (new_work_burst_3_downstream_reset_n),
      .upstream_address                (new_work_burst_3_upstream_byteaddress),
      .upstream_byteenable             (new_work_burst_3_upstream_byteenable),
      .upstream_debugaccess            (new_work_burst_3_upstream_debugaccess),
      .upstream_nativeaddress          (new_work_burst_3_upstream_address),
      .upstream_read                   (new_work_burst_3_upstream_read),
      .upstream_readdata               (new_work_burst_3_upstream_readdata),
      .upstream_readdatavalid          (new_work_burst_3_upstream_readdatavalid),
      .upstream_waitrequest            (new_work_burst_3_upstream_waitrequest),
      .upstream_write                  (new_work_burst_3_upstream_write),
      .upstream_writedata              (new_work_burst_3_upstream_writedata)
    );

  new_work_clock_0_in_arbitrator the_new_work_clock_0_in
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                            (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_new_work_clock_0_in           (cpu_0_data_master_granted_new_work_clock_0_in),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_new_work_clock_0_in (cpu_0_data_master_qualified_request_new_work_clock_0_in),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_new_work_clock_0_in   (cpu_0_data_master_read_data_valid_new_work_clock_0_in),
      .cpu_0_data_master_requests_new_work_clock_0_in          (cpu_0_data_master_requests_new_work_clock_0_in),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                             (cpu_0_data_master_writedata),
      .d1_new_work_clock_0_in_end_xfer                         (d1_new_work_clock_0_in_end_xfer),
      .new_work_clock_0_in_address                             (new_work_clock_0_in_address),
      .new_work_clock_0_in_byteenable                          (new_work_clock_0_in_byteenable),
      .new_work_clock_0_in_endofpacket                         (new_work_clock_0_in_endofpacket),
      .new_work_clock_0_in_endofpacket_from_sa                 (new_work_clock_0_in_endofpacket_from_sa),
      .new_work_clock_0_in_nativeaddress                       (new_work_clock_0_in_nativeaddress),
      .new_work_clock_0_in_read                                (new_work_clock_0_in_read),
      .new_work_clock_0_in_readdata                            (new_work_clock_0_in_readdata),
      .new_work_clock_0_in_readdata_from_sa                    (new_work_clock_0_in_readdata_from_sa),
      .new_work_clock_0_in_reset_n                             (new_work_clock_0_in_reset_n),
      .new_work_clock_0_in_waitrequest                         (new_work_clock_0_in_waitrequest),
      .new_work_clock_0_in_waitrequest_from_sa                 (new_work_clock_0_in_waitrequest_from_sa),
      .new_work_clock_0_in_write                               (new_work_clock_0_in_write),
      .new_work_clock_0_in_writedata                           (new_work_clock_0_in_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  new_work_clock_0_out_arbitrator the_new_work_clock_0_out
    (
      .clk                                                          (altpll_0_c0_out),
      .d1_sysid_0_control_slave_end_xfer                            (d1_sysid_0_control_slave_end_xfer),
      .new_work_clock_0_out_address                                 (new_work_clock_0_out_address),
      .new_work_clock_0_out_address_to_slave                        (new_work_clock_0_out_address_to_slave),
      .new_work_clock_0_out_byteenable                              (new_work_clock_0_out_byteenable),
      .new_work_clock_0_out_granted_sysid_0_control_slave           (new_work_clock_0_out_granted_sysid_0_control_slave),
      .new_work_clock_0_out_qualified_request_sysid_0_control_slave (new_work_clock_0_out_qualified_request_sysid_0_control_slave),
      .new_work_clock_0_out_read                                    (new_work_clock_0_out_read),
      .new_work_clock_0_out_read_data_valid_sysid_0_control_slave   (new_work_clock_0_out_read_data_valid_sysid_0_control_slave),
      .new_work_clock_0_out_readdata                                (new_work_clock_0_out_readdata),
      .new_work_clock_0_out_requests_sysid_0_control_slave          (new_work_clock_0_out_requests_sysid_0_control_slave),
      .new_work_clock_0_out_reset_n                                 (new_work_clock_0_out_reset_n),
      .new_work_clock_0_out_waitrequest                             (new_work_clock_0_out_waitrequest),
      .new_work_clock_0_out_write                                   (new_work_clock_0_out_write),
      .new_work_clock_0_out_writedata                               (new_work_clock_0_out_writedata),
      .reset_n                                                      (altpll_0_c0_out_reset_n),
      .sysid_0_control_slave_readdata_from_sa                       (sysid_0_control_slave_readdata_from_sa)
    );

  new_work_clock_0 the_new_work_clock_0
    (
      .master_address       (new_work_clock_0_out_address),
      .master_byteenable    (new_work_clock_0_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_0_out_endofpacket),
      .master_nativeaddress (new_work_clock_0_out_nativeaddress),
      .master_read          (new_work_clock_0_out_read),
      .master_readdata      (new_work_clock_0_out_readdata),
      .master_reset_n       (new_work_clock_0_out_reset_n),
      .master_waitrequest   (new_work_clock_0_out_waitrequest),
      .master_write         (new_work_clock_0_out_write),
      .master_writedata     (new_work_clock_0_out_writedata),
      .slave_address        (new_work_clock_0_in_address),
      .slave_byteenable     (new_work_clock_0_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_0_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_0_in_nativeaddress),
      .slave_read           (new_work_clock_0_in_read),
      .slave_readdata       (new_work_clock_0_in_readdata),
      .slave_reset_n        (new_work_clock_0_in_reset_n),
      .slave_waitrequest    (new_work_clock_0_in_waitrequest),
      .slave_write          (new_work_clock_0_in_write),
      .slave_writedata      (new_work_clock_0_in_writedata)
    );

  new_work_clock_1_in_arbitrator the_new_work_clock_1_in
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                            (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_new_work_clock_1_in           (cpu_0_data_master_granted_new_work_clock_1_in),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_new_work_clock_1_in (cpu_0_data_master_qualified_request_new_work_clock_1_in),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_new_work_clock_1_in   (cpu_0_data_master_read_data_valid_new_work_clock_1_in),
      .cpu_0_data_master_requests_new_work_clock_1_in          (cpu_0_data_master_requests_new_work_clock_1_in),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                             (cpu_0_data_master_writedata),
      .d1_new_work_clock_1_in_end_xfer                         (d1_new_work_clock_1_in_end_xfer),
      .new_work_clock_1_in_address                             (new_work_clock_1_in_address),
      .new_work_clock_1_in_byteenable                          (new_work_clock_1_in_byteenable),
      .new_work_clock_1_in_endofpacket                         (new_work_clock_1_in_endofpacket),
      .new_work_clock_1_in_endofpacket_from_sa                 (new_work_clock_1_in_endofpacket_from_sa),
      .new_work_clock_1_in_nativeaddress                       (new_work_clock_1_in_nativeaddress),
      .new_work_clock_1_in_read                                (new_work_clock_1_in_read),
      .new_work_clock_1_in_readdata                            (new_work_clock_1_in_readdata),
      .new_work_clock_1_in_readdata_from_sa                    (new_work_clock_1_in_readdata_from_sa),
      .new_work_clock_1_in_reset_n                             (new_work_clock_1_in_reset_n),
      .new_work_clock_1_in_waitrequest                         (new_work_clock_1_in_waitrequest),
      .new_work_clock_1_in_waitrequest_from_sa                 (new_work_clock_1_in_waitrequest_from_sa),
      .new_work_clock_1_in_write                               (new_work_clock_1_in_write),
      .new_work_clock_1_in_writedata                           (new_work_clock_1_in_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  new_work_clock_1_out_arbitrator the_new_work_clock_1_out
    (
      .clk                                                                  (altpll_0_c0_out),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                            (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                       (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                    (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .new_work_clock_1_out_address                                         (new_work_clock_1_out_address),
      .new_work_clock_1_out_address_to_slave                                (new_work_clock_1_out_address_to_slave),
      .new_work_clock_1_out_byteenable                                      (new_work_clock_1_out_byteenable),
      .new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave           (new_work_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave (new_work_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_read                                            (new_work_clock_1_out_read),
      .new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave   (new_work_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_readdata                                        (new_work_clock_1_out_readdata),
      .new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave          (new_work_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave),
      .new_work_clock_1_out_reset_n                                         (new_work_clock_1_out_reset_n),
      .new_work_clock_1_out_waitrequest                                     (new_work_clock_1_out_waitrequest),
      .new_work_clock_1_out_write                                           (new_work_clock_1_out_write),
      .new_work_clock_1_out_writedata                                       (new_work_clock_1_out_writedata),
      .reset_n                                                              (altpll_0_c0_out_reset_n)
    );

  new_work_clock_1 the_new_work_clock_1
    (
      .master_address       (new_work_clock_1_out_address),
      .master_byteenable    (new_work_clock_1_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_1_out_endofpacket),
      .master_nativeaddress (new_work_clock_1_out_nativeaddress),
      .master_read          (new_work_clock_1_out_read),
      .master_readdata      (new_work_clock_1_out_readdata),
      .master_reset_n       (new_work_clock_1_out_reset_n),
      .master_waitrequest   (new_work_clock_1_out_waitrequest),
      .master_write         (new_work_clock_1_out_write),
      .master_writedata     (new_work_clock_1_out_writedata),
      .slave_address        (new_work_clock_1_in_address),
      .slave_byteenable     (new_work_clock_1_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_1_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_1_in_nativeaddress),
      .slave_read           (new_work_clock_1_in_read),
      .slave_readdata       (new_work_clock_1_in_readdata),
      .slave_reset_n        (new_work_clock_1_in_reset_n),
      .slave_waitrequest    (new_work_clock_1_in_waitrequest),
      .slave_write          (new_work_clock_1_in_write),
      .slave_writedata      (new_work_clock_1_in_writedata)
    );

  new_work_clock_2_in_arbitrator the_new_work_clock_2_in
    (
      .clk                                                               (clk_0),
      .d1_new_work_clock_2_in_end_xfer                                   (d1_new_work_clock_2_in_end_xfer),
      .new_work_burst_2_downstream_address_to_slave                      (new_work_burst_2_downstream_address_to_slave),
      .new_work_burst_2_downstream_arbitrationshare                      (new_work_burst_2_downstream_arbitrationshare),
      .new_work_burst_2_downstream_burstcount                            (new_work_burst_2_downstream_burstcount),
      .new_work_burst_2_downstream_byteenable                            (new_work_burst_2_downstream_byteenable),
      .new_work_burst_2_downstream_granted_new_work_clock_2_in           (new_work_burst_2_downstream_granted_new_work_clock_2_in),
      .new_work_burst_2_downstream_latency_counter                       (new_work_burst_2_downstream_latency_counter),
      .new_work_burst_2_downstream_nativeaddress                         (new_work_burst_2_downstream_nativeaddress),
      .new_work_burst_2_downstream_qualified_request_new_work_clock_2_in (new_work_burst_2_downstream_qualified_request_new_work_clock_2_in),
      .new_work_burst_2_downstream_read                                  (new_work_burst_2_downstream_read),
      .new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in   (new_work_burst_2_downstream_read_data_valid_new_work_clock_2_in),
      .new_work_burst_2_downstream_requests_new_work_clock_2_in          (new_work_burst_2_downstream_requests_new_work_clock_2_in),
      .new_work_burst_2_downstream_write                                 (new_work_burst_2_downstream_write),
      .new_work_burst_2_downstream_writedata                             (new_work_burst_2_downstream_writedata),
      .new_work_clock_2_in_address                                       (new_work_clock_2_in_address),
      .new_work_clock_2_in_byteenable                                    (new_work_clock_2_in_byteenable),
      .new_work_clock_2_in_endofpacket                                   (new_work_clock_2_in_endofpacket),
      .new_work_clock_2_in_endofpacket_from_sa                           (new_work_clock_2_in_endofpacket_from_sa),
      .new_work_clock_2_in_nativeaddress                                 (new_work_clock_2_in_nativeaddress),
      .new_work_clock_2_in_read                                          (new_work_clock_2_in_read),
      .new_work_clock_2_in_readdata                                      (new_work_clock_2_in_readdata),
      .new_work_clock_2_in_readdata_from_sa                              (new_work_clock_2_in_readdata_from_sa),
      .new_work_clock_2_in_reset_n                                       (new_work_clock_2_in_reset_n),
      .new_work_clock_2_in_waitrequest                                   (new_work_clock_2_in_waitrequest),
      .new_work_clock_2_in_waitrequest_from_sa                           (new_work_clock_2_in_waitrequest_from_sa),
      .new_work_clock_2_in_write                                         (new_work_clock_2_in_write),
      .new_work_clock_2_in_writedata                                     (new_work_clock_2_in_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  new_work_clock_2_out_arbitrator the_new_work_clock_2_out
    (
      .clk                                                            (altpll_0_c0_out),
      .d1_sdram_0_s1_end_xfer                                         (d1_sdram_0_s1_end_xfer),
      .new_work_clock_2_out_address                                   (new_work_clock_2_out_address),
      .new_work_clock_2_out_address_to_slave                          (new_work_clock_2_out_address_to_slave),
      .new_work_clock_2_out_byteenable                                (new_work_clock_2_out_byteenable),
      .new_work_clock_2_out_granted_sdram_0_s1                        (new_work_clock_2_out_granted_sdram_0_s1),
      .new_work_clock_2_out_qualified_request_sdram_0_s1              (new_work_clock_2_out_qualified_request_sdram_0_s1),
      .new_work_clock_2_out_read                                      (new_work_clock_2_out_read),
      .new_work_clock_2_out_read_data_valid_sdram_0_s1                (new_work_clock_2_out_read_data_valid_sdram_0_s1),
      .new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register (new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register),
      .new_work_clock_2_out_readdata                                  (new_work_clock_2_out_readdata),
      .new_work_clock_2_out_requests_sdram_0_s1                       (new_work_clock_2_out_requests_sdram_0_s1),
      .new_work_clock_2_out_reset_n                                   (new_work_clock_2_out_reset_n),
      .new_work_clock_2_out_waitrequest                               (new_work_clock_2_out_waitrequest),
      .new_work_clock_2_out_write                                     (new_work_clock_2_out_write),
      .new_work_clock_2_out_writedata                                 (new_work_clock_2_out_writedata),
      .reset_n                                                        (altpll_0_c0_out_reset_n),
      .sdram_0_s1_readdata_from_sa                                    (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                 (sdram_0_s1_waitrequest_from_sa)
    );

  new_work_clock_2 the_new_work_clock_2
    (
      .master_address       (new_work_clock_2_out_address),
      .master_byteenable    (new_work_clock_2_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_2_out_endofpacket),
      .master_nativeaddress (new_work_clock_2_out_nativeaddress),
      .master_read          (new_work_clock_2_out_read),
      .master_readdata      (new_work_clock_2_out_readdata),
      .master_reset_n       (new_work_clock_2_out_reset_n),
      .master_waitrequest   (new_work_clock_2_out_waitrequest),
      .master_write         (new_work_clock_2_out_write),
      .master_writedata     (new_work_clock_2_out_writedata),
      .slave_address        (new_work_clock_2_in_address),
      .slave_byteenable     (new_work_clock_2_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_2_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_2_in_nativeaddress),
      .slave_read           (new_work_clock_2_in_read),
      .slave_readdata       (new_work_clock_2_in_readdata),
      .slave_reset_n        (new_work_clock_2_in_reset_n),
      .slave_waitrequest    (new_work_clock_2_in_waitrequest),
      .slave_write          (new_work_clock_2_in_write),
      .slave_writedata      (new_work_clock_2_in_writedata)
    );

  new_work_clock_3_in_arbitrator the_new_work_clock_3_in
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                            (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_new_work_clock_3_in        (cpu_0_data_master_byteenable_new_work_clock_3_in),
      .cpu_0_data_master_dbs_address                           (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                          (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_new_work_clock_3_in           (cpu_0_data_master_granted_new_work_clock_3_in),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_new_work_clock_3_in (cpu_0_data_master_qualified_request_new_work_clock_3_in),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_new_work_clock_3_in   (cpu_0_data_master_read_data_valid_new_work_clock_3_in),
      .cpu_0_data_master_requests_new_work_clock_3_in          (cpu_0_data_master_requests_new_work_clock_3_in),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_new_work_clock_3_in_end_xfer                         (d1_new_work_clock_3_in_end_xfer),
      .new_work_clock_3_in_address                             (new_work_clock_3_in_address),
      .new_work_clock_3_in_byteenable                          (new_work_clock_3_in_byteenable),
      .new_work_clock_3_in_endofpacket                         (new_work_clock_3_in_endofpacket),
      .new_work_clock_3_in_endofpacket_from_sa                 (new_work_clock_3_in_endofpacket_from_sa),
      .new_work_clock_3_in_nativeaddress                       (new_work_clock_3_in_nativeaddress),
      .new_work_clock_3_in_read                                (new_work_clock_3_in_read),
      .new_work_clock_3_in_readdata                            (new_work_clock_3_in_readdata),
      .new_work_clock_3_in_readdata_from_sa                    (new_work_clock_3_in_readdata_from_sa),
      .new_work_clock_3_in_reset_n                             (new_work_clock_3_in_reset_n),
      .new_work_clock_3_in_waitrequest                         (new_work_clock_3_in_waitrequest),
      .new_work_clock_3_in_waitrequest_from_sa                 (new_work_clock_3_in_waitrequest_from_sa),
      .new_work_clock_3_in_write                               (new_work_clock_3_in_write),
      .new_work_clock_3_in_writedata                           (new_work_clock_3_in_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  new_work_clock_3_out_arbitrator the_new_work_clock_3_out
    (
      .clk                                                            (altpll_0_c0_out),
      .d1_sdram_0_s1_end_xfer                                         (d1_sdram_0_s1_end_xfer),
      .new_work_clock_3_out_address                                   (new_work_clock_3_out_address),
      .new_work_clock_3_out_address_to_slave                          (new_work_clock_3_out_address_to_slave),
      .new_work_clock_3_out_byteenable                                (new_work_clock_3_out_byteenable),
      .new_work_clock_3_out_granted_sdram_0_s1                        (new_work_clock_3_out_granted_sdram_0_s1),
      .new_work_clock_3_out_qualified_request_sdram_0_s1              (new_work_clock_3_out_qualified_request_sdram_0_s1),
      .new_work_clock_3_out_read                                      (new_work_clock_3_out_read),
      .new_work_clock_3_out_read_data_valid_sdram_0_s1                (new_work_clock_3_out_read_data_valid_sdram_0_s1),
      .new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register (new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register),
      .new_work_clock_3_out_readdata                                  (new_work_clock_3_out_readdata),
      .new_work_clock_3_out_requests_sdram_0_s1                       (new_work_clock_3_out_requests_sdram_0_s1),
      .new_work_clock_3_out_reset_n                                   (new_work_clock_3_out_reset_n),
      .new_work_clock_3_out_waitrequest                               (new_work_clock_3_out_waitrequest),
      .new_work_clock_3_out_write                                     (new_work_clock_3_out_write),
      .new_work_clock_3_out_writedata                                 (new_work_clock_3_out_writedata),
      .reset_n                                                        (altpll_0_c0_out_reset_n),
      .sdram_0_s1_readdata_from_sa                                    (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                 (sdram_0_s1_waitrequest_from_sa)
    );

  new_work_clock_3 the_new_work_clock_3
    (
      .master_address       (new_work_clock_3_out_address),
      .master_byteenable    (new_work_clock_3_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_3_out_endofpacket),
      .master_nativeaddress (new_work_clock_3_out_nativeaddress),
      .master_read          (new_work_clock_3_out_read),
      .master_readdata      (new_work_clock_3_out_readdata),
      .master_reset_n       (new_work_clock_3_out_reset_n),
      .master_waitrequest   (new_work_clock_3_out_waitrequest),
      .master_write         (new_work_clock_3_out_write),
      .master_writedata     (new_work_clock_3_out_writedata),
      .slave_address        (new_work_clock_3_in_address),
      .slave_byteenable     (new_work_clock_3_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_3_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_3_in_nativeaddress),
      .slave_read           (new_work_clock_3_in_read),
      .slave_readdata       (new_work_clock_3_in_readdata),
      .slave_reset_n        (new_work_clock_3_in_reset_n),
      .slave_waitrequest    (new_work_clock_3_in_waitrequest),
      .slave_write          (new_work_clock_3_in_write),
      .slave_writedata      (new_work_clock_3_in_writedata)
    );

  new_work_clock_4_in_arbitrator the_new_work_clock_4_in
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                            (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_new_work_clock_4_in           (cpu_0_data_master_granted_new_work_clock_4_in),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_new_work_clock_4_in (cpu_0_data_master_qualified_request_new_work_clock_4_in),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_new_work_clock_4_in   (cpu_0_data_master_read_data_valid_new_work_clock_4_in),
      .cpu_0_data_master_requests_new_work_clock_4_in          (cpu_0_data_master_requests_new_work_clock_4_in),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                             (cpu_0_data_master_writedata),
      .d1_new_work_clock_4_in_end_xfer                         (d1_new_work_clock_4_in_end_xfer),
      .new_work_clock_4_in_address                             (new_work_clock_4_in_address),
      .new_work_clock_4_in_endofpacket                         (new_work_clock_4_in_endofpacket),
      .new_work_clock_4_in_endofpacket_from_sa                 (new_work_clock_4_in_endofpacket_from_sa),
      .new_work_clock_4_in_nativeaddress                       (new_work_clock_4_in_nativeaddress),
      .new_work_clock_4_in_read                                (new_work_clock_4_in_read),
      .new_work_clock_4_in_readdata                            (new_work_clock_4_in_readdata),
      .new_work_clock_4_in_readdata_from_sa                    (new_work_clock_4_in_readdata_from_sa),
      .new_work_clock_4_in_reset_n                             (new_work_clock_4_in_reset_n),
      .new_work_clock_4_in_waitrequest                         (new_work_clock_4_in_waitrequest),
      .new_work_clock_4_in_waitrequest_from_sa                 (new_work_clock_4_in_waitrequest_from_sa),
      .new_work_clock_4_in_write                               (new_work_clock_4_in_write),
      .new_work_clock_4_in_writedata                           (new_work_clock_4_in_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  new_work_clock_4_out_arbitrator the_new_work_clock_4_out
    (
      .clk                                             (altpll_0_c0_out),
      .d1_pio_0_s1_end_xfer                            (d1_pio_0_s1_end_xfer),
      .new_work_clock_4_out_address                    (new_work_clock_4_out_address),
      .new_work_clock_4_out_address_to_slave           (new_work_clock_4_out_address_to_slave),
      .new_work_clock_4_out_granted_pio_0_s1           (new_work_clock_4_out_granted_pio_0_s1),
      .new_work_clock_4_out_qualified_request_pio_0_s1 (new_work_clock_4_out_qualified_request_pio_0_s1),
      .new_work_clock_4_out_read                       (new_work_clock_4_out_read),
      .new_work_clock_4_out_read_data_valid_pio_0_s1   (new_work_clock_4_out_read_data_valid_pio_0_s1),
      .new_work_clock_4_out_readdata                   (new_work_clock_4_out_readdata),
      .new_work_clock_4_out_requests_pio_0_s1          (new_work_clock_4_out_requests_pio_0_s1),
      .new_work_clock_4_out_reset_n                    (new_work_clock_4_out_reset_n),
      .new_work_clock_4_out_waitrequest                (new_work_clock_4_out_waitrequest),
      .new_work_clock_4_out_write                      (new_work_clock_4_out_write),
      .new_work_clock_4_out_writedata                  (new_work_clock_4_out_writedata),
      .pio_0_s1_readdata_from_sa                       (pio_0_s1_readdata_from_sa),
      .reset_n                                         (altpll_0_c0_out_reset_n)
    );

  new_work_clock_4 the_new_work_clock_4
    (
      .master_address       (new_work_clock_4_out_address),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_4_out_endofpacket),
      .master_nativeaddress (new_work_clock_4_out_nativeaddress),
      .master_read          (new_work_clock_4_out_read),
      .master_readdata      (new_work_clock_4_out_readdata),
      .master_reset_n       (new_work_clock_4_out_reset_n),
      .master_waitrequest   (new_work_clock_4_out_waitrequest),
      .master_write         (new_work_clock_4_out_write),
      .master_writedata     (new_work_clock_4_out_writedata),
      .slave_address        (new_work_clock_4_in_address),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_4_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_4_in_nativeaddress),
      .slave_read           (new_work_clock_4_in_read),
      .slave_readdata       (new_work_clock_4_in_readdata),
      .slave_reset_n        (new_work_clock_4_in_reset_n),
      .slave_waitrequest    (new_work_clock_4_in_waitrequest),
      .slave_write          (new_work_clock_4_in_write),
      .slave_writedata      (new_work_clock_4_in_writedata)
    );

  new_work_clock_5_in_arbitrator the_new_work_clock_5_in
    (
      .clk                                                               (clk_0),
      .d1_new_work_clock_5_in_end_xfer                                   (d1_new_work_clock_5_in_end_xfer),
      .new_work_burst_3_downstream_address_to_slave                      (new_work_burst_3_downstream_address_to_slave),
      .new_work_burst_3_downstream_arbitrationshare                      (new_work_burst_3_downstream_arbitrationshare),
      .new_work_burst_3_downstream_burstcount                            (new_work_burst_3_downstream_burstcount),
      .new_work_burst_3_downstream_byteenable                            (new_work_burst_3_downstream_byteenable),
      .new_work_burst_3_downstream_granted_new_work_clock_5_in           (new_work_burst_3_downstream_granted_new_work_clock_5_in),
      .new_work_burst_3_downstream_latency_counter                       (new_work_burst_3_downstream_latency_counter),
      .new_work_burst_3_downstream_nativeaddress                         (new_work_burst_3_downstream_nativeaddress),
      .new_work_burst_3_downstream_qualified_request_new_work_clock_5_in (new_work_burst_3_downstream_qualified_request_new_work_clock_5_in),
      .new_work_burst_3_downstream_read                                  (new_work_burst_3_downstream_read),
      .new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in   (new_work_burst_3_downstream_read_data_valid_new_work_clock_5_in),
      .new_work_burst_3_downstream_requests_new_work_clock_5_in          (new_work_burst_3_downstream_requests_new_work_clock_5_in),
      .new_work_burst_3_downstream_write                                 (new_work_burst_3_downstream_write),
      .new_work_burst_3_downstream_writedata                             (new_work_burst_3_downstream_writedata),
      .new_work_clock_5_in_address                                       (new_work_clock_5_in_address),
      .new_work_clock_5_in_byteenable                                    (new_work_clock_5_in_byteenable),
      .new_work_clock_5_in_endofpacket                                   (new_work_clock_5_in_endofpacket),
      .new_work_clock_5_in_endofpacket_from_sa                           (new_work_clock_5_in_endofpacket_from_sa),
      .new_work_clock_5_in_nativeaddress                                 (new_work_clock_5_in_nativeaddress),
      .new_work_clock_5_in_read                                          (new_work_clock_5_in_read),
      .new_work_clock_5_in_readdata                                      (new_work_clock_5_in_readdata),
      .new_work_clock_5_in_readdata_from_sa                              (new_work_clock_5_in_readdata_from_sa),
      .new_work_clock_5_in_reset_n                                       (new_work_clock_5_in_reset_n),
      .new_work_clock_5_in_waitrequest                                   (new_work_clock_5_in_waitrequest),
      .new_work_clock_5_in_waitrequest_from_sa                           (new_work_clock_5_in_waitrequest_from_sa),
      .new_work_clock_5_in_write                                         (new_work_clock_5_in_write),
      .new_work_clock_5_in_writedata                                     (new_work_clock_5_in_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  new_work_clock_5_out_arbitrator the_new_work_clock_5_out
    (
      .cfi_flash_0_s1_wait_counter_eq_0                                 (cfi_flash_0_s1_wait_counter_eq_0),
      .clk                                                              (altpll_0_c0_out),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                      (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0),
      .new_work_clock_5_out_address                                     (new_work_clock_5_out_address),
      .new_work_clock_5_out_address_to_slave                            (new_work_clock_5_out_address_to_slave),
      .new_work_clock_5_out_byteenable                                  (new_work_clock_5_out_byteenable),
      .new_work_clock_5_out_granted_cfi_flash_0_s1                      (new_work_clock_5_out_granted_cfi_flash_0_s1),
      .new_work_clock_5_out_qualified_request_cfi_flash_0_s1            (new_work_clock_5_out_qualified_request_cfi_flash_0_s1),
      .new_work_clock_5_out_read                                        (new_work_clock_5_out_read),
      .new_work_clock_5_out_read_data_valid_cfi_flash_0_s1              (new_work_clock_5_out_read_data_valid_cfi_flash_0_s1),
      .new_work_clock_5_out_readdata                                    (new_work_clock_5_out_readdata),
      .new_work_clock_5_out_requests_cfi_flash_0_s1                     (new_work_clock_5_out_requests_cfi_flash_0_s1),
      .new_work_clock_5_out_reset_n                                     (new_work_clock_5_out_reset_n),
      .new_work_clock_5_out_waitrequest                                 (new_work_clock_5_out_waitrequest),
      .new_work_clock_5_out_write                                       (new_work_clock_5_out_write),
      .new_work_clock_5_out_writedata                                   (new_work_clock_5_out_writedata),
      .reset_n                                                          (altpll_0_c0_out_reset_n)
    );

  new_work_clock_5 the_new_work_clock_5
    (
      .master_address       (new_work_clock_5_out_address),
      .master_byteenable    (new_work_clock_5_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_5_out_endofpacket),
      .master_nativeaddress (new_work_clock_5_out_nativeaddress),
      .master_read          (new_work_clock_5_out_read),
      .master_readdata      (new_work_clock_5_out_readdata),
      .master_reset_n       (new_work_clock_5_out_reset_n),
      .master_waitrequest   (new_work_clock_5_out_waitrequest),
      .master_write         (new_work_clock_5_out_write),
      .master_writedata     (new_work_clock_5_out_writedata),
      .slave_address        (new_work_clock_5_in_address),
      .slave_byteenable     (new_work_clock_5_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_5_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_5_in_nativeaddress),
      .slave_read           (new_work_clock_5_in_read),
      .slave_readdata       (new_work_clock_5_in_readdata),
      .slave_reset_n        (new_work_clock_5_in_reset_n),
      .slave_waitrequest    (new_work_clock_5_in_waitrequest),
      .slave_write          (new_work_clock_5_in_write),
      .slave_writedata      (new_work_clock_5_in_writedata)
    );

  new_work_clock_6_in_arbitrator the_new_work_clock_6_in
    (
      .clk                                                     (clk_0),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                            (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_new_work_clock_6_in        (cpu_0_data_master_byteenable_new_work_clock_6_in),
      .cpu_0_data_master_dbs_address                           (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                          (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_new_work_clock_6_in           (cpu_0_data_master_granted_new_work_clock_6_in),
      .cpu_0_data_master_latency_counter                       (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_new_work_clock_6_in (cpu_0_data_master_qualified_request_new_work_clock_6_in),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_new_work_clock_6_in   (cpu_0_data_master_read_data_valid_new_work_clock_6_in),
      .cpu_0_data_master_requests_new_work_clock_6_in          (cpu_0_data_master_requests_new_work_clock_6_in),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_new_work_clock_6_in_end_xfer                         (d1_new_work_clock_6_in_end_xfer),
      .new_work_clock_6_in_address                             (new_work_clock_6_in_address),
      .new_work_clock_6_in_byteenable                          (new_work_clock_6_in_byteenable),
      .new_work_clock_6_in_endofpacket                         (new_work_clock_6_in_endofpacket),
      .new_work_clock_6_in_endofpacket_from_sa                 (new_work_clock_6_in_endofpacket_from_sa),
      .new_work_clock_6_in_nativeaddress                       (new_work_clock_6_in_nativeaddress),
      .new_work_clock_6_in_read                                (new_work_clock_6_in_read),
      .new_work_clock_6_in_readdata                            (new_work_clock_6_in_readdata),
      .new_work_clock_6_in_readdata_from_sa                    (new_work_clock_6_in_readdata_from_sa),
      .new_work_clock_6_in_reset_n                             (new_work_clock_6_in_reset_n),
      .new_work_clock_6_in_waitrequest                         (new_work_clock_6_in_waitrequest),
      .new_work_clock_6_in_waitrequest_from_sa                 (new_work_clock_6_in_waitrequest_from_sa),
      .new_work_clock_6_in_write                               (new_work_clock_6_in_write),
      .new_work_clock_6_in_writedata                           (new_work_clock_6_in_writedata),
      .reset_n                                                 (clk_0_reset_n)
    );

  new_work_clock_6_out_arbitrator the_new_work_clock_6_out
    (
      .cfi_flash_0_s1_wait_counter_eq_0                                 (cfi_flash_0_s1_wait_counter_eq_0),
      .clk                                                              (altpll_0_c0_out),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                      (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0),
      .new_work_clock_6_out_address                                     (new_work_clock_6_out_address),
      .new_work_clock_6_out_address_to_slave                            (new_work_clock_6_out_address_to_slave),
      .new_work_clock_6_out_byteenable                                  (new_work_clock_6_out_byteenable),
      .new_work_clock_6_out_granted_cfi_flash_0_s1                      (new_work_clock_6_out_granted_cfi_flash_0_s1),
      .new_work_clock_6_out_qualified_request_cfi_flash_0_s1            (new_work_clock_6_out_qualified_request_cfi_flash_0_s1),
      .new_work_clock_6_out_read                                        (new_work_clock_6_out_read),
      .new_work_clock_6_out_read_data_valid_cfi_flash_0_s1              (new_work_clock_6_out_read_data_valid_cfi_flash_0_s1),
      .new_work_clock_6_out_readdata                                    (new_work_clock_6_out_readdata),
      .new_work_clock_6_out_requests_cfi_flash_0_s1                     (new_work_clock_6_out_requests_cfi_flash_0_s1),
      .new_work_clock_6_out_reset_n                                     (new_work_clock_6_out_reset_n),
      .new_work_clock_6_out_waitrequest                                 (new_work_clock_6_out_waitrequest),
      .new_work_clock_6_out_write                                       (new_work_clock_6_out_write),
      .new_work_clock_6_out_writedata                                   (new_work_clock_6_out_writedata),
      .reset_n                                                          (altpll_0_c0_out_reset_n)
    );

  new_work_clock_6 the_new_work_clock_6
    (
      .master_address       (new_work_clock_6_out_address),
      .master_byteenable    (new_work_clock_6_out_byteenable),
      .master_clk           (altpll_0_c0_out),
      .master_endofpacket   (new_work_clock_6_out_endofpacket),
      .master_nativeaddress (new_work_clock_6_out_nativeaddress),
      .master_read          (new_work_clock_6_out_read),
      .master_readdata      (new_work_clock_6_out_readdata),
      .master_reset_n       (new_work_clock_6_out_reset_n),
      .master_waitrequest   (new_work_clock_6_out_waitrequest),
      .master_write         (new_work_clock_6_out_write),
      .master_writedata     (new_work_clock_6_out_writedata),
      .slave_address        (new_work_clock_6_in_address),
      .slave_byteenable     (new_work_clock_6_in_byteenable),
      .slave_clk            (clk_0),
      .slave_endofpacket    (new_work_clock_6_in_endofpacket),
      .slave_nativeaddress  (new_work_clock_6_in_nativeaddress),
      .slave_read           (new_work_clock_6_in_read),
      .slave_readdata       (new_work_clock_6_in_readdata),
      .slave_reset_n        (new_work_clock_6_in_reset_n),
      .slave_waitrequest    (new_work_clock_6_in_waitrequest),
      .slave_write          (new_work_clock_6_in_write),
      .slave_writedata      (new_work_clock_6_in_writedata)
    );

  pio_0_s1_arbitrator the_pio_0_s1
    (
      .clk                                             (altpll_0_c0_out),
      .d1_pio_0_s1_end_xfer                            (d1_pio_0_s1_end_xfer),
      .new_work_clock_4_out_address_to_slave           (new_work_clock_4_out_address_to_slave),
      .new_work_clock_4_out_granted_pio_0_s1           (new_work_clock_4_out_granted_pio_0_s1),
      .new_work_clock_4_out_nativeaddress              (new_work_clock_4_out_nativeaddress),
      .new_work_clock_4_out_qualified_request_pio_0_s1 (new_work_clock_4_out_qualified_request_pio_0_s1),
      .new_work_clock_4_out_read                       (new_work_clock_4_out_read),
      .new_work_clock_4_out_read_data_valid_pio_0_s1   (new_work_clock_4_out_read_data_valid_pio_0_s1),
      .new_work_clock_4_out_requests_pio_0_s1          (new_work_clock_4_out_requests_pio_0_s1),
      .new_work_clock_4_out_write                      (new_work_clock_4_out_write),
      .new_work_clock_4_out_writedata                  (new_work_clock_4_out_writedata),
      .pio_0_s1_address                                (pio_0_s1_address),
      .pio_0_s1_chipselect                             (pio_0_s1_chipselect),
      .pio_0_s1_readdata                               (pio_0_s1_readdata),
      .pio_0_s1_readdata_from_sa                       (pio_0_s1_readdata_from_sa),
      .pio_0_s1_reset_n                                (pio_0_s1_reset_n),
      .pio_0_s1_write_n                                (pio_0_s1_write_n),
      .pio_0_s1_writedata                              (pio_0_s1_writedata),
      .reset_n                                         (altpll_0_c0_out_reset_n)
    );

  pio_0 the_pio_0
    (
      .address    (pio_0_s1_address),
      .chipselect (pio_0_s1_chipselect),
      .clk        (altpll_0_c0_out),
      .out_port   (out_port_from_the_pio_0),
      .readdata   (pio_0_s1_readdata),
      .reset_n    (pio_0_s1_reset_n),
      .write_n    (pio_0_s1_write_n),
      .writedata  (pio_0_s1_writedata)
    );

  sdram_0_s1_arbitrator the_sdram_0_s1
    (
      .clk                                                            (altpll_0_c0_out),
      .d1_sdram_0_s1_end_xfer                                         (d1_sdram_0_s1_end_xfer),
      .new_work_clock_2_out_address_to_slave                          (new_work_clock_2_out_address_to_slave),
      .new_work_clock_2_out_byteenable                                (new_work_clock_2_out_byteenable),
      .new_work_clock_2_out_granted_sdram_0_s1                        (new_work_clock_2_out_granted_sdram_0_s1),
      .new_work_clock_2_out_qualified_request_sdram_0_s1              (new_work_clock_2_out_qualified_request_sdram_0_s1),
      .new_work_clock_2_out_read                                      (new_work_clock_2_out_read),
      .new_work_clock_2_out_read_data_valid_sdram_0_s1                (new_work_clock_2_out_read_data_valid_sdram_0_s1),
      .new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register (new_work_clock_2_out_read_data_valid_sdram_0_s1_shift_register),
      .new_work_clock_2_out_requests_sdram_0_s1                       (new_work_clock_2_out_requests_sdram_0_s1),
      .new_work_clock_2_out_write                                     (new_work_clock_2_out_write),
      .new_work_clock_2_out_writedata                                 (new_work_clock_2_out_writedata),
      .new_work_clock_3_out_address_to_slave                          (new_work_clock_3_out_address_to_slave),
      .new_work_clock_3_out_byteenable                                (new_work_clock_3_out_byteenable),
      .new_work_clock_3_out_granted_sdram_0_s1                        (new_work_clock_3_out_granted_sdram_0_s1),
      .new_work_clock_3_out_qualified_request_sdram_0_s1              (new_work_clock_3_out_qualified_request_sdram_0_s1),
      .new_work_clock_3_out_read                                      (new_work_clock_3_out_read),
      .new_work_clock_3_out_read_data_valid_sdram_0_s1                (new_work_clock_3_out_read_data_valid_sdram_0_s1),
      .new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register (new_work_clock_3_out_read_data_valid_sdram_0_s1_shift_register),
      .new_work_clock_3_out_requests_sdram_0_s1                       (new_work_clock_3_out_requests_sdram_0_s1),
      .new_work_clock_3_out_write                                     (new_work_clock_3_out_write),
      .new_work_clock_3_out_writedata                                 (new_work_clock_3_out_writedata),
      .reset_n                                                        (altpll_0_c0_out_reset_n),
      .sdram_0_s1_address                                             (sdram_0_s1_address),
      .sdram_0_s1_byteenable_n                                        (sdram_0_s1_byteenable_n),
      .sdram_0_s1_chipselect                                          (sdram_0_s1_chipselect),
      .sdram_0_s1_read_n                                              (sdram_0_s1_read_n),
      .sdram_0_s1_readdata                                            (sdram_0_s1_readdata),
      .sdram_0_s1_readdata_from_sa                                    (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_readdatavalid                                       (sdram_0_s1_readdatavalid),
      .sdram_0_s1_reset_n                                             (sdram_0_s1_reset_n),
      .sdram_0_s1_waitrequest                                         (sdram_0_s1_waitrequest),
      .sdram_0_s1_waitrequest_from_sa                                 (sdram_0_s1_waitrequest_from_sa),
      .sdram_0_s1_write_n                                             (sdram_0_s1_write_n),
      .sdram_0_s1_writedata                                           (sdram_0_s1_writedata)
    );

  sdram_0 the_sdram_0
    (
      .az_addr        (sdram_0_s1_address),
      .az_be_n        (sdram_0_s1_byteenable_n),
      .az_cs          (sdram_0_s1_chipselect),
      .az_data        (sdram_0_s1_writedata),
      .az_rd_n        (sdram_0_s1_read_n),
      .az_wr_n        (sdram_0_s1_write_n),
      .clk            (altpll_0_c0_out),
      .reset_n        (sdram_0_s1_reset_n),
      .za_data        (sdram_0_s1_readdata),
      .za_valid       (sdram_0_s1_readdatavalid),
      .za_waitrequest (sdram_0_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram_0),
      .zs_ba          (zs_ba_from_the_sdram_0),
      .zs_cas_n       (zs_cas_n_from_the_sdram_0),
      .zs_cke         (zs_cke_from_the_sdram_0),
      .zs_cs_n        (zs_cs_n_from_the_sdram_0),
      .zs_dq          (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm         (zs_dqm_from_the_sdram_0),
      .zs_ras_n       (zs_ras_n_from_the_sdram_0),
      .zs_we_n        (zs_we_n_from_the_sdram_0)
    );

  sysid_0_control_slave_arbitrator the_sysid_0_control_slave
    (
      .clk                                                          (altpll_0_c0_out),
      .d1_sysid_0_control_slave_end_xfer                            (d1_sysid_0_control_slave_end_xfer),
      .new_work_clock_0_out_address_to_slave                        (new_work_clock_0_out_address_to_slave),
      .new_work_clock_0_out_granted_sysid_0_control_slave           (new_work_clock_0_out_granted_sysid_0_control_slave),
      .new_work_clock_0_out_nativeaddress                           (new_work_clock_0_out_nativeaddress),
      .new_work_clock_0_out_qualified_request_sysid_0_control_slave (new_work_clock_0_out_qualified_request_sysid_0_control_slave),
      .new_work_clock_0_out_read                                    (new_work_clock_0_out_read),
      .new_work_clock_0_out_read_data_valid_sysid_0_control_slave   (new_work_clock_0_out_read_data_valid_sysid_0_control_slave),
      .new_work_clock_0_out_requests_sysid_0_control_slave          (new_work_clock_0_out_requests_sysid_0_control_slave),
      .new_work_clock_0_out_write                                   (new_work_clock_0_out_write),
      .reset_n                                                      (altpll_0_c0_out_reset_n),
      .sysid_0_control_slave_address                                (sysid_0_control_slave_address),
      .sysid_0_control_slave_readdata                               (sysid_0_control_slave_readdata),
      .sysid_0_control_slave_readdata_from_sa                       (sysid_0_control_slave_readdata_from_sa)
    );

  sysid_0 the_sysid_0
    (
      .address  (sysid_0_control_slave_address),
      .readdata (sysid_0_control_slave_readdata)
    );

  tri_state_bridge_0_avalon_slave_arbitrator the_tri_state_bridge_0_avalon_slave
    (
      .address_to_the_cfi_flash_0                                       (address_to_the_cfi_flash_0),
      .cfi_flash_0_s1_wait_counter_eq_0                                 (cfi_flash_0_s1_wait_counter_eq_0),
      .clk                                                              (altpll_0_c0_out),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                      (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash_0                                 (data_to_and_from_the_cfi_flash_0),
      .incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_0_with_Xs_converted_to_0),
      .new_work_clock_5_out_address_to_slave                            (new_work_clock_5_out_address_to_slave),
      .new_work_clock_5_out_granted_cfi_flash_0_s1                      (new_work_clock_5_out_granted_cfi_flash_0_s1),
      .new_work_clock_5_out_qualified_request_cfi_flash_0_s1            (new_work_clock_5_out_qualified_request_cfi_flash_0_s1),
      .new_work_clock_5_out_read                                        (new_work_clock_5_out_read),
      .new_work_clock_5_out_read_data_valid_cfi_flash_0_s1              (new_work_clock_5_out_read_data_valid_cfi_flash_0_s1),
      .new_work_clock_5_out_requests_cfi_flash_0_s1                     (new_work_clock_5_out_requests_cfi_flash_0_s1),
      .new_work_clock_5_out_write                                       (new_work_clock_5_out_write),
      .new_work_clock_5_out_writedata                                   (new_work_clock_5_out_writedata),
      .new_work_clock_6_out_address_to_slave                            (new_work_clock_6_out_address_to_slave),
      .new_work_clock_6_out_granted_cfi_flash_0_s1                      (new_work_clock_6_out_granted_cfi_flash_0_s1),
      .new_work_clock_6_out_qualified_request_cfi_flash_0_s1            (new_work_clock_6_out_qualified_request_cfi_flash_0_s1),
      .new_work_clock_6_out_read                                        (new_work_clock_6_out_read),
      .new_work_clock_6_out_read_data_valid_cfi_flash_0_s1              (new_work_clock_6_out_read_data_valid_cfi_flash_0_s1),
      .new_work_clock_6_out_requests_cfi_flash_0_s1                     (new_work_clock_6_out_requests_cfi_flash_0_s1),
      .new_work_clock_6_out_write                                       (new_work_clock_6_out_write),
      .new_work_clock_6_out_writedata                                   (new_work_clock_6_out_writedata),
      .read_n_to_the_cfi_flash_0                                        (read_n_to_the_cfi_flash_0),
      .reset_n                                                          (altpll_0_c0_out_reset_n),
      .select_n_to_the_cfi_flash_0                                      (select_n_to_the_cfi_flash_0),
      .write_n_to_the_cfi_flash_0                                       (write_n_to_the_cfi_flash_0)
    );

  //reset is asserted asynchronously and deasserted synchronously
  new_work_reset_clk_0_domain_synch_module new_work_reset_clk_0_domain_synch
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
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  new_work_reset_altpll_0_c0_out_domain_synch_module new_work_reset_altpll_0_c0_out_domain_synch
    (
      .clk      (altpll_0_c0_out),
      .data_in  (1'b1),
      .data_out (altpll_0_c0_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //new_work_burst_0_upstream_writedata of type writedata does not connect to anything so wire it to default (0)
  assign new_work_burst_0_upstream_writedata = 0;

  //new_work_burst_1_upstream_writedata of type writedata does not connect to anything so wire it to default (0)
  assign new_work_burst_1_upstream_writedata = 0;

  //new_work_burst_2_upstream_writedata of type writedata does not connect to anything so wire it to default (0)
  assign new_work_burst_2_upstream_writedata = 0;

  //new_work_burst_3_upstream_writedata of type writedata does not connect to anything so wire it to default (0)
  assign new_work_burst_3_upstream_writedata = 0;

  //new_work_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_0_out_endofpacket = 0;

  //new_work_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_1_out_endofpacket = 0;

  //new_work_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_2_out_endofpacket = 0;

  //new_work_clock_3_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_3_out_endofpacket = 0;

  //new_work_clock_4_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_4_out_endofpacket = 0;

  //new_work_clock_5_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_5_out_endofpacket = 0;

  //new_work_clock_6_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign new_work_clock_6_out_endofpacket = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_0_lane0_module (
                                  // inputs:
                                   data,
                                   rdaddress,
                                   rdclken,
                                   wraddress,
                                   wrclock,
                                   wren,

                                  // outputs:
                                   q
                                )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_0_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_0_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_0_lane1_module (
                                  // inputs:
                                   data,
                                   rdaddress,
                                   rdclken,
                                   wraddress,
                                   wrclock,
                                   wren,

                                  // outputs:
                                   q
                                )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 20: 0] rdaddress;
  input            rdclken;
  input   [ 20: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [2097151: 0];
  wire    [  7: 0] q;
  reg     [ 20: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_0_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_0_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 21,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_0 (
                     // inputs:
                      address,
                      read_n,
                      select_n,
                      write_n,

                     // outputs:
                      data
                   )
;

  inout   [ 15: 0] data;
  input   [ 20: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_0_lane0, which is an e_ram
  cfi_flash_0_lane0_module cfi_flash_0_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //cfi_flash_0_lane1, which is an e_ram
  cfi_flash_0_lane1_module cfi_flash_0_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

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
`include "altpll_0.v"
`include "new_work_clock_5.v"
`include "new_work_burst_2.v"
`include "new_work_clock_4.v"
`include "new_work_clock_0.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.vo"
`include "new_work_clock_6.v"
`include "pio_0.v"
`include "sysid_0.v"
`include "new_work_burst_0.v"
`include "jtag_uart_0.v"
`include "sdram_0.v"
`include "new_work_clock_1.v"
`include "new_work_burst_1.v"
`include "new_work_clock_3.v"
`include "new_work_clock_2.v"
`include "new_work_burst_3.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 21: 0] address_to_the_cfi_flash_0;
  wire             altpll_0_c0_out;
  wire             clk;
  reg              clk_0;
  wire             cpu_resetrequest_to_the_cpu_0;
  wire             cpu_resettaken_from_the_cpu_0;
  wire    [ 15: 0] data_to_and_from_the_cfi_flash_0;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_altpll_0;
  wire    [ 10: 0] new_work_burst_0_downstream_nativeaddress;
  wire    [ 31: 0] new_work_burst_0_upstream_writedata;
  wire             new_work_burst_1_downstream_debugaccess;
  wire    [  2: 0] new_work_burst_1_downstream_nativeaddress;
  wire    [ 31: 0] new_work_burst_1_upstream_writedata;
  wire             new_work_burst_2_downstream_debugaccess;
  wire    [ 15: 0] new_work_burst_2_upstream_writedata;
  wire             new_work_burst_3_downstream_debugaccess;
  wire    [ 15: 0] new_work_burst_3_upstream_writedata;
  wire             new_work_clock_0_in_endofpacket_from_sa;
  wire             new_work_clock_0_out_endofpacket;
  wire             new_work_clock_1_in_endofpacket_from_sa;
  wire             new_work_clock_1_out_endofpacket;
  wire             new_work_clock_2_in_endofpacket_from_sa;
  wire             new_work_clock_2_out_endofpacket;
  wire    [ 21: 0] new_work_clock_2_out_nativeaddress;
  wire             new_work_clock_3_in_endofpacket_from_sa;
  wire             new_work_clock_3_out_endofpacket;
  wire    [ 21: 0] new_work_clock_3_out_nativeaddress;
  wire             new_work_clock_4_in_endofpacket_from_sa;
  wire             new_work_clock_4_out_endofpacket;
  wire             new_work_clock_5_in_endofpacket_from_sa;
  wire             new_work_clock_5_out_endofpacket;
  wire    [ 20: 0] new_work_clock_5_out_nativeaddress;
  wire             new_work_clock_6_in_endofpacket_from_sa;
  wire             new_work_clock_6_out_endofpacket;
  wire    [ 20: 0] new_work_clock_6_out_nativeaddress;
  wire    [  7: 0] out_port_from_the_pio_0;
  wire             read_n_to_the_cfi_flash_0;
  reg              reset_n;
  wire             select_n_to_the_cfi_flash_0;
  wire             write_n_to_the_cfi_flash_0;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  new_work DUT
    (
      .address_to_the_cfi_flash_0       (address_to_the_cfi_flash_0),
      .altpll_0_c0_out                  (altpll_0_c0_out),
      .clk_0                            (clk_0),
      .cpu_resetrequest_to_the_cpu_0    (cpu_resetrequest_to_the_cpu_0),
      .cpu_resettaken_from_the_cpu_0    (cpu_resettaken_from_the_cpu_0),
      .data_to_and_from_the_cfi_flash_0 (data_to_and_from_the_cfi_flash_0),
      .locked_from_the_altpll_0         (locked_from_the_altpll_0),
      .out_port_from_the_pio_0          (out_port_from_the_pio_0),
      .read_n_to_the_cfi_flash_0        (read_n_to_the_cfi_flash_0),
      .reset_n                          (reset_n),
      .select_n_to_the_cfi_flash_0      (select_n_to_the_cfi_flash_0),
      .write_n_to_the_cfi_flash_0       (write_n_to_the_cfi_flash_0),
      .zs_addr_from_the_sdram_0         (zs_addr_from_the_sdram_0),
      .zs_ba_from_the_sdram_0           (zs_ba_from_the_sdram_0),
      .zs_cas_n_from_the_sdram_0        (zs_cas_n_from_the_sdram_0),
      .zs_cke_from_the_sdram_0          (zs_cke_from_the_sdram_0),
      .zs_cs_n_from_the_sdram_0         (zs_cs_n_from_the_sdram_0),
      .zs_dq_to_and_from_the_sdram_0    (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm_from_the_sdram_0          (zs_dqm_from_the_sdram_0),
      .zs_ras_n_from_the_sdram_0        (zs_ras_n_from_the_sdram_0),
      .zs_we_n_from_the_sdram_0         (zs_we_n_from_the_sdram_0)
    );

  cfi_flash_0 the_cfi_flash_0
    (
      .address  (address_to_the_cfi_flash_0[21 : 1]),
      .data     (data_to_and_from_the_cfi_flash_0),
      .read_n   (read_n_to_the_cfi_flash_0),
      .select_n (select_n_to_the_cfi_flash_0),
      .write_n  (write_n_to_the_cfi_flash_0)
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