`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:50 06/13/2024 
// Design Name: 
// Module Name:    pipelinedcpu_anvyl 
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
module pipelinedcpu_anvyl (
    CLK100MHZ,
    SW,
    BTN,
    LED,
    SEG,
    AN,
    KYPD_ROW,
    KYPD_COL
);
  input CLK100MHZ;
  input [7:0] SW;
  input [3:0] BTN;
  output [7:0] LED;
  output [6:0] SEG;
  output [5:0] AN;
  
  input [3:0] KYPD_ROW;
  output [3:0] KYPD_COL;

  //clock signal
  wire clock = CLK100MHZ;
  wire resetn = ~BTN[3];
  wire cpu_clock, mem_clk;
  // reg [31:0] memout;
  wire [31:0] mb, malu;

  //IO
  wire [31:0] mapped_io_out;

  wire [7 : 0] IO_7SEGEN_N;
  wire [31 : 0] IO_7SEG_DATA;

  wire [7:0] keypad_data;

  /*intr*/
  wire intr, inta;
  /*intr*/


  clock_generator clock_generator_0 (
      .Clock_100M(clock),
      .Clock_1M  (cpu_clock),
      .Clock_2M  (mem_clk)
  );

  wire divided_clock;
  ClockDivider M1_ClockDivider (
      .Reset(1'b0),
      .Clock(CLK100MHZ),
      .DividedClock(divided_clock)
  );

  wire [7:0] SevenSegsAndPoint;
  assign SEG = SevenSegsAndPoint[6:0];

  SevenSegsController M2_SevenSegsController (
      .Reset(1'b0),
      .Clock(divided_clock),
      .DisplayEnables(~IO_7SEGEN_N[5:0]),
      .Data(IO_7SEG_DATA[23:0]),
      .SevenSegsAndPoint(SevenSegsAndPoint),
      .ShowOneofSix(AN)
  );

  Keypad Keypad_Device (
      .Reset_N   (resetn),
      .Clock     (divided_clock),
      .Row       (KYPD_ROW),
      .Col       (KYPD_COL),
      .KeypadData(keypad_data)
  );

  wire [31:0] PC, if_inst, id_inst, exe_alu;
  SCCPU pipelined_cpu(
    /*intr*/
	  .intr(intr),
    /*intr*/
    /*IO*/
    .keypad_data(keypad_data),
    .mapped_io_out(mapped_io_out),
    /*IO*/
    .Clock(cpu_clock),
	  .Mem_Clock(mem_clk),
	  .Resetn(resetn),
	  /*.memout(memout),*/
	  .PC(PC),
	  .if_inst(if_inst),
	  .id_inst(id_inst),
	  .exe_alu(exe_alu),
	  .mem_alu(malu),
	  .mem_wmem(mwmem),
	  .mem_b(mb)
    /*intr*/
    , .inta(inta)
    /*intr*/
  );
  assign intr = (malu[31:16] == 16'h_BF80 && malu[4:0] == 5'b_1_0100) ? 1'b1 : 1'b0;

  mapped_io_data mapped_io_mem (
      .clk(clock),
      .resetn(resetn),
      .dataout(mapped_io_out),
      .datain(mb),
      .addr(malu),
      .we(mwmem),
      .IO_Switch(SW),
      .IO_PB(BTN[2:0]),
      .IO_LED(LED),
      .IO_7SEGEN_N(IO_7SEGEN_N),
      .IO_7SEG_DATA(IO_7SEG_DATA)
  );

endmodule
