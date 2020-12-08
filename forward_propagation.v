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
// activate act(weights[j],data[i],act_out);
// sigmoid sig(act_out,sig_out);
always@(posedge clk)
begin
    if(j == 2)
    begin
        i = i + 1;
        j = 0;
    end
    j = j + 1;
    $display("%d,%d",i,j);
end

endmodule