`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 17:56:04
// Design Name: 
// Module Name: sinh_cosh_tb
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


module sinh_cosh_tb( );

//localparam clk_period = 10;

localparam signed [15:0] PI_POS = 16'b 0110_0100_1000_1000; //+pi in fixed point in 1.2.14
localparam signed [15:0] PI_NEG = 16'b 1001_1011_0111_1000; //+pi in fixed point in 1.2.14
localparam PHASE_INC = 256;


reg clk = 1'b0;
reg reset = 1'b1;


reg signed [15:0] phase = 16'b0;
reg phase_tvalid = 1'b0;
wire signed [15:0] cosh,sinh;
wire sinh_cosh_tvalid;

//Design under test call

sinh_cosh dut (
    .clk(clk),
    .phase(phase),
    .phase_tvalid(phase_tvalid),
    .cosh(cosh),
    .sinh(sinh),
    .sinh_cosh_tvalid(sinh_cosh_tvalid)  // Corrected: input to sinh_cosh module
);



initial begin
    clk = 1'b0;
    reset = 1'b1;
    #100 reset =  1'b0;
end

always #10 clk = ~clk;

always @ (posedge clk) begin
    if (reset) begin
        phase <= 16'b0;
        phase_tvalid <= 1'b0;
    end
    else begin
        phase_tvalid <= 1'b1;
        if ($signed(phase) + $signed(PHASE_INC) < $signed(PI_POS))
            phase <= phase + PHASE_INC;
        else begin
            phase <= PI_NEG;
        end
    end
end

endmodule