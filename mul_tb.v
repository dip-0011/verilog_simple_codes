`timescale 1ns/100ps
`include "mul_BRAM.v"

module mul_tb;
    reg clk,rst,r_w,str;
    reg [7:0] address;
    reg [7:0]op_A;
    reg [7:0]const;
    wire [15:0]Mulb_obs;
    wire [15:0]Mulb_exp;

    multiplication_BRAM uut(clk,rst,r_w,str,address,op_A,const,Mulb_obs,Mulb_exp);
    always begin
        clk = ~clk;
        #5;
    end
    initial begin
        clk = 1'b0;
        rst = 1'b0;#5;
        rst = 1'b1;
    end
    initial begin
        $dumpfile("Multiplication_BRAM.vcd");
        $dumpvars(0,mul_tb);
        str = 1'b0;
        r_w = 1'b0; 
        address = 8'h55;
        const =  8'b11001010; #10; // BRAM reads the const
        r_w = 1'b1;
        address = 8'h55; #10; // BRAM writes the value to Reg B

        r_w = 1'b1; str = 1'b1;      // multiplication
        op_A = 8'b00110100; #20;

        op_A = 8'b10101101; #20;

        op_A = 8'b11010011; #20;

        // const = 8'b11001010;
        // const = 8'b00011101;
        // #10
        // B = 8'b10110101;
        // #10
    $finish;
    end
endmodule