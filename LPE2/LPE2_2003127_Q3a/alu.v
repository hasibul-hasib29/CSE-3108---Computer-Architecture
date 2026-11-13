module alu
(
    input wire [2:0] A, B,  // ALU 4-bit Inputs                 
    input wire [2:0] OP,    // ALU Operation selector (2-bit)
    output reg [2:0] R,     // ALU 4-bit Output
    output reg CF           // Carry Out Flag
);

    reg Sel;
    wire [2:0] R_ADD_SUB, R_SHL, R_NAND;
    wire CF_ADD_SUB;

    // Instantiate modules
    ADD3bit ADD_SUB1 ( .A(A), .B(B), .Sel(Sel), .R(R_ADD_SUB), .CF(CF_ADD_SUB));
    ROR3bit SHL1 ( .A(A), .B(B), .R(R_SHL));
    NAND3bit NAND1 ( .A(A), .B(B), .R(R_NAND));

    always @(*) 
    begin
        case (OP)
            3'b000: // Addition 
                begin 
                    Sel = 1'b0;  // Sel = 0 for Addition
                    R = R_ADD_SUB; 
                    CF = CF_ADD_SUB;
                end
            3'b111: // left Shift 
                begin 
                    R = R_SHL;
                    CF = 1'b0;
                end
            3'b010: // nand 
                begin 
                    R = R_NAND;
                    CF = 1'b0;
                end
            default: 
                begin
                    R = 3'b000;  
                    CF = 1'b0;
                end
        endcase
    end

endmodule
