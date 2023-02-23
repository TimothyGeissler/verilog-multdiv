module twobitwallace_tb;

    // Inputs
    reg signed [1:0] A;
    reg signed [1:0] B;

    // Outputs
    wire signed [3:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    twobitwallace uut (A, B, prod);

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=-2;i <=1;i = i+1)
            for(j=-2;j <=1;j = j+1) begin
                A <= i; 
                B <= j;
                #1;
                if (prod == A*B) begin
                    $display("%d * %d = %d (%b) (%b) -- CORRECT", A, B, prod, A*B, prod);
                    score = score + 1;  
                end else begin
                    $display("%d * %d = %d (%b) not %d (%b) -- INCORRECT" , A, B, A*B, A*B, prod, prod);
                end
            end     
            $display("Score: %d", score);
    end
      
endmodule