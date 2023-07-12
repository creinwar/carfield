// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
//
// Simple payload to test bootmodes

#include "regs/cheshire.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "hal/spi_s25fs512s.h"
#include "printf.h"

#define DUMP_SIZE 64
int dump_spi(spi_s25fs512s_t *device, uint64_t sector) {
    uint8_t read_buf[512];

    spi_s25fs512s_single_read(device, read_buf, sector*512, 512);
    for (int i = 0; i < DUMP_SIZE; i++) {
        if (i % 64 == 0)
            printf("\r\n%04x : ", sector * 512 + i);
        printf("%02x", read_buf[i]);
    }
    printf("\r\n");
}

int main(void) {
    char str[] = "Hello World!\r\n";
    uint8_t buf[512];
    uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);

    uart_init(&__base_uart, reset_freq, 9600);

    spi_s25fs512s_t device = {
        .spi_freq = MIN(40 * 1000 * 1000, reset_freq / 4), // Up to quarter core freq or 40MHz
        .csid = 1};

    uint32_t init = spi_s25fs512s_init(&device, reset_freq);
    printf("Dumping spi : \n\r");

    for (int i = 0; i < 100; i++)
        dump_spi(&device, i);

    return 0;
}
