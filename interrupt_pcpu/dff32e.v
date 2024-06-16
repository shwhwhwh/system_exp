`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:36 06/14/2024 
// Design Name: 
// Module Name:    dff32e 
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
module dff32e(
    datain,
    clk,
    resetn,
    we,
    dataout
    );
    input [31:0] datain;
    input clk, resetn, we;
    output [31:0] dataout;
    reg [31:0] dataout;
    always @(negedge resetn or posedge clk)  //add stall
    if (resetn == 0) begin
      dataout <= 32'b0;//���������͵��жϣ��˴��ĳ�ʼֵֻ������Status�Ĵ���
    end else if (we) begin
      dataout <= datain;
    end


endmodule
