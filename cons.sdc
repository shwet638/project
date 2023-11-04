create_clock -period 7.1429 i_clk
create_clock -period 12.5000 f_clk
create_clock -period 10.0000 c_clk
set_multicycle_path -setup  -end -from o_south_data[804]~FF|CLK  -to output_data_design/o_relu_data[200]~FF 2
set_multicycle_path -setup -end   -from o_south_data[842]~FF|CLK  -to output_data_design/o_relu_data[211]~FF  2
#set_multicycle_path -hold  -start    -from  o_south_data[804]~FF|CLK    -to output_data_design/o_relu_data[200]~FF  1
set_multicycle_path -setup  -end -from o_south_data[361]~FF|CLK  -to output_data_design/o_relu_data[89]~FF 2
set_multicycle_path -setup  -end -from input_data_design/in_fifo_col_controller/counter[0]~FF_REP6|CLK  -to north_w_p_sum[0]~FF 2
set_multicycle_path -setup  -end -from o_south_data[167]~FF|CLK   -to north_w_p_sum[0]~FF 2
set_multicycle_path -setup  -end -from o_south_data[84]~FF|CLK     -to output_data_design/o_relu_data[19]~FF  2
set_multicycle_path -setup  -end -from o_south_data[654]~FF|CLK     -to output_data_design/o_relu_data[167]~FF  2  
set_multicycle_path -setup  -end -from o_south_data[651]~FF|CLK     -to output_data_design/o_relu_data[167]~FF  2
set_multicycle_path -setup  -end -from o_south_data[649]~FF|CLK     -to output_data_design/o_relu_data[167]~FF  2
