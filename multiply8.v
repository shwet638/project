`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 11:10:27
// Design Name: 
// Module Name: multiply8
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


module multiply8(input [7:0] a,
input [7:0] b,
input clk,
output [15:0] c 
);
wire [7:0] p;
wire  [7:0] p1;
wire [7:0] p2;
wire [7:0] p3;
//wire [7:0] p4;
wire [11:0] temp;
wire [11:0] temp_ans;
//multiply4x4 m1(.a(a[3:0]),
//.b(b[3:0]),
//.c(p)
//);
//assign c[3:0]=p[3:0];

//multiply4x4 m2(.a(a[7:4]),.b(b[3:0]),.c(p1));
//multiply4x4 m3(.a(a[3:0]),.b(b[7:4]),.c(p2));

//adder10 a1(.a({2'b00,p1}),.b({2'b00,p2}),.sum(temp));
//adder10 a2(.a({6'b000000,p[7:4]}),.b(temp),.sum(temp1));
//assign c[7:4]=temp1[3:0];

//multiply4x4 m4(.a(a[7:4]),.b(b[7:4]),.c(p3));
//adder8 a3(.a(p3),.b({2'b00,temp1[9:4]}),.sum(p4));

//assign c[15:8]=p4;

multiply4x4 m1(.a(a[3:0]),
.b(b[3:0]),
.c(p)
);
assign c[3:0]=p[3:0];

reg  [7:0]pipe;
reg  [7:0]pipe1;
reg  [7:0]pipe2;
reg  [7:0]pipe3;

multiply4x4 m2(.a(a[7:4]),.b(b[3:0]),.c(p1));
multiply4x4 m3(.a(a[3:0]),.b(b[7:4]),.c(p2));

multiply4x4 m4(.a(a[7:4]),.b(b[7:4]),.c(p3));

twbitmcsa t1(.a({4'b0000,pipe1}),.b({4'b0000,pipe2}),.c(temp));
twbitmcsa t2(.a(temp),.b({pipe3,pipe[7:4]}),.c(temp_ans));
assign c[15:4]=temp_ans;
always @(posedge clk)
begin
    pipe<=p;
    pipe1<=p1;
    pipe2<=p2;
    pipe3<=p3;
end 
endmodule
