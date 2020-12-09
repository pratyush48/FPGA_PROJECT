module forward_propagation(clk, done_fp);
//Parameters
parameter layer = 2;//Hidden and output
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;
parameter nueron = 10;
integer i = 0,j = 0, n_n1 = 0, n_n2 = 0;
input clk;
output reg done_fp;


reg flag = 0;
wire [63:0] act_out1, sig_out, act_out2, act_out3;



activate1 act1(clk, i, j, n_n1, act_out1, done_act_1);
activate2 act2(clk, i, j, act_out2, act_out3, done_act_2);
sigmoid sig(i, j, n_n1, act_out1, act_out2, act_out3, sig_out);


always@(posedge done_act_1)
begin
    if(n_n1 == 9)
    begin
        j = 1; 
        n_n1 = 0;
    end
    n_n1 = n_n1 + 1;
end

always @ (posedge done_act_2)
begin
    n_n1 = 0;
    j = 0;
    i = i + 1;
    if(i == 100)
    begin
        done_fp = 1;    
    end
end

endmodule