module test_c #(parameter COUNT=1 ) (
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
    demux_test
     # (.COUNT(COUNT))dmx_wb
            (.dmx_clk(i_clk),
            .d_north(w_p_sum),
            .d_west(i_west[7:0]),
            .wb_data(o_data));


endmodule


module demux_test #(parameter COUNT=1) (
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

    assign i_sum1 = temp_c;
    reg [7:0] temp_a;
    reg [15:0] temp_c;
    
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
    temp_a<=d_west;
    temp_c<=temp_a*wb;
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