connect -url tcp:127.0.0.1:3121
source C:/hw1_zybo/hw1_zybo.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655836A"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279655836A" && level==0} -index 1
fpga -file C:/hw1_zybo/hw1_zybo.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655836A"} -index 0
loadhw C:/hw1_zybo/hw1_zybo.sdk/design_1_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655836A"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279655836A"} -index 0
dow C:/hw1_zybo/hw1_zybo.sdk/gpio_tutorial/Debug/gpio_tutorial.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279655836A"} -index 0
con
