module half_adder(
    Data_in_A,
    Data_in_B,
    Data_out_Sum,
    Data_out_Carry
    );

    //what are the input ports.
    input Data_in_A;
    input Data_in_B;
    //What are the output ports.
    output Data_out_Sum;
     output Data_out_Carry;
     
     //Implement the Sum and Carry equations using Verilog Bit operators.
     assign Data_out_Sum = Data_in_A ^ Data_in_B;  //XOR operation
     assign Data_out_Carry = Data_in_A & Data_in_B; //AND operation
    
endmodule

module full_adder(
    Data_in_A,  //input A
    Data_in_B,  //input B
    Data_in_C,  //input C
     Data_out_Sum,
     Data_out_Carry
    );

    //what are the input ports.
    input Data_in_A;
    input Data_in_B;
     input Data_in_C;
    //What are the output ports.
    output Data_out_Sum;
     output Data_out_Carry;
     //Internal variables
     wire ha1_sum;
     wire ha2_sum;
     wire ha1_carry;
     wire ha2_carry;
     wire Data_out_Sum;
     wire Data_out_Carry;

     //Instantiate the half adder 1
    half_adder  ha1(
        .Data_in_A(Data_in_A),
        .Data_in_B(Data_in_B),
        .Data_out_Sum(ha1_sum),
        .Data_out_Carry(ha1_carry)
    );
    
    //Instantiate the half adder 2
    half_adder  ha2(
        .Data_in_A(Data_in_C),
        .Data_in_B(ha1_sum),
        .Data_out_Sum(ha2_sum),
        .Data_out_Carry(ha2_carry)
    );

    //sum output from 2nd half adder is connected to full adder output
    assign Data_out_Sum = ha2_sum;  
    //The carry's from both the half adders are OR'ed to get the final carry./
    assign Data_out_Carry = ha1_carry | ha2_carry;
    
endmodule

module fourbitwallace(a, b, p);
    input [3:0] a, b;
    output [7:0] p;

    wire Cout;

    // 4 levels of horiz. cout lines
    wire [4:0] c1;
    wire [4:0] c2;
    wire [4:0] c3;
    wire [4:0] c4;

    assign c1[0] = 1'b0;
    assign c2[0] = 1'b0;
    assign c3[0] = 1'b0;
    assign c4[0] = 1'b0;

    // 5 levels of horiz. sum lines
    wire [4:0] s1;
    wire [4:0] s2;
    wire [4:0] s3;
    wire [4:0] s4;
    wire [4:0] s5;

    // 4 and lines per level
    wire [3:0] w1;
    wire [3:0] w2;
    wire [3:0] w3;
    wire [3:0] w4;

    //--------------- LVL 1 --------------------------
    /*
    // T1
    assign s1[0] = a[0] & b[0];
    // T2
    assign s1[1] = a[1] & b[0]; 
    // T3
    assign s1[2] = a[2] & b[0];
    // T4
    assign s1[3] = a[3] & b[0];*/
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            assign s1[i] = a[i] & b[0];
        end
    endgenerate

    //--------------- LVL 2 --------------------------
    /*genvar j;
    generate
        for (j = 0; j < 3; j = j + 1) begin
            assign w1[j] = a[j] & b[1];
            full_adder f2(w1[j], s1[j + 1], c1[j], s2[j], c1[j + 1]);
        end
    endgenerate*/
    // T1 
    assign w1[0] = a[0] & b[1];
    full_adder f12(w1[0], s1[1], c1[0], s2[0], c1[1]); // Cin = 0 on Adder #1

    // T2
    assign w1[1] = a[1] & b[1];
    full_adder f22(w1[1], s1[2], c1[1], s2[1], c1[2]);

    // T3
    assign w1[2] = a[2] & b[1];
    full_adder f32(w1[2], s1[3], c1[2], s2[2], c1[3]);

    // T4
    assign w1[3] = a[3] & b[1];
    full_adder f42(w1[3], 1'b0, c1[3], s2[3], c1[4]); // B = 0 only this adder on L2

    /*genvar j;
    generate
        for (j = 0; j < 4; j = j + 1) begin
            assign w1[j] = a[j] & b[1];
            full_adder f(w1[j], s1[j + 1], );
        end
    endgenerate*/

    //--------------- LVL 3 --------------------------
    
    // T1
    assign w2[0] = a[0] & b[2];
    full_adder f13(w2[0], s2[1], c2[0], s3[0], c2[1]);

    // T2
    assign w2[1] = a[1] & b[2];
    full_adder f23(w2[1], s2[2], c2[1], s3[1], c2[2]);

    // T3
    assign w2[2] = a[2] & b[2];
    full_adder f33(w2[2], s2[3], c2[2], s3[2], c2[3]);
    

    /*genvar k;
    generate
        for (k = 0; k < 3; k = k + 1) begin
            assign w2[k] = a[k] & b[2];
            full_adder f3(w2[k], s2[k + 1], c2[k], s3[k], c2[k + 1]);
        end
    endgenerate*/

    // T4
    assign w2[3] = a[3] & b[2];
    full_adder f43(w2[3], c1[4], c2[3], s3[3], c2[4]); //B = last of prev Cin row on last Adder

    //--------------- LVL 4 --------------------------
    // T1
    assign w3[0] = a[0] & b[3];
    full_adder f14(w3[0], s3[1], c3[0], s4[0], c3[1]);

    // T2
    assign w3[1] = a[1] & b[3];
    full_adder f24(w3[1], s3[2], c3[1], s4[1], c3[2]);

    // T3
    assign w3[2] = a[2] & b[3];
    full_adder f34(w3[2], s3[3], c3[2], s4[2], c3[3]);

    /*genvar l;
    generate
        for (l = 0; l < 3; l = l + 1) begin
            assign w3[l] = a[l] & b[3];
            full_adder f4(w3[l], s3[l + 1], c3[l], s4[l], c3[l + 1]);
        end
    endgenerate*/

    // T4
    assign w3[3] = a[3] & b[3];
    full_adder f44(w3[3], c2[4], c3[3], s4[3], c3[4]);

    //--------------- LVL 4 --------------------------

    /*genvar m;
    generate
        for (m = 0; m < 3; m = m + 1) begin
            assign w4[m] = a[m] & 1'b0;
            full_adder f5(w4[m], s4[m + 1], c4[m], s5[m], c4[m + 1]);
        end
    endgenerate*/
    // T1
    assign w4[0] = a[0] & 1'b0;//b[4];
    full_adder f15(w4[0], s4[1], c4[0], s5[0], c4[1]);

    // T2
    assign w4[1] = a[1] & 1'b0;//b[4];
    full_adder f25(w4[1], s4[2], c4[1], s5[1], c4[2]);

    // T3
    assign w4[2] = a[2] & 1'b0;//b[4];
    full_adder f35(w4[2], s4[3], c4[2], s5[2], c4[3]);

    // T4
    assign w4[3] = a[3] & 1'b0;//b[4];
    full_adder f45(w4[3], c3[4], c4[3], s5[3], Cout);

    // Assign outputs
    assign p[0] = s1[0];
    assign p[1] = s2[0];
    assign p[2] = s3[0];
    assign p[3] = s4[0];
    assign p[4] = s5[0];
    assign p[5] = s5[1];
    assign p[6] = s5[2];
    assign p[7] = s5[3];

endmodule