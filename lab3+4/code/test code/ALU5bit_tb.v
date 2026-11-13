module alu_tb;
    reg [4:0] A, B;       
    reg [1:0] OP;          
    wire [4:0] R;          
    wire CF;               

    alu uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF)
    );

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, alu_tb);

        A = 5'b00100; B = 5'b00011; OP = 2'b00;
        #10;

        A = 5'b01000; B = 5'b00010; OP = 2'b01;
        #10;

        A = 5'b00111; B = 5'b00101; OP = 2'b10;
        #10;

        A = 5'b00110; B = 5'b01001; OP = 2'b11;
        #10;

        A = 5'b01111; B = 5'b01111; OP = 2'b00;
        #10;

        A = 5'b01001; B = 5'b00100; OP = 2'b01;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b", $time, A, B, OP, R, CF);
    end

endmodule
