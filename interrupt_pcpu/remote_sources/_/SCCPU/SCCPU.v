`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:59 05/14/2019 
// Design Name: 
// Module Name:    SCCPU 
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
module SCCPU (
    /*intr*/
    intr,
    /*intr*/
    /*IO*/
    keypad_data,
    mapped_io_out,
    /*IO*/
    Clock,
    Mem_Clock,
    Resetn,
    /*memout,*/
    PC,
    if_inst,
    id_inst,
    exe_alu,
    mem_alu,
    /*mem_mo,*/
    mem_wmem,
    mem_b
    /*intr*/
    , inta
    /*intr*/
);
  /*intr*/
  input intr;
  /*intr*/
  input Clock, Resetn;
  output [31:0] PC, if_inst, exe_alu, id_inst;

  //IO
  input Mem_Clock;
  input [31:0] mapped_io_out;
  input [7:0] keypad_data;
  wire [31:0] memout;
  //output [31:0] mem_alu, mem_mo, mem_b;
  output [31:0] mem_alu, mem_b;
  output mem_wmem;

  /*intr*/
  output inta;
  reg [31:0] clock_cnt;
  always @(posedge Clock) begin
    if (Resetn == 0) clock_cnt <= 32'h0;
    else clock_cnt <= clock_cnt + 1;
  end
  /*intr*/

  wire [1:0] pcsource;
  wire [31:0] bpc, jpc;

  wire [31:0] wdi;

  wire [31:0] mo;
  //if
  wire [31:0] if_pc4, if_inst;
  //id
  wire [31:0] id_pc4, id_inst;
  wire id_wreg, id_m2reg, id_wmem, id_aluimm, id_shift, id_uns, id_compact, id_half, id_byte;
  wire [4:0] id_rn;
  wire [31:0] id_a, id_b, id_imm, id_a_org, id_b_org;
  wire [3:0] id_aluc;
  //exe
  wire [31:0] exe_imm, exe_a, exe_b, exe_alu;
  wire [4:0] exe_rn;
  wire exe_wreg, exe_m2reg, exe_wmem, exe_aluimm, exe_shift, exe_uns, exe_half, exe_byte;
  //wire exe_z;
  wire [ 3:0] exe_aluc;
  //mem
  wire [31:0] mem_mo;
  wire mem_wreg, mem_m2reg, mem_wmem, mem_uns, mem_half, mem_byte;
  wire [31:0] mem_b, mem_alu;
  wire [4:0] mem_rn;
  //wb
  wire wb_wreg, wb_m2reg;
  wire [4:0] wb_rn;
  wire [31:0] wb_alu, wb_mo;
  //stall
  wire stall;
  wire regrt;
  wire [4:0] rs, rt;

  //FWD
  wire [1:0] FWDA, FWDB;

  //ID check
  wire id_z;
  wire [31:0] if_inst_org;

  /*intr*/
  wire alu_overflow;
  wire [31:0] id_pc, exe_pc, epc, npc;
  wire [ 1:0] selpc;
  wire [31:0] id_inst_org;
  wire id_add_or_sub, exe_add_or_sub;
  wire exc;
  /*intr*/

  Stall stall_unit (
      id_inst,
      regrt,
      exe_rn,
      exe_m2reg,
      exe_wreg,
      stall,
      rs,
      rt
  );

  FWD fwda_unit (
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


  IF_STAGE stage1 (
      /*intr*/
      selpc,
      epc,
      /*intr*/
      Clock,
      Resetn,
      pcsource,
      bpc,
      jpc,
      stall,
      if_pc4,
      if_inst_org,
      PC
      /*intr*/
      , npc
      /*intr*/
  );  //add stall input, if_inst to if_inst_org

  assign if_inst = (((pcsource == 2'b01 || pcsource == 2'b10) && id_compact) || (exc == 1 && inta == 0) || (alu_overflow == 1)) ? 32'h0 : if_inst_org;//branch and jump instruction, 对于非紧凑指令，将执行下一条指令，没有做如果下一条指令也是控制指令的报错

  IF_ID instruction_register (
      /*intr*/
      PC,
      /*intr*/
      if_pc4,
      if_inst,
      stall,
      Clock,
      Resetn,
      id_pc4,
      /*id_inst*/
      /*intr*/
      id_inst_org,
      id_pc
      /*intr*/
  );  //add stall input

  /*intr*/
  assign id_inst = (alu_overflow == 1) ? 32'h0 : id_inst_org;
  /*intr*/

  ID_STAGE stage2 (
      /*intr*/
      npc,
      id_pc,
      exe_pc,
      alu_overflow,
      intr,
      
      /*intr*/

      id_a,
      id_b,
      stall,
      id_pc4,
      id_inst,
      wdi,
      wb_wreg,
      wb_rn,
      id_z,
      Clock,
      Resetn,
      bpc,
      jpc,
      pcsource,
      id_wreg,
      id_m2reg,
      id_wmem,
      id_aluc,
      id_aluimm,
      id_rn,
      id_a_org,
      id_b_org,
      id_imm,
      id_shift,
      regrt,
      id_uns,
      id_compact,
      id_half,
      id_byte
      /*intr*/
      , selpc,
      epc,
      inta,
      exc,
      id_add_or_sub
      /*intr*/
  );  //add stall, exe_z to id_z

  mux32_4_1 id_a_input (
      id_a_org,
      exe_alu,
      mem_alu,
      /*mem_mo,*/
      memout,
      FWDA,
      id_a
  );

  mux32_4_1 id_b_input (
      id_b_org,
      exe_alu,
      mem_alu,
      /*mem_mo,*/
      memout,
      FWDB,
      id_b
  );

  //ID check
  assign id_z = (id_a == id_b) ? 1'b1 : 1'b0;
  ID_EXE id_exe_register (
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
      Resetn,
      Clock,
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

  EXE_STAGE stage3 (
      /*intr*/
      exe_add_or_sub,
      /*intr*/
      exe_uns,
      exe_aluc,
      exe_aluimm,
      exe_a,
      exe_b,
      exe_imm,
      exe_shift,
      exe_alu
      /*intr*/
      , alu_overflow
      /*intr*/
      /*exe_z*/
  );

  EXE_MEM exe_mem_register (
      alu_overflow,
      exe_uns,
      exe_half,
      exe_byte,

      exe_wreg,
      exe_m2reg,
      exe_wmem,
      exe_rn,
      exe_alu,
      exe_b,
      Resetn,
      Clock,
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

  MEM_STAGE stage4 (
      mem_uns,
      mem_half,
      mem_byte,

      mem_wmem,
      mem_alu[8:0],
      mem_b,
      /*Clock,*/
      Mem_Clock,
      mem_mo
  );

  assign memout = (mem_alu[31:16] != 16'h_BF80) ? mem_mo : (mem_alu[4:0] == 5'b_1_0100) ?  {24'b0, keypad_data} : mapped_io_out;

  MEM_WB mem_wb_register (
      mem_wreg,
      mem_m2reg,
      mem_rn,
      mem_alu,
      /*mem_mo,*/
      memout,
      Clock,
      Resetn,
      wb_wreg,
      wb_m2reg,
      wb_rn,
      wb_alu,
      wb_mo
  );

  WB_STAGE stage5 (
      wb_alu,
      wb_mo,
      wb_m2reg,
      wdi
  );


endmodule
