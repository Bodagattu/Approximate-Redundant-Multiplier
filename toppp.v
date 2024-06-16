`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:      N.VAMSHI KRISHNA
// Engineer:     9100110505
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define width 32
`timescale 1ns/1ps

module toppp;
parameter width=`width;
parameter N = `width/2;
reg [width-1:0]x, y;
wire [width+width-1:0]p;
	// Outputs

	// Instantiate the Unit Under Test (UUT)
	booth uut (p,x,y);

	initial begin
		// Initialize Inputs
		// Initialize Inputs
x=15;
y=15;

		#100 $finish;        
		// Add stimulus here

	end
      
endmodule

