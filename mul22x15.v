module multiplicator(A,B,Mul_o,Mul_e);
input [21:0]A;
input [14:0]B;
output signed[35:0]Mul_o;
output signed [35:0]Mul_e;

reg [7:0]A0;
reg [7:0]A1;
reg [7:0]A2;
reg [7:0]B0;
reg [7:0]B1;

reg [35:0]prod;
reg [16:0]m1;
reg [35:0]n1;
reg [35:0]n2;
reg [35:0]n3;
reg [35:0]n4;
reg [35:0]n5;
reg [35:0]n6;


always @(*) begin
    prod = 37'd0;
    A0 = {1'b0,A[6:0]};
    A1 = {1'b0,A[13:7]};
    A2 = A[21:14];
    B0 = {1'b0,B[6:0]};
    B1 = B[14:7];
    m1 = A0*B0;
    n1 = {20'd0,m1};
    prod = prod + m1;
    m1 = A1*B0;
    n2 = {13'd0,m1,7'd0};
    prod = prod+n2;
    m1 = A2*B0;
    n3 = {6'd0,m1,14'd0};
    prod = prod+n3;
    m1 = A0*B1;
    n4 = {13'd0,m1,7'd0};
    prod = prod+n4;
    m1 = A1*B1;
    n5 = {6'd0,m1,14'd0};
    prod = prod+n5;
    m1 = A2*B1;
    n6 = {3'd0,m1,21'd0};
    prod = prod+n6; 
end

assign Mul_o = prod;
assign Mul_e = A*B;

endmodule
