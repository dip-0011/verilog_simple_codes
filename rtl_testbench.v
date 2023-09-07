`timescale 1ns/100ps
`include "rtl_one.v"
`include "rtl_two.v"

module rtl_tb;
reg clk,rst;
reg [7:0]data_in;
wire data_out_one;
wire data_out_two;

rtl_one uut(clk,rst,data_in,data_out_one);
rtl_two dut(clk,rst,data_in,dtat_out_two);

always begin
    clk = ~clk; #5;
end
initial begin
    clk = 1'b0;
end
initial begin
    $dumpfile("rtl_waveform.vcd"); $dumpvars(0,rtl_tb);
    rst = 1'b0; #5;

    rst = 1'b1;
    data_in = 8'b11001010; #10;

    rst = 1'b0; #5;

    rst = 1'b1;
    data_in = 8'b01010110; #10;

    $finish;
end

endmodule