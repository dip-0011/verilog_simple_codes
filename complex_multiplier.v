module complex_mul_three(a,b,c,d,z_r,z_i);
input [3:0]a;
input [3:0]b;
input [3:0]c;
input [3:0]d;
output [7:0]z_r;
output [7:0]z_i;

reg [7:0]t1;
reg [7:0]t2;
reg [7:0]t3;
reg [5:0]a1;
reg [5:0]a2;

reg [7:0]rr;
reg [7:0]ii;

always @(*) begin
	t1 <= a*c;
	t2 <= b*d;
	a1 <= (a+b);
	a2 <= (c+d);
	t3 <= a1*a2;

	rr = t1-t2;
	ii = t3-t1-t2;
end

assign z_r = rr;
assign z_i = ii;

endmodule

module complex_mul_four(A,B,C,D,Z_r,Z_i);
input [3:0]A;
input [3:0]B;
input [3:0]C;
input [3:0]D;
output [7:0]Z_r;
output [7:0]Z_i;

reg [7:0]w1;
reg [7:0]w2;
reg [7:0]w3;
reg [7:0]w4;

reg [7:0]RR;
reg [7:0]II;

always @(*) begin
	w1 <= A*C;
	w2 <= B*D;
	w3 <= A*D;
	w4 <= B*C;

	RR = w1-w2;
	II = w3+w4;
end

assign Z_r = RR;
assign Z_i = II;

endmodule