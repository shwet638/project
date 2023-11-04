module test_pe_grid_dada #(
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
                    test_c_dada #(.COUNT(ROWS -i-1))
                                pe_block(.i_clk(i_clk),
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );     
                end else if(i == ROWS - 1 && j == 0) begin
                     test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
     
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(out_data_8)
                            );
                end else if (j == 0) begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(i_west_data[((ROWS - i) * 9) - 1 -: 9]),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                        
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );
                end else if (i == 0 && j == COLS - 1) begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
      
                                .o_data(out_data_32),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (i == 0) begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(i_north_data[((COLS - j) * 32) - 1 -: 32]),
                               
                                .o_data(out_data_32),
                                .data8(out_data_8)
                            );
                end else if ((i == ROWS - 1) && (j == COLS - 1)) begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                             
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                              
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (j == COLS - 1) begin 
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                                
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                              
                                .o_data(out_data_32),
                                .data8(o_data_8[(ROWS - i) * 9 - 1 -: 9])
                            );
                end else if (i == ROWS - 1) begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                               
                                .i_west(PE_EL_ROWS[i].PE_EL_COLS[j-1].out_data_8),
                                .w_p_sum(PE_EL_ROWS[i-1].PE_EL_COLS[j].out_data_32),
                                
                                .o_data(o_data_32[(COLS - j) * 32 - 1 -: 32]),
                                .data8(out_data_8)
                            );
                end else begin
                    test_c_dada #(.COUNT(ROWS -i-1))  pe_block(.i_clk(i_clk),
                              
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
module test_c_dada #(parameter COUNT=1 ) (
    input i_clk,
   // input i_sel,
    input [8:0] i_west,
    input [31:0] w_p_sum,
  //  output o_sel,
    output [31:0] o_data,
    output reg [8:0] data8 = 0
);
    
    
    always @(posedge i_clk) begin 
        data8 <= i_west; 
    end 
	//Include operations done on weights and data in a PE block     
    demux_test_dada
     # (.COUNT(COUNT))dmx_wb
            (.dmx_clk(i_clk),
            .d_north(w_p_sum),
            .d_west(i_west[7:0]),
            .wb_data(o_data));


endmodule


module demux_test_dada #(parameter COUNT=1) (
    input dmx_clk,
    
    input [31:0] d_north,
    input [7:0] d_west,
    output  reg [31:0]  wb_data
    
);

    reg current_state=0;
    reg [7:0] wb = 0;
    wire [31:0] o_dmx2;
    wire [7:0] o_dmx1;
    wire [31:0] i_sum1;
    wire [31:0] mux_d2;
    assign o_dmx1 = d_north[7:0];
    assign o_dmx2 = (current_state) ? d_north : 0;

    //assign i_sum1 = d_west * wb;
    wire [15:0]temp;
    top dada(.clk(dmx_clk),.a(d_west),.b(wb),.c(temp));
    assign i_sum1=temp;

    
    reg [3:0] r_count=COUNT;
 

    assign mux_d2 = i_sum1 + o_dmx2;
   // assign wb_data=(current_state)?mux_d2:o_dmx1;
    always @(posedge dmx_clk) begin

        case(current_state)

        1'b0:
        begin   
            if(r_count!=0)begin
                wb<=o_dmx1;
                r_count<=r_count-1;
                end
                else
                current_state<=1'b1;
        end
        1'b1:
            wb<=wb;
        default:wb<=0;
        endcase

        
    end
  
    always @(posedge dmx_clk)
    
    begin 
        if(current_state)
        wb_data<=mux_d2;
        else
        wb_data<=o_dmx1;
   end

            



        // if(i_sel ) begin 
        //     wb <= o_dmx1;
        // end
        // else begin
        //     wb <= wb;
        // end

    
endmodule