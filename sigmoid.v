module sigmoid(i, j, n_n1, act_out1, act_out2, act_out3, sig_out);

input [63:0] act_out1, act_out2, act_out3;
input [31:0] i, j, n_n1;
output reg [63:0] sig_out;


real e = 2.713;
real var;
real val1,val2,val3;

always @ (act_out1, act_out2, act_out3)
begin
    if(j == 0)
    begin
        val1 = $bitstoreal(act_out1);
        val1 = -val1;
        var = 1/(1 + e**(val1));
        sig_out = $realtobits(var);
        file_read.mid_out[n_n1] = sig_out;
        // $display("midout =   %f", val1);
    end
    else
    begin
        val2 = $bitstoreal(act_out2);
        val3 = $bitstoreal(act_out3);
        val2 = -val2;
        val3 = -val3;
        if ((1/(1 + e**(val2))) > (1/(1 + e**(val3))))
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