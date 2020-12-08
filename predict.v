module predict(clk);
//Parameters
parameter lines = 1600;
parameter row = 100;
parameter column = 15;
parameter layers = 10;
input clk;
//Outputs
real accuracy;

forward_propagation fp(clk);

endmodule