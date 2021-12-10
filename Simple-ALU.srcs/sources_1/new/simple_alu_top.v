`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 12:23:16 PM
// Design Name: 
// Module Name: simple_alu_top
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


module simple_alu_top(
input btnU, btnD, btnL, btnR, btnC, clk, [7:0] sw, 
output wire [6:0] D, wire [3:0] an
);

reg [3:0] state = 0;
reg [7:0] inp_A;
reg [7:0] inp_B;
reg [15:0] inp_dig = 0;
wire deb_btnU, deb_btnD, deb_btnL, deb_btnR, deb_btnC;
debouncer db1(clk, btnU, deb_btnU);
debouncer db2(clk, btnD, deb_btnD);
debouncer db3(clk, btnL, deb_btnL);
debouncer db4(clk, btnR, deb_btnR);
debouncer db5(clk, btnC, deb_btnC);

display d1(inp_dig, clk, D, an);

always @(posedge clk) begin
    case (state) 
        3'b000: begin // Load A
            inp_A <= sw;
            inp_dig <= inp_A;
            if (deb_btnL) begin
                // If we push the L button in state one display left shift
                inp_dig <= sw << 1;
                state <= 3'b100;
            end
            else if (deb_btnD) begin
                // If we get button D, move to state 1 to load B

                state <= 3'b001;
            end
        end
        3'b001: begin // Load B
            inp_B <= sw;
            inp_dig <= inp_B;
            if (deb_btnD) begin
                // B is loaded so move to state 2 to wait for an op selection
                state <= 3'b010;
            end
        end
        3'b010: begin // select math op or next state for binary ops
            if (deb_btnU) begin // Add
                inp_dig <= inp_A + inp_B;
                state <= 3'b100;
            end
            if (deb_btnD) begin // Subtract
                inp_dig <= inp_A - inp_B;
                state <= 3'b100;
            end
            if (deb_btnR) begin // Multiply
                inp_dig <= inp_A * inp_B;
                state <= 3'b100;
            end
            if (deb_btnL) begin // Divide
                if (inp_B == 0)
                    // if trying to do division by zero go back to loading B
                    state <= 3'b001;
                else 
                    inp_dig <= inp_A / inp_B;
                    state <= 3'b100;
                end
            if (deb_btnC) begin // Go to switch for binary ops
                state <= 3'b011;
            end
        end
        3'b011: begin // Select between the binary operations
            if (deb_btnR) begin  // Binary and
                inp_dig <= inp_A & inp_B;
                state <= 3'b100;
            end
            if (deb_btnL) begin // Binary or
                inp_dig <= inp_A | inp_B;
                state <= 3'b100;
            end
        end
        3'b100: begin // State to display the output
            if (deb_btnC) begin 
                state <= 3'b000;
            end
        end
    endcase
end

endmodule
