`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 09:45:03
// Design Name: 
// Module Name: multiply
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


module multiply(input [1:0]a,
input [1:0] b,
output [3:0] c);

wire [3:0] w;
assign c[0]=a[0]&b[0];
assign w[0]=a[0]&b[1];
assign w[1]=a[1] & b[0];
assign w[2]=a[1]&b[1];

adder add_c1(.a(w[0]),.b(w[1]),.cout(w[3]),.sum(c[1]));
adder add_c2(.a(w[3]),
.b(w[2]),
.sum(c[2]),
.cout(c[3])
);





endmodule
