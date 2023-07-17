# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName xlnx_clk_wiz

create_project $ipName . -force -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name $ipName

if {$::env(BOARD) eq "vcu128"} {
    set_property -dict  [list CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
                              CONFIG.RESET_BOARD_INTERFACE {Custom} \
                              CONFIG.CLKOUT2_USED {true} \
                              CONFIG.CLKOUT3_USED {true} \
                              CONFIG.CLKOUT4_USED {true} \
                              CONFIG.CLK_OUT1_PORT {clk_100} \
                              CONFIG.CLK_OUT2_PORT {clk_50} \
                              CONFIG.CLK_OUT3_PORT {clk_20} \
                              CONFIG.CLK_OUT4_PORT {clk_10} \
                              CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50.000} \
                              CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {20.000} \
                              CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {10.000} \
                              CONFIG.PRIM_SOURCE {No_buffer} \
                              CONFIG.USE_RESET {true} \
                              CONFIG.MMCM_CLKOUT1_DIVIDE {24} \
                              CONFIG.MMCM_CLKOUT2_DIVIDE {60} \
                              CONFIG.MMCM_CLKOUT3_DIVIDE {120} \
                              CONFIG.NUM_OUT_CLKS {4} \
                              CONFIG.CLKOUT2_JITTER {132.683} \
                              CONFIG.CLKOUT2_PHASE_ERROR {87.180} \
                              CONFIG.CLKOUT3_JITTER {162.167} \
                              CONFIG.CLKOUT3_PHASE_ERROR {87.180} \
                              CONFIG.CLKOUT4_JITTER {188.586} \
                              CONFIG.CLKOUT4_PHASE_ERROR {87.180} \
                        ] [get_ips $ipName]
}

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
