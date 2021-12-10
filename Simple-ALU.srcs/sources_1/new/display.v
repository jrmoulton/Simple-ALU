`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 03:56:21 PM
// Design Name: 
// Module Name: display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display(input [15:0] inp_dig, clk, output reg [6:0] D, reg [3:0] an);

wire [6:0] temp1; 
wire [6:0] temp2; 
wire [6:0] temp3; 
wire [6:0] temp4;
NewSevenSegment seg1(inp_dig[15:12], temp1);
NewSevenSegment seg2(inp_dig[11:8], temp2);
NewSevenSegment seg3(inp_dig[7:4], temp3);
NewSevenSegment seg4(inp_dig[3:0], temp4);
// the prescaler either needs to be doubled or halved; I think it needs to be
// 25_000 was 50_000 originally
ClockDivider #(.PRESCALER(25_000)) CKD(
    .clkin(clk),
    .clkout(sel)
);

reg [2:0] count = 0;
always @(posedge sel) begin
    if (count == 0) begin
        an = 4'b0111; // this might need to be ~sel
        D <= temp1;
        count <= count + 1;
    end
    else if (count == 1) begin
        an = 4'b1011; // this might need to be ~sel
        D <= temp2;
        count <= count + 1;
    end
    else if (count == 2) begin
        an = 4'b1101; // this might need to be ~sel
        D <= temp3;
        count <= count + 1;
    end
    else if (count == 3) begin
        an = 4'b1110; // this might need to be ~sel
        D <= temp4;
        count <= 0;
    end
end
endmodule
