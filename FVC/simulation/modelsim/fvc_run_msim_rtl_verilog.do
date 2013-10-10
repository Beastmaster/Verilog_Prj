transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/FVC {D:/WORKPLACE/VerilogPRJ/FVC/fvc.v}
vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/FVC {D:/WORKPLACE/VerilogPRJ/FVC/dac_clk.v}

vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/FVC/simulation/modelsim {D:/WORKPLACE/VerilogPRJ/FVC/simulation/modelsim/fvc.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L maxii_ver -L rtl_work -L work -voptargs="+acc" fvc_test

add wave *
view structure
view signals
run -all
