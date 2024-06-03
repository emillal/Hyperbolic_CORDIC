`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 17:51:14
// Design Name: 
// Module Name: sinh_cosh
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


module sinh_cosh(
    input clk,
    input [15:0] phase,
    input phase_tvalid,
    
    output  [15:0] cosh,
    output  [15:0] sinh,
    output sinh_cosh_tvalid
    );

//instantiating the IP

cordic_0 hyperbolic_inst (
  .aclk(clk),                                // input wire aclk
  .s_axis_phase_tvalid(phase_tvalid),  // input wire s_axis_phase_tvalid
  .s_axis_phase_tdata(phase),    // input wire [15 : 0] s_axis_phase_tdata
  .m_axis_dout_tvalid(sinh_cosh_tvalid),    // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata({sinh,cosh})      // output wire [31 : 0] m_axis_dout_tdata
);

endmodule