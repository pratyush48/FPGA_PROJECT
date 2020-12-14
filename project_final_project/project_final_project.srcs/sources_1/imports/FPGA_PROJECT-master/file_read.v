module file_read();

parameter w_lines = 182;
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;

integer i,j,k;
wire acc_cal;
reg clk;
reg[10:0] addra;
reg[7:0] addrb;
reg ena,enb;
wire[31:0]douta,doutb;

reg[31:0]weight_mem[0:w_lines-1];//Read this from br
reg[31:0]memory[0:lines-1];//Read this from br

//reg[31:0]data[0:row-1][0:column-1];
//reg[31:0]out[0:row-1];
//reg[31:0]weights[0:layers-1][0:column];
//reg[31:0]mid_out[0:layers-1];
//reg[31:0]actual[0:row-1];
//reg[31:0]final_weight[0:1][0:layers];

reg mem_read;
reg weight_read;

//Block Ram for Data
blk_mem_gen_0 test_data (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(addra),  // input wire [10 : 0] addra
  .douta(douta)  // output wire [31 : 0] douta
);
//Block Ram for Weights
blk_mem_gen_1 layer_weights (
  .clka(clk),    // input wire clka
  .ena(enb),      // input wire ena
  .addra(addrb),  // input wire [7 : 0] addra
  .douta(doutb)  // output wire [31 : 0] douta
);

initial
begin
    clk = 1;
    mem_read = 0;
    weight_read = 0;
    ena = 1;
    enb = 1;
    addra = 0;
    addrb = 0;
    i = 0;
    j = 0;
    k = 0;
end

always #5 clk = ~clk;

always@(posedge clk)
begin
    if(douta != 0)
    begin
        k = 1;
    end
end
always@(posedge  clk)
begin
if(k == 1)
begin
    if(i < 1600)
    begin
        memory[i] = douta;
        addra = addra+1;
        i = i+1;
    end
    else
        mem_read = 1;
    if(j < 182)
    begin
        weight_mem[j] = doutb;
        addrb = addrb+1;
        j = j+1;
    end
    else
        weight_read  = 1;
end
end

//predict p(clk,acc_cal);
//always@(posedge clk)
//begin
//    if(acc_cal == 1)
//    begin
//        #50 $finish;
//    end
//end
endmodule
