`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 11:02:27 AM
// Design Name: 
// Module Name: debouncer
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


module debouncer(input clk, b, output reg d);
reg [1:0] state = 2'b00;
always @(posedge clk) begin
    case (state)
        2'b00: begin
            if (b) begin
                state <= 2'b01;
                d <= 0;
            end
            else begin
                    state <= 2'b00;
                    d <= 0;
            end
        end
        2'b01: begin
            if (b) begin
                state <= 2'b11;
                d <= 0;
            end
            else begin
                    state <= 2'b00;
                    d <= 0;
            end
        end
        2'b11: begin
            if (b) begin
                state <= 2'b11; 
                d <= 0;
            end
            else begin
                    state <= 2'b10;
                    d <= 0;
            end
        end
        2'b10: begin
            if (b) begin
                state <= 2'b11;
                d <= 0;
            end
            else begin
                    state <= 2'b00;
                    d <= 1;
            end
        end
    endcase
end
endmodule
