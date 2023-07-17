# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

###################
# Global Settings #
###################

# Preserve the output mux of the clock divider
set_property DONT_TOUCH TRUE [get_cells i_sys_clk_div/i_clk_bypass_mux]

# Synchronous reset
set SOC_RST_SRC [get_pins -filter {DIRECTION == OUT} -leaf -of_objects [get_nets rst_n]]

#####################
# Timing Parameters #
#####################

# 20 MHz SoC clock
set SOC_TCK 50.0

# 10 MHz (max) JTAG clock
set JTAG_TCK 100.0

# I2C High-speed mode is 3.2 Mb/s
set I2C_IO_SPEED 312.5

# UART speed is at most 5 Mb/s
set UART_IO_SPEED 200.0

##########
# Clocks #
##########

# Clk_wiz clocks
create_clock -period 100 -name clk_10 [get_pins i_xlnx_clk_wiz/clk_10]
create_clock -period 50 -name clk_20 [get_pins i_xlnx_clk_wiz/clk_20]
create_clock -period 20 -name clk_50 [get_pins i_xlnx_clk_wiz/clk_50]
create_clock -period 10 -name clk_100 [get_pins i_xlnx_clk_wiz/clk_100]

# System Clock
# [see in board.xdc]

# JTAG Clock
create_clock -period $JTAG_TCK -name clk_jtag [get_ports jtag_tck_i]
set_input_jitter clk_jtag 1.000

################
# Clock Groups #
################

# JTAG Clock is asynchronous to all other clocks
set_clock_groups -name jtag_async -asynchronous -group {clk_jtag}

########
# JTAG #
########

set_input_delay  -min -clock clk_jtag [expr 0.10 * $JTAG_TCK] [get_ports {jtag_tdi_i jtag_tms_i}]
set_input_delay  -max -clock clk_jtag [expr 0.20 * $JTAG_TCK] [get_ports {jtag_tdi_i jtag_tms_i}]

set_output_delay -min -clock clk_jtag [expr 0.10 * $JTAG_TCK] [get_ports jtag_tdo_o]
set_output_delay -max -clock clk_jtag [expr 0.20 * $JTAG_TCK] [get_ports jtag_tdo_o]

set_max_delay  -from [get_ports jtag_trst_ni] $JTAG_TCK
set_false_path -hold -from [get_ports jtag_trst_ni]

########
# UART #
########

set_max_delay [expr $UART_IO_SPEED * 0.35] -from [get_ports uart_rx_i]
set_false_path -hold -from [get_ports uart_rx_i]

set_max_delay [expr $UART_IO_SPEED * 0.35] -to [get_ports uart_tx_o]
set_false_path -hold -to [get_ports uart_tx_o]

########
# CDCs #
########

# cdc_fifo_gray: Disable hold checks, limit datapath delay and bus skew
set_property KEEP_HIERARCHY SOFT [get_cells i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*i_sync]
set_false_path -hold -through [get_pins -of_objects [get_cells i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*]] -through [get_pins -of_objects [get_cells i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*]]
set_max_delay -datapath -from [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*reg*/C] -to [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_dst_*/*i_sync/reg*/D] $FPGA_TCK
set_max_delay -datapath -from [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*reg*/C] -to [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_src_*/*i_sync/reg*/D] $FPGA_TCK
set_max_delay -datapath -from [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*reg*/C] -to [get_pins i_dram_wrapper/i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] $FPGA_TCK

set_false_path -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME == axi_cdc_src || REF_NAME == axi_cdc_src}] -filter {NAME =~ *async*}]
set_false_path -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME == axi_cdc_dst || REF_NAME == axi_cdc_dst}] -filter {NAME =~ *async*}]


####################
# Reset Generators #
####################

set_max_delay -from $SOC_RST_SRC $SOC_TCK
set_false_path -hold -from $SOC_RST_SRC
set_false_path -hold -through [get_pins i_carfield/i_carfield_rstgen/rsts_no]
set_false_path -hold -through [get_pins i_carfield/i_carfield_rstgen/pwr_on_rsts_no]
set_false_path -hold -through [get_pins -filter {REF_PIN_NAME == rst_no} -of_objects [get_cells -hier -filter {REF_NAME == rstgen || ORIG_REF_NAME == rstgen}]]
