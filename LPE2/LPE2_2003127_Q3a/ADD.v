module ADD3bit 
(
    input wire [2:0] A,B,  
    input wire Sel,        // Sel = 0 for Addition, Sel = 1 for Subtraction
    output wire [2:0] R,    
    output wire CF
);





    assign {CF, R} = A + B;


endmodule