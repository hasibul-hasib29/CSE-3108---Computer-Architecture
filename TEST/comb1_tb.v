`timescale 1ns/1ns
module comb1_tb();
reg [3:0]a;
reg [3:0]b;
reg [3:0]c;
wire [3:0]d;
comb1 uut(a,b,c,d);

initial begin
    c = 4'b1010;
    #20;
    c = 4'b1111;
    #20;
end

initial begin
    $monitor("c %4b, %d || d = %4b -- %d", c,c,d, d);
end
endmodule