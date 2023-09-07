module rtl_two(clk,rst,data_in,data_out);
input clk,rst;
input [7:0]data_in;
output data_out;

reg [7:0]flop1,flop2;
reg flop3;
wire [7:0]addi;
wire x_pd;

assign addi = flop1 + 8'h55;
assign x_pd = flop2[0]^flop2[1]^flop2[2]^flop2[3]^flop2[4]^flop2[5]^flop2[6]^flop2[7];

always @(posedge clk) begin
    if (!rst) begin
        flop1 <= 8'd0;
        flop2 <= 8'd0;
        flop3 <= 1'b0;
    end
    else begin
        flop1 <= data_in;
        flop2 <= addi;
        flop3 <= x_pd;
    end
end

assign data_out = flop3; 

endmodule