// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#ifndef __CAR_UTIL_H
#define __CAR_UTIL_H

// Safety Island offload
void prepare_safed_boot () {

        // Select bootmode
	volatile uintptr_t *bootmode_addr = (uintptr_t*)CAR_SAFETY_ISLAND_BOOTMODE_ADDR;
	writew(1, bootmode_addr);

	// Write entry point into boot address
	volatile uintptr_t *bootaddr_addr = (uintptr_t*)CAR_SAFETY_ISLAND_BOOTADDR_ADDR;
	writew(CAR_SAFETY_ISLAND_ENTRY_POINT, bootaddr_addr);

	// Assert fetch enable
	volatile uintptr_t *fetchen_addr = (uintptr_t*)CAR_SAFETY_ISLAND_FETCHEN_ADDR;
	writew(1, fetchen_addr);

}

uint32_t poll_safed_corestatus () {

        volatile uint32_t corestatus;
	volatile uintptr_t *corestatus_addr = (uintptr_t*)CAR_SAFETY_ISLAND_CORESTATUS_ADDR;
	// TODO: Add a timeut to not poll indefinitely
	while (((uint32_t)readw(corestatus_addr) & 0x80000000) == 0) {
	    corestatus = (uint32_t) readw(corestatus_addr);
	}

	corestatus = (uint32_t) readw(corestatus_addr);

	return corestatus;
}

uint32_t safed_offloader_blocking () {

        uint32_t ret = 0;

	// Load binary payload
	load_safed_payload();

	// Select bootmode, write entry point, write launch signal
	prepare_safed_boot();

	// Poll status register
	volatile uint32_t corestatus = poll_safed_corestatus();

	// Check core status. Return safed exit code to signal an error in the execution.
	if ((corestatus & 0x7FFFFFFF) != 0) {
	    ret = ESAFEDEXEC;
	}

	return ret;
}

#endif
