`timescale 1ps/1ps
module test_t;
    reg [2:0] a;
    wire [2:0] b;
    test uut(a,b);

    initial begin
        a = 3'b000;
        #10;
        a = 3'b001;
        #10;
        a = 3'b111;
        #10;
        #10;
        #10;
        #10;
    end
    initial begin
    $monitor("a = %b , b= %b ", a, b);
    end
endmodule