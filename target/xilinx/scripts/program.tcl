# Copyright 2018 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Florian Zaruba <zarubaf@iis.ee.ethz.ch>
# Description: Program Genesys II

open_hw

connect_hw_server -url $::env(HOST):$::env(PORT)

open_hw_target $::env(HOST):$::env(PORT)/$::env(FPGA_PATH)

current_hw_device [get_hw_devices xcvu37p_0]

write_cfgmem -force -format mcs -size 256 -interface SPIx4 \
  -loaddata "up 0 ../../cheshire/sw/boot/zsl.rom.bin" \
  -checksum \
  -file $mcs_file
