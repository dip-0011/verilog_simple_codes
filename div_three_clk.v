module div_three(clk,reset,clk_out);
input clk, reset;
output clk_out;

reg [1:0]pos_con;
reg [1:0]neg_con;

always @(posedge clk) begin
    if (reset) 
        pos_con <= 0;
    else if(pos_con==2) 
        pos_con <= 0;
    else 
        pos_con <= pos_con+1;
end 

always @(negedge clk) begin
    if (reset) 
        neg_con <= 0;
    else if(neg_con==2) 
        neg_con <= 0;
    else 
        neg_con <= neg_con+1;
end 

assign clk_out = ((pos_con == 2)|(neg_con == 2));

endmodule