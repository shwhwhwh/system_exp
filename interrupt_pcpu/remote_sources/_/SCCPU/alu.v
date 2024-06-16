`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:17 05/15/2019 
// Design Name: 
// Module Name:    alu 
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
module alu (
    uns,
    alua,
    alub,
    ealuc,
    ealu,
    /*intr*/
    IntOverflow
    /*intr*/
);
  input uns;
  input [31:0] alua, alub;
  input [3:0] ealuc;
  output [31:0] ealu;
  /*intr*/
  output IntOverflow;
  /*intr*/
  //  output z;
  wire signed [31:0] s_a = alua;
  wire signed [31:0] s_b = alub;


  // assign ealu = (ealuc == 3'b000) ? alua + alub :
  //                (ealuc == 3'b001) ? alua & alub :
  //                (ealuc == 3'b010) ? alua | alub :
  //                (ealuc == 3'b011) ? alua ^ alub :
  //                (ealuc == 3'b100) ? alub >> alua :
  //                (ealuc == 3'b101) ? alub << alua :
  //                (ealuc == 3'b110) ? alua - alub :					
  //     				32'hxxxxxxxx;
  wire [32:0] a_33 = {1'b0, alua};
  wire [32:0] b_33 = {1'b0, alub};
  wire [32:0] sum_33 = a_33 + b_33;
  wire [32:0] sub_33 = a_33 - b_33;
  wire [31:0] sum = (IntOverflow == 0) ? sum_33[31:0] : 32'hxxxxxxxx;
  wire [31:0] sub = (IntOverflow == 0) ? sub_33[31:0] : 32'hxxxxxxxx; 
  wire signed [63:0] mu_s = s_a * s_b;
  wire [63:0] mu_u = alua * alub;
  wire [31:0] ra = s_b >>> s_a;

  //Òç³öÐÅºÅ
  assign IntOverflow = (uns == 1) ? 1'b0 : (ealuc == 4'b0000 && sum_33[32] != sum_33[31] && (alua[31] == alub[31])) ? 1'b1 : (ealuc == 4'b1100 && sub_33[31] != alua[31] && (alua[31] != alub[31])) ? 1'b1 : 1'b0; 
  
  wire [31:0] alu_u =  (ealuc == 4'b0000) ? sum:
	               (ealuc == 4'b0001) ? alua & alub :
	               (ealuc == 4'b0010) ? /*div*/32'hxxxxxxxx : 
	               (ealuc == 4'b0011) ? /*mod*/32'hxxxxxxxx : 
	               (ealuc == 4'b0100) ? mu_u[31:0] : 
	               (ealuc == 4'b0101) ? mu_u[63:32] : 
	               (ealuc == 4'b0110) ? ~(alua | alub) :
				      (ealuc == 4'b0111) ? alua | alub :
				      (ealuc == 4'b1000) ? alub << alua :
	               (ealuc == 4'b1001) ? alua < alub :
	               (ealuc == 4'b1010) ? alub >>> alua :
	               (ealuc == 4'b1011) ? alub >> alua :
	               (ealuc == 4'b1100) ? sub :
	               (ealuc == 4'b1101) ? alua ^ alub :
	               (ealuc == 4'b1110) ? {alub[15:0], 16'b0} :
				   (ealuc == 4'b1111) ? alua > alub :
	    				32'hxxxxxxxx;

  wire [31:0] alu_s =  (ealuc == 4'b0000) ? sum :
	               (ealuc == 4'b0001) ? alua & alub :
	               (ealuc == 4'b0010) ? /*div*/32'hxxxxxxxx : 
	               (ealuc == 4'b0011) ? /*mod*/32'hxxxxxxxx : 
	               (ealuc == 4'b0100) ? mu_s[31:0] : 
	               (ealuc == 4'b0101) ? mu_s[63:32] :
	               (ealuc == 4'b0110) ? ~(alua | alub) :
				   (ealuc == 4'b0111) ? alua | alub :
				   (ealuc == 4'b1000) ? alub << alua :
	               (ealuc == 4'b1001) ? s_a < s_b :
	               (ealuc == 4'b1010) ? ra :
	               (ealuc == 4'b1011) ? alub >> alua :
	               (ealuc == 4'b1100) ? sub :
	               (ealuc == 4'b1101) ? alua ^ alub :
	               (ealuc == 4'b1110) ? {alub[15:0], 16'b0} :
				   (ealuc == 4'b1111) ? s_a > s_b :
	    				32'hxxxxxxxx;

  assign ealu = (uns == 0) ? alu_s : alu_u;
  //  assign z = ~|ealu;

endmodule
