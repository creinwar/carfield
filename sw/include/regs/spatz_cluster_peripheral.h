// Generated register defines for spatz_cluster_peripheral

// Copyright information found in source file:
// Copyright 2020 ETH Zurich and University of Bologna.

// Licensing information found in source file:
// Licensed under Solderpad Hardware License, Version 0.51, see LICENSE for
// details. SPDX-License-Identifier: SHL-0.51

#ifndef _SPATZ_CLUSTER_PERIPHERAL_REG_DEFS_
#define _SPATZ_CLUSTER_PERIPHERAL_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Number of performance counters
#define SPATZ_CLUSTER_PERIPHERAL_PARAM_NUM_PERF_COUNTERS 2

// Register width
#define SPATZ_CLUSTER_PERIPHERAL_PARAM_REG_WIDTH 64

// Enable particular performance counter and start tracking. (common
// parameters)
// Enable particular performance counter and start tracking.
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_REG_OFFSET 0x0
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_CYCLE_0_BIT 0
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_TCDM_ACCESSED_0_BIT 1
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_TCDM_CONGESTED_0_BIT 2
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ISSUE_FPU_0_BIT 3
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ISSUE_FPU_SEQ_0_BIT 4
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ISSUE_CORE_TO_FPU_0_BIT 5
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_RETIRED_INSTR_0_BIT 6
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_RETIRED_LOAD_0_BIT 7
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_RETIRED_I_0_BIT 8
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_RETIRED_ACC_0_BIT 9
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AW_STALL_0_BIT 10
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AR_STALL_0_BIT 11
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_R_STALL_0_BIT 12
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_W_STALL_0_BIT 13
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_BUF_W_STALL_0_BIT 14
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_BUF_R_STALL_0_BIT 15
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AW_DONE_0_BIT 16
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AW_BW_0_BIT 17
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AR_DONE_0_BIT 18
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_AR_BW_0_BIT 19
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_R_DONE_0_BIT 20
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_R_BW_0_BIT 21
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_W_DONE_0_BIT 22
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_W_BW_0_BIT 23
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_B_DONE_0_BIT 24
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_DMA_BUSY_0_BIT 25
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ICACHE_MISS_0_BIT 26
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ICACHE_HIT_0_BIT 27
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ICACHE_PREFETCH_0_BIT 28
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ICACHE_DOUBLE_HIT_0_BIT \
  29
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_0_ICACHE_STALL_0_BIT 30

// Enable particular performance counter and start tracking.
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_REG_OFFSET 0x8
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_CYCLE_1_BIT 0
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_TCDM_ACCESSED_1_BIT 1
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_TCDM_CONGESTED_1_BIT 2
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ISSUE_FPU_1_BIT 3
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ISSUE_FPU_SEQ_1_BIT 4
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ISSUE_CORE_TO_FPU_1_BIT 5
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_RETIRED_INSTR_1_BIT 6
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_RETIRED_LOAD_1_BIT 7
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_RETIRED_I_1_BIT 8
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_RETIRED_ACC_1_BIT 9
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AW_STALL_1_BIT 10
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AR_STALL_1_BIT 11
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_R_STALL_1_BIT 12
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_W_STALL_1_BIT 13
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_BUF_W_STALL_1_BIT 14
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_BUF_R_STALL_1_BIT 15
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AW_DONE_1_BIT 16
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AW_BW_1_BIT 17
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AR_DONE_1_BIT 18
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_AR_BW_1_BIT 19
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_R_DONE_1_BIT 20
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_R_BW_1_BIT 21
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_W_DONE_1_BIT 22
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_W_BW_1_BIT 23
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_B_DONE_1_BIT 24
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_DMA_BUSY_1_BIT 25
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ICACHE_MISS_1_BIT 26
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ICACHE_HIT_1_BIT 27
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ICACHE_PREFETCH_1_BIT 28
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ICACHE_DOUBLE_HIT_1_BIT \
  29
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_ENABLE_1_ICACHE_STALL_1_BIT 30

// Select from which hart in the cluster, starting from `0`,
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_HART_SELECT_FIELD_WIDTH 10
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_HART_SELECT_FIELDS_PER_REG 6
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_MULTIREG_COUNT 2

// Select from which hart in the cluster, starting from `0`,
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_REG_OFFSET 0x10
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_HART_SELECT_0_MASK 0x3ff
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_HART_SELECT_0_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_HART_SELECT_0_FIELD             \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_HART_SELECT_0_MASK,       \
      .index = SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_0_HART_SELECT_0_OFFSET})

// Select from which hart in the cluster, starting from `0`,
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_REG_OFFSET 0x18
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_HART_SELECT_1_MASK 0x3ff
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_HART_SELECT_1_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_HART_SELECT_1_FIELD             \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_HART_SELECT_1_MASK,       \
      .index = SPATZ_CLUSTER_PERIPHERAL_HART_SELECT_1_HART_SELECT_1_OFFSET})

// Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending
// on what
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_PERF_COUNTER_FIELD_WIDTH 48
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_PERF_COUNTER_FIELDS_PER_REG 1
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_MULTIREG_COUNT 2

// Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending
// on what
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_REG_OFFSET 0x20
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_PERF_COUNTER_0_MASK            \
  0xffffffffffff
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_PERF_COUNTER_0_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_PERF_COUNTER_0_FIELD           \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_PERF_COUNTER_0_MASK,     \
      .index = SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_0_PERF_COUNTER_0_OFFSET})

// Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending
// on what
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_REG_OFFSET 0x28
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_PERF_COUNTER_1_MASK            \
  0xffffffffffff
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_PERF_COUNTER_1_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_PERF_COUNTER_1_FIELD           \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_PERF_COUNTER_1_MASK,     \
      .index = SPATZ_CLUSTER_PERIPHERAL_PERF_COUNTER_1_PERF_COUNTER_1_OFFSET})

// Set bits in the cluster-local CLINT. Writing a 1 at location i sets the
// cluster-local interrupt
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_REG_OFFSET 0x30
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_CL_CLINT_SET_MASK 0xffffffff
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_CL_CLINT_SET_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_CL_CLINT_SET_FIELD               \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_CL_CLINT_SET_MASK,         \
      .index = SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_SET_CL_CLINT_SET_OFFSET})

// Clear bits in the cluster-local CLINT. Writing a 1 at location i clears
// the cluster-local interrupt
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_REG_OFFSET 0x38
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_CL_CLINT_CLEAR_MASK 0xffffffff
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_CL_CLINT_CLEAR_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_CL_CLINT_CLEAR_FIELD           \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_CL_CLINT_CLEAR_MASK,     \
      .index = SPATZ_CLUSTER_PERIPHERAL_CL_CLINT_CLEAR_CL_CLINT_CLEAR_OFFSET})

// Hardware barrier register. Loads to this register will block until all
// cores have
#define SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_REG_OFFSET 0x40
#define SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_HW_BARRIER_MASK 0xffffffff
#define SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_HW_BARRIER_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_HW_BARRIER_FIELD                   \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_HW_BARRIER_MASK,             \
      .index = SPATZ_CLUSTER_PERIPHERAL_HW_BARRIER_HW_BARRIER_OFFSET})

// Controls prefetching of the instruction cache.
#define SPATZ_CLUSTER_PERIPHERAL_ICACHE_PREFETCH_ENABLE_REG_OFFSET 0x48
#define SPATZ_CLUSTER_PERIPHERAL_ICACHE_PREFETCH_ENABLE_ICACHE_PREFETCH_ENABLE_BIT \
  0

// Sets the status of the Spatz cluster.
#define SPATZ_CLUSTER_PERIPHERAL_SPATZ_STATUS_REG_OFFSET 0x50
#define SPATZ_CLUSTER_PERIPHERAL_SPATZ_STATUS_SPATZ_CLUSTER_PROBE_BIT 0

// Controls the cluster boot process.
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET 0x58
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_ENTRY_POINT_MASK         \
  0xffffffff
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_ENTRY_POINT_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_ENTRY_POINT_FIELD        \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_ENTRY_POINT_MASK,  \
      .index =                                                                 \
          SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_ENTRY_POINT_OFFSET})

// End of computation and exit status register
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_REG_OFFSET 0x60
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_EOC_EXIT_MASK 0xffffffff
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_EOC_EXIT_OFFSET 0
#define SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_EOC_EXIT_FIELD               \
  ((bitfield_field32_t){                                                       \
      .mask = SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_EOC_EXIT_MASK,         \
      .index = SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_EOC_EXIT_OFFSET})

#ifdef __cplusplus
} // extern "C"
#endif
#endif // _SPATZ_CLUSTER_PERIPHERAL_REG_DEFS_
       // End generated register defines for spatz_cluster_peripheral