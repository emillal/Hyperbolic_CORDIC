`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 11:13:50 AM
// Design Name: 
// Module Name: test
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


module test(

    );
    reg clk;
    //reg [15:0] x,y,
    reg [15:0] theta;
    wire [15:0] cosh, sinh;

flow uut(clk,theta,cosh,sinh);

    initial begin
        
        clk = 1'b0;
        //x=16'b0100000000000000;
        //y=16'b0000000000000000;
        
        theta = 16'b0000000000000000;
        
      #7;
      theta = 16'b0000001100110011; //0.05
      
      
      #20;
      theta = 16'b0000011001100110; // 0.1
        
      #20;
      theta = 16'b0000100110011001; //0.15
      
      #20;
      theta = 16'b0000110011001100; //0.2
      
      #20;
      theta = 16'b0001000000000000; //0.25
      
      #20;
      theta = 16'b0001001100110011; //0.3
      
      #20;
      theta = 16'b0001011001100110; //0.35
      
      #20;
      theta = 16'b0001100110011001; //0.4
      
      #20;
      theta = 16'b0001110011001100; //0.45
      
      #20;
      theta = 16'b0010000000000000; //0.5
      
      #20;
      theta = 16'b0010001100110011; //0.55
      
      #20;
      theta = 16'b0010011001100110; //0.6
      
      #20;
      theta = 16'b0010100110011001; //0.65
      
      #20;
      theta = 16'b0010110011001100; //0.7
      
      #20;
      theta = 16'b0011000000000000; //0.75
      
      #20;
      theta = 16'b0011001000111101; //0.785

      #60 $finish;
     // $display("%b",cosh);
        
     
    end
    
    
      always #5 clk = ~clk;
    
    
endmodule
