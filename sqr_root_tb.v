`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2023 22:42:40
// Design Name: 
// Module Name: sqr_root_tb
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


module sqr_root_tb(

    );
    
    reg [31:0]number;
    reg clk;
    wire [31:0]sqr_root;
    
    sqr_root tb(number,clk,sqr_root);
    
    initial begin
    clk=0;
//    number = 32'h41000000; // number = 8
//    number = 32'h41980000; //number = 19
//number = 32'h429f0000;  //number=79.5
number = 32'h436de58e; //number=237.8967
//number = 32'hc0000000;  //number =-2
    end
  initial begin
  forever #50 clk =~clk;
end
    
    
endmodule
