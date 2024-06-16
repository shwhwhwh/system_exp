`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:03 05/15/2019 
// Design Name: 
// Module Name:    MEM_STAGE 
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
module MEM_STAGE (
    uns,
    half,
    is_byte,
    we,
    addr,
    datain,
    clk,
    dataout
);
  input [31:0] datain;
  input [8:0] addr;
  input clk, we, half, is_byte, uns;
  output [31:0] dataout;

  reg [7:0] ram[0:255];

  wire [7:0] temp_byte = ram[addr];
  wire [15:0] temp_half = {ram[{addr[8:1], 1'b0}], ram[{addr[8:1], 1'b1}]}; 
  wire [31:0] temp_word = {ram[{addr[8:2], 2'b00}], ram[{addr[8:2], 2'b01}], ram[{addr[8:2], 2'b10}], ram[{addr[8:2], 2'b11}]};
  wire e = (uns) ? 0 : (half) ? temp_half[15] : (is_byte) ? temp_byte[7] : 0;
  wire [23:0] ext24 = {24{e}};
  assign dataout = (half) ? {ext24[15:0], temp_half} : (is_byte) ? {ext24, temp_byte} : temp_word;  //读出常有效
  
  always @(posedge clk) begin
    if (we)
		begin
		ram[{addr[8:2], 2'b00}] = datain[31:24];
		ram[{addr[8:2], 2'b01}] = datain[23:16];
		ram[{addr[8:2], 2'b10}] = datain[15:8];
		ram[{addr[8:2], 2'b11}] = datain[7:0];
		end
  end

  integer i;
  initial begin  //存储器初始化
    for (i = 0; i < 256; i = i + 1)  //存储器清零	
      ram[i] = 0;
    //1		
    ram[9'h04] = 8'h00;  //存储器对应地址初始化赋值, 大端存储
    ram[9'h05] = 8'h00;
    ram[9'h06] = 8'h00;
    ram[9'h07] = 8'h01;
    //2
    ram[9'h08] = 8'h00;
    ram[9'h09] = 8'h00;
    ram[9'h0a] = 8'h80;
    ram[9'h0b] = 8'h02;
    //3
    ram[9'h0c] = 8'h00;
    ram[9'h0d] = 8'h00;
    ram[9'h0e] = 8'h00;
    ram[9'h0f] = 8'h03;
    //4
    ram[9'h10] = 8'h00;
    ram[9'h11] = 8'h00;
    ram[9'h12] = 8'h00;
    ram[9'h13] = 8'h04;
    //5
    ram[9'h14] = 8'h00;
    ram[9'h15] = 8'h00;
    ram[9'h16] = 8'h00;
    ram[9'h17] = 8'h04;
    //6
    ram[9'h18] = 8'h00;
    ram[9'h19] = 8'h00;
    ram[9'h1a] = 8'h00;
    ram[9'h1b] = 8'h04;
    //7
    ram[9'h1c] = 8'h00;
    ram[9'h1d] = 8'h00;
    ram[9'h1e] = 8'h00;
    ram[9'h1f] = 8'h04;
    //跳转表
    //8: address for interrupt
    ram[9'h20] = 8'h00;
    ram[9'h21] = 8'h00;
    ram[9'h22] = 8'h00;
    ram[9'h23] = 8'h0c;
    //9: address for syscall
    ram[9'h24] = 8'h00;
    ram[9'h25] = 8'h00;
    ram[9'h26] = 8'h00;
    ram[9'h27] = 8'h0f;
    //a: address for unimplemented instruction
    ram[9'h28] = 8'h00;
    ram[9'h29] = 8'h00;
    ram[9'h2a] = 8'h00;
    ram[9'h2b] = 8'h15;
    //b: address for overflow
    ram[9'h2c] = 8'h00;
    ram[9'h2d] = 8'h00;
    ram[9'h2e] = 8'h00;
    ram[9'h2f] = 8'h1A;
    //为测试溢出准备的数据
    //12: for testing overflow
    ram[9'h48] = 8'h00;
    ram[9'h49] = 8'h00;
    ram[9'h4a] = 8'h00;
    ram[9'h4b] = 8'h02;
    //13: 2 + max_int --> overflow
    ram[9'h4c] = 8'h7f;
    ram[9'h4d] = 8'hff;
    ram[9'h4e] = 8'hff;
    ram[9'h4f] = 8'hff;
    //14: data[0] 0 + A3 = A3
    ram[9'h50] = 8'h00;
    ram[9'h51] = 8'h00;
    ram[9'h52] = 8'h00;
    ram[9'h53] = 8'hA3;
    //15: data[1] A3 + 27 = CA
    ram[9'h54] = 8'h00;
    ram[9'h55] = 8'h00;
    ram[9'h56] = 8'h00;
    ram[9'h57] = 8'h27;
    //16: data[2] CA + 79 = 143
    ram[9'h58] = 8'h00;
    ram[9'h59] = 8'h00;
    ram[9'h5a] = 8'h00;
    ram[9'h5b] = 8'h79;
    //17: data[3] 143 + 115 = 258
    ram[9'h5c] = 8'h00;
    ram[9'h5d] = 8'h00;
    ram[9'h5e] = 8'h01;
    ram[9'h5f] = 8'h15;
  end

endmodule
