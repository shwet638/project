`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2023 15:17:39
// Design Name: 
// Module Name: adder_full
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


module adder_full(input a,
input b,
input cin,
output cout,
output sum);
//assign sum=a^b^cin;
//assign cout=(a^b)&cin | a&b;
wire [1:0] w_sel;
assign w_sel[1]=a;
assign w_sel[0]=b;
mux4 m1(.sel(w_sel),.d0(1'b0),.d1(cin),.d2(cin),.d3(1'b1),.c(cout));
wire temp;
assign temp=~cin;
mux4 m2(.sel(w_sel),.d0(cin),.d1(temp),.d2(temp),.d3(cin),.c(sum));


endmodule
