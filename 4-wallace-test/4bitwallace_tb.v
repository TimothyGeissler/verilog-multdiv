module fourbitwallace_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [7:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    fourbitwallace_tree uut (
        .A(A), 
        .B(B), 
        .prod(prod)
    );

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=0;i <=15;i = i+1)
            for(j=0;j <=15;j = j+1) begin
                A <= i; 
                B <= j;
                #1;
                if (prod == A*B) begin
                    $display("%d * %d = %d -- CORRECT", A, B, prod);
                    score = score + 1;  
                end else begin
                    $display("Error");
                end
            end     
            $display("Score: %d", score);
    end
      
endmodule