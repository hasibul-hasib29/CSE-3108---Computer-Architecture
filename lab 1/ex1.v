module ex1 (
    output wire z,
    input wire a,
    input wire b,
    input wire c,
    input wire d
);



assign z = (a&&c) || (b&&d);
    
endmodule