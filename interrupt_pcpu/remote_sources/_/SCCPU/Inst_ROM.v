`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:27 05/15/2019 
// Design Name: 
// Module Name:    Inst_ROM 
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
module Inst_ROM (
    a,
    inst
);
  input [5:0] a;
  output [31:0] inst;
  wire [31:0] rom[0:63];

  //assign rom[6'h00] = 32'h00000000;  //0地址为空，从1地址开始执行；
  // assign rom[6'h001] = 32'h220821;  //addu r1, r1, r2:  r1 = 3
  // assign rom[6'h002] = 32'h240825;  //or  r1, r1, r4: r1 = 7
  // assign rom[6'h003] = 32'h230898;  //mul r1, r1, r3: r1 = 21
  // assign rom[6'h004] = 32'h1010823;  //subu r1, r8, r1: r1 = -13(FFFF FFF3)
  // assign rom[6'h005] = 32'h14902;  //srl r9, r1, 4: r9 = 0FFF FFFF
  // assign rom[6'h006] = 32'h1000009;  //jr r8
  // assign rom[6'h007] = 32'h10903;  //sra r1, r1, 4: r1 = FFFF FFFF(-1)

  // assign rom[6'h008] = 32'h29502A;  //slt r10, r1, r9: r10 = 1
  // assign rom[6'h009] = 32'h242B0002;  //addiu r11, r1, 2: r11 = 1
  // assign rom[6'h00a] = 32'h214B0001;  //beqc r10, r11, 1: 跳转成功
  // assign rom[6'h00b] = 32'h242B0001;  //addiu r11, r1, 2: 不执行，被置为NOP
  // assign rom[6'h00c] = 32'h8C810003;  //lw r1, 3(r4): r1 = 1
  // assign rom[6'h00d] = 32'hAD010003;  //sw r1, 3(r8): ram[11] = 1
  // assign rom[6'h00e] = 32'hC000001;   //jal 1

  assign rom[6'h000] = 32'h0800001d;  //j 0x0a
  assign rom[6'h001] = 32'h0;         //nop
  //EXC_BASE:
  assign rom[6'h002] = 32'h401a6800;  //mfc0 r26, C0_CAUSE: read cp0 Cause reg
  assign rom[6'h003] = 32'h335b000c;  //andi r27, r26, 0xc: get ExcCode, 2 bits here
  assign rom[6'h004] = 32'h8f7b0020;  //lw   r27, j_table(r27): get address from table
  assign rom[6'h005] = 32'h0;         //nop
  assign rom[6'h006] = 32'h03600009;  //jr   r27: jump to that address  
  assign rom[6'h007] = 32'h0;         //nop
  assign rom[6'h008] = 32'h0;  
  assign rom[6'h009] = 32'h0;  
  assign rom[6'h00a] = 32'h0;  
  assign rom[6'h00b] = 32'h0;
  //int_entry:  
  assign rom[6'h00c] = 32'h0;         //nop: deal with interrupt here 
  assign rom[6'h00d] = 32'h42000018;  //eret: return from interrupt
  assign rom[6'h00e] = 32'h0;
  //sys_entry:   
  assign rom[6'h00f] = 32'h00000000;  //nop: deal with syscall
  //epc_plus4:
  assign rom[6'h010] = 32'h401a7000;  //mfc0 r26, C0_EPC: get EPC
  assign rom[6'h011] = 32'h275a0004;  //addiu r26, r26, 4: EPC + 4
  assign rom[6'h012] = 32'h409a7000;  //mtc0 r26, C0_EPC: EPC <-- EPC + 4
  assign rom[6'h013] = 32'h42000018;  //eret: return from interrupt
  assign rom[6'h14] = 32'h00000000;   //nop
  //uni_entry:
  assign rom[6'h15] = 32'h00000000;   //nop: deal with unimplemented insts
  assign rom[6'h16] = 32'h08000010;   //j    epc_plus4: return
  assign rom[6'h17] = 32'h00000000;   //nop
  assign rom[6'h18] = 32'h00000000;
  assign rom[6'h19] = 32'h00000000;
  //ovf_entry:
  assign rom[6'h1A] = 32'h00000000;   //nop
  assign rom[6'h1B] = 32'h08000010;   //j    epc_plus4: return
  assign rom[6'h1C] = 32'h00000000;   //nop
  //start:
  //开中断
  assign rom[6'h1D] = 32'h2408000F;   //addiu r8, r0, 0xf: IM[3:0] <-- 1111
  assign rom[6'h1E] = 32'h40886000;   //mtc0 r8, C0_STATUS: exc/intr enable
  //开中断
  //测试溢出
  assign rom[6'h1F] = 32'h8c080048;   //lw   r8, 0x48(r0): try overflow exception
  assign rom[6'h20] = 32'h8c09004c;   //lw   r9, 0x4c(r0): caused by add
  //Ov:
  assign rom[6'h21] = 32'h01094020;   //add  r9, r9, r8  : overflow
  assign rom[6'h22] = 32'h00000000;   //nop
  //测试系统调用
  assign rom[6'h23] = 32'h0000000c;   //syscall          : will be ignored before EXC_program finished
  assign rom[6'h24] = 32'h00000000;   //nop
  //测试未实现指令
  assign rom[6'h25] = 32'h0128001a;   //div  r9, r8      : div, but not implemented
  assign rom[6'h26] = 32'h00000000;   //nop
  //测试外部中断：此期间外部送来中断信号 intr
  //Int:
  assign rom[6'h27] = 32'h34040050;   //ori  r4, r1, 0x50: address of data[0]
  assign rom[6'h28] = 32'h24050004;   //addiu r5, r0, 4   : counter
  assign rom[6'h29] = 32'h00004020;   //add  r8, r0, r0  : sum <-- 0
  //loop:
  assign rom[6'h2A] = 32'h8c890000;   //lw   r9, 0(r4)   : load data
  assign rom[6'h2B] = 32'h24840004;   //addiu r4, r4, 4   : address + 4
  assign rom[6'h2C] = 32'h01094020;   //add  r8, r8, r9  : sum
  assign rom[6'h2D] = 32'h24a5ffff;   //addiu r5, r5, -1  : counter - 1
  assign rom[6'h2E] = 32'h14a0fffb;   //bne  r5, r0, loop: finish?
  assign rom[6'h2F] = 32'h00000000;   //nop
  //finish
  assign rom[6'h30] = 32'h08000030;   //j    finish      : dead loop
  assign rom[6'h31] = 32'h00000000;
  assign rom[6'h32] = 32'h00000000;
  assign rom[6'h33] = 32'h00000000;
  assign rom[6'h34] = 32'h00000000;
  assign rom[6'h35] = 32'h00000000;
  assign rom[6'h36] = 32'h00000000;
  assign rom[6'h37] = 32'h00000000;
  assign rom[6'h38] = 32'h00000000;
  assign rom[6'h39] = 32'h00000000;
  assign rom[6'h3A] = 32'h00000000;
  assign rom[6'h3B] = 32'h00000000;
  assign rom[6'h3C] = 32'h00000000;
  assign rom[6'h3D] = 32'h00000000;
  assign rom[6'h3E] = 32'h00000000;
  assign rom[6'h3F] = 32'h00000000;

  assign inst = rom[a];
endmodule
