
set mcs_file spi_mem.mcs

# Create flash configuration file
write_cfgmem -force -format mcs -size 256 -interface SPIx4 \
  -loaddata "up 0 ../../cheshire/sw/boot/linux.gpt.bin" \
  -checksum \
  -file $mcs_file

# Open and connect HW manager
open_hw_manager
connect_hw_server -url $::env(HOST):$::env(PORT) -allow_non_jtag
current_hw_target [get_hw_targets */$::env(FPGA_PATH)]
set_property PARAM.FREQUENCY 15000000 [get_hw_targets */$::env(FPGA_PATH)]
open_hw_target
current_hw_device [get_hw_devices xcvu37p_0]

# Add the SPI flash as configuration memory
set hw_device [get_hw_devices xcvu37p_0]
create_hw_cfgmem -hw_device $hw_device [lindex [get_cfgmem_parts {mt25qu02g-spi-x1_x2_x4}] 0]
set hw_cfgmem [get_property PROGRAM.HW_CFGMEM $hw_device]
set_property PROGRAM.ADDRESS_RANGE  {use_file} $hw_cfgmem
set_property PROGRAM.FILES [list $mcs_file ] $hw_cfgmem
set_property PROGRAM.PRM_FILE {} $hw_cfgmem
set_property PROGRAM.UNUSED_PIN_TERMINATION {pull-none} $hw_cfgmem
set_property PROGRAM.BLANK_CHECK  0 $hw_cfgmem
set_property PROGRAM.ERASE  1 $hw_cfgmem
set_property PROGRAM.CFG_PROGRAM  1 $hw_cfgmem
set_property PROGRAM.VERIFY  1 $hw_cfgmem
set_property PROGRAM.CHECKSUM  0 $hw_cfgmem

# Create bitstream to access SPI flash
create_hw_bitstream -hw_device $hw_device [get_property PROGRAM.HW_CFGMEM_BITFILE $hw_device]; 
program_hw_devices $hw_device; 
refresh_hw_device $hw_device;

# Program SPI flash
program_hw_cfgmem -hw_cfgmem $hw_cfgmem

# Close connection
close_hw_manager