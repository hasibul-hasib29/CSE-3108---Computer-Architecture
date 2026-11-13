`timescale 1ns/1ps
module dff_tb();
reg clk;
reg d;
wire q;

dff c1(clk,d,q);

always begin

    clk = ~clk;
    #10;
    
end

initial begin
    $dumpfile("dff_grp.vcd");
    $dumpvars(0,dff_tb);
    clk <= 0; d <= 1;
    #10;
    d <= 0;
    #10;
    #20;
    $finish;
end

initial begin
    $monitor("clk = %b, d = %b , q = %b " , clk, d, q);
end

endmodule