module NAND3bit 
(
    input wire [2:0] A,B,  
    output wire [2:0] R
);

assign R = ~(A & B);

endmodule