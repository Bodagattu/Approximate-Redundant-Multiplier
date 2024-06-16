`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:      N.VAMSHI KRISHNA
// Engineer:     9100110505
// Create Date:    21:24:23 01/30/2020 
// Design Name: 
// Module Name:     
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
module COMP42(xk,yk,xk1,yk1,sk1m,sk1p);

input xk,yk,xk1,yk1;
output sk1m,sk1p;

assign sk1m = xk^yk^((xk1&~yk1)|(~xk1&yk1));
assign sk1p = xk1&yk|yk&yk1|xk1&yk1;

endmodule
/////////////////////////////

module COMP42_NBIT(a,b,sum);

parameter N=32;
input [N-1:0] a,b;
output [N-1:0] sum;
wire [N:0] C;
	
	assign C[0]=1'b0;
	assign cout=C[N];
	genvar i;
	
   generate 
   for(i=0;i<=N-1;i=i+1)
     begin: aa
       COMP42 b1(1'b0,a[i],b[i],C[i],sum[i],C[i+1]);
     end
   endgenerate

endmodule 
