module alu
(
    input wire [4:0] A, B,  // ALU 4-bit Inputs                 
    input wire [1:0] OP,    // ALU Operation selector (2-bit)
    output reg [4:0] R,     // ALU 4-bit Output
    output reg CF           // Carry Out Flag
);

    reg Sel;
    wire [4:0] R_ADD_SUB, R_ROR, R_XOR;
    wire CF_ADD_SUB;

    // Instantiate modules
    ADD_SUB5bit ADD_SUB1 ( .A(A), .B(B), .Sel(Sel), .R(R_ADD_SUB), .CF(CF_ADD_SUB));
    ROR5bit ROR1 ( .A(A), .B(B), .R(R_ROR));
    XOR5BIT XOR ( .A(A), .B(B), .R(R_XOR));

    always @(*) 
    begin
        case (OP)
            2'b00: // rotate right shift
                begin 

                    R = R_ROR;
                    CF = 1'b0;

                end
            2'b11: // Subtraction 
                begin 
                    Sel = 1'b1;  // Sel = 1 for Subtraction
                    R = R_ADD_SUB;
                    CF = CF_ADD_SUB;
                end
            2'b10: // left Shift 
                begin 
                    Sel = 1'b0;  // Sel = 0 for Addition
                    R = R_ADD_SUB; 
                    CF = CF_ADD_SUB;
                end
            2'b01: // nand 
                begin 
                    R = R_XOR;
                    CF = 1'b0;
                end
            default: 
                begin
                    R = 5'b00000;  
                    CF = 1'b0;
                end
        endcase
    end

endmodule
