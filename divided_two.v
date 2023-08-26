module divided_two(clk,reset,out_clk);

input clk, reset;
output reg out_clk;

always @(posedge clk) begin
    if (reset) 
        out_clk<=1'b0;
    else 
        out_clk = ~out_clk;
end

endmodule