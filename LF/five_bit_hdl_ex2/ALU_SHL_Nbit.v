module ALU_SHL_Nbit 
(
    input wire [4:0] A,B,  
    output reg [4:0] R
);

    wire [1:0] B2bit;
    assign B2bit = B[1:0];

    always @(*) begin
        case(B2bit)
            2'b00: R = A;                     // No shift
            2'b01: R = {1'b0, A[4:1]};        // Left shift by 1 bit
            2'b10: R = {2'b00, A[4:2]};       // Left shift by 2 bits
            2'b11: R = {3'b000, A[4:3]};        // Left shift by 3 bits
            default: R = A;                   // Default case (no shift)
        endcase
    end
    
endmodule