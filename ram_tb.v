`timescale 1ns/100ps
`include "ram.v"

module dual_port_ram_tb;
    reg clk;
    reg rst;
    reg [9:0] addrA;
    reg [9:0] addrB;
    reg [17:0] dataA;
    reg [17:0] dataB;
    reg weA;
    reg weB;
    wire [17:0] qA;
    wire [17:0] qB;

    dual_port_ram uut(clk,rst,addrA,addrB,dataA,dataB,weA,weB, qA,qB);
    initial begin
        clk = 1'b0;
        forever begin
            clk = ~clk; #5;
        end
        rst = 1'b1;
    end
    initial begin
        $dumpfile("dual_port_ram.vcd");
        $dumpvars(0,dual_port_ram_tb);
        
        rst = 1'b0;
        weA = 1'b0;
        addrA = 10'b0000100000;
        weB = 1'b1;
        addrB = 10'b0010000000;
        dataB = 18'b001100100111100101;
        #20;

        rst = 1'b0;
        weA = 1'b1;
        addrA = 10'b0000100000;
        dataA = 18'b101110100110010101;
        weB = 1'b0;
        addrB = 10'b0010001100;
        #20;

        rst = 1'b0;
        weA = 1'b1;
        addrA = 10'b0010101100;
        dataA = 18'b001010100110011101;
        weB = 1'b1;
        addrB = 10'b0010001100;
        dataB = 18'b100100110111110001;
        #20;

        
    $finish;
    end
endmodule