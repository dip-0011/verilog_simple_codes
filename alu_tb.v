`timescale 1ps/1ps
`include "alu.v"

module tb_alu;
reg clk, reset;
reg [3:0]opt;
reg [3:0]A,B;
wire [7:0]Res;

ALU_frb uut(reset,clk,opt,A,B,Res);
always begin
    clk = ~clk;
    #5;
end
initial begin
    clk = 1'b1;
end

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0,tb_alu);
    reset = 1'b0; #5;
    reset = 1'b1;

    A = 4'h2;
    B = 4'h3;
    opt = 4'h0; #25; //addition

    A = 4'h6;
    B = 4'h2;
    opt = 4'h1;#20; //subtraction

    A = 4'h3;
    B = 4'h3;
    opt = 4'h2;#20; // multiplication

    A = 4'h8;
    B = 4'h2;
    opt = 4'h3;#20; // division

    A = 4'h8;
    opt = 4'h4;#20; // left shift

    A = 4'h8;
    opt = 4'h5;#20; // right shift

    A = 4'h8;
    opt = 4'h6;#20; // left rot

    A = 4'h8;
    opt = 4'h7;#20; // right rot

    A = 4'hA;
    B = 4'h5;
    opt = 4'h8; #20; // and

    A = 4'hc;
    B = 4'h3;
    opt = 4'h9; #20; // or

    A = 4'hc;
    B = 4'h3;
    opt = 4'ha; #20; // xor

    A = 4'hc;
    B = 4'h3;
    opt = 4'hb; #20; // nor

    A = 4'hA;
    B = 4'h5;
    opt = 4'hc; #20; // nand

    A = 4'hc;
    B = 4'h3;
    opt = 4'hd; #20; // xnor

    A = 4'hA;
    opt = 4'he; #20; // not
    $finish;
    end

endmodule