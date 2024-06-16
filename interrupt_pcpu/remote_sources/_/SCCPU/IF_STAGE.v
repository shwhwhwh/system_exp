`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:26 05/14/2019 
// Design Name: 
// Module Name:    IF_STAGE 
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
module IF_STAGE (
    /*interrupt*/
    selpc,
    epc,
    /*interrupt*/
    clk,
    clrn,
    pcsource,
    bpc,
    jpc,
    stall,
    pc4,
    inst,
    PC,
    /*interrupt*/
    npc /*interrupt, connect to ID_STAGE*/
    /*interrupt*/
);
  input clk, clrn;
  input [31:0] bpc, jpc;
  input [1:0] pcsource;
  input stall;

  //interrupt
  input [1:0] selpc;
  input [31:0] epc;

  output [31:0] pc4, inst;
  output [31:0] PC;

  //interrupt
  output [31:0] npc;


  wire [31:0] pc;
  wire [31:0] npc;  //下一条指令地址

  //interrupt
  wire [31:0] npc_intr;
  parameter EXC_BASE = 32'h8; // = base = BASE from 8 to c
  mux32_4_1 irq_pc(npc, epc, EXC_BASE, 32'h0, selpc, npc_intr);
  
  dff32 program_counter (
      /*npc,*/
      npc_intr,
      stall,
      clk,
      clrn,
      pc
  );  //利用32位的D触发器实现PC
  add32 pc_plus4 (
      pc,
      32'h4,
      pc4
  );  //32位加法器，用来计算PC+4
  mux32_4_1 next_pc (
      pc4,
      bpc,
      jpc,
      32'b0,
      pcsource,
      npc
  );  //根据pcsource信号选择下一条指令的地址
  Inst_ROM inst_mem (
      pc[7:2],
      inst
  );  //指令存储器

  assign PC = pc;

endmodule
