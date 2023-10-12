# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Create project
set project carfield_$::env(BOARD)

create_project $project ./$project -force -part $::env(XILINX_PART)
set_property board_part $::env(XILINX_BOARD) [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]

# set number of threads to 8 (maximum, unfortunately)
set_param general.maxThreads 8

# Define sources
set_property ip_repo_paths ./carfield_ip [current_project]
update_ip_catalog

import_files -fileset constrs_1 -norecurse constraints/$::env(BOARD).xdc

source scripts/carfield_bd.tcl
source scripts/add_includes.tcl

make_wrapper -files [get_files $project/$project.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse $project/$project.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v

# Create OOC runs
generate_target all [get_files *design_1.bd]
export_ip_user_files -of_objects  [get_files *design_1.bd] -no_script
create_ip_run [get_files *design_1.bd]

# Start OOC synthesis of changed IPs
set synth_runs [get_runs *synth*]
set synth_1_idx [lsearch $synth_runs "synth_1"]
set all_ooc_synth [lreplace $synth_runs $synth_1_idx $synth_1_idx]
set runs_queued {}
foreach run $all_ooc_synth {
    if {[get_property PROGRESS [get_run $run]] != "100%"} {
        puts "Launching run $run"
        lappend runs_queued $run
        # Default synthesis strategy
        set_property strategy Flow_RuntimeOptimized [get_runs $run]
    } else {
        puts "Skipping 100% complete run: $run"
    }
}
if {[llength $runs_queued] != 0} {
    reset_run $runs_queued
    launch_runs $runs_queued -jobs 16
    puts "Waiting on $runs_queued"
    foreach run $runs_queued {
        wait_on_run $run
    }
    # reset main synthesis
    reset_run synth_1
}

set_property strategy Flow_RuntimeOptimized [get_runs synth_1]
set_property strategy Flow_RuntimeOptimized [get_runs impl_1]

set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
# Enable sfcu due to package conflicts
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-sfcu} -objects [get_runs synth_1]

launch_runs synth_1
wait_on_run synth_1
open_run synth_1 -name synth_1

# Implementation
launch_runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
