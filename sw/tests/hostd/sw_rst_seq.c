// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

#include <stdint.h>
#include "params.h"
#include "regs/cheshire.h"
#include "regs/soc_ctrl.h"
#include "util.h"
#include "car_util.h"
#include "car_memory_map.h"

int main(void)
{
    // We write a bunch of bytes to the safety island scratchpad memory and
    // check whether they survive a warm reset. The safety island's scratchpad
    // is uncached so everything should go thorugh without a fence.
    uint64_t magic = 0xbeebdeadcafebeef;

    // Write a pattern to safety island SRAM
    for (uintptr_t i = 0; i < 128; i++)
        writed(magic, CAR_SAFETY_ISLAND_SPM_BASE_ADDR + (i * 8));

    // Double check
    for (uintptr_t i = 0; i < 128; i++)
        if ((readd(CAR_SAFETY_ISLAND_SPM_BASE_ADDR + (i * 8))) != magic)
            return 2;

    // reset sequence
    car_set_isolate(CAR_SAFETY_RST, CAR_ISOLATE_ENABLE);
    car_disable_clk(CAR_SAFETY_CLK);

    car_set_rst(CAR_SAFETY_RST, CAR_RST_ASSERT);
    for (volatile int i = 0; i < 16; i++)
        ;
    car_set_rst(CAR_SAFETY_RST, CAR_RST_RELEASE);

    car_enable_clk(CAR_SAFETY_CLK);
    car_set_isolate(CAR_SAFETY_RST, CAR_ISOLATE_DISABLE);

    // After the reset we should only see zeros
    for (uintptr_t i = 0; i < 128; i++)
        if ((readd(CAR_SAFETY_ISLAND_SPM_BASE_ADDR + (i * 8))) != 0)
            return 1;

    return 0;
}
