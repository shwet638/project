module test_pe_grid #(
    parameter ROWS = 9,
    parameter COLS = 1
)(
    input i_clk,

    input [(ROWS * 9) - 1:0] i_west_data, 
     input [(COLS * 32) - 1:0] i_north_data, 

    output [(COLS * 32) - 1:0] o_data_32,
    output [(ROWS * 9) - 1:0] o_data_8
);
    
   genvar i, j; 
    generate 
        for (i = 0; i < ROWS ; i = i + 1) begin: PE_EL_ROWS
            for (j = 0; j < COLS ; j = j + 1) begin: PE_EL_COLS
        
            wire [32:0] out_data_32;
            wire [8:0] out_data_8 ;
            wire sel;
            
                if (i == 0 && j == 0) begin
                    test_c #(.COUNT(ROWS -i-1))
                                pe_block(.i_clk(i_clk),
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );     
                end else if(i == ROWS - 1 && j == 0) begin
                     test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
     
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(out_data_8)
                            );
                end else if (j == 0) begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                        
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );
                end else if (i == 0 && j == COLS - 1) begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
      
                                .o_data(out_data_32),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (i == 0) begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
                               
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );
                end else if ((i == ROWS - 1) && (j == COLS - 1)) begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                             
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                              
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (j == COLS - 1) begin 
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                                
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                              
                                .o_data(out_data_32),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (i == ROWS - 1) begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                                
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(out_data_8)
                            );
                end else begin
                    test_c #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                              
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                              
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );
                end
            end
        end 
    endgenerate
    

endmodule