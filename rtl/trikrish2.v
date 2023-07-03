module trikrish (En,D, cond, clk, Q);
input clk,En,D,cond;
output Q;
reg Q;

always@ (posedge clk)
if(En) Q = (~cond)? D:Q;
else Q = 1'bz;

endmodule
