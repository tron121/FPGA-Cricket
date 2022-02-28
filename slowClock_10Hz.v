`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2020 08:49:07 AM
// Design Name: 
// Module Name: slowClock_10Hz
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


module slowClock_10Hz(
    input clk_fpga, // 100MHz master clock   
    output reg clk_10Hz //10Hz output clock
    );    
    
    localparam clkdiv = 5_000_000 - 1; // clock divider 
    reg [22:0] period_count = 0; // counts up to the clock divider    
    
    // divide the 100MHz clock to 100Hz    
    always@(posedge clk_fpga) begin       
        if (period_count == clkdiv) 
            begin
            period_count <= 0;
            clk_10Hz <= ~clk_10Hz;
            end
        else
            begin
            period_count <= period_count + 1'b1;
            clk_10Hz <= clk_10Hz;
            end
    end      

endmodule