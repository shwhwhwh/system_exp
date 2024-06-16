`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:09 05/24/2024 
// Design Name: 
// Module Name:    FWD 
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
module FWD (
    rs,
    rt,
    exe_rn,
    exe_m2reg,
    exe_wreg,
    mem_rn,
    mem_m2reg,
    mem_wreg,
    FWDA,
    FWDB
);
  input [4:0] rs, rt, exe_rn, mem_rn;
  input exe_m2reg, exe_wreg, mem_m2reg, mem_wreg;
  output [1:0] FWDA, FWDB;
  assign FWDA = ((exe_rn != 5'b0) & exe_wreg & (exe_rn == rs) &  ~exe_m2reg) ? 2'b01 : 
               ((mem_rn != 5'b0) & mem_wreg & (mem_rn == rs) & ~mem_m2reg) ? 2'b10 : 
               ((mem_rn != 5'b0) & mem_wreg & (mem_rn == rs) &  mem_m2reg) ? 2'b11 : 2'b00;
  assign FWDB = ((exe_rn != 5'b0) & exe_wreg & (exe_rn == rt) &  ~exe_m2reg) ? 2'b01 : 
               ((mem_rn != 5'b0) & mem_wreg & (mem_rn == rt) & ~mem_m2reg) ? 2'b10 : 
               ((mem_rn != 5'b0) & mem_wreg & (mem_rn == rt) &  mem_m2reg) ? 2'b11 : 2'b00;
endmodule
