module sixtff_tb();  
reg clk;
reg reset;

wire q0, q1, q2, q3, q4, q5;
 
sixbitcount counter(clk, reset, q0, q1, q2, q3, q4, q5); //(clk, clr, q0, q1, q2);

integer i;

initial begin
//$monitor(clk,reset, q0, q1, q2);
$dumpfile("6tff.vcd");
$dumpvars(0, sixtff_tb);

reset = 0;
clk = 0;

for (i = 0; i < 127; i = i + 1) begin
clk = ~clk;
#10;
$display("%b%b%b", q5, q4, q3, q2, q1, q0);
end

end
//always #25 clk = ~clk;
 
endmodule