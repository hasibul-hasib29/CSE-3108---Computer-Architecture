module alu_tb;
    reg [2:0] A, B;       
    reg [2:0] OP;          
    wire [2:0] R;          
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

        A = 3'b100; B = 3'b011; OP = 3'b000;
        #10;

        A = 3'b100; B = 3'b011; OP = 3'b010;

        #10;
                A = 3'b110; B = 3'b011; OP = 3'b111;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b", $time, A, B, OP, R, CF);
    end

endmodule
