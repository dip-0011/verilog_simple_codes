// question: Construct a moore machine that counts the number of abb in a sequence of a,b
// there are four states 

// In the theory of computation, a Moore machine is a finite-state machine whose current output 
// values are determined only by its current state. This is in contrast to a Mealy machine, whose 
// output values are determined both by its current state and by the values of its inputs.

module abb_count(ip,clk,reset,cn_out);
input ip,reset,clk;
output reg [3:0] cn_out = 0;

parameter st1=2'b00;
parameter st2=2'b01;
parameter st3=2'b10;
parameter st4=2'b11;

reg [1:0] state;

always @(posedge clk) begin
    if (reset) begin
        cn_out <= 0;
        state <= st1;
    end
end
always @(posedge clk) begin
        case (state)
            st1 : begin if (ip) state <= st2;
                    else state <= st1; end
            st2 : begin if (!ip) state <= st3;
                    else state <= st2; end
            st3 : begin if (!ip) state <= st4;
                    else state <= st1; end
            st4 : begin cn_out <= cn_out+1;
                    if (ip) state <= st2;
                   else state <= st1;end
            default:
                state <= st1;
        endcase
    end

endmodule