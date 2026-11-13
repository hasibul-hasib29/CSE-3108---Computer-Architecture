module RFSet_tb;
    reg clk;
    reg reset;
    reg [2:0] RA;
    reg [2:0] RB;
    reg RE;
    reg [2:0] WR;
    reg [4:0] WRD;
    wire [4:0] A;
    wire [4:0] B;

    RFSet uut (
        .clk(clk),
        .reset(reset),
        .RA(RA),
        .RB(RB),
        .RE(RE),
        .WR(WR),
        .WRD(WRD),
        .A(A),
        .B(B)
    );

    always 
    begin
        clk = ~clk; 
        #5;
    end 

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, RFSet_tb);

        clk = 0;
        reset = 1;  
        RA = 3'b000;
        RB = 3'b000;
        RE = 0;
        WR = 3'b000;
        WRD = 5'b00000;
        #10;

        reset = 0;  
        #10;

        RE = 1; 
        
        WR = 3'b000; WRD = 5'b11101; RA = 3'b000; RB = 3'b000; 
        #10;

        WR = 3'b001; WRD = 5'b10101; RA = 3'b001; RB = 3'b000; 

        #10;

        WR = 3'b010; WRD = 5'b11011; RA = 3'b010; RB = 3'b001; 

        #10;

        WR = 3'b100; WRD = 5'b10001; RA = 3'b010; RB = 3'b100; 
 
        #10;

        RE = 0; 

        WR = 3'b011; WRD = 5'b11101; RA = 3'b011; RB = 3'b000; 

        #10;

                WR = 3'b011; WRD = 5'b11101; RA = 3'b011; RB = 3'b000; 
                #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | RA = %b | RB = %b | WR = %b | WRD = %b | RE = %b | A = %b | B = %b", 
                 $time, clk, reset, RA, RB, WR, WRD, RE, A, B);
    end

endmodule
