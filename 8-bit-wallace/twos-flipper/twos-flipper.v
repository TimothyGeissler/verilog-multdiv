module twosflipper(a, b);
    input [31:0] a;
    output [31:0] b;

    assign b = (~a);
endmodule