module eightbitwallace_tb;

    // Inputs
    reg signed [31:0] A;
    reg signed [31:0] B;

    // Outputs
    wire signed [63:0] prod;
    integer i, j, score, total;

    // Instantiate the Unit Under Test (UUT)
     thirty_two_wallace_multipiler wallace(A, B, prod);

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        total = 0;
        for(i=-128;i <=127;i = i+1)
            for(j=-128;j <=127;j = j+1) begin
                A <= i; 
                B <= j;
                total = total + 1;
                #20;
                if (prod == A*B) begin
                    $display("%d * %d = %d -- CORRECT", A, B, prod);
                    score = score + 1;  
                end else begin
                    $display("%d * %d = %d not %d -- INCORRECT" , A, B, A*B, prod);
                end
            end     
            $display("Score: %d/%d", score, total);
    end
      
endmodule