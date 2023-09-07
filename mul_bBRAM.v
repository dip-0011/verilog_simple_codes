module multiplication_BRAM(clk,rst,r_w,str,address,op_A,const,Mulb_o);
input clk, rst,r_w,str;
input [7:0]address;
input [7:0]op_A;
input [7:0]const;
output [15:0] Mulb_o;

reg [7:0]BRAM[0:255];
reg [15:0]prod;
reg [15:0]acc;
reg [7:0]reg_A;
reg [7:0]reg_B;
integer i;

always @(posedge clk ) begin
    if (!rst) begin
        for ( i=0 ; i<256 ; i = i+1 ) begin
            BRAM[i] <= 8'd0;
        end
        prod <= 16'd0;
        acc <= 16'd0;
    end
    else begin
        if (!r_w & !str) begin // r_w = 0 str = 0 BRAM reads the value
            BRAM[address] = const;
        end
        else begin
            if (r_w & !str) begin // r_w = 1 str = 0 BRAM writes the value
                reg_B = BRAM[address];
            end
            if (r_w & str) begin // r_w = str = 1 multiplication is done
                reg_A = op_A;
                acc = {8'd0,reg_A};
                prod = 16'd0;
                for ( i=0 ; i<8 ; i = i+1 ) begin
                    if(reg_B[i]) begin
                        prod = prod + reg_A;
                        reg_A = reg_A << 1;
                    end
                else begin
                        reg_A = reg_A << 1;
                    end
                end
            end
        end
    end
end

assign Mulb_o = prod;

endmodule