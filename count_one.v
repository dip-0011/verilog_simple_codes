module con_one(in_s,clk,n_one);
input [15:0] in_s;
input clk;
output reg [3:0] n_one;

integer i;

always @(posedge clk) begin
    n_one = 4'd0;
    for (i = 0; i<16 ; i=i+1 ) begin
        if (in_s[i] == 1'b0) begin
            n_one = n_one+1;
        end
    end
end

endmodule