`timescale 1ns/100ps
`include "moore_mach.v"

module moore_mach_tb;

reg ip,reset,clk;
wire [3:0] cn_out;

abb_count uut(ip,clk,reset,cn_out); // uut --> unit under test
always begin
    clk = ~clk; #5;
end

initial begin
    clk = 1'b1;
    reset = 1'b0; 
end

initial begin
    $dumpfile("count_100.vcd");
    $dumpvars(0,moore_mach_tb);
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    // reset = 1'b1, #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;
    ip = 1'b0; #10;
    ip = 1'b1; #10;
    ip = 1'b0; #10;


    $finish;
end

endmodule