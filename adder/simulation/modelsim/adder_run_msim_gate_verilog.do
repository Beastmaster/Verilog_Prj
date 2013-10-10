transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {adder.vo}

vlog -vlog01compat -work work +incdir+D:/WORKPLACE/VerilogPRJ/adder/simulation/modelsim {D:/WORKPLACE/VerilogPRJ/adder/simulation/modelsim/adder.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneiii_ver -L gate_work -L work -voptargs="+acc" adder_0

add wave *
view structure
view signals
run -all
