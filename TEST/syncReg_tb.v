`timescale 1ns/1ns
module syncReg_tb();
reg clk;
reg reset;
reg en;
reg d;
wire q;

syncReg uut(clk,reset,en,d,q);

always begin
    clk = ~clk;
    #10;    
end

initial begin
    $dumpfile("syncReg.vcd");
    $dumpvars(0,syncReg_tb);
    clk <=0;
    reset <= 0;
    en <=1;
    d<=1;
    #20;

    reset <= 1;
    en<=1;
    d <= 0;
    #20;
    reset <=0;
    d<=1;
    #10;
    reset <= 0;
    d<=1;
    #20;


    #50;

    $finish;

end

initial begin
    $monitor("clk = %b, reset = %b , en = %b , d = %b,, q = %b", clk, reset, en, d,q);
end

endmodule