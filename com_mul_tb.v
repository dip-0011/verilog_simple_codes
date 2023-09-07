`timescale 1ns/100ps
`include "complex_multiplier.v"

module complex_mul_test_bench;
reg [3:0]A_in;
reg [3:0]B_in;
reg [3:0]C_in;
reg [3:0]D_in;
wire [7:0]Mul_r_th;
wire [7:0]Mul_i_th;
wire [7:0]Mul_r_fr;
wire [7:0]Mul_i_fr;

complex_mul_three uut(A_in,B_in,C_in,D_in,Mul_r_th,Mul_i_th);
complex_mul_four dut(A_in,B_in,C_in,D_in,Mul_r_fr,Mul_i_fr);

initial begin
	$dumpfile("complex_mul.vcd");
	$dumpvars(0,complex_mul_test_bench);
	$monitor("complex_num1 = %h + j%h,complex_num2 = %h + j%h,mul_3 = %h + j%h, mul_4 = %h + j%h",A_in,B_in,C_in,D_in,Mul_r_th,Mul_i_th,Mul_r_fr,Mul_i_fr);

	A_in = 4'b1101;
	B_in = 4'b1010;
	C_in = 4'b0011;
	D_in = 4'b0110;
	#30
	$finish; 
end

endmodule