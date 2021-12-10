`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 10:55:41 AM
// Design Name: 
// Module Name: decoder4_16
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


module decoder4_16(in, out);
    input [3:0] in;
    output [15:0] out;
	wire en1, en2;
    assign en1 = in[3];
    assign en2 = ~in[3];
    
    decoder3_8 s1(in[2:0], en1, out[7:0]);
    decoder3_8 s2(in[2:0], en2, out[15:8]);
endmodule
