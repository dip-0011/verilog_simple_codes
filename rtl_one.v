module rtl_one(clk,rst,data_in,data_out);
input clk,rst;
input [7:0]data_in;
output data_out;

reg [7:0]flop1;
reg flop2,flop3;
wire [7:0]addi;
wire x_pd;

assign addi = flop1 + 8'h55;
assign x_pd = addi[0]^addi[1]^addi[2]^addi[3]^addi[4]^addi[5]^addi[6]^addi[7];

always @(posedge clk) begin
    if (!rst) begin
        flop1 <= 8'd0;
        flop2 <= 1'b0;
        flop3 <= 1'b0;
    end
    else begin
        flop1 <= data_in;
        flop2 <= x_pd;
        flop3 <= flop2;
    end
end

assign data_out = flop3; 

endmodule