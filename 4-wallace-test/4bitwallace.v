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

module fourbitwallace_tree(A, B, prod);
    
    //inputs and outputs
    input [3:0] A,B;
    output [7:0] prod;
    
    //Sum wires
    wire [4:0] s1; //s11,s12,s13,s14,s15;
    wire [4:0] s2; //s22,s23,s24,s25,s26;
    wire [5:0] s3; //s32,s33,s34,s35,s36,s37;

    // Carry wires
    wire [4:0] c1; //c11,c12,c13,c14,c15;
    wire [4:0] c2; //c22,c23,c24,c25,c26;
    wire [5:0] c3; //c32,c33,c34,c35,c36,c37;

    // Product wires
    wire [6:0] p0, p1, p2, p3;

    //initialize the p's.
    assign  p0 = A & {4{B[0]}};
    assign  p1 = A & {4{B[1]}};
    assign  p2 = A & {4{B[2]}};
    assign  p3 = A & {4{B[3]}};

    //final product assignments    
    assign prod[0] = p0[0];
    assign prod[1] = s1[0];
    assign prod[2] = s2[0];
    assign prod[3] = s3[0];
    assign prod[4] = s3[2];
    assign prod[5] = s3[3];
    assign prod[6] = s3[4];
    assign prod[7] = s3[5];

//first stage
    half_adder ha11(p0[1],p1[0],s1[0],c1[0]);
    full_adder fa12(p0[2],p1[1],p2[0],s1[1],c1[1]);
    full_adder fa13(p0[3],p1[2],p2[1],s1[2],c1[2]);
    full_adder fa14(p1[3],p2[2],p3[1],s1[3],c1[3]);
    full_adder ha15(p2[3],p3[2],1'b0, s1[4],c1[4]);

//second stage
    half_adder ha22(c1[0],s1[1],s2[0],c2[0]);
    full_adder fa23(p3[0],c1[1],s1[2],s2[1],c2[1]);
    full_adder fa24(c1[2],c3[0],s1[3],s2[2],c2[2]);
    full_adder fa25(c1[3],c2[2],s1[4],s2[3],c2[3]);
    full_adder fa26(c1[4],c2[3],p3[3],s2[4],c2[4]);

//third stage
    half_adder ha32(c2[0],s2[1],s3[0],c3[0]);
    half_adder ha34(c2[1],s2[2],s3[2],c3[2]);
    half_adder ha35(c3[2],s2[3],s3[3],c3[3]);
    half_adder ha36(c3[3],s2[4],s3[4],c3[4]);
    half_adder ha37(c3[4],c2[4],s3[5],c3[5]);
endmodule