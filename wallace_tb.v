module wallace_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [7:0] prod;
    integer i,j,error;

    // Instantiate the Unit Under Test (UUT)
    wallace_tree uut (
        .A(A), 
        .B(B), 
        .prod(prod)
    );

    initial begin
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        error = 0;
        for(i=0;i <=15;i = i+1)
            for(j=0;j <=15;j = j+1) begin
                A <= i; 
                B <= j;
                #1;
                if (prod != A*B) begin //if the result isnt correct increment "error".
                    $display("Error");
                    error = error + 1;  
                end else begin
                    $display("%d * %d = %d -- CORRECT", A, B, prod);
                end
            end     
            $display("Error: %d", error);
    end
      
endmodule