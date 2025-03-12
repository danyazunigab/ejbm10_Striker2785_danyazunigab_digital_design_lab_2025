transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/Restador.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/and_gate.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/or_gate3.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/or_gate4.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/and_gate3.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/not_gate.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/ContadorRegresivo.sv}

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Problema_3/ContadorRegresivo_tb_2bits.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ContadorRegresivo_tb_2bits

add wave *
view structure
view signals
run -all
