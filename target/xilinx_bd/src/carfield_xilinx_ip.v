// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>
// Just a verilog wrapper to accomodate Vivado


module carfield_xilinx_ip
(
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_HIGH" *)
  input  wire         cpu_reset          ,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock_rtl:1.0 clock clk_10" *)
  input  wire         clk_10             ,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock_rtl:1.0 clock clk_20" *)
  input  wire         clk_20             ,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock_rtl:1.0 clock clk_50" *)
  input  wire         clk_50             ,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock_rtl:1.0 clock clk_100" *)
  input  wire         clk_100            ,

  input  wire         testmode_i         ,
  input  wire [1:0]   boot_mode_i        ,
  input  wire [1:0]   boot_mode_safety_i ,

  input  wire         jtag_tck_i         ,
  input  wire         jtag_tms_i         ,
  input  wire         jtag_tdi_i         ,
  output wire         jtag_tdo_o         ,
  input  wire         jtag_trst_ni       ,
  output wire         jtag_vdd_o         ,
  output wire         jtag_gnd_o         ,

  output wire         uart_tx_o          ,
  input  wire         uart_rx_i          ,

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARADDR" *)
  output wire [47:0] dram_axi_m_axi_araddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARBURST" *)
  output wire [1:0] dram_axi_m_axi_arburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARCACHE" *)
  output wire [3:0] dram_axi_m_axi_arcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARID" *)
  output wire [6:0]dram_axi_m_axi_arid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARLEN" *)
  output wire [7:0] dram_axi_m_axi_arlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARLOCK" *)
  output wire dram_axi_m_axi_arlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARPROT" *)
  output wire [2:0] dram_axi_m_axi_arprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARQOS" *)
  output wire [3:0] dram_axi_m_axi_arqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARREADY" *)
  input  wire dram_axi_m_axi_arready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARSIZE" *)
  output wire [2:0] dram_axi_m_axi_arsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi ARVALID" *)
  output wire dram_axi_m_axi_arvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWADDR" *)
  output wire [47:0] dram_axi_m_axi_awaddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWBURST" *)
  output wire [1:0] dram_axi_m_axi_awburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWCACHE" *)
  output wire [3:0] dram_axi_m_axi_awcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWID" *)
  output wire [6:0] dram_axi_m_axi_awid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWLEN" *)
  output wire [7:0] dram_axi_m_axi_awlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWLOCK" *)
  output wire dram_axi_m_axi_awlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWPROT" *)
  output wire [2:0] dram_axi_m_axi_awprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWQOS" *)
  output wire [3:0] dram_axi_m_axi_awqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWREADY" *)
  input  wire dram_axi_m_axi_awready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWSIZE" *)
  output wire [2:0] dram_axi_m_axi_awsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi AWVALID" *)
  output wire dram_axi_m_axi_awvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi BID" *)
  input  wire [6:0] dram_axi_m_axi_bid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi BREADY" *)
  output wire dram_axi_m_axi_bready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi BRESP" *)
  input  wire [1:0] dram_axi_m_axi_bresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi BVALID" *)
  input  wire dram_axi_m_axi_bvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RDATA" *)
  input  wire [63:0] dram_axi_m_axi_rdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RID" *)
  input  wire [6:0] dram_axi_m_axi_rid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RLAST" *)
  input  wire dram_axi_m_axi_rlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RREADY" *)
  output wire dram_axi_m_axi_rready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RRESP" *)
  input  wire [1:0] dram_axi_m_axi_rresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi RVALID" *)
  input  wire dram_axi_m_axi_rvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi WDATA" *)
  output wire [63:0] dram_axi_m_axi_wdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi WLAST" *)
  output wire dram_axi_m_axi_wlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi WREADY" *)
  input  wire dram_axi_m_axi_wready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi WSTRB" *)
  output wire [7:0] dram_axi_m_axi_wstrb,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 dram_axi WVALID" *)
  output wire dram_axi_m_axi_wvalid,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dram_axi CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dram_axi, ASSOCIATED_BUSIF dram_axi" *)
  output wire dram_axi_m_aclk,
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aux_reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW" *)
  output wire dram_axi_m_aresetn,

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARADDR" *)
  output wire [47:0] periph_axi_m_axi_araddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARBURST" *)
  output wire [1:0] periph_axi_m_axi_arburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARCACHE" *)
  output wire [3:0] periph_axi_m_axi_arcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARID" *)
  output wire [1:0]periph_axi_m_axi_arid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARLEN" *)
  output wire [7:0] periph_axi_m_axi_arlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARLOCK" *)
  output wire periph_axi_m_axi_arlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARPROT" *)
  output wire [2:0] periph_axi_m_axi_arprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARQOS" *)
  output wire [3:0] periph_axi_m_axi_arqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARREADY" *)
  input  wire periph_axi_m_axi_arready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARSIZE" *)
  output wire [2:0] periph_axi_m_axi_arsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi ARVALID" *)
  output wire periph_axi_m_axi_arvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWADDR" *)
  output wire [47:0] periph_axi_m_axi_awaddr,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWBURST" *)
  output wire [1:0] periph_axi_m_axi_awburst,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWCACHE" *)
  output wire [3:0] periph_axi_m_axi_awcache,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWID" *)
  output wire [1:0] periph_axi_m_axi_awid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWLEN" *)
  output wire [7:0] periph_axi_m_axi_awlen,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWLOCK" *)
  output wire periph_axi_m_axi_awlock,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWPROT" *)
  output wire [2:0] periph_axi_m_axi_awprot,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWQOS" *)
  output wire [3:0] periph_axi_m_axi_awqos,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWREADY" *)
  input  wire periph_axi_m_axi_awready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWSIZE" *)
  output wire [2:0] periph_axi_m_axi_awsize,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi AWVALID" *)
  output wire periph_axi_m_axi_awvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi BID" *)
  input  wire [1:0] periph_axi_m_axi_bid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi BREADY" *)
  output wire periph_axi_m_axi_bready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi BRESP" *)
  input  wire [1:0] periph_axi_m_axi_bresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi BVALID" *)
  input  wire periph_axi_m_axi_bvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RDATA" *)
  input  wire [63:0] periph_axi_m_axi_rdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RID" *)
  input  wire [1:0] periph_axi_m_axi_rid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RLAST" *)
  input  wire periph_axi_m_axi_rlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RREADY" *)
  output wire periph_axi_m_axi_rready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RRESP" *)
  input  wire [1:0] periph_axi_m_axi_rresp,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi RVALID" *)
  input  wire periph_axi_m_axi_rvalid,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi WDATA" *)
  output wire [63:0] periph_axi_m_axi_wdata,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi WLAST" *)
  output wire periph_axi_m_axi_wlast,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi WREADY" *)
  input  wire periph_axi_m_axi_wready,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi WSTRB" *)
  output wire [7:0] periph_axi_m_axi_wstrb,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 periph_axi WVALID" *)
  output wire periph_axi_m_axi_wvalid,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 periph_axi CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME periph_axi, ASSOCIATED_BUSIF periph_axi" *)
  output wire periph_axi_m_aclk,
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aux_reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW" *)
  output wire periph_axi_m_aresetn
);

  carfield_xilinx i_carfield_xilinx (
  .cpu_reset(cpu_reset),
  .clk_10(clk_10),
  .clk_20(clk_20),
  .clk_50(clk_50),
  .clk_100(clk_100),

  .testmode_i        (testmode_i        ) ,
  .boot_mode_i       (boot_mode_i       ) ,
  .boot_mode_safety_i(boot_mode_safety_i) ,

  .jtag_tck_i  (jtag_tck_i   ),
  .jtag_tms_i  (jtag_tms_i   ),
  .jtag_tdi_i  (jtag_tdi_i   ),
  .jtag_tdo_o  (jtag_tdo_o   ),
  .jtag_trst_ni(jtag_trst_ni ),
  .jtag_vdd_o  (jtag_vdd_o   ),
  .jtag_gnd_o  (jtag_gnd_o   ),

  .uart_tx_o(uart_tx_o),
  .uart_rx_i(uart_rx_i),

  .dram_axi_m_aclk   (dram_axi_m_aclk   ),
  .dram_axi_m_aresetn(dram_axi_m_aresetn),

  // Dram axi

  .dram_axi_m_axi_awid   (dram_axi_m_axi_awid   ),
  .dram_axi_m_axi_awaddr (dram_axi_m_axi_awaddr ),
  .dram_axi_m_axi_awlen  (dram_axi_m_axi_awlen  ),
  .dram_axi_m_axi_awsize (dram_axi_m_axi_awsize ),
  .dram_axi_m_axi_awburst(dram_axi_m_axi_awburst),
  .dram_axi_m_axi_awlock (dram_axi_m_axi_awlock ),
  .dram_axi_m_axi_awcache(dram_axi_m_axi_awcache),
  .dram_axi_m_axi_awprot (dram_axi_m_axi_awprot ),
  .dram_axi_m_axi_awqos  (dram_axi_m_axi_awqos  ),
  .dram_axi_m_axi_awvalid(dram_axi_m_axi_awvalid),
  .dram_axi_m_axi_awready(dram_axi_m_axi_awready),

  .dram_axi_m_axi_wdata (dram_axi_m_axi_wdata ),
  .dram_axi_m_axi_wstrb (dram_axi_m_axi_wstrb ),
  .dram_axi_m_axi_wlast (dram_axi_m_axi_wlast ),
  .dram_axi_m_axi_wvalid(dram_axi_m_axi_wvalid),
  .dram_axi_m_axi_wready(dram_axi_m_axi_wready),

  .dram_axi_m_axi_bready(dram_axi_m_axi_bready),
  .dram_axi_m_axi_bid   (dram_axi_m_axi_bid   ),
  .dram_axi_m_axi_bresp (dram_axi_m_axi_bresp ),
  .dram_axi_m_axi_bvalid(dram_axi_m_axi_bvalid),

  .dram_axi_m_axi_arid   (dram_axi_m_axi_arid   ),
  .dram_axi_m_axi_araddr (dram_axi_m_axi_araddr ),
  .dram_axi_m_axi_arlen  (dram_axi_m_axi_arlen  ),
  .dram_axi_m_axi_arsize (dram_axi_m_axi_arsize ),
  .dram_axi_m_axi_arburst(dram_axi_m_axi_arburst),
  .dram_axi_m_axi_arlock (dram_axi_m_axi_arlock ),
  .dram_axi_m_axi_arcache(dram_axi_m_axi_arcache),
  .dram_axi_m_axi_arprot (dram_axi_m_axi_arprot ),
  .dram_axi_m_axi_arqos  (dram_axi_m_axi_arqos  ),
  .dram_axi_m_axi_arvalid(dram_axi_m_axi_arvalid),
  .dram_axi_m_axi_arready(dram_axi_m_axi_arready),

  .dram_axi_m_axi_rready(dram_axi_m_axi_rready),
  .dram_axi_m_axi_rid   (dram_axi_m_axi_rid   ),
  .dram_axi_m_axi_rdata (dram_axi_m_axi_rdata ),
  .dram_axi_m_axi_rresp (dram_axi_m_axi_rresp ),
  .dram_axi_m_axi_rlast (dram_axi_m_axi_rlast ),
  .dram_axi_m_axi_rvalid(dram_axi_m_axi_rvalid),

  // Peripheral axi

  .periph_axi_m_aclk   (periph_axi_m_aclk   ),
  .periph_axi_m_aresetn(periph_axi_m_aresetn),

  .periph_axi_m_axi_awid   (periph_axi_m_axi_awid   ),
  .periph_axi_m_axi_awaddr (periph_axi_m_axi_awaddr ),
  .periph_axi_m_axi_awlen  (periph_axi_m_axi_awlen  ),
  .periph_axi_m_axi_awsize (periph_axi_m_axi_awsize ),
  .periph_axi_m_axi_awburst(periph_axi_m_axi_awburst),
  .periph_axi_m_axi_awlock (periph_axi_m_axi_awlock ),
  .periph_axi_m_axi_awcache(periph_axi_m_axi_awcache),
  .periph_axi_m_axi_awprot (periph_axi_m_axi_awprot ),
  .periph_axi_m_axi_awqos  (periph_axi_m_axi_awqos  ),
  .periph_axi_m_axi_awvalid(periph_axi_m_axi_awvalid),
  .periph_axi_m_axi_awready(periph_axi_m_axi_awready),

  .periph_axi_m_axi_wdata (periph_axi_m_axi_wdata ),
  .periph_axi_m_axi_wstrb (periph_axi_m_axi_wstrb ),
  .periph_axi_m_axi_wlast (periph_axi_m_axi_wlast ),
  .periph_axi_m_axi_wvalid(periph_axi_m_axi_wvalid),
  .periph_axi_m_axi_wready(periph_axi_m_axi_wready),

  .periph_axi_m_axi_bready(periph_axi_m_axi_bready),
  .periph_axi_m_axi_bid   (periph_axi_m_axi_bid   ),
  .periph_axi_m_axi_bresp (periph_axi_m_axi_bresp ),
  .periph_axi_m_axi_bvalid(periph_axi_m_axi_bvalid),

  .periph_axi_m_axi_arid   (periph_axi_m_axi_arid   ),
  .periph_axi_m_axi_araddr (periph_axi_m_axi_araddr ),
  .periph_axi_m_axi_arlen  (periph_axi_m_axi_arlen  ),
  .periph_axi_m_axi_arsize (periph_axi_m_axi_arsize ),
  .periph_axi_m_axi_arburst(periph_axi_m_axi_arburst),
  .periph_axi_m_axi_arlock (periph_axi_m_axi_arlock ),
  .periph_axi_m_axi_arcache(periph_axi_m_axi_arcache),
  .periph_axi_m_axi_arprot (periph_axi_m_axi_arprot ),
  .periph_axi_m_axi_arqos  (periph_axi_m_axi_arqos  ),
  .periph_axi_m_axi_arvalid(periph_axi_m_axi_arvalid),
  .periph_axi_m_axi_arready(periph_axi_m_axi_arready),

  .periph_axi_m_axi_rready(periph_axi_m_axi_rready),
  .periph_axi_m_axi_rid   (periph_axi_m_axi_rid   ),
  .periph_axi_m_axi_rdata (periph_axi_m_axi_rdata ),
  .periph_axi_m_axi_rresp (periph_axi_m_axi_rresp ),
  .periph_axi_m_axi_rlast (periph_axi_m_axi_rlast ),
  .periph_axi_m_axi_rvalid(periph_axi_m_axi_rvalid)

  );

endmodule
