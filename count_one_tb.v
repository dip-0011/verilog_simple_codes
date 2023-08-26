`timescale 1ns/100ps
`include "count_one.v"

module count_one_tb;
    reg [15:0] in_s;
    reg clk;
    wire [3:0] n_one;

    con_one uut(in_s,clk,n_one);
    always begin
        clk = ~clk; #5;
    end
    initial begin
        clk = 1'b0;
    end
    initial begin
    $dumpfile("count_1.vcd");
    $dumpvars(0,count_one_tb);
    in_s = 16'ha50f; #10;


    $finish;
end

endmodule