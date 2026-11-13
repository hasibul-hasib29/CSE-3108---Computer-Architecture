`timescale 1ns/1ns

module decoder_tb();
    reg [1:0] x;
    reg en;
    wire [3:0] y;

    decoder uut(x, en, y);

    initial begin
        en = 0;
        x = 2'b00;
        #20;
        en = 1;
        x[0] = 0;
        x[1] = 1;
        #20;
        x[0] = 1;
        x[1] = 1;
        $finish;
    end

    initial begin
        $monitor("en = %b x[0] = %b, x[1] = %b || y = %4b",en, x[0], x[1], y);
    end
endmodule
