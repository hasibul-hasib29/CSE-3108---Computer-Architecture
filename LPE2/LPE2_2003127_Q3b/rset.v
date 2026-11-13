module RFSet (
    input wire clk,
    input wire reset,
    input wire  RA,
    input wire  RB,
    input wire RE,  
    input wire  WR,  
    input wire [4:0] WRD,
    output reg  A,
    output reg  B
);

    wire [4:0] R00, R01;
    reg [1:0] WR_SEL;

    RF5bit Reg00 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[0]), .Dout(R00));
    RF5bit Reg01 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[1]), .Dout(R01));

    
    always @(*) 
       begin
            case ({RE, WR})
                2'b10: WR_SEL = 2'b01;  
                2'b11: WR_SEL = 2'b10;  
  
                default: WR_SEL = 2'b00; 
            endcase
        end 

    always @(*) 
        begin
            case (RA)
                1'b0: A = R00;
                1'b1: A = R01;

                default: A = 5'b00000;
            endcase
        end

    always @(*) 
        begin
            case (RB)
                1'b0: B = R00;
                1'b1: B = R01;

                default: B = 5'b00000;
            endcase
        end

endmodule
