# $Id: modelsim_v.do,v 1.1.1.1 2005-01-04 02:05:58 arif_endro Exp $
#
destroy .wave;
destroy .list;
vlib work;
vlog *.v;
vsim bench;
add wave -height 80 -scale .1 -format Analog-Step /bench/myfm/fmin
add wave -height 80 -scale .1 -format Analog-Step /bench/myfm/output_nco
add wave -height 80 -scale 1. -format Analog-Step /bench/myfm/phase_output 
add wave -height 80 -scale .0002 -format Analog-Step /bench/myfm/mynco/myaddacc/result
add wave -height 80 -scale .1 -format Analog-Step /bench/myfm/loop_out
add wave -height 80 -scale 1. -format Analog-Step /bench/myfm/dmout 
