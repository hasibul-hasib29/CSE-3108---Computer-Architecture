module adder1bit (
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire co
);
assign s = a ^ b ^ cin;
assign co = ( a & b) | ((a^b) & cin);
    
endmodule