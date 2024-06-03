`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 02:51:51 PM
// Design Name: 
// Module Name: tb
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
`timescale 1ns / 1ps
module tb(

    );
    
    
reg clk;
reg reset;
reg [15:0] X_initial,Y_initial;
reg [3:0] sn_initial;
reg [15:0] theta_in;
wire [3:0] sn_op_final;
wire [15:0] theta_op_final;
wire [15:0] Xo_final,Yo_final;

top_pip dut(.clk(clk),.reset(reset),.X(X_initial),.Y(Y_initial),.sn_1(sn_initial),.theta_in(theta_in),.sn_op(sn_op_final),.theta_op(theta_op_final),.Xo(Xo_final),.Yo(Yo_final));

 initial begin
        
        clk = 1'b0;
        
        //theta_in = 16'b0000000000000000;
        
        //3 for 11 iterations and 2 or 8 iterations
        sn_initial = 4'b0011;
        reset = 1;
        
        X_initial = 16'b1000000000000000;
        Y_initial = 16'b0000000000000000;
        
        #3 reset = 0;
        
        
        #7
         
        theta_in = 16'b0110010010000111;
        
       // #1000 $finish;
        
        
        end
        
        
        always #100 clk = ~clk;
    


endmodule