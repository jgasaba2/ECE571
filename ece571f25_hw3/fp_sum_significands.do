vdel -all            ;# delete any old 'work' library
vlib work            ;# create a fresh one

vlog -sv fp_pkg.sv
vlog -sv fp_sum_significands.sv
vlog -sv fp_sum_significands_tb.sv

vsim -voptargs=+acc work.fp_sum_significands_tb  ;# or work.<your actual tb module name>

add wave -r *
run -all