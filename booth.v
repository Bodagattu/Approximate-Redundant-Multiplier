`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:02 01/17/2018 
// Design Name: 
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
`timescale 1ns/1ps
module booth (p, x, y);

parameter width= 32;
parameter    N = width/2;
input [width-1:0]x, y;
output[width+width-1:0]p;

  reg [2:0] cc[N-1:0];
  reg [width:0] pp[N-1:0];
  reg [width+width-1:0] spp[N-1:0];
  wire [width+width-1:0] prod1[N:0];
  wire [width:0] inv_x;
  integer kk,ii;
  genvar kkk;	

assign inv_x = {~x[width-1],~x}+1;

always @ (x or y or inv_x)
begin
/////////////main block operarion///
  cc[0] = {y[1],y[0],1'b0};
  for(kk=1;kk<N;kk=kk+1)
    cc[kk] = {y[2*kk+1],y[2*kk],y[2*kk-1]};
  for(kk=0;kk<N;kk=kk+1)
  ///// error correction block
  begin
    case(cc[kk])
      3'b001 , 3'b010 : pp[kk] = {x[width-1],x};
      3'b011 : pp[kk] = {x,1'b0};
      3'b100 : pp[kk] = {inv_x[width-1:0],1'b0};
      3'b101 , 3'b110 : pp[kk] = inv_x;
      default : pp[kk] = 0;
    endcase
	 
    spp[kk] = $signed(pp[kk]);
    for(ii=0;ii<kk;ii=ii+1)
      spp[kk] = {spp[kk],2'b00}; //multiply by 2 to the power x or shifting operation
  end //for(kk=0;kk<N;kk=kk+1)
  
//  for(kk=1;kk<N;kk=kk+1)
//       //prod = prod + spp[kk];
//	 ARBC1_NBIT #(width+width) UUT(prod,spp[kk],prod);
end
assign prod1[0]= spp[0];
  generate
  for(kkk=1;kkk<N;kkk=kkk+1)
   begin
 	 COMP42_NBIT #(width+width) UUT(prod1[kkk-1],spp[kkk],prod1[kkk]);
   end
  endgenerate

  
assign p = prod1[N-1];
endmodule
  