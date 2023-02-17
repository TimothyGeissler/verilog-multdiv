module wallace32_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;

    // Outputs
    wire [63:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    wallace32 uut (A, B, prod);

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=0;i <=15;i = i+1) begin
            A <= $urandom%100000; 
            B <= $urandom%100000;
            #1;
            if (prod == A*B) begin
                $display("%d * %d = %d -- CORRECT", A, B, prod);
                score = score + 1;  
            end else begin
                $display("%d * %d = %d not %d -- INCORRECT" , A, B, A*B, prod);
            end  
        end 
        $display("Score: %d", score);
    end
      
endmodule