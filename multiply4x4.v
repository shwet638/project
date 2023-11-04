`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 10:12:09
// Design Name: 
// Module Name: multiply4x4
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


module multiply4x4(input [3:0]a,
input[3:0] b,output [7:0] c );

wire [3:0] p1;
wire [3:0] p2;
wire [3:0] p3;
wire [3:0] p4;
//wire [3:0] p5;
wire [5:0] w1;
wire [5:0] temp;
//wire [5:0] temp1;
//multiply m1(.a(a[1:0]),.b(b[1:0]),.c(p1));
//assign c[1:0]=p1[1:0];

//multiply m2(.a(a[3:2]),.b(b[1:0]),.c(p2));
//multiply m3(.a(a[1:0]),.b(b[3:2]),.c(p3));

//assign w1={4'b0000,p1[3:2]};
//adder6 a1(.a({2'b00,p2}),.b({2'b00,p3}),.sum(temp));

//adder6 a2(.a(6temp),.b(w1),.sum(temp1));
//assign c[3:2]=temp1[1:0];

//multiply m4(.a(a[3:2]),.b(b[3:2]),.c(p4));
//adder4 a3(.a(p4),.b(temp1[5:2]),.sum(p5));
//assign c[7:4]=p5;

multiply m1(.a(a[1:0]),.b(b[1:0]),.c(p1));
assign c[1:0]=p1[1:0];

multiply m2(.a(a[3:2]),.b(b[1:0]),.c(p2));
multiply m3(.a(a[1:0]),.b(b[3:2]),.c(p3));

multiply m4(.a(a[3:2]),.b(b[3:2]),.c(p4));
sixbitmcsa s1(.a({2'b00,p2}),.b({2'b00,p3}),.c(w1));
sixbitmcsa s2(.a(w1),.b({p4,p1[3:2]}),.c(temp));
assign c[7:2]=temp;


endmodule
