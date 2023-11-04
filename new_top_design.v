module new_top_design(
input i_clk,
    input i_sel_1,
    input i_sel_2,
    input i_trigger_1,
    input i_trigger_2,
    input i_rx_serial,
    output o_tx_serial_column1,
    output o_tx_serial_column2,
    output o_tx_serial_row);
    
    
    
    
    
 top_design t1(.i_clk(i_clk),
 .i_sel_2(i_sel_2),
 .i_sel_1(i_sel_2),
 .i_trigger_1(i_trigger_1),
 .i_trigger_2(i_trigger_2),
 .i_rx_serial(i_rx_serial),
 .o_tx_serial_column(o_tx_serial_column),
 .o_tx_serial_row(temp_west));
 
 
 wire [80:0] temp_west;
 
 
 
 top_design_dada t2(.i_clk(i_clk),
 .i_sel_2(i_sel_2),
 .i_sel_1(i_sel_2),
 .i_trigger_1(i_trigger_1),
 .i_trigger_2(i_trigger_2),
 .i_rx_serial(temp_west),
 .o_tx_serial_column(o_tx_serial_column2),
 .o_tx_serial_row(o_tx_serial_row));
 
 endmodule
 