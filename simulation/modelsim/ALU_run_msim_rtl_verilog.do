transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/ShiftRightNBits.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/ShiftLeftNBits.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Shift1Bit.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/full_substractor.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_adder.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_substractor.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/ALU.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/seven_seg_decoder.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_and.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_multiplier.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_division.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_or.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/n_bit_xor.sv}

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
