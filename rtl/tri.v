module trikrish (En,D, clk, QB);
input clk,En,D;
output QB;
reg QA,QB;
always@(En or D)
if(En) QA = D;
else QA = 1'bZ;

always@ (posedge clk)
QB = QA;

endmodule
