module sigmoid(i, j, n_n1, act_out1, act_out2, act_out3, sig_out);

input [63:0] act_out1, act_out2, act_out3;
input [31:0] i, j, n_n1;
output reg [63:0] sig_out;


real e = 2.713;
real var;


always @ (act_out1, act_out2, act_out3)
begin
    if(j == 0)
    begin
        var = 1/(1 + e**($bitstoreal(act_out1)));
        sig_out = $realtobits(var);
        file_read.mid_out[n_n1] = sig_out;
        // $display("midout =   %f", act_out1);
    end
    else
    begin
        if ((1/(1 + e**($bitstoreal(act_out2)))) > (1/(1 + e**($bitstoreal(act_out3)))))
        begin
            sig_out = 0;
        end 
        else begin
            sig_out = 1;
        end
        file_read.actual[i] = sig_out;
    end
end

endmodule