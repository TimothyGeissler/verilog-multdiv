module ovfchk(a_neq_b, b);
input [63:0] b; // Full product
output a_neq_b;

// Padd a w/ 0s if pos, 1's if neg
wire signed [63:0] x;
wire [31:0] a; // shortened product

assign a = b[31:0];

assign x[63:32] = a;
assign x[31:0] = 32'b0;
assign x = x>>>32;

wire a_eq_b;

assign a_eq_b = (x == b);
not(a_neq_b, a_eq_b);

endmodule

module shift();
reg [63:0] p;
wire ovf;

ovfchk o(ovf, p);

initial begin
    p = 12345;

    $display("OVF==%b", ovf);
end
endmodule