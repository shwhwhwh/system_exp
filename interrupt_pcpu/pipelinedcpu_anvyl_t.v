`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:45 06/14/2024
// Design Name:   pipelinedcpu_anvyl
// Module Name:   C:/Users/lirui/Desktop/lr/pipeline_anvyl/pipelinedcpu_anvyl_t.v
// Project Name:  pipeline_anvyl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipelinedcpu_anvyl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipelinedcpu_anvyl_t;

	// Inputs
	reg CLK100MHZ;
	reg [7:0] SW;
	reg [3:0] BTN;
	reg [3:0] KYPD_ROW;

	// Outputs
	wire [7:0] LED;
	wire [6:0] SEG;
	wire [5:0] AN;
	wire [3:0] KYPD_COL;

	// Instantiate the Unit Under Test (UUT)
	pipelinedcpu_anvyl uut (
		.CLK100MHZ(CLK100MHZ), 
		.SW(SW), 
		.BTN(BTN), 
		.LED(LED), 
		.SEG(SEG), 
		.AN(AN), 
		.KYPD_ROW(KYPD_ROW), 
		.KYPD_COL(KYPD_COL)
	);

	initial begin
		// Initialize Inputs
		CLK100MHZ = 0;
		SW = 0;
		BTN = 0;
		KYPD_ROW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

