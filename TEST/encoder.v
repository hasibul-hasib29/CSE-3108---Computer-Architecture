module encoder (
    input wire [3:0] x,
    input wire en,
    output reg [1:0] y
);


always @(*) begin
    casex ({en, x})
        {1'b1, 4'b1xxx} : y = 2'b11; // If x[3] is 1, output is 2'b11 (highest priority)
        {1'b1, 4'b01xx}: y = 2'b10; // If x[2] is 1 and x[3] is 0, output is 2'b10
        {1'b1, 4'b001x}: y = 2'b01; // If x[1] is 1 and x[3:2] is 00, output is 2'b01
        {1'b1, 4'b0001}: y = 2'b00; // If x[0] is 1 and x[3:1] is 000, output is 2'b00
        // {1'b0, 4'bxxxx}: y = 2'bxx; // If en is 0, output is 2'b00 (don't care about x)
        default: y = 2'b00;   // If none of the above conditions are met, output is don't care
    endcase

    
    // if(en==0)
    //     y=2'b00;
    // else if(x[3]==1)
    //     y=2'b11;
    // else if(x[2]==1)
    //     y=2'b10;
    // else if(x[1]==1)
    //     y=2'b01;
    // else if(x[0]==1)
    //     y=2'b00;
end

endmodule