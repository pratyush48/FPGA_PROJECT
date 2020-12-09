module activate2(clk, i, j, act_out1, act_out2, done_act_2);

input clk;
input [31:0] i, j;
output reg [63:0] act_out1 = 0, act_out2 = 0;
output reg done_act_2 = 0;


integer cnt, w_n = 0;

always @ (posedge clk)
begin
    if(j == 1)
    begin
    if(w_n <= 9)
    begin
        if(w_n == 0)
        begin
            act_out1 = 0;
            act_out2 = 0;
        end
        done_act_2 = 0;
        act_out1 = $realtobits($bitstoreal(act_out1) + ($bitstoreal(file_read.final_weight[0][w_n])*$bitstoreal(file_read.mid_out[w_n])));
        act_out2 = $realtobits($bitstoreal(act_out2) + ($bitstoreal(file_read.final_weight[1][w_n])*$bitstoreal(file_read.mid_out[w_n])));
        // $display("act_out2 = %f\n",$bitstoreal(file_read.mid_out[w_n]));
        w_n = w_n+1;
    end
    else
    begin
        act_out1 = $realtobits($bitstoreal(act_out1) + $bitstoreal(file_read.final_weight[0][10]));
        act_out2 = $realtobits($bitstoreal(act_out2) + $bitstoreal(file_read.final_weight[1][10]));
        w_n = 0;
        done_act_2 = 1;
    end
    end
    else
    begin
        done_act_2 = 0;
    end
end

endmodule

