`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:04 05/17/2024 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID (
    /*intr*/
    if_pc,
    /*intr*/
    if_pc4,
    if_inst,
    stall,
    clk,
    clrn,
    id_pc4,
    /*intr*/
    id_inst,
    id_pc
    /*intr*/
);
  input [31:0] if_pc4, if_inst;
  input clk, clrn;
  input stall;

  output [31:0] id_pc4, id_inst;

  /*intr*/
  input [31:0] if_pc;
  output [31:0] id_pc;
  reg [31:0] id_pc;
  /*intr*/
  
  reg [31:0] id_pc4, id_inst;

  always @(posedge clk or negedge clrn)  //add stall
    if (clrn == 0) begin
      id_pc4  <= 0;
      id_inst <= 0;
      id_pc <= 0;
    end else if (stall == 0) begin
      id_pc4  <= if_pc4;
      id_inst <= if_inst;
      id_pc <= if_pc;
    end
endmodule
