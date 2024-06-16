`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:26 05/17/2024 
// Design Name: 
// Module Name:    EXE_MEM 
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
module EXE_MEM (
    /*intr*/
    exe_overflow,
    /*intr*/
    exe_uns,
    exe_half,
    exe_byte,

    exe_wreg,
    exe_m2reg,
    exe_wmem,
    exe_rn,
    exe_alu,
    exe_b,
    clrn,
    clk,
    mem_wreg,
    mem_m2reg,
    mem_wmem,
    mem_rn,
    mem_alu,
    mem_b,

    mem_uns,
    mem_half,
    mem_byte
);
  /*intr*/
  input exe_overflow;
  /*intr*/
  input exe_uns, exe_half, exe_byte;

  input exe_wreg, exe_m2reg, exe_wmem;
  input [31:0] exe_b, exe_alu;
  input [4:0] exe_rn;
  input clk, clrn;
  output mem_wreg, mem_m2reg, mem_wmem;
  output [31:0] mem_b, mem_alu;
  output [4:0] mem_rn;

  output mem_uns, mem_half, mem_byte;

  reg mem_wreg, mem_m2reg, mem_wmem;
  reg [31:0] mem_b, mem_alu;
  reg [4:0] mem_rn;

  reg mem_uns, mem_half, mem_byte;

  always @(posedge clk or negedge clrn)
    if (clrn == 0) begin
      mem_wreg <= 0;
      mem_m2reg <= 0;
      mem_wmem <= 0;
      mem_rn <= 0;
      mem_alu <= 0;
      mem_b <= 0;

      mem_uns <= 0;
      mem_half <= 0;
      mem_byte <= 0;

    end else begin
      /*intr*/
      if(exe_overflow == 1'b0)
        begin
          mem_wreg <= exe_wreg;
        end
      else
        begin
          mem_wreg <= 0;
        end
      /*intr*/
      mem_m2reg <= exe_m2reg;
      mem_wmem <= exe_wmem;
      mem_rn <= exe_rn;
      mem_alu <= exe_alu;
      mem_b <= exe_b;

      mem_uns <= exe_uns;
      mem_half <= exe_half;
      mem_byte <= exe_byte;

    end
endmodule
