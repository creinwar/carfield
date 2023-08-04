// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
// Maicol Ciani <maicol.ciano@unibo.it>

// The security island is inaccessible from other parts of the SoC, hence we
// need to preload it from the testbench. This testbench checks the
// mailbox-based communication between the security_island and other subsystems.

module tb_carfield_soc;

  import uvm_pkg::*;
  import carfield_pkg::*;
  import cheshire_pkg::*;

  carfield_soc_fixture fix();

  // cheshire
  string      chs_preload_elf;
  string      chs_boot_hex;
  logic [1:0] boot_mode;
  logic [1:0] preload_mode;
  bit [31:0]  exit_code;
  bit         is_dram;

  // safety island
  string      safed_preload_elf;
  logic       safed_boot_mode;
  bit  [31:0] safed_exit_code;
  bit         safed_exit_status;

  // security island
  string      secd_preload_elf;

  //FP Spatz Cluster
  localparam CAR_PERIPHS_BASE_ADDR = 32'h20000000;
  localparam CAR_SOC_CTRL_OFFSET   = 32'h10000;
  localparam CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE_REG_OFFSET = 32'hC8;
  string      spatz_preload_elf;
  logic       spatz_boot_mode;
  bit  [31:0] spatz_exit_code;
  bit         spatz_exit_status;
  doub_bt     spatz_binary_entry;
  doub_bt     spatz_reg_value;
  carfield_pkg::reg_start_t carfield_reg_start;

  logic [63:0] unused;

  // Cheshire standalone binary execution
  initial begin
    // Fetch plusargs or use safe (fail-fast) defaults
    if (!$value$plusargs("CHS_BOOTMODE=%d", boot_mode))         boot_mode         = 0;
    if (!$value$plusargs("CHS_PRELMODE=%d", preload_mode))      preload_mode      = 0;
    if (!$value$plusargs("CHS_BINARY=%s",   chs_preload_elf))   chs_preload_elf   = "";
    if (!$value$plusargs("CHS_IMAGE=%s",    chs_boot_hex))      chs_boot_hex      = "";

    // Set boot mode and preload boot image if there is one
    fix.chs_vip.set_boot_mode(boot_mode);
    fix.chs_vip.i2c_eeprom_preload(chs_boot_hex);
    fix.chs_vip.spih_norflash_preload(chs_boot_hex);

    // Wait for reset
    fix.chs_vip.wait_for_reset();

    if (chs_preload_elf != "" || chs_boot_hex != "") begin
      // When Cheshire is offloading to safety island, the latter should be set in passive preloaded
      // bootmode
      fix.safed_vip.set_safed_boot_mode(safety_island_pkg::Preloaded);
      // Preload in idle mode or wait for completion in autonomous boot
      if (boot_mode == 0) begin
        // Idle boot: preload with the specified mode
        case (preload_mode)
          0: begin // Standalone JTAG passive preload
            // Cheshire
            is_dram = uvm_re_match("dram",chs_preload_elf);
            if(~is_dram) begin
              $display("Wait the hyperram");
              repeat(120000)
                @(posedge fix.clk);
            end
            fix.chs_vip.jtag_init();
            fix.chs_vip.jtag_elf_run(chs_preload_elf);
            fix.chs_vip.jtag_wait_for_eoc(exit_code);
          end 1: begin  // Standalone Serial Link passive preload
            // Cheshire
            fix.chs_vip.slink_elf_run(chs_preload_elf);
            fix.chs_vip.slink_wait_for_eoc(exit_code);
          end 2: begin // Standalone UART passive preload
            fix.chs_vip.uart_debug_elf_run_and_wait(chs_preload_elf, exit_code);
          end 3: begin  // Secure boot: Opentitan booting CVA6
            if (chs_preload_elf != "") begin
              fix.chs_vip.slink_elf_preload(chs_preload_elf, unused);
              fix.chs_vip.jtag_init();
              fix.chs_vip.jtag_wait_for_eoc(exit_code);
            end
          end default: begin
            $fatal(1, "Unsupported preload mode %d (reserved)!", boot_mode);
          end
        endcase
      end else if (boot_mode == 1) begin
        $fatal(1, "Unsupported boot mode %d (SD Card)!", boot_mode);
      end else begin
        // Autonomous boot: Only poll return code
        fix.chs_vip.jtag_init();
        fix.chs_vip.jtag_wait_for_eoc(exit_code);
      end

      $display("Wait for OT to boot..."); // TODO: is there a better way to fix this?
      wait (fix.i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable == lc_ctrl_pkg::On);

      $finish;
    end
  end

  // safety island standalone
  initial begin
    // Fetch plusargs or use safe (fail-fast) defaults
    if (!$value$plusargs("SAFED_BOOTMODE=%d",     safed_boot_mode))   safed_boot_mode   = 0;
    if (!$value$plusargs("SAFED_BINARY=%s",       safed_preload_elf)) safed_preload_elf = "";

    if (safed_preload_elf != "") begin
      case (safed_boot_mode)
        0: begin
          fix.safed_vip.set_safed_boot_mode(safety_island_pkg::Jtag);
          fix.safed_vip.safed_wait_for_reset();
          fix.safed_vip.jtag_safed_init();
          fix.safed_vip.jtag_write_test(32'h6000_1000, 32'hABBA_ABBA);
          fix.safed_vip.jtag_safed_elf_run(safed_preload_elf);
          fix.safed_vip.jtag_safed_wait_for_eoc(safed_exit_code, safed_exit_status);
        end 1: begin
          fix.safed_vip.set_safed_boot_mode(safety_island_pkg::Preloaded);
          fix.safed_vip.safed_wait_for_reset();
          fix.safed_vip.axi_safed_elf_run(safed_preload_elf);
          fix.safed_vip.axi_safed_wait_for_eoc(safed_exit_code, safed_exit_status);
       end default: begin
          $fatal(1, "Unsupported boot mode %d (reserved)!", safed_boot_mode);
        end
      endcase

      $display("Wait for OT to boot..."); // TODO: is there a better way to fix this?
      wait (fix.i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable == lc_ctrl_pkg::On);

      $finish;
    end
  end

  // security island standalone
  initial begin
    // Fetch plusargs or use safe (fail-fast) defaults
    if (!$value$plusargs("SECD_BINARY=%s", secd_preload_elf)) secd_preload_elf = "";
      // Security Island
      if (secd_preload_elf != "") begin
        // Wait before security island HW is initialized
        repeat(10000)
          @(posedge fix.clk);
        fix.debug_secd_module_init();
        fix.load_secd_binary(secd_preload_elf);
        fix.jtag_secd_data_preload();
        fix.jtag_secd_wakeup(32'h E0000080);
      end
  end

  // pulp cluster standalone
  // TODO

  // spatz cluster standalone
  initial begin
    // Fetch plusargs or use safe (fail-fast) defaults
    if (!$value$plusargs("SPATZCL_BOOTMODE=%d",     spatz_boot_mode))   spatz_boot_mode   = 0;
    if (!$value$plusargs("SPATZCL_BINARY=%s",       spatz_preload_elf)) spatz_preload_elf = "";

    if (spatz_preload_elf != "") begin
      case (spatz_boot_mode)
        0: begin
          //JTAG
          $display("[JTAG SPATZ] Init ");
          fix.chs_vip.jtag_init();
          $display("[JTAG SPATZ] Halt the core and load the binary to L2 ");
          fix.chs_vip.jtag_elf_halt_load(spatz_preload_elf, spatz_binary_entry );
          // write start address into the csr
          $display("[JTAG SPATZ] write the CSR %x of spatz with the entry point %x", spatz_cluster_pkg::PeriStartAddr + spatz_cluster_peripheral_reg_pkg::SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_OFFSET, spatz_binary_entry);
          fix.chs_vip.jtag_write_reg(spatz_cluster_pkg::PeriStartAddr + spatz_cluster_peripheral_reg_pkg::SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_OFFSET, spatz_binary_entry );
          // write fetch enable register
          spatz_reg_value = {32'h00000000,32'h00000003};
          $display("[JTAG SPATZ] Write the fetch enable register %x with %x", CAR_PERIPHS_BASE_ADDR + CAR_SOC_CTRL_OFFSET + CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE_REG_OFFSET ,spatz_reg_value);
          fix.chs_vip.jtag_write_reg(CAR_PERIPHS_BASE_ADDR + CAR_SOC_CTRL_OFFSET + CARFIELD_SPATZ_CLUSTER_FETCH_ENABLE_REG_OFFSET, spatz_reg_value);
          spatz_reg_value = 64'h0000000000000000;
          //the test shouldd write 70 if ever
          do begin
            fix.chs_vip.jtag_read_reg(32'h0x78100000, spatz_reg_value);
          end while (spatz_reg_value!='h5);
          $display("Spatz EOC 32'h0x78100000 value is: %x", spatz_reg_value);
        end

        1: begin
          //Serial Link

        end default: begin
          $fatal(1, "Unsupported boot mode %d (reserved)!", spatz_boot_mode);
        end
      endcase
      $finish;
    end
  end

endmodule
