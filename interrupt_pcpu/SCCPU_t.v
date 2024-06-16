`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:26:40 06/15/2024
// Design Name:   SCCPU
// Module Name:   C:/Users/lirui/Desktop/lr/interrupt_pcpu/SCCPU_t.v
// Project Name:  interrupt_pcpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SCCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SCCPU_t;

	// Inputs
	reg intr;
	reg [7:0] keypad_data;
	reg [31:0] mapped_io_out;
	reg Clock;
	reg Mem_Clock;
	reg Resetn;

	// Outputs
	wire [31:0] PC;
	wire [31:0] if_inst;
	wire [31:0] id_inst;
	wire [31:0] exe_alu;
	wire [31:0] mem_alu;
	wire mem_wmem;
	wire [31:0] mem_b;
	wire inta;

	// Instantiate the Unit Under Test (UUT)
	SCCPU uut (
		.intr(intr), 
		.keypad_data(keypad_data), 
		.mapped_io_out(mapped_io_out), 
		.Clock(Clock), 
		.Mem_Clock(Clock), 
		.Resetn(Resetn), 
		.PC(PC), 
		.if_inst(if_inst), 
		.id_inst(id_inst), 
		.exe_alu(exe_alu), 
		.mem_alu(mem_alu), 
		.mem_wmem(mem_wmem), 
		.mem_b(mem_b), 
		.inta(inta)
	);

	initial begin
		// Initialize Inputs
		intr = 0;
		keypad_data = 0;
		mapped_io_out = 0;
		Clock = 0;
		Mem_Clock = 0;
		Resetn = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Resetn = 1;
		#5600;
		intr = 1;
		#100;
		intr = 0;
		// Add stimulus here

	end
	always #50 Clock = ~Clock;
	
endmodule

