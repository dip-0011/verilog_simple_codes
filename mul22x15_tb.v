`timescale 1ns/100ps
`include"22x15mul.v"

module test;
reg [21:0]A;
reg [14:0]B;
wire [35:0]Mul_o;
wire [35:0]Mul_exp;

multiplicator uut(A,B,Mul_o,Mul_exp);
initial begin
    $dumpfile("multiplication.vcd");
    $dumpvars(0,test);
    $monitor($time,"A=%h,B=%h, Res = %h, Exp = %h",A,B,Mul_o,Mul_exp);

    A = -22'b1010101010101010101010;
    B = 15'b110101010101010;
    #30;
    $finish;
end
endmodule
