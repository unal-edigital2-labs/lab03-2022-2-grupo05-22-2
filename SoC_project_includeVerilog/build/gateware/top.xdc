################################################################################
# IO constraints
################################################################################
# serial:0.tx
set_property LOC D4 [get_ports {serial_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_tx}]

# serial:0.rx
set_property LOC C4 [get_ports {serial_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {serial_rx}]

# clk:0
set_property LOC E3 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# cpu_reset:0
set_property LOC C12 [get_ports {cpu_reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {cpu_reset}]

# led:0
set_property LOC H17 [get_ports {led0}]
set_property IOSTANDARD LVCMOS33 [get_ports {led0}]

# led:1
set_property LOC K15 [get_ports {led1}]
set_property IOSTANDARD LVCMOS33 [get_ports {led1}]

# led:2
set_property LOC J13 [get_ports {led2}]
set_property IOSTANDARD LVCMOS33 [get_ports {led2}]

# sw:0
set_property LOC J15 [get_ports {sw0}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw0}]

# sw:1
set_property LOC L16 [get_ports {sw1}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw1}]

# sw:2
set_property LOC M13 [get_ports {sw2}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw2}]

# sw:3
set_property LOC R15 [get_ports {sw3}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw3}]

# btnc:0
set_property LOC N17 [get_ports {btnc}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnc}]

# btnd:0
set_property LOC P18 [get_ports {btnd}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnd}]

# btnu:0
set_property LOC M18 [get_ports {btnu}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnu}]

# ledRGB:1.r
set_property LOC N15 [get_ports {ledRGB1_r}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_r}]

# ledRGB:1.g
set_property LOC M16 [get_ports {ledRGB1_g}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_g}]

# ledRGB:1.b
set_property LOC R12 [get_ports {ledRGB1_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledRGB1_b}]

# pwm__:1
set_property LOC V14 [get_ports {pwm__1}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwm__1}]

# servo_n:1.servo_o
set_property LOC D14 [get_ports {servo_n1_servo_o}]
set_property IOSTANDARD LVCMOS33 [get_ports {servo_n1_servo_o}]

# temp_n:1.data_temp
set_property LOC F16 [get_ports {temp_n1_data_temp}]
set_property IOSTANDARD LVCMOS33 [get_ports {temp_n1_data_temp}]

# valvula_pin:1.sal_val
set_property LOC G16 [get_ports {valvula_pin1_sal_val}]
set_property IOSTANDARD LVCMOS33 [get_ports {valvula_pin1_sal_val}]

# MQ3_pin:1.Alcohol_ent
set_property LOC C17 [get_ports {MQ3_pin1_Alcohol_ent}]
set_property IOSTANDARD LVCMOS33 [get_ports {MQ3_pin1_Alcohol_ent}]

# Nivel_pin:1.Ent_nivel0
set_property LOC D18 [get_ports {Nivel_pin1_Ent_nivel0}]
set_property IOSTANDARD LVCMOS33 [get_ports {Nivel_pin1_Ent_nivel0}]

# Nivel_pin:1.Ent_nivel1
set_property LOC E18 [get_ports {Nivel_pin1_Ent_nivel1}]
set_property IOSTANDARD LVCMOS33 [get_ports {Nivel_pin1_Ent_nivel1}]

# mod_pin_verilog:1.xclk
set_property LOC V12 [get_ports {mod_pin_verilog1_xclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {mod_pin_verilog1_xclk}]

# mod_pin_verilog:1.salida_led
set_property LOC V11 [get_ports {mod_pin_verilog1_salida_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {mod_pin_verilog1_salida_led}]

################################################################################
# Design constraints
################################################################################

set_property INTERNAL_VREF 0.750 [get_iobanks 34]

################################################################################
# Clock constraints
################################################################################


################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]