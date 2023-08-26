module half_adder(a,b,s_o,c_o);
    input a,b;
    output s_o,c_o;

    xor (s_o,a,b);
    and (c_o,a,b);
endmodule

module full_adder(A,B,C_in,Sum,C_out);
    input A,B,C_in;
    output Sum,C_out;

    wire S1,S2,S3; // first HA sum, first HA C_out, second HA C_out

    half_adder u1(A,B,S1,S2);
    half_adder u2(S1,C_in,Sum,S3);
    or (C_out,S2,S3);
endmodule

module ripple_carry_adder(AA,BB,SS,Co);
    input [3:0]AA;
    input [3:0]BB;
    output [3:0]SS;
    output Co;

    wire [2:0]cc;
    reg c_in = 1'b0;

    full_adder fa0(AA[0],BB[0],c_in,SS[0],cc[0]);
    full_adder fa1(AA[1],BB[1],cc[0],SS[1],cc[1]);
    full_adder fa2(AA[2],BB[2],cc[1],SS[2],cc[2]);
    full_adder fa3(AA[3],BB[3],cc[2],SS[3],Co);

endmodule

module addr_sub(A_in,B_in,Sel,Res_o,CB_bit);
    input [3:0]A_in;
    input [3:0]B_in;
    input Sel;
    output [3:0]Res_o;
    output CB_bit;

    wire [3:0]W;

    xor (W[0],B_in[0],Sel);
    xor (W[1],B_in[1],Sel);
    xor (W[2],B_in[2],Sel);
    xor (W[3],B_in[3],Sel);

    ripple_carry_adder rca(A_in,W,Res_o,CB_bit);
endmodule