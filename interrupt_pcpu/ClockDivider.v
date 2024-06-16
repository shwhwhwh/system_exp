`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:06 06/14/2024 
// Design Name: 
// Module Name:    ClockDivider 
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
module ClockDivider(
       input      Reset ,
       input      Clock , 
       output reg DividedClock	
	 );      

	 parameter  COUNTER = 32'hC350; // 50 000   
    reg [32:0] clock_count;

    initial begin
	     clock_count  = 0 ;
		  DividedClock = 0 ;
	 end

    always @(posedge Clock ) 
      if (Reset == 1'b1) begin
         clock_count  <= {32{1'b0}};
			DividedClock <= 0 ;
		end
      else 
      begin
         if ( clock_count == COUNTER - 1 ) // CLKΪ100Mʱ�� dividedClk������ 1ms , �ߵ͸� 0.5ms
         begin
            DividedClock <= ~DividedClock;
            clock_count <= {32{1'b0}};
         end
			else
            clock_count <= clock_count + 1;
      end	
		
endmodule
