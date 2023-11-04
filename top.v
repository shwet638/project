`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 14:57:19
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top  (input [7:0]a,
input [7:0] b,
input clk,
output reg [15:0]c    );
wire [15:0] temp_c;
reg [7:0] temp_a,temp_b;
dada_mul m1(.a(temp_a),.b(temp_b),.y(temp_c));
always @(posedge clk)
begin
    temp_a<=a;
    temp_b<=b;
    c<=temp_c;
end

endmodule
