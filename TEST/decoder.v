module decoder (
    input wire [1:0] a,
    input wire en,
    output reg [3:0] y
);

    // assign y[0] = en & ~a[1] & ~a[0];
    // assign y[1] = en & ~a[1] & a[0];
    // assign y[2] = en & a[1] & ~a[0];
    // assign y[3] = en & a[1] & a[0];
    always @* begin
        
        // if(en==1'b0) begin
        //     y = 4'b0000;
        // end
        
        // else if(a == 2'b00)
        //     y =4'b0001;
        
        // else if(a == 2'b01)
        //     y =4'b0010;
        //        else if(a == 2'b10);
        //     y =4'b0100;
        //        else if(a == 2'b11)
        //     y =4'b1000;
        case ({en,a})
            3'b100: y = 4'b0001;
            3'b101: y = 4'b0010;
            3'b110: y = 4'b0100;
            3'b111: y = 4'b1000;
            default: y = 4'b0000;
        endcase
        
    end
    
endmodule