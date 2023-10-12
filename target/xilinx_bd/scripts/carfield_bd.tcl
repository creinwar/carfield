
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu37p-fsvh2892-2L-e
   set_property BOARD_PART xilinx.com:vcu128:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
ethz.ch:user:carfield_xilinx_ip:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:ddr4:2.2\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:util_ds_buf:2.1\
xilinx.com:ip:vio:3.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_sdram [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram ]

  set sys_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $sys_clk


  # Create ports
  set jtag_gnd_o [ create_bd_port -dir O jtag_gnd_o ]
  set jtag_tck_i [ create_bd_port -dir I jtag_tck_i ]
  set jtag_tdi_i [ create_bd_port -dir I jtag_tdi_i ]
  set jtag_tdo_o [ create_bd_port -dir O jtag_tdo_o ]
  set jtag_tms_i [ create_bd_port -dir I jtag_tms_i ]
  set jtag_vdd_o [ create_bd_port -dir O jtag_vdd_o ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set uart_rx_i [ create_bd_port -dir I uart_rx_i ]
  set uart_tx_o [ create_bd_port -dir O uart_tx_o ]

  # Create instance: carfield_xilinx_ip_0, and set properties
  set carfield_xilinx_ip_0 [ create_bd_cell -type ip -vlnv ethz.ch:user:carfield_xilinx_ip:1.0 carfield_xilinx_ip_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {188.586} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10.000} \
   CONFIG.CLKOUT1_USED {true} \
   CONFIG.CLKOUT2_JITTER {162.167} \
   CONFIG.CLKOUT2_PHASE_ERROR {87.180} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {20.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {132.683} \
   CONFIG.CLKOUT3_PHASE_ERROR {87.180} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_JITTER {115.831} \
   CONFIG.CLKOUT4_PHASE_ERROR {87.180} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
   CONFIG.CLK_OUT1_PORT {clk_10} \
   CONFIG.CLK_OUT2_PORT {clk_20} \
   CONFIG.CLK_OUT3_PORT {clk_50} \
   CONFIG.CLK_OUT4_PORT {clk_100} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {120.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {60} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {24} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {12} \
   CONFIG.NUM_OUT_CLKS {4} \
   CONFIG.PRIM_SOURCE {No_buffer} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
   CONFIG.USE_LOCKED {false} \
 ] $clk_wiz_0

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.ADDN_UI_CLKOUT1_FREQ_HZ {None} \
   CONFIG.C0_CLOCK_BOARD_INTERFACE {Custom} \
   CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram} \
   CONFIG.System_Clock {No_Buffer} \
 ] $ddr4_0

  # Create instance: high, and set properties
  set high [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 high ]

  # Create instance: low, and set properties
  set low [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 low ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $low

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.HAS_ARESETN {1} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property -dict [ list \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_1

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
   CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {Custom} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $util_ds_buf_0

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_EN_PROBE_IN_ACTIVITY {0} \
   CONFIG.C_NUM_PROBE_IN {0} \
   CONFIG.C_NUM_PROBE_OUT {2} \
   CONFIG.C_PROBE_OUT0_WIDTH {2} \
   CONFIG.C_PROBE_OUT1_WIDTH {2} \
 ] $vio_0

  # Create interface connections
  connect_bd_intf_net -intf_net carfield_xilinx_ip_0_dram_axi [get_bd_intf_pins carfield_xilinx_ip_0/dram_axi] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net carfield_xilinx_ip_0_periph_axi [get_bd_intf_pins carfield_xilinx_ip_0/periph_axi] [get_bd_intf_pins smartconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_sdram] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net diff_clock_rtl_1 [get_bd_intf_ports sys_clk] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI_CTRL] [get_bd_intf_pins smartconnect_1/M00_AXI]

  # Create port connections
  connect_bd_net -net carfield_xilinx_ip_0_dram_axi_m_aclk [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aclk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net carfield_xilinx_ip_0_dram_axi_m_aresetn [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net carfield_xilinx_ip_0_jtag_gnd_o [get_bd_ports jtag_gnd_o] [get_bd_pins carfield_xilinx_ip_0/jtag_gnd_o]
  connect_bd_net -net carfield_xilinx_ip_0_jtag_tdo_o [get_bd_ports jtag_tdo_o] [get_bd_pins carfield_xilinx_ip_0/jtag_tdo_o]
  connect_bd_net -net carfield_xilinx_ip_0_jtag_vdd_o [get_bd_ports jtag_vdd_o] [get_bd_pins carfield_xilinx_ip_0/jtag_vdd_o]
  connect_bd_net -net carfield_xilinx_ip_0_periph_axi_m_aclk [get_bd_pins carfield_xilinx_ip_0/periph_axi_m_aclk] [get_bd_pins smartconnect_1/aclk]
  connect_bd_net -net carfield_xilinx_ip_0_periph_axi_m_aresetn [get_bd_pins carfield_xilinx_ip_0/periph_axi_m_aresetn] [get_bd_pins smartconnect_1/aresetn]
  connect_bd_net -net carfield_xilinx_ip_0_uart_tx_o [get_bd_ports uart_tx_o] [get_bd_pins carfield_xilinx_ip_0/uart_tx_o]
  connect_bd_net -net clk_wiz_0_clk_10 [get_bd_pins carfield_xilinx_ip_0/clk_10] [get_bd_pins clk_wiz_0/clk_10]
  connect_bd_net -net clk_wiz_0_clk_20 [get_bd_pins carfield_xilinx_ip_0/clk_20] [get_bd_pins clk_wiz_0/clk_20]
  connect_bd_net -net clk_wiz_0_clk_50 [get_bd_pins carfield_xilinx_ip_0/clk_50] [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins vio_0/clk]
  connect_bd_net -net clk_wiz_0_clk_100 [get_bd_pins carfield_xilinx_ip_0/clk_100] [get_bd_pins clk_wiz_0/clk_100]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins smartconnect_0/aclk1] [get_bd_pins smartconnect_1/aclk1]
  connect_bd_net -net high_dout [get_bd_pins carfield_xilinx_ip_0/jtag_trst_ni] [get_bd_pins high/dout]
  connect_bd_net -net jtag_tck_i_1 [get_bd_ports jtag_tck_i] [get_bd_pins carfield_xilinx_ip_0/jtag_tck_i]
  connect_bd_net -net jtag_tdi_i_1 [get_bd_ports jtag_tdi_i] [get_bd_pins carfield_xilinx_ip_0/jtag_tdi_i]
  connect_bd_net -net jtag_tms_i_1 [get_bd_ports jtag_tms_i] [get_bd_pins carfield_xilinx_ip_0/jtag_tms_i]
  connect_bd_net -net low_dout [get_bd_pins carfield_xilinx_ip_0/testmode_i] [get_bd_pins low/dout]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins carfield_xilinx_ip_0/cpu_reset] [get_bd_pins clk_wiz_0/reset] [get_bd_pins ddr4_0/sys_rst]
  connect_bd_net -net uart_rx_i_1 [get_bd_ports uart_rx_i] [get_bd_pins carfield_xilinx_ip_0/uart_rx_i]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins ddr4_0/c0_sys_clk_i] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins carfield_xilinx_ip_0/boot_mode_i] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net vio_0_probe_out1 [get_bd_pins carfield_xilinx_ip_0/boot_mode_safety_i] [get_bd_pins vio_0/probe_out1]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces carfield_xilinx_ip_0/dram_axi] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces carfield_xilinx_ip_0/periph_axi] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


