`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2020 11:18:23 AM
// Design Name: 
// Module Name: slowClock_1kHz
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


module slowClock_1kHz(
    input clk_fpga, // 100MHz master clock    
    output reg clk_1kHz //1kHz output clock
    );    
    
    localparam clkdiv = 50_000 - 1; // clock divider 
    reg [15:0] period_count = 0; // counts up to the clock divider    
    
    // divide the 100MHz clock to 1kHz    
    always@(posedge clk_fpga)   begin        
        if (period_count == clkdiv) 
            begin
            period_count <= 0;
            clk_1kHz <= ~clk_1kHz;
            end
        else
            begin
            period_count <= period_count + 1'b1;
            clk_1kHz <= clk_1kHz;
            end
        end      

endmodule