`timescale 1ns/100ps
`include "div_three_clk.v"

module div_three_clk_tb;

reg clk,reset;
wire clk_out;

div_three uut(clk,reset,clk_out);
always begin
    clk = ~clk; #5;
end

initial begin
    clk = 1'b1;
end
initial begin
    $dumpfile("div_three_clk.vcd");
    $dumpvars(0,div_three_clk_tb);
    reset = 1'b1; #10;
    reset = 1'b0; #20;
    #300;
    $finish;
end

endmodule