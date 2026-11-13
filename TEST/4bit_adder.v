module fourbitadder(
    input wire [3:0] a,
    input wire [3:0] b,
    output reg [3:0] r,
    input wire clk,
    input wire reset
);

reg [3:0] r_res;
regester r1(clk,reset,r,r_res);
always @(*) begin
    
assign r = (a + b);
end

endmodule
