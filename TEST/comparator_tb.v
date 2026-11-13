`timescale 1ns/1ps
module comparator_tb();
reg a;
reg b;
wire c;

comparator uut(
    a,b,c
);

initial begin
    $dumpfile("comparatorout.vcd");
    $dumpvars(0, comparator_tb);
    a = 0;
    b=0;
    #20;
    a=1;
    #20;
    b=1;
    #20;
    a=0;
    #20;
    $finish;
end

initial begin
    $monitor("x = %d, y = %d || z = %d \n", a, b, c);
end

endmodule