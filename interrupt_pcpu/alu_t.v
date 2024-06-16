`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:48 06/15/2024
// Design Name:   alu
// Module Name:   C:/Users/lirui/Desktop/lr/interrupt_pcpu/alu_t.v
// Project Name:  interrupt_pcpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_t;

	// Inputs
	reg uns;
	reg [31:0] alua;
	reg [31:0] alub;
	reg [3:0] ealuc;

	// Outputs
	wire [31:0] ealu;
	wire IntOverflow;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.uns(uns), 
		.alua(alua), 
		.alub(alub), 
		.ealuc(ealuc), 
		.ealu(ealu), 
		.IntOverflow(IntOverflow)
	);

	initial begin
		// Initialize Inputs
		uns = 0;
		alua = 0;
		alub = 0;
		ealuc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		alua = -32'd1;
		alub = -32'd1;
		ealuc = 0;
		
		#100;
		alua = -32'd1;
		alub = 32'h7fffffff;
		ealuc = 0;
		
		#100;
		alua = 32'h7fffffff;
		alub = 32'h7fffffff;
		ealuc = 0;
		
		#100;
		alua = 32'h80000001;
		alub = 32'h80000001;
		ealuc = 0;
		
		//sub
		#100;
		alua = -32'd1;
		alub = 32'h7fffffff;
		ealuc = 1100;
		
		#100;
		alua = 32'h1;
		alub = 32'h80000000;
		ealuc = 1100;
		
		#100;
		alua = 32'h1;
		alub = 32'h7fffffff;
		ealuc = 1100;
		
		#100;
		alua = 32'h80000000;
		alub = -32'd1;
		ealuc = 1100;
		
		// Add stimulus here

	end
      
endmodule

