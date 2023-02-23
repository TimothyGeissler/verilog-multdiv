module tff_tb();  
reg clk;
reg reset;
reg t;
 
wire q;
wire qb;
 
tff tflipflop(t, clk, reset, q);

integer i;

initial begin
$monitor(clk,t,q,reset);
$dumpfile("tff.vcd");
$dumpvars(0, tff_tb);

reset = 0;
t = 1;
clk = 0;

for (i = 0; i < 10; i = i + 1) begin
clk = ~clk;
#10;
end

end
//always #25 clk = ~clk;
 
endmodule