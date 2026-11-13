module RFSet_tb;
    reg clk;
    reg reset;
    reg  RA;
    reg  RB;
    reg RE; 
    reg  WR;  
    reg [4:0] WRD;
     wire  A;
     wire B;
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
        RA = 1'b0;
        RB = 1'b0;
        RE = 0;
        WR = 1'b0;
        WRD = 5'b00000;
        #10;

        reset = 0;  
        #10;

        RE = 1; 
        
        WR = 1'b0; WRD = 5'b11101; RA = 1'b0; RB = 2'b1; 
        #10;
        WR = 1'b1; WRD = 5'b11111; RA = 1'b0; RB = 2'b1; 

          #10;

        RE = 0; 

        WR = 1'b1; WRD = 5'b11111; RA = 1'b0; RB = 2'b1; 
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | RA = %b | RB = %b | WR = %b | WRD = %b | RE = %b | A = %b | B = %b", 
                 $time, clk, reset, RA, RB, WR, WRD, RE, A, B);
    end

endmodule
