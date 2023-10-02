module ALU_frb (reset,clk,opt,A,B,Res);
    input reset,clk;
    input [3:0]opt;
    input [3:0]A,B;
    output [7:0]Res;

    reg [7:0]ALU_out;
    reg [3:0]temp_one;

    always @(posedge clk) begin
        if (!reset) begin
            ALU_out = 8'b0;
        end
        else begin
            ALU_out = {4'b0,temp_one};

            case (opt)
               4'b0000 : ALU_out = A + B;
               4'b0001 : ALU_out = A - B;
               4'b0010 : ALU_out = A * B;
               4'b0011 : ALU_out = A/B; 
               4'b0100 : ALU_out = A << 1;
               4'b0101 : ALU_out = A >> 1;
               4'b0110 : ALU_out = {4'b0,A[2:0],A[3]};
               4'b0111 : ALU_out = {4'b0,A[0],A[3:1]};
               4'b1000 : ALU_out = A&B;
               4'b1001 : ALU_out = A|B;
               4'b1010 : ALU_out = A^B;
               4'b1011 : ALU_out = ~(A|B);
               4'b1100 : ALU_out = ~(A&B);
               4'b1101 : ALU_out = ~(A^B);
               4'b1110 : ALU_out = {4'b0,(~A)};
            endcase
        end
    end
   
    assign Res = ALU_out;
endmodule