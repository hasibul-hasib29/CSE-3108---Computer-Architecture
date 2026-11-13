module multiplexer (
    input wire [3:0] i,
    input wire [1:0] en,
    // output reg [0:0]y
    output y
);
    assign y = (~en[0] & ~en[1] & i[0]) | (en[0] & ~en[1] & i[1]) | (~en[0] & en[1] & i[2]) |(en[0] & en[1] & i[3]) ;

    // always @(*) begin
    //     if(en==2'b00) 
    //         y = i[0];
    //     if(en==2'b01) 
    //         y = i[1];
    //     if(en==2'b10) 
    //         y = i[2];
    //     if(en==2'b11) 
    //         y = i[3];
    // end
endmodule