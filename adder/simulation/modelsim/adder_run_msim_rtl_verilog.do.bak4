transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/adder {D:/WORKPLACE/VerilogPRJ/adder/adder.v}

vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/adder/simulation/modelsim {D:/WORKPLACE/VerilogPRJ/adder/simulation/modelsim/adder.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc" adder_0

add wave *
view structure
view signals
run -all
