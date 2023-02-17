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

module eightwallace(a, b, p);
    input [7:0] a, b;
    output [15:0] p;

    wire Cout;

    // 4 levels of horiz. cout lines
wire [8:0] c0;
wire [8:0] c1;
wire [8:0] c2;
wire [8:0] c3;
wire [8:0] c4;
wire [8:0] c5;
wire [8:0] c6;
wire [8:0] c7;
wire [8:0] c8;

assign c0[0] = 1'b0;
assign c1[0] = 1'b0;
assign c2[0] = 1'b0;
assign c3[0] = 1'b0;
assign c4[0] = 1'b0;
assign c5[0] = 1'b0;
assign c6[0] = 1'b0;
assign c7[0] = 1'b0;
assign c8[0] = 1'b0;

wire [8:0] s0;
wire [8:0] s1;
wire [8:0] s2;
wire [8:0] s3;
wire [8:0] s4;
wire [8:0] s5;
wire [8:0] s6;
wire [8:0] s7;
wire [8:0] s8;
wire [8:0] s9;

wire [7:0] w0;
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;
wire [7:0] w4;
wire [7:0] w5;
wire [7:0] w6;
wire [7:0] w7;
wire [7:0] w8;


genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            assign s1[i] = a[i] & b[0];
        end
    endgenerate

//--------------- LVL 2 --------------------------
genvar ab;
generate
	for (ab = 0; ab < 7; ab = ab + 1) begin
		assign w1[ab] = a[ab] & b[1];
		full_adder f2(w1[ab], s1[ab + 1], c1[ab], s2[ab], c1[ab + 1]);
	end
endgenerate
assign w1[7] = a[7] & b[1];
full_adder f73(w1[7], 1'b0, c1[7], s2[7], c1[8]);

//--------------- LVL 3 --------------------------
genvar ac;
generate
	for (ac = 0; ac < 7; ac = ac + 1) begin
		assign w2[ac] = a[ac] & b[2];
		full_adder f3(w2[ac], s2[ac + 1], c2[ac], s3[ac], c2[ac + 1]);
	end
endgenerate
assign w2[7] = a[7] & b[2];
full_adder f74(w2[7], c1[8], c2[7], s3[7], c2[8]);

//--------------- LVL 4 --------------------------
genvar ad;
generate
	for (ad = 0; ad < 7; ad = ad + 1) begin
		assign w3[ad] = a[ad] & b[3];
		full_adder f4(w3[ad], s3[ad + 1], c3[ad], s4[ad], c3[ad + 1]);
	end
endgenerate
assign w3[7] = a[7] & b[3];
full_adder f75(w3[7], c2[8], c3[7], s4[7], c3[8]);

//--------------- LVL 5 --------------------------
genvar ae;
generate
	for (ae = 0; ae < 7; ae = ae + 1) begin
		assign w4[ae] = a[ae] & b[4];
		full_adder f5(w4[ae], s4[ae + 1], c4[ae], s5[ae], c4[ae + 1]);
	end
endgenerate
assign w4[7] = a[7] & b[4];
full_adder f76(w4[7], c3[8], c4[7], s5[7], c4[8]);

//--------------- LVL 6 --------------------------
genvar af;
generate
	for (af = 0; af < 7; af = af + 1) begin
		assign w5[af] = a[af] & b[5];
		full_adder f6(w5[af], s5[af + 1], c5[af], s6[af], c5[af + 1]);
	end
endgenerate
assign w5[7] = a[7] & b[5];
full_adder f77(w5[7], c4[8], c5[7], s6[7], c5[8]);

//--------------- LVL 7 --------------------------
genvar ag;
generate
	for (ag = 0; ag < 7; ag = ag + 1) begin
		assign w6[ag] = a[ag] & b[6];
		full_adder f7(w6[ag], s6[ag + 1], c6[ag], s7[ag], c6[ag + 1]);
	end
endgenerate
assign w6[7] = a[7] & b[6];
full_adder f78(w6[7], c5[8], c6[7], s7[7], c6[8]);

//--------------- LVL 8 --------------------------
genvar ah;
generate
	for (ah = 0; ah < 7; ah = ah + 1) begin
		assign w7[ah] = a[ah] & b[7];
		full_adder f8(w7[ah], s7[ah + 1], c7[ah], s8[ah], c7[ah + 1]);
	end
endgenerate
assign w7[7] = a[7] & b[7];
full_adder f79(w7[7], c6[8], c7[7], s8[7], c7[8]);

genvar m; 
    generate
        for (m = 0; m < 7; m = m + 1) begin
            assign w8[m] = a[m] & 1'b0;
            full_adder fend(w8[m], s8[m + 1], c8[m], s9[m], c8[m + 1]);
        end
    endgenerate

    assign w8[7] = a[7] & 1'b0;
    full_adder fend2(w8[7], c7[8], c8[7], s9[7], Cout);

    // Assign outputs
assign p[0] = s1[0];
assign p[1] = s2[0];
assign p[2] = s3[0];
assign p[3] = s4[0];
assign p[4] = s5[0];
assign p[5] = s6[0];
assign p[6] = s7[0];
assign p[7] = s8[0];
assign p[8] = s9[0];
assign p[9] = s9[1];
assign p[10] = s9[2];
assign p[11] = s9[3];
assign p[12] = s9[4];
assign p[13] = s9[5];
assign p[14] = s9[6];
assign p[15] = s9[7];

endmodule