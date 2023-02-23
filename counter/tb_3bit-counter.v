module threetff_tb();  
reg clk;
reg reset;

wire q0, q1, q2;
 
threebitcount counter(clk, reset, q0, q1, q2); //(clk, clr, q0, q1, q2);

integer i;

initial begin
//$monitor(clk,reset, q0, q1, q2);
$dumpfile("3tff.vcd");
$dumpvars(0, threetff_tb);

reset = 0;
clk = 0;

for (i = 0; i < 13; i = i + 1) begin
clk = ~clk;
#10;
$display("%b%b%b", q2, q1, q0);
end

end
//always #25 clk = ~clk;
 
endmodule