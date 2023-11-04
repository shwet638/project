`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 09:34:20
// Design Name: 
// Module Name: twbitmcsa
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


module twbitmcsa(input [11:0] a,
input [11:0] b,
output [11:0] c
);

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

adder a1(.a(a[0]),.b(b[0]),.sum(c[0]),.cout(w1));

adder_full fa_1(.a(a[1]),.b(b[1]),.cin(w1),.sum(c[1]),.cout(w2));

adder_full fa_2(.a(a[2]),.b(b[2]),.cin(w2),.sum(c[2]),.cout(w3));

adder_full fa_3(.a(a[3]),.b(b[3]),.cin(w3),.sum(c[3]),.cout(w4));

adder_full fa_4(.a(a[4]),.b(b[4]),.cin(w4),.sum(c[4]),.cout(w5));

adder_full fa_5(.a(a[5]),.b(b[5]),.cin(w5),.sum(c[5]),.cout(w6));

adder_full fa_6(.a(a[6]),.b(b[6]),.cin(w6),.sum(c[6]),.cout(w7));
adder_full fa7(.a(a[7]),.b(b[7]),.cin(w7),.sum(c[7]),.cout(w8));
adder_full fa8(.a(a[8]),.b(b[8]),.cin(w8),.sum(c[8]),.cout(w9));

adder_full fa9(.a(a[9]),.b(b[9]),.cin(w9),.sum(c[9]),.cout(w10));
adder_full fa10(.a(a[10]),.b(b[10]),.cin(w10),.sum(c[10]),.cout(w11));

adder_full fa11(.a(a[11]),.b(b[11]),.cin(w11),.sum(c[11]),.cout());
endmodule
