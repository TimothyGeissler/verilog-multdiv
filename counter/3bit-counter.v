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

module threebitcount(clk, clr, q0, q1, q2);
    input clk, clr;
    output q0, q1, q2;

    wire w1;

    tff t1(1'b1, clk, clr, q0);
    tff t2(q0, clk, clr, q1);
    and(w1, q0, q1);
    tff t3(w1, clk, clr, q2);
endmodule