transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/def.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/param.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/write_back.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/mips32.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/execute.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/control.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/decode.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/reg_file.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/fetch.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/i_mem.sv}
vlog -sv -work work +incdir+F:/dev/mips_05 {F:/dev/mips_05/d_mem.sv}

