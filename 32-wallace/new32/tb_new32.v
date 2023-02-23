module new32_tb;

    // Inputs
    reg signed [3:0] A;
    reg signed [3:0] B;

    wire ovf;

    // Outputs
    wire signed [3:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    new32wallace uut (A, B, prod, ovf);

    wire signed [7:0] lA, lB;

    assign lA = A;
    assign lB = B;

    initial begin
        $dumpfile("gtk32bit.vcd");
        $dumpvars(0, new32_tb);
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=-8;i <=7;i = i+1)
            for(j=-8;j <=7;j = j+1) begin
                A <= i; 
                B <= j;
                #30;
                if ((prod == A*B)) begin
                    $display("%d * %d = %d prod=(%b) actual=(%b) -- CORRECT; OVF: %b", A, B, prod, prod, lA*lB, ovf);
                    score = score + 1;  
                end else begin
                    $display("%d * %d = %d prod=(%b) actual=%d (%b) -- INCORRECT; OVF: %b" , A, B, prod, prod, A*B, A*B, ovf);
                end
                
                if (((ovf == 0) * (A*B < -8 || A*B> 7)) || ((ovf == 1) * (A*B >= -8 && A*B <= 7))) begin
                    $display("INCORRECT OVF");
                end
            end     
            A <= 7;
            B <= 7;
            #30;
            $display("%d * %d = %d prod=(%b) actual=(%b); OVF: %b", A, B, prod, prod, lA*lB, ovf);
            $display("Score: %d", score);
    end
      
endmodule