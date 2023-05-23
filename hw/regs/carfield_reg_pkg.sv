// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package carfield_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 8;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [2:0]  q;
  } carfield_reg2hw_boot_mode_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_generic_scratch0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_generic_scratch1_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_host_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_periph_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_safety_island_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_security_island_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_spatz_cluster_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_l2_rst_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_host_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_periph_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_safety_island_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_security_island_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_spatz_cluster_isolate_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_host_fetch_enable_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_safety_island_fetch_enable_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_security_island_fetch_enable_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_fetch_enable_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_spatz_cluster_fetch_enable_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_host_boot_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_safety_island_boot_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_security_island_boot_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_pulp_cluster_boot_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_spatz_cluster_boot_addr_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_l2_sram_config0_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_l2_sram_config1_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_l2_sram_config2_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } carfield_reg2hw_l2_sram_config3_reg_t;

  typedef struct packed {
    logic [2:0]  d;
    logic        de;
  } carfield_hw2reg_boot_mode_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } carfield_hw2reg_generic_scratch0_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } carfield_hw2reg_generic_scratch1_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_host_isolate_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_periph_isolate_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_safety_island_isolate_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_security_island_isolate_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_pulp_cluster_isolate_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_spatz_cluster_isolate_status_reg_t;

  // Register -> HW type
  typedef struct packed {
    carfield_reg2hw_boot_mode_reg_t boot_mode; // [372:370]
    carfield_reg2hw_generic_scratch0_reg_t generic_scratch0; // [369:338]
    carfield_reg2hw_generic_scratch1_reg_t generic_scratch1; // [337:306]
    carfield_reg2hw_host_rst_reg_t host_rst; // [305:305]
    carfield_reg2hw_periph_rst_reg_t periph_rst; // [304:304]
    carfield_reg2hw_safety_island_rst_reg_t safety_island_rst; // [303:303]
    carfield_reg2hw_security_island_rst_reg_t security_island_rst; // [302:302]
    carfield_reg2hw_pulp_cluster_rst_reg_t pulp_cluster_rst; // [301:301]
    carfield_reg2hw_spatz_cluster_rst_reg_t spatz_cluster_rst; // [300:300]
    carfield_reg2hw_l2_rst_reg_t l2_rst; // [299:299]
    carfield_reg2hw_host_isolate_reg_t host_isolate; // [298:298]
    carfield_reg2hw_periph_isolate_reg_t periph_isolate; // [297:297]
    carfield_reg2hw_safety_island_isolate_reg_t safety_island_isolate; // [296:296]
    carfield_reg2hw_security_island_isolate_reg_t security_island_isolate; // [295:295]
    carfield_reg2hw_pulp_cluster_isolate_reg_t pulp_cluster_isolate; // [294:294]
    carfield_reg2hw_spatz_cluster_isolate_reg_t spatz_cluster_isolate; // [293:293]
    carfield_reg2hw_host_fetch_enable_reg_t host_fetch_enable; // [292:292]
    carfield_reg2hw_safety_island_fetch_enable_reg_t safety_island_fetch_enable; // [291:291]
    carfield_reg2hw_security_island_fetch_enable_reg_t security_island_fetch_enable; // [290:290]
    carfield_reg2hw_pulp_cluster_fetch_enable_reg_t pulp_cluster_fetch_enable; // [289:289]
    carfield_reg2hw_spatz_cluster_fetch_enable_reg_t spatz_cluster_fetch_enable; // [288:288]
    carfield_reg2hw_host_boot_addr_reg_t host_boot_addr; // [287:256]
    carfield_reg2hw_safety_island_boot_addr_reg_t safety_island_boot_addr; // [255:224]
    carfield_reg2hw_security_island_boot_addr_reg_t security_island_boot_addr; // [223:192]
    carfield_reg2hw_pulp_cluster_boot_addr_reg_t pulp_cluster_boot_addr; // [191:160]
    carfield_reg2hw_spatz_cluster_boot_addr_reg_t spatz_cluster_boot_addr; // [159:128]
    carfield_reg2hw_l2_sram_config0_reg_t l2_sram_config0; // [127:96]
    carfield_reg2hw_l2_sram_config1_reg_t l2_sram_config1; // [95:64]
    carfield_reg2hw_l2_sram_config2_reg_t l2_sram_config2; // [63:32]
    carfield_reg2hw_l2_sram_config3_reg_t l2_sram_config3; // [31:0]
  } carfield_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    carfield_hw2reg_boot_mode_reg_t boot_mode; // [81:78]
    carfield_hw2reg_generic_scratch0_reg_t generic_scratch0; // [77:45]
    carfield_hw2reg_generic_scratch1_reg_t generic_scratch1; // [44:12]
    carfield_hw2reg_host_isolate_status_reg_t host_isolate_status; // [11:10]
    carfield_hw2reg_periph_isolate_status_reg_t periph_isolate_status; // [9:8]
    carfield_hw2reg_safety_island_isolate_status_reg_t safety_island_isolate_status; // [7:6]
    carfield_hw2reg_security_island_isolate_status_reg_t security_island_isolate_status; // [5:4]
    carfield_hw2reg_pulp_cluster_isolate_status_reg_t pulp_cluster_isolate_status; // [3:2]
    carfield_hw2reg_spatz_cluster_isolate_status_reg_t spatz_cluster_isolate_status; // [1:0]
  } carfield_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] CARFIELD_VERSION0_OFFSET = 8'h 0;
  parameter logic [BlockAw-1:0] CARFIELD_VERSION1_OFFSET = 8'h 4;
  parameter logic [BlockAw-1:0] CARFIELD_VERSION2_OFFSET = 8'h 8;
  parameter logic [BlockAw-1:0] CARFIELD_VERSION3_OFFSET = 8'h c;
  parameter logic [BlockAw-1:0] CARFIELD_VERSION4_OFFSET = 8'h 10;
  parameter logic [BlockAw-1:0] CARFIELD_BOOT_MODE_OFFSET = 8'h 14;
  parameter logic [BlockAw-1:0] CARFIELD_JEDEC_IDCODE_OFFSET = 8'h 18;
  parameter logic [BlockAw-1:0] CARFIELD_GENERIC_SCRATCH0_OFFSET = 8'h 1c;
  parameter logic [BlockAw-1:0] CARFIELD_GENERIC_SCRATCH1_OFFSET = 8'h 20;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_RST_OFFSET = 8'h 24;
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_RST_OFFSET = 8'h 28;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_RST_OFFSET = 8'h 2c;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_RST_OFFSET = 8'h 30;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_RST_OFFSET = 8'h 34;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_RST_OFFSET = 8'h 38;
  parameter logic [BlockAw-1:0] CARFIELD_L2_RST_OFFSET = 8'h 3c;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_ISOLATE_OFFSET = 8'h 40;
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_ISOLATE_OFFSET = 8'h 44;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_ISOLATE_OFFSET = 8'h 48;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_ISOLATE_OFFSET = 8'h 4c;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_ISOLATE_OFFSET = 8'h 50;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_ISOLATE_OFFSET = 8'h 54;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_ISOLATE_STATUS_OFFSET = 8'h 58;
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_ISOLATE_STATUS_OFFSET = 8'h 5c;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_ISOLATE_STATUS_OFFSET = 8'h 60;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_ISOLATE_STATUS_OFFSET = 8'h 64;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_ISOLATE_STATUS_OFFSET = 8'h 68;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_ISOLATE_STATUS_OFFSET = 8'h 6c;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_FETCH_ENABLE_OFFSET = 8'h 70;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_FETCH_ENABLE_OFFSET = 8'h 74;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_FETCH_ENABLE_OFFSET = 8'h 78;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_FETCH_ENABLE_OFFSET = 8'h 7c;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE_OFFSET = 8'h 80;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_BOOT_ADDR_OFFSET = 8'h 84;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_BOOT_ADDR_OFFSET = 8'h 88;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_BOOT_ADDR_OFFSET = 8'h 8c;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_BOOT_ADDR_OFFSET = 8'h 90;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_BOOT_ADDR_OFFSET = 8'h 94;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG0_OFFSET = 8'h 98;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG1_OFFSET = 8'h 9c;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG2_OFFSET = 8'h a0;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG3_OFFSET = 8'h a4;

  // Register index
  typedef enum int {
    CARFIELD_VERSION0,
    CARFIELD_VERSION1,
    CARFIELD_VERSION2,
    CARFIELD_VERSION3,
    CARFIELD_VERSION4,
    CARFIELD_BOOT_MODE,
    CARFIELD_JEDEC_IDCODE,
    CARFIELD_GENERIC_SCRATCH0,
    CARFIELD_GENERIC_SCRATCH1,
    CARFIELD_HOST_RST,
    CARFIELD_PERIPH_RST,
    CARFIELD_SAFETY_ISLAND_RST,
    CARFIELD_SECURITY_ISLAND_RST,
    CARFIELD_PULP_CLUSTER_RST,
    CARFIELD_SPATZ_CLUSTER_RST,
    CARFIELD_L2_RST,
    CARFIELD_HOST_ISOLATE,
    CARFIELD_PERIPH_ISOLATE,
    CARFIELD_SAFETY_ISLAND_ISOLATE,
    CARFIELD_SECURITY_ISLAND_ISOLATE,
    CARFIELD_PULP_CLUSTER_ISOLATE,
    CARFIELD_SPATZ_CLUSTER_ISOLATE,
    CARFIELD_HOST_ISOLATE_STATUS,
    CARFIELD_PERIPH_ISOLATE_STATUS,
    CARFIELD_SAFETY_ISLAND_ISOLATE_STATUS,
    CARFIELD_SECURITY_ISLAND_ISOLATE_STATUS,
    CARFIELD_PULP_CLUSTER_ISOLATE_STATUS,
    CARFIELD_SPATZ_CLUSTER_ISOLATE_STATUS,
    CARFIELD_HOST_FETCH_ENABLE,
    CARFIELD_SAFETY_ISLAND_FETCH_ENABLE,
    CARFIELD_SECURITY_ISLAND_FETCH_ENABLE,
    CARFIELD_PULP_CLUSTER_FETCH_ENABLE,
    CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE,
    CARFIELD_HOST_BOOT_ADDR,
    CARFIELD_SAFETY_ISLAND_BOOT_ADDR,
    CARFIELD_SECURITY_ISLAND_BOOT_ADDR,
    CARFIELD_PULP_CLUSTER_BOOT_ADDR,
    CARFIELD_SPATZ_CLUSTER_BOOT_ADDR,
    CARFIELD_L2_SRAM_CONFIG0,
    CARFIELD_L2_SRAM_CONFIG1,
    CARFIELD_L2_SRAM_CONFIG2,
    CARFIELD_L2_SRAM_CONFIG3
  } carfield_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] CARFIELD_PERMIT [42] = '{
    4'b 1111, // index[ 0] CARFIELD_VERSION0
    4'b 1111, // index[ 1] CARFIELD_VERSION1
    4'b 1111, // index[ 2] CARFIELD_VERSION2
    4'b 1111, // index[ 3] CARFIELD_VERSION3
    4'b 1111, // index[ 4] CARFIELD_VERSION4
    4'b 0001, // index[ 5] CARFIELD_BOOT_MODE
    4'b 1111, // index[ 6] CARFIELD_JEDEC_IDCODE
    4'b 1111, // index[ 7] CARFIELD_GENERIC_SCRATCH0
    4'b 1111, // index[ 8] CARFIELD_GENERIC_SCRATCH1
    4'b 0001, // index[ 9] CARFIELD_HOST_RST
    4'b 0001, // index[10] CARFIELD_PERIPH_RST
    4'b 0001, // index[11] CARFIELD_SAFETY_ISLAND_RST
    4'b 0001, // index[12] CARFIELD_SECURITY_ISLAND_RST
    4'b 0001, // index[13] CARFIELD_PULP_CLUSTER_RST
    4'b 0001, // index[14] CARFIELD_SPATZ_CLUSTER_RST
    4'b 0001, // index[15] CARFIELD_L2_RST
    4'b 0001, // index[16] CARFIELD_HOST_ISOLATE
    4'b 0001, // index[17] CARFIELD_PERIPH_ISOLATE
    4'b 0001, // index[18] CARFIELD_SAFETY_ISLAND_ISOLATE
    4'b 0001, // index[19] CARFIELD_SECURITY_ISLAND_ISOLATE
    4'b 0001, // index[20] CARFIELD_PULP_CLUSTER_ISOLATE
    4'b 0001, // index[21] CARFIELD_SPATZ_CLUSTER_ISOLATE
    4'b 0001, // index[22] CARFIELD_HOST_ISOLATE_STATUS
    4'b 0001, // index[23] CARFIELD_PERIPH_ISOLATE_STATUS
    4'b 0001, // index[24] CARFIELD_SAFETY_ISLAND_ISOLATE_STATUS
    4'b 0001, // index[25] CARFIELD_SECURITY_ISLAND_ISOLATE_STATUS
    4'b 0001, // index[26] CARFIELD_PULP_CLUSTER_ISOLATE_STATUS
    4'b 0001, // index[27] CARFIELD_SPATZ_CLUSTER_ISOLATE_STATUS
    4'b 0001, // index[28] CARFIELD_HOST_FETCH_ENABLE
    4'b 0001, // index[29] CARFIELD_SAFETY_ISLAND_FETCH_ENABLE
    4'b 0001, // index[30] CARFIELD_SECURITY_ISLAND_FETCH_ENABLE
    4'b 0001, // index[31] CARFIELD_PULP_CLUSTER_FETCH_ENABLE
    4'b 0001, // index[32] CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE
    4'b 1111, // index[33] CARFIELD_HOST_BOOT_ADDR
    4'b 1111, // index[34] CARFIELD_SAFETY_ISLAND_BOOT_ADDR
    4'b 1111, // index[35] CARFIELD_SECURITY_ISLAND_BOOT_ADDR
    4'b 1111, // index[36] CARFIELD_PULP_CLUSTER_BOOT_ADDR
    4'b 1111, // index[37] CARFIELD_SPATZ_CLUSTER_BOOT_ADDR
    4'b 1111, // index[38] CARFIELD_L2_SRAM_CONFIG0
    4'b 1111, // index[39] CARFIELD_L2_SRAM_CONFIG1
    4'b 1111, // index[40] CARFIELD_L2_SRAM_CONFIG2
    4'b 1111  // index[41] CARFIELD_L2_SRAM_CONFIG3
  };

endpackage

