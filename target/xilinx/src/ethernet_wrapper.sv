// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>


`include "cheshire/typedef.svh"
`include "phy_definitions.svh"
`include "common_cells/registers.svh"

module ethernet_wrapper_xilinx #(
    parameter type axi_soc_aw_chan_t = logic,
    parameter type axi_soc_w_chan_t  = logic,
    parameter type axi_soc_b_chan_t  = logic,
    parameter type axi_soc_ar_chan_t = logic,
    parameter type axi_soc_r_chan_t  = logic,
    parameter type axi_soc_req_t     = logic,
    parameter type axi_soc_resp_t    = logic
) (
    // System reset
    input                 sys_rst_i,
    input                 eth_clk_i,
    // Controller reset
    input                 soc_resetn_i,
    input                 soc_clk_i,
    // Phy interfaces
    input                 phy_tx_clk,
    input                 phy_rx_clk,
    input                 phy_crs,
    input                 phy_dv,
    input wire [3:0]      phy_rx_data,
    input                 phy_col,
    input                 phy_rx_er,
    output                phy_rst_n,
    output                phy_tx_en,
    output wire [3:0]     phy_tx_data,
    input                 phy_mdio_i,
    output                phy_mdio_o,
    output                phy_mdio_t,
    output                phy_mdc,
    // Eth axi interface
    input  axi_soc_req_t  soc_req_i,
    output axi_soc_resp_t soc_rsp_o
);

  ////////////////////////////////////
  // Configurations and definitions //
  ////////////////////////////////////

  typedef struct packed {
    bit EnCDC;
    integer IdWidth;
    integer AddrWidth;
    integer DataWidth;
    integer StrobeWidth;
  } eth_cfg_t;


  localparam eth_cfg_t cfg = '{
    EnCDC         : 1, // 100 MHz axi (attention CDC logdepth)
    IdWidth       : 4,
    AddrWidth     : 32,
    DataWidth     : 32,
    StrobeWidth   : 4
  };

  localparam SoC_DataWidth = $bits(soc_req_i.w.data);
  localparam SoC_IdWidth   = $bits(soc_req_i.ar.id);
  localparam SoC_UserWidth = $bits(soc_req_i.ar.user);
  localparam SoC_AddrWidth = $bits(soc_req_i.ar.addr);

  // Define type after data width and address resizer
  `AXI_TYPEDEF_ALL(axi_dw, logic[SoC_AddrWidth-1:0], logic[SoC_IdWidth-1:0],
                   logic[cfg.DataWidth-1:0], logic[cfg.StrobeWidth-1:0],
                   logic[SoC_UserWidth-1:0])

  // Define type after data & id width resizers
  `AXI_TYPEDEF_ALL(axi_dw_iw, logic[SoC_AddrWidth-1:0], logic[cfg.IdWidth-1:0],
                   logic[cfg.DataWidth-1:0], logic[cfg.StrobeWidth-1:0],
                   logic[SoC_UserWidth-1:0])

  // Clock on which is clocked the DRAM AXI
  logic eth_axi_clk, eth_rst_o;

  // Signals before resizing
  axi_soc_req_t  soc_dresizer_req;
  axi_soc_resp_t soc_dresizer_rsp;

  // Signals after data width resizing
  axi_dw_req_t  dresizer_iresizer_req;
  axi_dw_resp_t dresizer_iresizer_rsp;

  // Signals after id width resizing
  axi_dw_iw_req_t  iresizer_cdc_req, cdc_eth_req;
  axi_dw_iw_resp_t iresizer_cdc_rsp, cdc_eth_rsp;

  // Entry signals
  assign soc_dresizer_req = soc_req_i;
  assign soc_rsp_o = soc_dresizer_rsp;

  /////////////////////////////////////
  // Instianciate data width resizer //
  /////////////////////////////////////

  if (cfg.DataWidth != SoC_DataWidth) begin : gen_dw_converter
    axi_dw_converter #(
        .AxiMaxReads        (8),
        .AxiSlvPortDataWidth(SoC_DataWidth),
        .AxiMstPortDataWidth(cfg.DataWidth),
        .AxiAddrWidth       (SoC_AddrWidth),
        .AxiIdWidth         (SoC_IdWidth  ),
        // Common aw, ar, b
        .aw_chan_t          (axi_soc_aw_chan_t),
        .b_chan_t           (axi_soc_b_chan_t),
        .ar_chan_t          (axi_soc_ar_chan_t),
        // Master w, r
        .mst_w_chan_t       (axi_dw_w_chan_t),
        .mst_r_chan_t       (axi_dw_r_chan_t),
        .axi_mst_req_t      (axi_dw_req_t),
        .axi_mst_resp_t     (axi_dw_resp_t),
        // Slave w, r
        .slv_w_chan_t       (axi_soc_w_chan_t),
        .slv_r_chan_t       (axi_soc_r_chan_t),
        .axi_slv_req_t      (axi_soc_req_t),
        .axi_slv_resp_t     (axi_soc_resp_t)
    ) axi_dw_converter_ddr4 (
        .clk_i     (soc_clk_i),
        .rst_ni    (soc_resetn_i),
        .slv_req_i (soc_dresizer_req),
        .slv_resp_o(soc_dresizer_rsp),
        .mst_req_o (dresizer_iresizer_req),
        .mst_resp_i(dresizer_iresizer_rsp)
    );
  end else begin : gen_no_dw_converter
    assign dresizer_iresizer_req = soc_dresizer_req;
    assign soc_dresizer_rsp      = dresizer_iresizer_rsp;
  end

  /////////////////
  // ID resizer  //
  /////////////////

if (cfg.IdWidth != SoC_IdWidth) begin : gen_iw_converter
  axi_iw_converter #(
    .AxiAddrWidth          ( SoC_AddrWidth    ),
    .AxiDataWidth          ( cfg.DataWidth    ),
    .AxiUserWidth          ( SoC_UserWidth    ),
    .AxiSlvPortIdWidth     ( SoC_IdWidth      ),
    .AxiSlvPortMaxUniqIds  ( 1                ),
    .AxiSlvPortMaxTxnsPerId( 1                ),
    .AxiSlvPortMaxTxns     ( 1                ),
    .AxiMstPortIdWidth     ( cfg.IdWidth      ),
    .AxiMstPortMaxUniqIds  ( 1                ),
    .AxiMstPortMaxTxnsPerId( 1                ),
    .slv_req_t             ( axi_dw_req_t     ),
    .slv_resp_t            ( axi_dw_resp_t    ),
    .mst_req_t             ( axi_dw_iw_req_t  ),
    .mst_resp_t            ( axi_dw_iw_resp_t )
  ) i_axi_iw_convert (
    .clk_i      ( soc_clk_i             ),
    .rst_ni     ( soc_resetn_i          ),
    .slv_req_i  ( dresizer_iresizer_req ),
    .slv_resp_o ( dresizer_iresizer_rsp ),
    .mst_req_o  ( iresizer_cdc_req      ),
    .mst_resp_i ( iresizer_cdc_rsp      )
  );
  end else begin : gen_no_iw_converter
    assign iresizer_cdc_req = dresizer_iresizer_req;
    assign dresizer_iresizer_rsp = iresizer_cdc_rsp;
  end

  //////////////////////
  // Instianciate CDC //
  //////////////////////

  if (cfg.EnCDC) begin : gen_cdc
    axi_cdc #(
        .aw_chan_t (axi_dw_iw_aw_chan_t),
        .w_chan_t  (axi_dw_iw_w_chan_t),
        .b_chan_t  (axi_dw_iw_b_chan_t),
        .ar_chan_t (axi_dw_iw_ar_chan_t),
        .r_chan_t  (axi_dw_iw_r_chan_t),
        .axi_req_t (axi_dw_iw_req_t),
        .axi_resp_t(axi_dw_iw_resp_t),
        .LogDepth  (4)
    ) i_axi_cdc_mig (
        .src_clk_i (soc_clk_i),
        .src_rst_ni(soc_resetn_i),
        .src_req_i (iresizer_cdc_req),
        .src_resp_o(iresizer_cdc_rsp),
        .dst_clk_i (eth_axi_clk),
        .dst_rst_ni(~eth_rst_o),
        .dst_req_o (cdc_eth_req),
        .dst_resp_i(cdc_eth_rsp)
    );
  end else begin : gen_no_cdc
    assign cdc_eth_req     = iresizer_cdc_req;
    assign iresizer_cdc_rsp = cdc_eth_rsp;
  end

  ///////////////////////
  // User and address  //
  ///////////////////////

  assign cdc_eth_rsp.b.user = '0;
  assign cdc_eth_rsp.r.user = '0;

  logic [cfg.AddrWidth-1:0] cdc_eth_req_aw_addr;
  logic [cfg.AddrWidth-1:0] cdc_eth_req_ar_addr;

  assign cdc_eth_req_aw_addr = cdc_eth_req.aw.addr[cfg.AddrWidth-1:0];
  assign cdc_eth_req_ar_addr = cdc_eth_req.ar.addr[cfg.AddrWidth-1:0];


  ///////////////////////////
  // Instianciate Ethernet //
  ///////////////////////////

  xlnx_ethernet_lite i_ethernet (
    // Clk rst 
    .s_axi_aresetn           (sys_rst_i), // Active high
    .s_axi_aclk              (eth_clk_i),
    // Axi
    // .s_axi_awid        (cdc_eth_req_awid),
    .s_axi_awaddr      (cdc_eth_req_awaddr),
    .s_axi_awlen       (cdc_eth_req.aw.len),
    .s_axi_awsize      (cdc_eth_req.aw.size),
    .s_axi_awburst     (cdc_eth_req.aw.burst),
    // .s_axi_awlock      (cdc_eth_req.aw.lock),
    .s_axi_awcache     (cdc_eth_req.aw.cache),
    // .s_axi_awprot      (cdc_eth_req.aw.prot),
    // .s_axi_awqos       (cdc_eth_req.aw.qos),
    .s_axi_awvalid     (cdc_eth_req.aw_valid),
    .s_axi_awready     (cdc_eth_rsp.aw_ready),
    .s_axi_wdata       (cdc_eth_req.w.data),
    .s_axi_wstrb       (cdc_eth_req.w.strb),
    .s_axi_wlast       (cdc_eth_req.w.last),
    .s_axi_wvalid      (cdc_eth_req.w_valid),
    .s_axi_wready      (cdc_eth_rsp.w_ready),
    .s_axi_bready      (cdc_eth_req.b_ready),
    // .s_axi_bid         (cdc_eth_rsp_bid),
    .s_axi_bresp       (cdc_eth_rsp.b.resp),
    .s_axi_bvalid      (cdc_eth_rsp.b_valid),
    // .s_axi_arid        (cdc_eth_req_arid),
    .s_axi_araddr      (cdc_eth_req_araddr),
    .s_axi_arlen       (cdc_eth_req.ar.len),
    .s_axi_arsize      (cdc_eth_req.ar.size),
    .s_axi_arburst     (cdc_eth_req.ar.burst),
    // .s_axi_arlock      (cdc_eth_req.ar.lock),
    .s_axi_arcache     (cdc_eth_req.ar.cache),
    // .s_axi_arprot      (cdc_eth_req.ar.prot),
    // .s_axi_arqos       (cdc_eth_req.ar.qos),
    .s_axi_arvalid     (cdc_eth_req.ar_valid),
    .s_axi_arready     (cdc_eth_rsp.ar_ready),
    .s_axi_rready      (cdc_eth_req.r_ready),
    // .s_axi_rid         (cdc_eth_rsp_rid),
    .s_axi_rdata       (cdc_eth_rsp.r.data),
    .s_axi_rresp       (cdc_eth_rsp.r.resp),
    .s_axi_rlast       (cdc_eth_rsp.r.last),
    .s_axi_rvalid      (cdc_eth_rsp.r_valid),
    // Interrupt
    .ip2intc_irpt      (),
    // Phy
    .*
  );
 
endmodule
