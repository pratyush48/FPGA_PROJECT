module activate2(flag, i, j, act_out);

input flag;
input [31:0] i, j;
output reg [63:0] act_out;

integer cnt;

always @ (i, j)
begin
    if(flag == 1)
    begin
    for(cnt = 0; cnt < 10; cnt = cnt + 1)
    begin
        act_out += file_read.final_weight[j][cnt]*file_read.mid_out[i][cnt];
    end
    act_out += file_read.final_weight[j][10];
    end
end


endmodule