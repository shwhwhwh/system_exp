`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:13 05/15/2019 
// Design Name: 
// Module Name:    EXE_STAGE 
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
module EXE_STAGE (
    /*intr*/
    add_or_sub,
    /*intr*/
    uns,
    ealuc,
    ealuimm,
    ea,
    eb,
    eimm,
    eshift,
    ealu
    /*intr*/
    , alu_overflow
    /*intr*/
);
  /*intr*/
  input add_or_sub;
  /*intr*/

  input uns;
  input [31:0] ea,eb,eimm;		//ea-�ɼĴ��������Ĳ�����a��eb-�ɼĴ��������Ĳ�����a��eimm-������չ����������
  input [3:0] ealuc;  //ALU������
  input ealuimm, eshift;  //ALU����������Ķ�·ѡ����
  output [31:0] ealu;  //alu�������

  /*intr*/
  output alu_overflow;
  wire overflow;
  assign alu_overflow = (add_or_sub == 1) ? overflow : 1'b0;
  /*intr*/

  //output z;
  wire [31:0] alua, alub, sa;

  assign sa = {27'b0, eimm[10:6]};  //��λλ��������

  mux32_2_1 alu_ina (
      ea,
      sa,
      eshift,
      alua
  );  //ѡ��ALU a�˵�������Դ
  mux32_2_1 alu_inb (
      eb,
      eimm,
      ealuimm,
      alub
  );  //ѡ��ALU b�˵�������Դ
  alu al_unit (
      uns,
      alua,
      alub,
      ealuc,
      ealu
      /*intr*/
      , overflow
      /*intr*/
  );  //ALU


endmodule
