`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2020 09:09:31 AM
// Design Name: 
// Module Name: Cricket
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

module Cricket(
    input clk_fpga,     // 100MHz Basys3 master clock
    input reset,        // center push button used as reset
    input btnU,         // up push button    
    input sw,           // switch between Team 1 and Team 2        
    output dp,          // use the third decimal point as a separator
    output [6:0] seg,   // goes to anode ports defined in  constraints
    output [3:0] an,    // goes to seven seg cathodes defined in constraints
    output [15:0] led   // drive the leds
    );     
   
    wire delivery;  // debounced up button press      
    wire [7:0] binaryRuns;  // runs from game
    wire [3:0] binaryWickets; // wickets from game   
    wire inningOver; // signal from match to bcd display to show IO(inning over) on display
    wire gameOver;  // signal from match to bcd display to lock in winner on display 
    wire winner;    // signal from match to bcd display to select winner to display    
    
    // debounces the up push button      
    debounce d0(clk_fpga, btnU, delivery);   
    
    // A single game of cricket     
    cricketGame g0(clk_fpga, reset, delivery, sw, binaryRuns, binaryWickets, led, inningOver, gameOver, winner);       
    
    /* converts and displays the runs on the three leftmost digits and the wickets on the last fourth digit,
       separated by a decimal point. Eg; 199.8 (199 runs , and 8 wickets)
       displays the match winner as t01.0 or t02.0 when the game is over */
    bcdDisplay b0(clk_fpga, binaryRuns, binaryWickets, inningOver, gameOver, winner, an, dp, seg);    
      
endmodule