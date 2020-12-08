module activate1(flag, i, j, act_out);

input flag;
input [31:0] i, j;
output reg [63:0] act_out;

integer cnt;

always @ (i, j)
begin
    if(flag == 0)
    begin
    for(cnt = 0; cnt < 14; cnt = cnt + 1)
    begin
        act_out += file_read.weights[j][cnt]*file_read.data[i][cnt];
    end
    act_out += file_read.weights[j][15];
    end
end


endmodule