`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:42 05/24/2024 
// Design Name: 
// Module Name:    Stall 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Stall (
    id_inst,
    regrt,
    exe_rn,
    exe_m2reg,
    exe_wreg,
    stall,
    rs,
    rt
);
  input [31:0] id_inst;
  input [4:0] exe_rn;
  input regrt, exe_wreg, exe_m2reg;
  output stall;
  output [4:0] rs, rt;

  assign rs = id_inst[25:21];
  assign rt = id_inst[20:16];
  assign stall= ((rs == exe_rn)|(rt == exe_rn)&~regrt)&(exe_rn !=0)&(exe_wreg&exe_m2reg);


endmodule
