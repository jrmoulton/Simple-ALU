`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 04:48:18 PM
// Design Name: 
// Module Name: test_simple_alu_top
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


module test_simple_alu_top();

    wire btnU, btnD, btnL, btnR, btnC;
    reg clk;
    wire [7:0] sw;
    wire [6:0] D;
    wire [3:0] an;
    
    reg clk;
    reg [8:0] count;
    simple_alu_top UUT( .bntU(btnU), .bntD(btnD), .btnL(btnL), .btnR(btnR), .btnC(btnc), .D(D), .an(an));

    initial begin
        btnU = 0;
        btnD = 0;
        btnL = 0;
        btnR = 0;
        btnC = 0;
        clk = 0;
        sw = 0;
        
        #100;
        
        forever #10 clk=~clk;
    end

    always @(posedge clk) begin
        if (count == 0)
            btnU <= 5;
    end
endmodule
