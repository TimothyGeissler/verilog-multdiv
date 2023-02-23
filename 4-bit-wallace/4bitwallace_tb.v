module fourbitwallace_tb;

    // Inputs
    reg signed [3:0] A;
    reg signed [3:0] B;

    wire ovf;

    // Outputs
    wire signed [7:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    fourbitwallace uut (A, B, prod, ovf);

    initial begin
        $dumpfile("gtk4bit.vcd");
        $dumpvars(0, fourbitwallace_tb);
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        score = 0;
        for(i=-8;i <=7;i = i+1)
            for(j=-8;j <=7;j = j+1) begin
                A <= i; 
                B <= j;
                #30;
                if ((prod == A*B) && (((ovf == 0) && (prod <= 7 || prod >= -8)) || ((ovf == 1) && (prod > 7 || prod < -8)))) begin
                    $display("%d * %d = %d prod=(%b) actual=(%b) -- CORRECT; OVF: %b", A, B, prod, prod, A*B, ovf);
                    score = score + 1;  
                end else begin
                    $display("%d * %d = %d prod=(%b) actual=%d (%b) -- INCORRECT; OVF: %b" , A, B, prod, prod, A*B, A*B, ovf);
                end
            end     
            $display("Score: %d", score);
    end
      
endmodule