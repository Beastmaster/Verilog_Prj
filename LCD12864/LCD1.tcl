# Copyright (C) 1991-2009 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: LCD1.tcl
# Generated on: Wed Aug 07 02:45:32 2013

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "LCD1"]} {
		puts "Project LCD1 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists LCD1]} {
		project_open -revision LCD1 LCD1
	} else {
		project_new -revision LCD1 LCD1
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone II"
	set_global_assignment -name DEVICE EP2C5T144C8
	set_global_assignment -name TOP_LEVEL_ENTITY cpu_0
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION "9.0 SP2"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "23:03:36  MAY 29, 2013"
	set_global_assignment -name LAST_QUARTUS_VERSION "9.0 SP2"
	set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_blast_fpga
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name VERILOG_FILE LCD1.v
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
	set_global_assignment -name MISC_FILE "D:/WORKPLACE/VerilogPRJ/LCD12864/LCD1.dpf"
	set_global_assignment -name VECTOR_WAVEFORM_FILE LCD1_t.vwf
	set_global_assignment -name INCREMENTAL_VECTOR_INPUT_SOURCE LCD1_t.vwf
	set_global_assignment -name INCREMENTAL_COMPILATION OFF
	set_global_assignment -name QIP_FILE lcd_1.qip
	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
