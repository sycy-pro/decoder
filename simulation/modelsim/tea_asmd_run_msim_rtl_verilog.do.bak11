transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/krzys/Programs/Verilog/SYCY/TEA_ASMD {C:/Users/krzys/Programs/Verilog/SYCY/TEA_ASMD/brute_force.sv}
vlog -sv -work work +incdir+C:/Users/krzys/Programs/Verilog/SYCY/TEA_ASMD {C:/Users/krzys/Programs/Verilog/SYCY/TEA_ASMD/tea_asmd.sv}

