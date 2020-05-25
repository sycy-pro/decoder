restart -nowave -force
add wave -radix hex *
add wave -radix hex /brute_force/*
#add wave -radix hex /brute_force/d0/*
force clk 0 0, 1 5 -r 10
force rst 1 0, 0 1
force ena 1 0
force start 0 0, 1 40
force data 16#2446724016d57538 0
#force key 16#0123456789abcdeffedcba9876543210 0
run 1000