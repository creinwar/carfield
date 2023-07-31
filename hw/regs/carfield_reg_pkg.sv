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
  } carfield_reg2hw_periph_clk_en_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_safety_island_clk_en_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_security_island_clk_en_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_clk_en_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_spatz_cluster_clk_en_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_l2_clk_en_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_periph_clk_sel_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_safety_island_clk_sel_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_security_island_clk_sel_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_pulp_cluster_clk_sel_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_spatz_cluster_clk_sel_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } carfield_reg2hw_l2_clk_sel_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_periph_clk_div_value_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_safety_island_clk_div_value_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_security_island_clk_div_value_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_pulp_cluster_clk_div_value_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_spatz_cluster_clk_div_value_reg_t;

  typedef struct packed {
    logic [23:0] q;
    logic        qe;
  } carfield_reg2hw_l2_clk_div_value_reg_t;

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
    logic [1:0]  q;
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
    logic        q;
  } carfield_reg2hw_pulp_cluster_boot_enable_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_spatz_cluster_busy_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_busy_reg_t;

  typedef struct packed {
    logic        q;
  } carfield_reg2hw_pulp_cluster_eoc_reg_t;

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

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_spatz_cluster_busy_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_pulp_cluster_busy_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } carfield_hw2reg_pulp_cluster_eoc_reg_t;

  // Register -> HW type
  typedef struct packed {
    carfield_reg2hw_boot_mode_reg_t boot_mode; // [545:543]
    carfield_reg2hw_generic_scratch0_reg_t generic_scratch0; // [542:511]
    carfield_reg2hw_generic_scratch1_reg_t generic_scratch1; // [510:479]
    carfield_reg2hw_host_rst_reg_t host_rst; // [478:478]
    carfield_reg2hw_periph_rst_reg_t periph_rst; // [477:477]
    carfield_reg2hw_safety_island_rst_reg_t safety_island_rst; // [476:476]
    carfield_reg2hw_security_island_rst_reg_t security_island_rst; // [475:475]
    carfield_reg2hw_pulp_cluster_rst_reg_t pulp_cluster_rst; // [474:474]
    carfield_reg2hw_spatz_cluster_rst_reg_t spatz_cluster_rst; // [473:473]
    carfield_reg2hw_l2_rst_reg_t l2_rst; // [472:472]
    carfield_reg2hw_host_isolate_reg_t host_isolate; // [471:471]
    carfield_reg2hw_periph_isolate_reg_t periph_isolate; // [470:470]
    carfield_reg2hw_safety_island_isolate_reg_t safety_island_isolate; // [469:469]
    carfield_reg2hw_security_island_isolate_reg_t security_island_isolate; // [468:468]
    carfield_reg2hw_pulp_cluster_isolate_reg_t pulp_cluster_isolate; // [467:467]
    carfield_reg2hw_spatz_cluster_isolate_reg_t spatz_cluster_isolate; // [466:466]
    carfield_reg2hw_periph_clk_en_reg_t periph_clk_en; // [465:465]
    carfield_reg2hw_safety_island_clk_en_reg_t safety_island_clk_en; // [464:464]
    carfield_reg2hw_security_island_clk_en_reg_t security_island_clk_en; // [463:463]
    carfield_reg2hw_pulp_cluster_clk_en_reg_t pulp_cluster_clk_en; // [462:462]
    carfield_reg2hw_spatz_cluster_clk_en_reg_t spatz_cluster_clk_en; // [461:461]
    carfield_reg2hw_l2_clk_en_reg_t l2_clk_en; // [460:460]
    carfield_reg2hw_periph_clk_sel_reg_t periph_clk_sel; // [459:458]
    carfield_reg2hw_safety_island_clk_sel_reg_t safety_island_clk_sel; // [457:456]
    carfield_reg2hw_security_island_clk_sel_reg_t security_island_clk_sel; // [455:454]
    carfield_reg2hw_pulp_cluster_clk_sel_reg_t pulp_cluster_clk_sel; // [453:452]
    carfield_reg2hw_spatz_cluster_clk_sel_reg_t spatz_cluster_clk_sel; // [451:450]
    carfield_reg2hw_l2_clk_sel_reg_t l2_clk_sel; // [449:448]
    carfield_reg2hw_periph_clk_div_value_reg_t periph_clk_div_value; // [447:423]
    carfield_reg2hw_safety_island_clk_div_value_reg_t safety_island_clk_div_value; // [422:398]
    carfield_reg2hw_security_island_clk_div_value_reg_t security_island_clk_div_value; // [397:373]
    carfield_reg2hw_pulp_cluster_clk_div_value_reg_t pulp_cluster_clk_div_value; // [372:348]
    carfield_reg2hw_spatz_cluster_clk_div_value_reg_t spatz_cluster_clk_div_value; // [347:323]
    carfield_reg2hw_l2_clk_div_value_reg_t l2_clk_div_value; // [322:298]
    carfield_reg2hw_host_fetch_enable_reg_t host_fetch_enable; // [297:297]
    carfield_reg2hw_safety_island_fetch_enable_reg_t safety_island_fetch_enable; // [296:296]
    carfield_reg2hw_security_island_fetch_enable_reg_t security_island_fetch_enable; // [295:295]
    carfield_reg2hw_pulp_cluster_fetch_enable_reg_t pulp_cluster_fetch_enable; // [294:294]
    carfield_reg2hw_spatz_cluster_fetch_enable_reg_t spatz_cluster_fetch_enable; // [293:292]
    carfield_reg2hw_host_boot_addr_reg_t host_boot_addr; // [291:260]
    carfield_reg2hw_safety_island_boot_addr_reg_t safety_island_boot_addr; // [259:228]
    carfield_reg2hw_security_island_boot_addr_reg_t security_island_boot_addr; // [227:196]
    carfield_reg2hw_pulp_cluster_boot_addr_reg_t pulp_cluster_boot_addr; // [195:164]
    carfield_reg2hw_spatz_cluster_boot_addr_reg_t spatz_cluster_boot_addr; // [163:132]
    carfield_reg2hw_pulp_cluster_boot_enable_reg_t pulp_cluster_boot_enable; // [131:131]
    carfield_reg2hw_spatz_cluster_busy_reg_t spatz_cluster_busy; // [130:130]
    carfield_reg2hw_pulp_cluster_busy_reg_t pulp_cluster_busy; // [129:129]
    carfield_reg2hw_pulp_cluster_eoc_reg_t pulp_cluster_eoc; // [128:128]
    carfield_reg2hw_l2_sram_config0_reg_t l2_sram_config0; // [127:96]
    carfield_reg2hw_l2_sram_config1_reg_t l2_sram_config1; // [95:64]
    carfield_reg2hw_l2_sram_config2_reg_t l2_sram_config2; // [63:32]
    carfield_reg2hw_l2_sram_config3_reg_t l2_sram_config3; // [31:0]
  } carfield_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    carfield_hw2reg_boot_mode_reg_t boot_mode; // [87:84]
    carfield_hw2reg_generic_scratch0_reg_t generic_scratch0; // [83:51]
    carfield_hw2reg_generic_scratch1_reg_t generic_scratch1; // [50:18]
    carfield_hw2reg_host_isolate_status_reg_t host_isolate_status; // [17:16]
    carfield_hw2reg_periph_isolate_status_reg_t periph_isolate_status; // [15:14]
    carfield_hw2reg_safety_island_isolate_status_reg_t safety_island_isolate_status; // [13:12]
    carfield_hw2reg_security_island_isolate_status_reg_t security_island_isolate_status; // [11:10]
    carfield_hw2reg_pulp_cluster_isolate_status_reg_t pulp_cluster_isolate_status; // [9:8]
    carfield_hw2reg_spatz_cluster_isolate_status_reg_t spatz_cluster_isolate_status; // [7:6]
    carfield_hw2reg_spatz_cluster_busy_reg_t spatz_cluster_busy; // [5:4]
    carfield_hw2reg_pulp_cluster_busy_reg_t pulp_cluster_busy; // [3:2]
    carfield_hw2reg_pulp_cluster_eoc_reg_t pulp_cluster_eoc; // [1:0]
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
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_CLK_EN_OFFSET = 8'h 70;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_CLK_EN_OFFSET = 8'h 74;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_CLK_EN_OFFSET = 8'h 78;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_CLK_EN_OFFSET = 8'h 7c;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_CLK_EN_OFFSET = 8'h 80;
  parameter logic [BlockAw-1:0] CARFIELD_L2_CLK_EN_OFFSET = 8'h 84;
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_CLK_SEL_OFFSET = 8'h 88;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_CLK_SEL_OFFSET = 8'h 8c;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_CLK_SEL_OFFSET = 8'h 90;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_CLK_SEL_OFFSET = 8'h 94;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_CLK_SEL_OFFSET = 8'h 98;
  parameter logic [BlockAw-1:0] CARFIELD_L2_CLK_SEL_OFFSET = 8'h 9c;
  parameter logic [BlockAw-1:0] CARFIELD_PERIPH_CLK_DIV_VALUE_OFFSET = 8'h a0;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_CLK_DIV_VALUE_OFFSET = 8'h a4;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_CLK_DIV_VALUE_OFFSET = 8'h a8;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_CLK_DIV_VALUE_OFFSET = 8'h ac;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_CLK_DIV_VALUE_OFFSET = 8'h b0;
  parameter logic [BlockAw-1:0] CARFIELD_L2_CLK_DIV_VALUE_OFFSET = 8'h b4;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_FETCH_ENABLE_OFFSET = 8'h b8;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_FETCH_ENABLE_OFFSET = 8'h bc;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_FETCH_ENABLE_OFFSET = 8'h c0;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_FETCH_ENABLE_OFFSET = 8'h c4;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE_OFFSET = 8'h c8;
  parameter logic [BlockAw-1:0] CARFIELD_HOST_BOOT_ADDR_OFFSET = 8'h cc;
  parameter logic [BlockAw-1:0] CARFIELD_SAFETY_ISLAND_BOOT_ADDR_OFFSET = 8'h d0;
  parameter logic [BlockAw-1:0] CARFIELD_SECURITY_ISLAND_BOOT_ADDR_OFFSET = 8'h d4;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_BOOT_ADDR_OFFSET = 8'h d8;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_BOOT_ADDR_OFFSET = 8'h dc;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_BOOT_ENABLE_OFFSET = 8'h e0;
  parameter logic [BlockAw-1:0] CARFIELD_SPATZ_CLUSTER_BUSY_OFFSET = 8'h e4;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_BUSY_OFFSET = 8'h e8;
  parameter logic [BlockAw-1:0] CARFIELD_PULP_CLUSTER_EOC_OFFSET = 8'h ec;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG0_OFFSET = 8'h f0;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG1_OFFSET = 8'h f4;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG2_OFFSET = 8'h f8;
  parameter logic [BlockAw-1:0] CARFIELD_L2_SRAM_CONFIG3_OFFSET = 8'h fc;

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
    CARFIELD_PERIPH_CLK_EN,
    CARFIELD_SAFETY_ISLAND_CLK_EN,
    CARFIELD_SECURITY_ISLAND_CLK_EN,
    CARFIELD_PULP_CLUSTER_CLK_EN,
    CARFIELD_SPATZ_CLUSTER_CLK_EN,
    CARFIELD_L2_CLK_EN,
    CARFIELD_PERIPH_CLK_SEL,
    CARFIELD_SAFETY_ISLAND_CLK_SEL,
    CARFIELD_SECURITY_ISLAND_CLK_SEL,
    CARFIELD_PULP_CLUSTER_CLK_SEL,
    CARFIELD_SPATZ_CLUSTER_CLK_SEL,
    CARFIELD_L2_CLK_SEL,
    CARFIELD_PERIPH_CLK_DIV_VALUE,
    CARFIELD_SAFETY_ISLAND_CLK_DIV_VALUE,
    CARFIELD_SECURITY_ISLAND_CLK_DIV_VALUE,
    CARFIELD_PULP_CLUSTER_CLK_DIV_VALUE,
    CARFIELD_SPATZ_CLUSTER_CLK_DIV_VALUE,
    CARFIELD_L2_CLK_DIV_VALUE,
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
    CARFIELD_PULP_CLUSTER_BOOT_ENABLE,
    CARFIELD_SPATZ_CLUSTER_BUSY,
    CARFIELD_PULP_CLUSTER_BUSY,
    CARFIELD_PULP_CLUSTER_EOC,
    CARFIELD_L2_SRAM_CONFIG0,
    CARFIELD_L2_SRAM_CONFIG1,
    CARFIELD_L2_SRAM_CONFIG2,
    CARFIELD_L2_SRAM_CONFIG3
  } carfield_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] CARFIELD_PERMIT [64] = '{
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
    4'b 0001, // index[28] CARFIELD_PERIPH_CLK_EN
    4'b 0001, // index[29] CARFIELD_SAFETY_ISLAND_CLK_EN
    4'b 0001, // index[30] CARFIELD_SECURITY_ISLAND_CLK_EN
    4'b 0001, // index[31] CARFIELD_PULP_CLUSTER_CLK_EN
    4'b 0001, // index[32] CARFIELD_SPATZ_CLUSTER_CLK_EN
    4'b 0001, // index[33] CARFIELD_L2_CLK_EN
    4'b 0001, // index[34] CARFIELD_PERIPH_CLK_SEL
    4'b 0001, // index[35] CARFIELD_SAFETY_ISLAND_CLK_SEL
    4'b 0001, // index[36] CARFIELD_SECURITY_ISLAND_CLK_SEL
    4'b 0001, // index[37] CARFIELD_PULP_CLUSTER_CLK_SEL
    4'b 0001, // index[38] CARFIELD_SPATZ_CLUSTER_CLK_SEL
    4'b 0001, // index[39] CARFIELD_L2_CLK_SEL
    4'b 0111, // index[40] CARFIELD_PERIPH_CLK_DIV_VALUE
    4'b 0111, // index[41] CARFIELD_SAFETY_ISLAND_CLK_DIV_VALUE
    4'b 0111, // index[42] CARFIELD_SECURITY_ISLAND_CLK_DIV_VALUE
    4'b 0111, // index[43] CARFIELD_PULP_CLUSTER_CLK_DIV_VALUE
    4'b 0111, // index[44] CARFIELD_SPATZ_CLUSTER_CLK_DIV_VALUE
    4'b 0111, // index[45] CARFIELD_L2_CLK_DIV_VALUE
    4'b 0001, // index[46] CARFIELD_HOST_FETCH_ENABLE
    4'b 0001, // index[47] CARFIELD_SAFETY_ISLAND_FETCH_ENABLE
    4'b 0001, // index[48] CARFIELD_SECURITY_ISLAND_FETCH_ENABLE
    4'b 0001, // index[49] CARFIELD_PULP_CLUSTER_FETCH_ENABLE
    4'b 0001, // index[50] CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE
    4'b 1111, // index[51] CARFIELD_HOST_BOOT_ADDR
    4'b 1111, // index[52] CARFIELD_SAFETY_ISLAND_BOOT_ADDR
    4'b 1111, // index[53] CARFIELD_SECURITY_ISLAND_BOOT_ADDR
    4'b 1111, // index[54] CARFIELD_PULP_CLUSTER_BOOT_ADDR
    4'b 1111, // index[55] CARFIELD_SPATZ_CLUSTER_BOOT_ADDR
    4'b 0001, // index[56] CARFIELD_PULP_CLUSTER_BOOT_ENABLE
    4'b 0001, // index[57] CARFIELD_SPATZ_CLUSTER_BUSY
    4'b 0001, // index[58] CARFIELD_PULP_CLUSTER_BUSY
    4'b 0001, // index[59] CARFIELD_PULP_CLUSTER_EOC
    4'b 1111, // index[60] CARFIELD_L2_SRAM_CONFIG0
    4'b 1111, // index[61] CARFIELD_L2_SRAM_CONFIG1
    4'b 1111, // index[62] CARFIELD_L2_SRAM_CONFIG2
    4'b 1111  // index[63] CARFIELD_L2_SRAM_CONFIG3
  };

endpackage

