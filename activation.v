module activate1(clk, i, j, n_n1, act_out, done_act_1);

input clk;
input [31:0] i, j, n_n1;
output reg [63:0] act_out = 0;

output reg done_act_1 = 0;

integer cnt, w_n = 0;


always @ (posedge clk)
begin
    if(j == 0)
    begin
    if(w_n <= 14)
    begin
        if(w_n == 0)
        begin
            act_out = 0;
        end
        done_act_1 = 0;
        act_out = $realtobits($bitstoreal(act_out) + ($bitstoreal(file_read.weights[n_n1][w_n])*$bitstoreal(file_read.data[i][w_n])));
        // $display("act_out=%f, %f ",$bitstoreal(act_out),$bitstoreal(file_read.weights[n_n1][w_n])*$bitstoreal(file_read.data[i][w_n]));
        w_n = w_n+1;
    end
    else
    begin
        act_out = $realtobits($bitstoreal(act_out) + $bitstoreal(file_read.weights[n_n1][15]));
        // $display("act_out=%f",$bitstoreal(act_out));
        w_n = 0;
        done_act_1 = 1;
    end
    end
    else
    begin
        done_act_1 = 0;
    end
end


endmodule
