module dffe(q, d, clk, en, clr);
   //Inputs
   input d, clk, en, clr;
   //Internal wire
   wire clr;
   //Output
   output q;
   //Register
   reg q;
   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr) begin
           q <= 1'b0;
       //If enable is high, set q to the value of d
       end else if (en) begin
           q <= d;
       end
   end
endmodule

module tff(t, clk, clr, q);
    input t, clk, clr;
    output q;

    wire d;
    xor(d, t, q);

    dffe dflipflop(q, d, clk, 1'b1, clr);
 
endmodule

module sixbitcount(clk, clr, q0, q1, q2, q3, q4, q5);
    input clk, clr;
    output q0, q1, q2, q3, q4, q5;

    wire w1, w2, w3, w4;

    tff t1(1'b1, clk, clr, q0);
    tff t2(q0, clk, clr, q1);
    and(w1, q0, q1);
    tff t3(w1, clk, clr, q2);

    and(w2, w1, q2);
    and(w3, q3, w2);
    and(w4, w3, q4);

    tff t4(w2, clk, clr, q3);
    tff t5(w3, clk, clr, q4);
    tff t6(w4, clk, clr, q5);
endmodule