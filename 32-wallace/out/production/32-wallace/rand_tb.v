module wallace_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;

    // Outputs
    wire [63:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT) input [31:0]a; input [31:0]b; output [63:0]c; 
    wallace32 uut (A, B, prod);

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i = 0; i <= 100; i = i + 1) begin
                A <= $urandom%65535; 
                B <= $urandom%65535;
                #20;
                if (prod[31:0] == A*B) begin //if the result isnt correct increment "error".
                    $display("%d * %d = %d -- CORRECT", A, B, prod);
                    score = score + 1;
                end else if (prod == A * B) begin
                    $display("Error - Overflow");
                end else begin
                    $display("INCORRECT: %d * %d = %d not %d", A, B, A*B, prod);
                end
        end
        $display("Score: %d", score);
    end
      
endmodule