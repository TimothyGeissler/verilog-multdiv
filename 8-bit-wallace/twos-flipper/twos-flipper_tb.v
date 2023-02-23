module twosflipper_tb();
    reg [31:0] a;
    wire [31:0] b;

    twosflipper t(a, b);

    initial begin
        a = 32'b00000000000000000000000101000001;
        $display("%b -> %b", a, (~a) + 1'b1);
    end
endmodule