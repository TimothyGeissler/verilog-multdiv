module wallace32_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;

    // Outputs
    wire [63:0] prod;
    integer i,j,score;

    // Instantiate the Unit Under Test (UUT)
    WallaceTreeMul uut (A, B, prod);

    initial begin
        $dumpfile("wallace32_tb.vcd");
        // Module to capture and what level, 0 means all wires
        $dumpvars(0, wallace32_tb);
        A = 32'b00000000000000011000011010011111; B = 32'b00000000000000000000111111111111;
        #30
        $display(" %b * %b \n= %b \n\n (i.e %d * %d = %d) \n\n\n", A[31:0],B[31:0],prod[63:0],A[31:0],B[31:0],prod[63:0]);
        A=32'b11111111111111111111110101110010; B=32'b00000000000000000000000001111011; 
        #30
        $display(" %b * %b \n= %b \n\n (i.e %d * %d = %d) \n\n\n", A[31:0],B[31:0],prod[63:0],A[31:0],B[31:0],prod[63:0]);
        // Apply inputs for the whole range of A and B.
        // 16*16 = 256 inputs.
        //score = 0;
        /*for(i=0;i <=15;i = i+1) begin
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
        $display("Score: %d", score);*/
    end
      
endmodule