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

module new32wallace(aIn, bIn, out, ovf);
    input [3:0] aIn, bIn;
    output [3:0] out;
    output ovf;

    wire [7:0] compProd;

    wire twosComp;
    assign twosComp = aIn[3] ^ bIn[3];

    wire [3:0] a, b;
    assign a = aIn[3] ? (~aIn) + 1 : aIn; // 2s comp A to positive
    assign b = bIn[3] ? (~bIn) + 1 : bIn; // 2s comp B to positive

    // if toggle flag = 1 then twos comp product
    wire [7:0] p;
    assign compProd = twosComp ? (~p) + 1 : p;

    wire allones, allzeros, high_bits, msb_match;
	assign allones = & compProd[7:4];
	assign allzeros = | compProd[7:4];
	assign high_bits = allones ^ allzeros; //ovf = 1 if !allzeros and !allones
	assign msb_match = allzeros ^ compProd[3];
	assign ovf = high_bits | msb_match;

    assign out = compProd[3:0];

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

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            assign s1[i] = a[i] & b[0];
        end
    endgenerate

    //--------------- LVL 2 --------------------------
    genvar j;
    generate
        for (j = 0; j < 3; j = j + 1) begin
            assign w1[j] = a[j] & b[1];
            full_adder f2(w1[j], s1[j + 1], c1[j], s2[j], c1[j + 1]);
        end
    endgenerate

    // T4
    assign w1[3] = a[3] & b[1];
    full_adder f42(w1[3], 1'b0, c1[3], s2[3], c1[4]); // B = 0 only this adder on L2


    //--------------- LVL 3 --------------------------

    genvar k;
    generate
        for (k = 0; k < 3; k = k + 1) begin
            assign w2[k] = a[k] & b[2];
            full_adder f3(w2[k], s2[k + 1], c2[k], s3[k], c2[k + 1]);
        end
    endgenerate

    // T4
    assign w2[3] = a[3] & b[2];
    full_adder f43(w2[3], c1[4], c2[3], s3[3], c2[4]); //B = last of prev Cin row on last Adder

    //--------------- LVL 4 --------------------------

    genvar l;
    generate
        for (l = 0; l < 3; l = l + 1) begin
            assign w3[l] = a[l] & b[3];
            full_adder f4(w3[l], s3[l + 1], c3[l], s4[l], c3[l + 1]);
        end
    endgenerate

    // T4
    assign w3[3] = a[3] & b[3];
    full_adder f44(w3[3], c2[4], c3[3], s4[3], c3[4]);

    //--------------- LVL 4 --------------------------

    genvar m;
    generate
        for (m = 0; m < 3; m = m + 1) begin
            assign w4[m] = a[m] & 1'b0;
            full_adder f5(w4[m], s4[m + 1], c4[m], s5[m], c4[m + 1]);
        end
    endgenerate

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