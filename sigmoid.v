module sigmoid(flag, act_out1, act_out2, sig_out);

input [63:0] act_out1, act_out2;
input flag;
output reg [63:0] sig_out;


real e = 2.713;
real var;

assign act_out = flag ? act_out1 : act_out2;

always @ (act_out1, act_out2)
begin
    var = 1/(1 + e**(act_out));
    sig_out = $realtobits(var);
end

endmodule