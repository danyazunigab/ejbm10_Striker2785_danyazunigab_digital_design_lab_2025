transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {Decodificador.svo}

vlog -sv -work work +incdir+Z:/devWS/TallerDD/Laboratorios/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Laboratorio1/Problema1 {Z:/devWS/TallerDD/Laboratorios/ejbm10_Striker2785_danyazunigab_digital_design_lab_2025/Laboratorio1/Problema1/binary_to_bcd_testbench.sv}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L cyclonev_ver -L lpm_ver -L sgate_ver -L cyclonev_hssi_ver -L altera_mf_ver -L cyclonev_pcie_hip_ver -L gate_work -L work -voptargs="+acc"  bin_To_BCD

add wave *
view structure
view signals
run -all
