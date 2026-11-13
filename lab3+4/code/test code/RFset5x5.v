module RFSet (
    input wire clk,
    input wire reset,
    input wire [2:0] RA,
    input wire [2:0] RB,
    input wire RE,  
    input wire [2:0] WR,  
    input wire [4:0] WRD,
    output reg [4:0] A,
    output reg [4:0] B
);

    wire [4:0] R00, R01, R10, R11, R100;
    reg [4:0] WR_SEL;

    RF5bit Reg00 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[0]), .Dout(R00));
    RF5bit Reg01 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[1]), .Dout(R01));
    RF5bit Reg10 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[2]), .Dout(R10));
    RF5bit Reg11 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[3]), .Dout(R11));
    RF5bit Reg100 (.clk(clk), .reset(reset), .Din(WRD), .Sel(WR_SEL[4]), .Dout(R100));
    
    always @(*) 
       begin
            case ({RE, WR})
                4'b1000: WR_SEL = 5'b00001;  
                4'b1001: WR_SEL = 5'b00010;  
                4'b1010: WR_SEL = 5'b00100;  
                4'b1011: WR_SEL = 5'b01000;  
                4'b1100: WR_SEL = 5'b10000;  
                default: WR_SEL = 5'b0000; 
            endcase
        end 

    always @(*) 
        begin
            case (RA)
                3'b000: A = R00;
                3'b001: A = R01;
                3'b010: A = R10;
                3'b011: A = R11;
                3'b100: A = R100;
                default: A = 5'b0000;
            endcase
        end

    always @(*) 
        begin
            case (RB)
                3'b000: B = R00;
                3'b001: B = R01;
                3'b010: B = R10;
                3'b011: B = R11;
                3'b100: B = R100;
                default: B = 5'b0000;
            endcase
        end

endmodule
