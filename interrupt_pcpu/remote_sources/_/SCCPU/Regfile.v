`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:27 05/15/2019 
// Design Name: 
// Module Name:    Regfile 
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
module Regfile (
    /*intr*/
    mfc0,
    mfc0_src,
    /*intr*/
    wmem,
    half,
    is_byte,
    pc4,
    rd,
    al,
    jalr,
    rna,
    rnb,
    d,
    wn,
    we,
    clk,
    clrn,
    qa,
    qb
);
  /*intr*/
  input [1:0] mfc0;
  input [31:0] mfc0_src;
  /*intr*/
  input [4:0] rna, rnb, wn, rd;
  input [31:0] d, pc4;
  input we, clk, clrn, al, jalr, half, is_byte, wmem;
  output [31:0] qa, qb;
  reg [31:0] register[0:31];
  // assign qa = (rna == 0) ? 0 : register[rna];
  // assign qb = (rnb == 0) ? 0 : register[rnb];
  assign qa = register[rna];
  assign qb = (wmem == 0) ? register[rnb] : (half == 1) ? {register[rnb][15:0], 16'b0} : (is_byte == 1) ? {register[rnb][7:0], 24'b0} : register[rnb];
  wire [4:0] a0 = (jalr) ? rd : 5'b11111;
  wire [31:0] pc8 = pc4 + 4;
  integer i;
  always @(negedge clk or negedge clrn)  //posedge clk to negedge clk
    if(clrn==0)		//如果复位信号有效，则进行寄存器初始化。
		  begin//:init

      for (i = 0; i < 32; i = i + 1)  //所有寄存器清零
        register[i] <= 0;

      register[5'h01] <= 32'h7fffffff;  //对指定寄存器的指定地址初始化值
      register[5'h02] <= 32'h7fffffff;
      register[5'h03] <= 32'h3;
      register[5'h04] <= 32'h00000004;
      register[5'h05] <= 32'h00000005;
      register[5'h06] <= 32'h00000006;
      register[5'h07] <= 32'h00000007;
      register[5'h08] <= 32'h00000008;
    end 
	else
		begin
			if ((wn != 0) && we) register[wn] <= d;
			if (al) 
				begin
					if(jalr && (rd != 0))register[rd] <= pc8;
					else if(~jalr)register[5'b11111] <= pc8;
				end
      if (mfc0 != 0) register[rnb] <= mfc0_src;
		end

endmodule
