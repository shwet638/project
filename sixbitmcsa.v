`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 19:03:34
// Design Name: 
// Module Name: sixbitmcsa
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


module sixbitmcsa(input [5:0] a,
input [5:0] b,
output [5:0] c);

wire w1,w2,w3,w4,w5;
adder a1(.a(a[0]),.b(b[0]),.sum(c[0]),.cout(w1));

adder_full fa1(.a(a[1]),.b(b[1]),.cin(w1),.sum(c[1]),.cout(w2));

adder_full fa2(.a(a[2]),.b(b[2]),.cin(w2),.sum(c[2]),.cout(w3));

adder_full fa3(.a(a[3]),.b(b[3]),.cin(w3),.sum(c[3]),.cout(w4));

adder_full fa4(.a(a[4]),.b(b[4]),.cin(w4),.sum(c[4]),.cout(w5));

adder_full fa5(.a(a[5]),.b(b[5]),.cin(w5),.sum(c[5]),.cout());

 


endmodule
