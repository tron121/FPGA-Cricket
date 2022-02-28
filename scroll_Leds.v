`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 07:00:46 PM
// Design Name: 
// Module Name: scroll_Leds
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


module scroll_Leds(
    input clk_fpga,      
    output reg [15:0] led
    );  
    
    wire clk_10Hz; // 10Hz signal from slow clock
    
    //shift an led every rising edge
    always @ (posedge clk_10Hz) begin
        if (led == 16'hffff)
            led <= 16'hfffe; // reset to 16'b1111_1111_1111_1110
        else
            led <= {led[14:0], 1'b1}; //shift the rightmost unlit led in 16'hfffe to the left
    end
    
    slowClock_10Hz c0(clk_fpga, clk_10Hz);  
      
endmodule