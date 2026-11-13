module fdownct (
    input wire clk,
    input wire reset,
    output wire [3:0] q
);
reg [3:0] q_reg;
wire [3:0] q_temp,q_next, d_temp;

always @(posedge clk , posedge reset) begin
    if(reset)
        q_reg <= 4'b1111;
    else
        q_reg <= q_next;

end
// always @(*) begin
//     q_next <= d_temp;
// end
assign q_next = d_temp;
assign q_temp = q_reg;

assign d_temp = q_temp - 1;
assign q = q_temp;

    
endmodule