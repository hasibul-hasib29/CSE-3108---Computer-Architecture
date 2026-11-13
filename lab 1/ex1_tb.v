`timescale 1ns/1ps
module ex1_tb();
reg A;
reg B;
reg C;
reg D;
wire Z;

ex1 uut(Z, A, B, C, D);

initial begin
    $dumpfile("testtt.vcd");
    $dumpvars(0,ex1_tb);
    A = 0;
    D = 0;
    C = 0;
    B = 0;
    #10;
    A = 1;
    D = 0;
    C = 1;
    B = 0;
    #10;
    A = 0;
    D = 1;
    C = 0;
    B = 1;
    #100;
        A = 0;
    D = 0;
    C = 0;
    B = 0;
    $finish; // Added semicolon here
end

initial begin
    $display("A=%b , B = %b , C=%b, D = %b, Z= %b \n", A, B, C, D, Z);
end

endmodule
