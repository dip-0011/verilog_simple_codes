`timescale 1ns/100ps
`include "divided_two.v"

module div_two_tb;

reg clk,reset;
wire clk_out;

divided_two uut(clk,reset,clk_out);
always begin
    clk = ~clk; #5;
end

initial begin
    clk = 1'b1;
end
initial begin
    $dumpfile("div_two_clk.vcd");
    $dumpvars(0,div_two_tb);
    reset = 1'b1; #10;
    reset = 1'b0; #20;
    #300;
    $finish;
end

endmodule