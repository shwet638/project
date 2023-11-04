/*
	Multiple registers are appended before 1st column of systolic array,
    to provide required row-wise delay to input data for rows
*/
module systolic_array_dada
#(parameter ROW = 9, 
  parameter COL = 3, 
  parameter TOTAL_BYTES = ROW * COL)
(   input in_clk, 
    input in_sel,   							
    input [(COL * 32) - 1:0] in_north,  		//32 bit partial sum input 
    input [(ROW * 9) - 1:0] in_west,    		//8 bit data input
    output [COL-1:0] out_sel, 
    output [(ROW * 9) - 1:0] out_east,  		//9 bit output from last column
    output [(COL * 32) - 1:0] out_south,    	//32 bit data output from the last row
    output last_row_i_data_valid    			//Shows the validity of input 8 bit data which is going into the last row of systolic array
    );
    
    wire [(ROW* 9) - 1 : 0] data_to_be_passed;  //8 bit input data to be fetched from registers goes as input into the first column of systolic array
    
    assign last_row_i_data_valid = data_to_be_passed[8];

   //NxM systolic array grid, excluding the registers used for providing delay to input data 
    pe_grid_dada #(.ROWS (ROW),
    .COLS (COL)
) top_instance (.i_clk (in_clk),
    .i_sel (in_sel), 
    .i_west_data (data_to_be_passed), 
    .i_north_data (in_north), 
    .o_sel (out_sel),  
    .o_data_32 (out_south),
    .o_data_8 (out_east)
);

//Registers for providing row wise delay to the input data
reg_module_dada #(.ROW (ROW))
delay_reg(.in_clk (in_clk), 
    .in_west (in_west) ,
    .data_to_be_passed (data_to_be_passed)
);

endmodule

/*
	Multiple registers used for providing delay to the input data
*/
module reg_module_dada #(parameter ROW = 9)(
    input in_clk, 
    input [(ROW * 9) - 1 : 0] in_west,
    output [(ROW * 9) - 1 : 0] data_to_be_passed
);

assign data_to_be_passed [80:72] = in_west[80:72];

genvar i , j;
generate
    for (i = 0; i < ROW; i = i + 1) begin: FOR_ROW
        for (j = 0; j < i; j = j + 1) begin: FC_IN
            wire [8:0] data_out_reg;
            if (j == 0 && j == i - 1) begin
                data_reg_dada dr (
                    .clk(in_clk),
                    .o_data(data_to_be_passed[(ROW - i) * 9 - 1 -: 9]),
                    .i_data(in_west[(ROW - i) * 9 - 1 -: 9])
                );
            end else if (j == 0) begin
                 data_reg_dada dr (
                    .clk(in_clk),
                    .o_data(data_out_reg),
                    .i_data(in_west[(ROW - i) * 9 - 1 -: 9])
                );
            end else if (j == i - 1) begin
                data_reg_dada dr (
                    .clk(in_clk),
                    .o_data(data_to_be_passed[(ROW - i) * 9 - 1 -: 9]),
                    .i_data(FOR_ROW[i].FC_IN[j-1].data_out_reg)
                );
            end else begin
                data_reg_dada dr (
                    .clk(in_clk),
                    .o_data(data_out_reg),
                    .i_data(FOR_ROW[i].FC_IN[j-1].data_out_reg)
                );
            end
        end
    end
endgenerate

endmodule    

//Delay is provided to the inputs of rows in systolic array by storing it into this register
module data_reg_dada(
    input clk, 
    input [8:0] i_data, 
    output reg [8:0] o_data= 0
); 
    always @(posedge clk) begin 
        o_data <= i_data; 
    end 
    
endmodule
