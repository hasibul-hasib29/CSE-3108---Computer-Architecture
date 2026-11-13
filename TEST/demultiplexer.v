module demultiplexer (
    input  i,
    input [1:0] en,
    output reg [3:0] y
);
    always @(*) begin
        


    
    // Assign values based on the value of en
    case (en)
        2'b00: y = { 3'b000 , i}; // Concatenate i with three 0s for y[1:0]
        2'b01: y = {2'b00, i, 1'b0}; // Concatenate three 0s with i for y[3:2]
        2'b10: y = {1'b0, i, 2'b00}; // Concatenate two 0s, i, and a 0 for y[3] 
        2'b11: y = { i, 3'b000}; // Concatenate a 0, i, and three 0s for y[2:0]
        default: y = 4'bzzzz; // Default case: output remains unchanged
    endcase

    end
endmodule


// module demultiplexer (
//     input wire i, // Change to input wire
//     input wire [1:0] en,
//     output reg [3:0] y
// );

// always @* begin

        // if(i==0) 
        // y = 4'b0000;

//     else if (en == 2'b00)
//         y = 4'b0001;
//     else if (en == 2'b01)
//         y = 4'b0010;
//     else if (en == 2'b10)
//         y = 4'b0100;
//     else if (en == 2'b11)
//         y = 4'b1000;
// end

// endmodule


