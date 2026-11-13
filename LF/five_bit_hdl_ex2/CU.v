module CU (
    input wire [3:0] Opcode,
    input wire ZF,
    input wire SF,
    input wire CF,
    output wire [1:0] OP,
    output wire REG_EN,
    output wire IMM_SEL,
    output wire JMP_SEL,
    output wire LD_SEL
);

    assign OP = Opcode[1:0];
    assign IMM_SEL = (Opcode[3:2] == 2'b10)? 1'b1 : 1'b0;
    assign JMP_SEL = (Opcode[3:0] == 4'b1100 && ZF == 1'b0 && SF == 1'b1)? 1'b1 : 1'b0;
    assign LD_SEL  = (Opcode[3:0] == 4'b0000)? 1'b1 : 1'b0;
    assign REG_EN = Opcode == 4'b1100 ? 0 : 1
                        ;

endmodule