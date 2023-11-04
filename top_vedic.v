module top_vedic  (input [7:0]a,
input [7:0] b,
input clk,
output reg [15:0]c    );
wire [15:0] temp_c;
reg [7:0] temp_a,temp_b;
multiply8 m1(.clk(clk),.a(temp_a),.b(temp_b),.y(temp_c));
always @(posedge clk)
begin
    temp_a<=a;
    temp_b<=b;
    c<=temp_c;
end

endmodule