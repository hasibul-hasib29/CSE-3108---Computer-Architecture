module RAM3x3bit (
    input wire clk,
    input wire reset,
    input wire [2:0] Write_Data,
    input wire [1:0]Write_Address,
    input wire Write_Enable,  
    input wire [1:0]Read_Address_1,
    input wire [1:0]Read_Address_2,
    output wire [2:0] Read_Data_1,
    output wire [2:0] Read_Data_2
);

    wire [2:0] RD1_row00, RD1_row01, RD1_row02;
    wire [2:0] RD2_row00, RD2_row01, RD2_row02;
    reg [2:0] WR_SEL, RD1_SEL, RD2_SEL;

    RAM1x3bit ram_row00 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[0]), 
        .Read_Select_1(RD1_SEL[0]), 
        .Read_Select_2(RD2_SEL[0]), 
        .Read_Data_1(RD1_row00), 
        .Read_Data_2(RD2_row00)
    );

    RAM1x3bit ram_row01 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[1]), 
        .Read_Select_1(RD1_SEL[1]), 
        .Read_Select_2(RD2_SEL[1]), 
        .Read_Data_1(RD1_row01), 
        .Read_Data_2(RD2_row01)
    );

    RAM1x3bit ram_row02
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[2]), 
        .Read_Select_1(RD1_SEL[2]), 
        .Read_Select_2(RD2_SEL[2]), 
        .Read_Data_1(RD1_row02), 
        .Read_Data_2(RD2_row02)
    );


    always @(*) 
       begin
            case ({Write_Enable, Write_Address})
                3'b100: WR_SEL = 3'b001;
                3'b101: WR_SEL = 3'b010;
                3'b110: WR_SEL = 3'b100;
                default: WR_SEL = 3'b000;
            endcase
        end 

    always @(*) 
        begin
            case (Read_Address_1)
                2'b00: RD1_SEL = 3'b001;
                2'b01: RD1_SEL = 3'b010;
                2'b10: RD1_SEL = 3'b100;
                default: RD1_SEL = 3'b000;
            endcase
        end

    always @(*) 
        begin
            case (Read_Address_2)
                2'b00: RD2_SEL = 3'b001;
                2'b01: RD2_SEL = 3'b010;
                2'b10: RD2_SEL = 3'b100;
                default: RD2_SEL = 3'b000;
            endcase
        end

    assign Read_Data_1 = RD1_row00 | RD1_row01 | RD1_row02;
    assign Read_Data_2 = RD2_row00 | RD2_row01 | RD2_row02;

endmodule
