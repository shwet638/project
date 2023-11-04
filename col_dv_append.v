module col_dv_append#(
    parameter W_DATA = 8
)(
    input i_clk,
    input [W_DATA-1:0] i_data,
    input i_data_valid,
    output [8:0] o_data
);

assign o_data = {i_data_valid, i_data}; 

endmodule