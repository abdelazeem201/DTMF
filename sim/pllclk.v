module pllclk (refclk, vcop, vcom, clk1x, clk2x, reset, ibias);
input refclk;
input vcop;
input vcom;
input reset;
input ibias;
output clk1x;
output clk2x;

reg clk1x, clk2x;

initial
begin
  clk1x = 0;
  clk2x = 0;
end

always #5  clk1x = ~clk1x;
always #10 clk2x = ~clk2x;

endmodule
