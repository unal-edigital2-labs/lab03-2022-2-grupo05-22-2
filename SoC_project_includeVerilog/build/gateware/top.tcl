
# Create Project

create_project -force -name top -part xc7a100t-CSG324-1
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/GPIOv.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/servo_p.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/temperatura.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/Valvula.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/MQ3.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/module/verilog/Nivel_agua.v}
read_verilog {/home/rodrigo/pythondata-cpu-vexriscv/pythondata_cpu_vexriscv/verilog/VexRiscv.v}
read_verilog {/home/rodrigo/Documents/F/WP03_SoC_include_verilog/SoC_project_includeVerilog/build/gateware/top.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc top.xdc
set_property PROCESSING_ORDER EARLY [get_files top.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top top -part xc7a100t-CSG324-1

# Synthesis report

report_timing_summary -file top_timing_synth.rpt
report_utilization -hierarchical -file top_utilization_hierarchical_synth.rpt
report_utilization -file top_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file top_utilization_hierarchical_place.rpt
report_utilization -file top_utilization_place.rpt
report_io -file top_io.rpt
report_control_sets -verbose -file top_control_sets.rpt
report_clock_utilization -file top_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force top_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file top_route_status.rpt
report_drc -file top_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file top_timing.rpt
report_power -file top_power.rpt

# Bitstream generation

write_bitstream -force top.bit 

# End

quit