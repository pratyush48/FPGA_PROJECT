module forward_propagation(clk);
//Parameters
parameter layer = 2;//Hidden and output
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;
parameter nueron = 10;
integer i = 0,j = 0;
input clk;

reg flag = 0;
wire [63:0] act_out1, sig_out, act_out2;
activate1 act1(flag, i, j, act_out1);
activate2 act2(flag, i, j, act_out2);
sigmoid sig(flag, act_out1, act_out2, sig_out);
always@(posedge clk)
begin
    if(j == 2)
    begin
        i = i + 1;
        j = 0;
        flag = 0;
    end
    j = j + 1;
    $display("%d,%d",i,j);
end

endmodule