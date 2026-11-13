`timescale 1ns/1ps
module demultiplexer_tb();
reg i;
reg [1:0] en;
wire [3:0] y;

demultiplexer uut(i,en,y);
initial begin
    i=1;
    en = 2'b00;
    #20;
    en = 2'b11;
    #20;
    en=2'b10;
    #20;
    $finish;
end

initial begin
    $monitor("i= %b ,, en = %b || y = %b" , i, en, y);
end

endmodule