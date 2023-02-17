module fourbitwallace_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [7:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    simplewallace uut (A, B, prod);

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=-8;i <=7;i = i+1)
            for(j=-8;j <=7;j = j+1) begin
                A <= i; 
                B <= j;
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