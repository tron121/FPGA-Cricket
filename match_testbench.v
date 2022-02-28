`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 09:48:44 PM
// Design Name: 
// Module Name: match_testbench
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


module match_testbench();           
    //inputs as reg
    reg clk;
    reg reset;
    reg delivery; 
    reg sw;   
    
    //outputs as wires
    wire [3:0] lfsr_out;   
    wire dotball,single, double, triple, fours, sixes, wideball, noball, wicket;   
    wire[7:0] runs;     
    wire [3:0] wickets;
    wire [15:0] balls;
    wire inningOver;
    wire gameOver; 
    wire winner;   
    
    //instantiate cricketGame   
    cricketGame uut(clk, reset, delivery, sw, runs, wickets, balls,inningOver, gameOver, winner); 
    
    //instantiate lfsr
    lfsr g1(clk_fpga, reset, lfsr_out, delivery, dotball,single, double, triple, fours, sixes, wideball, noball, wicket);   
    
    //simulate 100MHz clock (10ns period)
    always
        begin
            clk = 0;
            #5;
            clk = 1;
            #5;           
        end
            
    // alternate other values
    initial 
       begin
          reset = 1 ;
          delivery = 0;                    
          sw = 0; 
          
          #10
          reset = 0;              
          
          //change switch after 1700 ns
          #1700
          sw = 1;  
       end
    
    // alternate forever    
    initial
       begin        
          forever #10 delivery = ~delivery;           
       end        
    
endmodule