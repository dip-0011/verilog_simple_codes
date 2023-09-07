module dual_port_ram(clk,rst,addrA,addrB,dataA,dataB,weA,weB, qA,qB);
    input clk;
    input rst;
    input [9:0] addrA;
    input [9:0] addrB;
    input [17:0] dataA;
    input [17:0] dataB;
    input weA;
    input weB;
    output [17:0] qA;
    output [17:0] qB;

    reg [17:0] mem [0:1023];

    // Read ports
    assign qA = mem[addrA];
    assign qB = mem[addrB];

    // Write ports
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mem[addrA] <= 18'b0;
            mem[addrB] <= 18'b0;
        end else begin 
        if (weA)
            mem[addrA] <= dataA;
        if (weB)
            mem[addrB] <= dataB;
        end
    end

endmodule