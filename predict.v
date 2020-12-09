module predict(clk,acc_cal);
//Parameters
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;
input clk;
//Outputs
real accuracy;
integer i;
output reg acc_cal;
wire done_fp;
forward_propagation fp(clk, done_fp);

always @ (posedge done_fp)
begin
    for(i = 0; i < row; i = i + 1)
    begin
        $display("%d   %d",file_read.actual[i], file_read.out[i]);
        accuracy = accuracy + (file_read.actual[i] - file_read.out[i])*(file_read.actual[i] - file_read.out[i]);
    end
    acc_cal = 1;
    $display("accuracy = %f",accuracy);
end


endmodule
