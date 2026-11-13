`timescale 1ns/1ps
module encoder_tb();
reg [3:0] x;
reg en;
wire [1:0] y;

encoder uut(x,en,y);
initial begin
    // x = 4'b0000;
    
    en=0;
    #20;
    en=1;
    #20;
    x = 4'b0001;

    #20;
    x = 4'b0010;
    #20;
    x= 4'b0100;
    #20;
    x=4'b1100;
    #20;
    x=4'b0111;
    #20;
    x=4'b1010;
    #20;
    $finish;
end

initial begin
    $monitor("x = %b , en = %b  ,, y = %b ", x,en, y);
end

endmodule