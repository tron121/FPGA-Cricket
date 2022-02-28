`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2020 07:00:46 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    input clk_fpga,
	input reset,
	output [3:0] q
	// for a more detailed simulation uncomment the following: 
	// , input delivery,
	// output dotball,single, double, triple, fours, sixes, wideball,noball,wicket
	);

	reg [5:0] shift;  
	wire xor_sum;	
	assign xor_sum = shift[1] ^ shift[4]; // feedback taps

	always @ (posedge clk_fpga) begin	   
	   if(reset)
	       shift <= 6'b111111;
	   else 
	       shift <= {xor_sum, shift[5:1]}; // shift right
	end
	
	assign q = shift[3:0]; // output of LFSR 
	
//	// for a more detailed simulation, uncomment the following:
//	assign dotball = delivery & ((shift[3:0] == 0) | (shift[3:0] == 1) | (shift[3:0] == 2)); 
//	assign single = delivery & ((shift[3:0] == 3) | ( shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
//	assign double = delivery & ((shift[3:0] == 7) | ( shift[3:0] == 8) | (shift[3:0] == 9));
//	assign triple = delivery & (shift[3:0] == 10);
//	assign fours = delivery &  (shift[3:0] == 11);
//	assign sixes = delivery & (shift[3:0] == 12);
//	assign wideball = delivery & (shift[3:0] == 13);
//	assign noball = delivery & (shift[3:0] == 14);
//	assign wicket = delivery &  (shift[3:0] == 15);	  
	
endmodule