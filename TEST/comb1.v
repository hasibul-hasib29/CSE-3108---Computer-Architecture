module comb1 (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [3:0] c,
    output wire [3:0] reduction

);

assign reduction = c >>> 1;
    
endmodule