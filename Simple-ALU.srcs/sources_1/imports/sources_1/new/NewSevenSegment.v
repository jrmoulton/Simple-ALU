`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 12:37:40 PM
// Design Name: 
// Module Name: NewSevenSegment
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


module NewSevenSegment(
	input [3:0] wxyz,
	output [6:0] seg
    );

	wire [15:0] d;

	decoder4_16 D(.in(wxyz), .out(d));

	assign seg[0] = ~|(16'hB7EB & d);
	assign seg[1] = ~|(16'hF9E4 & d);
	assign seg[2] = ~|(16'hDFF4 & d);
	assign seg[3] = ~|(16'hB6DE & d);
	assign seg[4] = ~|(16'hA2BF & d);
	assign seg[5] = ~|(16'h8EFB & d);
	assign seg[6] = ~|(16'h3EF7 & d);

endmodule
