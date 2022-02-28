`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2020 10:18:50 AM
// Design Name: 
// Module Name: two_bit_counter
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


module two_bit_counter(
    input clk,  // input clock
    output reg [1:0] Q // 2-bit register 
    );   
    
    /* on each positive edge of the input clock,
       count up from 0 to 3, and wrap around from 3 back to 0,
       with the 2 bit sized register Q
    */
    always @(posedge clk) begin              
        Q <= Q + 1'b1; 
    end     
    
endmodule