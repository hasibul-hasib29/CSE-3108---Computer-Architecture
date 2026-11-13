`timescale 1ns/1ps
module adder1bit_tb();

    reg a;
    reg b;
    reg cin;
    wire s;
    wire co;

adder1bit cir1(a,b,cin, s, co);
initial begin
$dumpfile("test.vcd");
$dumpvars(0,adder1bit_tb);
    a = 1'b1;
    b = 1'b1;
    cin = 1'b1;
    #20;
    a = 1'b0;
    #20;
    a=1'b0;
    $finish;


    

end

initial begin
    $monitor ( "a = %b b=%b , cin = %b | cout = %b", a, b, cin, co, s);
end
endmodule