module ROR5bit 
(
    input wire [4:0] A,B,  
    output reg [4:0] R
);

    wire [2:0] B3bit;
    assign B3bit = B[2:0];

    always @(*) begin
        case(B3bit)
            3'b000: R = A;                     // No shift
            3'b001: R = {A[0],A[4:1]};        // Left shift by 1 bit
            3'b010: R = {A[1:0], A[4:2]};       // Left shift by 2 bits
            3'b011: R = {A[2:0], A[4:3]};        // Left shift by 3 bits
            3'b100: R = {A[3:0], A[4]};        // Left shift by 3 bits
            default: R = A;                   // Default case (no shift)
        endcase
    end
    
endmodule