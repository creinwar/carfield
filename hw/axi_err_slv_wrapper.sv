// Copyright 2023 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "axi/assign.svh"
`include "axi/typedef.svh"

module axi_err_slv_wrapper #(
  // Add parameter
  parameter int unsigned AxiIdWidth  = 0, 
  parameter int unsigned LogDepth  = 1,
  parameter type aw_chan_t = logic,
  parameter type w_chan_t  = logic,
  parameter type b_chan_t  = logic,
  parameter type ar_chan_t = logic,
  parameter type r_chan_t  = logic,
  parameter type req_t     = logic,
  parameter type rsp_t     = logic
) (
  input  aw_chan_t  [2**LogDepth-1:0] axi_slv_aw_data_i,
  input  logic           [LogDepth:0] axi_slv_aw_wptr_i,
  output logic           [LogDepth:0] axi_slv_aw_rptr_o,
  input  w_chan_t   [2**LogDepth-1:0] axi_slv_w_data_i,
  input  logic           [LogDepth:0] axi_slv_w_wptr_i,
  output logic           [LogDepth:0] axi_slv_w_rptr_o,
  output b_chan_t   [2**LogDepth-1:0] axi_slv_b_data_o,
  output logic           [LogDepth:0] axi_slv_b_wptr_o,
  input  logic           [LogDepth:0] axi_slv_b_rptr_i,
  input  ar_chan_t  [2**LogDepth-1:0] axi_slv_ar_data_i,
  input  logic           [LogDepth:0] axi_slv_ar_wptr_i,
  output logic           [LogDepth:0] axi_slv_ar_rptr_o,
  output r_chan_t   [2**LogDepth-1:0] axi_slv_r_data_o,
  output logic           [LogDepth:0] axi_slv_r_wptr_o,
  input  logic           [LogDepth:0] axi_slv_r_rptr_i,
  input  logic                        clk_i,
  input  logic                        pwr_on_rst_n
);

  req_t axi_req;
  rsp_t axi_rsp;

  axi_cdc_dst #(
    .LogDepth   ( LogDepth  ),
    .aw_chan_t  ( aw_chan_t ),
    .w_chan_t   ( w_chan_t  ),
    .b_chan_t   ( b_chan_t  ),
    .ar_chan_t  ( ar_chan_t ),
    .r_chan_t   ( r_chan_t  ),
    .axi_req_t  ( req_t     ),
    .axi_resp_t ( rsp_t     )
  ) i_cdc_dst (
    .async_data_slave_aw_data_i ( axi_slv_aw_data_i ),
    .async_data_slave_aw_wptr_i ( axi_slv_aw_wptr_i ),
    .async_data_slave_aw_rptr_o ( axi_slv_aw_rptr_o ),
    .async_data_slave_w_data_i  ( axi_slv_w_data_i  ),
    .async_data_slave_w_wptr_i  ( axi_slv_w_wptr_i  ),
    .async_data_slave_w_rptr_o  ( axi_slv_w_rptr_o  ),
    .async_data_slave_b_data_o  ( axi_slv_b_data_o  ),
    .async_data_slave_b_wptr_o  ( axi_slv_b_wptr_o  ),
    .async_data_slave_b_rptr_i  ( axi_slv_b_rptr_i  ),
    .async_data_slave_ar_data_i ( axi_slv_ar_data_i ),
    .async_data_slave_ar_wptr_i ( axi_slv_ar_wptr_i ),
    .async_data_slave_ar_rptr_o ( axi_slv_ar_rptr_o ),
    .async_data_slave_r_data_o  ( axi_slv_r_data_o  ),
    .async_data_slave_r_wptr_o  ( axi_slv_r_wptr_o  ),
    .async_data_slave_r_rptr_i  ( axi_slv_r_rptr_i  ),
    .dst_clk_i                  ( clk_i             ),
    .dst_rst_ni                 ( pwr_on_rst_n      ),
    .dst_req_o                  ( axi_req           ),
    .dst_resp_i                 ( axi_rsp           )
  );

  axi_err_slv #(
   .AxiIdWidth  ( AxiIdWidth           ),
   .axi_req_t   ( req_t                ),
   .axi_resp_t  ( rsp_t                ),
   .Resp        ( axi_pkg::RESP_DECERR ),
   .ATOPs       ( 1'b0                 ),
   .MaxTrans    ( 4                    )
  ) i_axi_err_slv (
    .clk_i      ( clk_i        ),
    .rst_ni     ( pwr_on_rst_n ), // TODO: currently not sw resettable no isolate
    .test_i     ( test_mode_i  ),
    // slave port
    .slv_req_i  ( axi_req      ),
    .slv_resp_o ( axi_rsp      )
  );

endmodule