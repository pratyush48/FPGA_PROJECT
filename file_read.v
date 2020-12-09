module file_read();

parameter w_lines = 182;
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;

real stat;
integer file,file1,i,j,k;
real val;
wire acc_cal;
reg clk;
reg[63:0]weight_mem[0:w_lines];
reg[63:0]memory[0:lines-1];
reg[63:0]data[0:row-1][0:column-1];
reg[63:0]out[0:row-1];
reg[63:0]weights[0:layers-1][0:column];
reg[63:0]mid_out[0:layers-1];
reg[63:0]actual[0:row-1];
reg[63:0]final_weight[0:1][0:layers];

initial
    begin
        clk = 1;
        file=$fopen("test_dataset.txt","r");
        file1=$fopen("weights_1.txt","r");
        $display ("reading file.....");
        //Read test data 
        for(i = 0;i < lines;i=i+1)
        begin
            stat=$fscanf(file,"%f\n",val);
            memory[i] = $realtobits(val);
        end
        $fclose(file);
        //Read weights of layers
        for(i=0;i<=w_lines;i=i+1)
        begin
            stat=$fscanf(file1,"%f\n",val);
            weight_mem[i] = $realtobits(val);
        end
        $fclose(file1);
        //Allot data of test data
        k=0;
        for(i = 0;i < row;i=i+1)
        begin
            for(j=0;j < column;j=j+1)
            begin
                data[i][j] = memory[k];
                k=k+1;
            end
            out[i] = $bitstoreal(memory[k]);
            // $display("out  = %d", out[i]);
            k=k+1;
        end
        //Allot data of weights till 10 layers
        k  = 0;
        for(i=0;i<layers;i=i+1)
        begin
            for(j=0;j<=column;j=j+1)
            begin
                weights[i][j] = weight_mem[k];
                k=k+1;
            end
        end
        //Final weights
        for(i=0;i<2;i=i+1)
        begin
            for(j=0;j<=layers;j=j+1)
            begin
                final_weight[i][j] = weight_mem[k];
                k=k+1;
            end
        end
        // //Print data of test
        // for(i = 0;i < row;i=i+1)
        // begin
        //     for(j=0;j < column;j=j+1)
        //     begin
        //         $display("data[%d][%d] = %f",i,j,$bitstoreal(data[i][j]));
        //     end
        //     $display("out[%d] = %f",i,$bitstoreal(out[i]));
        // end        
        // //Print data of weights
        // for(i = 0;i < layers;i=i+1)
        // begin
        //     for(j=0;j < column;j=j+1)
        //     begin
        //         $display("weights[%d][%d] = %f",i,j,$bitstoreal(weights[i][j]));
        //     end
        // end      
        //Print final weights
        // for(i=0;i<=layers;i=i+1)
        // begin
        //     $display("finalweights[%d] = %f",i,$bitstoreal(final_weight[i]));
        // end          
    end
always #10 clk = ~clk;
predict p(clk,acc_cal);
always@(posedge clk)
begin
    if(acc_cal == 1)
    begin
        #50 $finish;
    end
end
endmodule
