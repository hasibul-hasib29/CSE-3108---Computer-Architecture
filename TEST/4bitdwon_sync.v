module fdownct (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

// Register to hold the current value of q
reg [3:0] q_reg, q_next, d_temp;

// Synchronous reset
always @(posedge clk) begin
    if (reset)
        q_reg <= 4'b1111; // Reset q_reg to 4'b1111 on positive clock edge when reset is asserted
    else
        q_reg <= q_next; // Decrement q_reg on positive clock edge when reset is de-asserted
end

//next state

always @(*) begin
    q_next<= d_temp;
end


// adder

always @(*) begin
    d_temp = q_reg - 1;
end

// Output
always @(*) begin
    
q = q_reg; // Output q is assigned the value of q_reg
end

endmodule
