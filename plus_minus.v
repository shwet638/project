module plus_minus(input clk,input a, input b, output  [1:0] c);
reg x;
reg y;
assign c=x+y;
always @(posedge clk)
begin 
x<=a;
y<=b;
end
endmodule
