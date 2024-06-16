`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:01 05/17/2024 
// Design Name: 
// Module Name:    ID_EXE 
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
module ID_EXE (
    /*intr*/
    id_pc,
    id_add_or_sub,
    /*intr*/
    id_uns,
    id_half,
    id_byte,

    id_wreg,
    id_m2reg,
    id_wmem,
    id_aluc,
    id_aluimm,
    id_shift,
    id_rn,
    id_a,
    id_b,
    id_imm,
    clrn,
    clk,
    exe_imm,
    exe_rn,
    exe_a,
    exe_b,
    exe_wreg,
    exe_m2reg,
    exe_wmem,
    exe_aluc,
    exe_aluimm,
    exe_shift,

    exe_uns,
    exe_half,
    exe_byte
    /*intr*/
    , exe_add_or_sub,
    exe_pc
    /*intr*/
);
  /*intr*/
  input id_add_or_sub;
  input [31:0] id_pc;
  /*intr*/
  input id_uns, id_half, id_byte;

  input id_wreg, id_m2reg, id_wmem, id_aluimm, id_shift;
  input [4:0] id_rn;
  input [31:0] id_a, id_b, id_imm;
  input [3:0] id_aluc;
  input clk, clrn;
  output [31:0] exe_imm, exe_a, exe_b;
  output [4:0] exe_rn;
  output exe_wreg, exe_m2reg, exe_wmem, exe_aluimm, exe_shift;
  output [3:0] exe_aluc;

  /*intr*/
  output exe_add_or_sub;
  output [31:0] exe_pc;
  /*intr*/

  output exe_uns, exe_half, exe_byte;
  reg [31:0] exe_imm, exe_a, exe_b;
  reg [4:0] exe_rn;
  reg exe_wreg, exe_m2reg, exe_wmem, exe_aluimm, exe_shift, exe_uns, exe_half, exe_byte;
  reg [3:0] exe_aluc;
  
  /*intr*/
  reg exe_add_or_sub;
  reg [31:0] exe_pc;
  /*intr*/
  
  always @(posedge clk or negedge clrn)
    if (clrn == 0) begin
      exe_imm <= 0;
      exe_a <= 0;
      exe_b <= 0;
      exe_rn <= 0;
      exe_wreg <= 0;
      exe_m2reg <= 0;
      exe_wmem <= 0;
      exe_aluimm <= 0;
      exe_shift <= 0;
      exe_aluc <= 0;

      exe_uns <= 0;
      exe_half <= 0;
      exe_byte <= 0;
      /*intr*/
      exe_add_or_sub <= 0;
      exe_pc <= 0;
      /*intr*/
    end else begin
      exe_imm <= id_imm;
      exe_a <= id_a;
      exe_b <= id_b;
      exe_rn <= id_rn;
      exe_wreg <= id_wreg;
      exe_m2reg <= id_m2reg;
      exe_wmem <= id_wmem;
      exe_aluimm <= id_aluimm;
      exe_shift <= id_shift;
      exe_aluc <= id_aluc;

      exe_uns <= id_uns;
      exe_half <= id_half;
      exe_byte <= id_byte;
      /*intr*/
      exe_add_or_sub <= id_add_or_sub;
      exe_pc <= id_pc;
      /*intr*/
    end
endmodule

