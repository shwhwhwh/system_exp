`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:11 05/17/2024 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB (
    mem_wreg,
    mem_m2reg,
    mem_rn,
    mem_alu,
    mem_mo,
    clk,
    clrn,
    wb_wreg,
    wb_m2reg,
    wb_rn,
    wb_alu,
    wb_mo
);
  input mem_wreg, mem_m2reg;
  input [4:0] mem_rn;
  input [31:0] mem_alu, mem_mo;
  input clk, clrn;

  output wb_wreg, wb_m2reg;
  output [4:0] wb_rn;
  output [31:0] wb_alu, wb_mo;
  reg wb_wreg, wb_m2reg;
  reg [4:0] wb_rn;
  reg [31:0] wb_alu, wb_mo;
  always @(posedge clk or negedge clrn)
    if (clrn == 0) begin
      wb_wreg <= 0;
      wb_m2reg <= 0;
      wb_rn <= 0;
      wb_alu <= 0;
      wb_mo <= 0;
    end else begin
      wb_wreg <= mem_wreg;
      wb_m2reg <= mem_m2reg;
      wb_rn <= mem_rn;
      wb_alu <= mem_alu;
      wb_mo <= mem_mo;
    end
endmodule
