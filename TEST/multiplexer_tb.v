`timescale 1ns/1ps
module multiplexer_tb();
    reg [3:0] I;
    reg [1:0] en;
    wire [0:0] y;
    multiplexer uut(.i(I), .en(en), .y(y)); // Corrected port names and signal types

    initial begin
        I = 4'b1010;
        en = 2'b01;
        #20;
        en = 2'b10;
        #20;
        en = 2'b11;
        #20;
        $finish;
    end

    initial begin
        $monitor("i= %b ,,, en= %b || y= %b ", I, en, y);
    end
endmodule
