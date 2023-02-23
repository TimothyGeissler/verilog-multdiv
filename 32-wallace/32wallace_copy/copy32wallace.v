//`include "FullAdder.v"

module HalfAdder (a,b,sum,ca);
input a,b;
output sum,ca;

assign sum = a ^ b;
assign ca = a & b;
    
endmodule
module Bitwise (A,B,p);

input [32:1] A; // multiplicand
input B; // multiplier bit
output [32:1] p ; //partial product

assign p[1] = A[1] & B;
assign p[2] = A[2] & B;
assign p[3] = A[3] & B;
assign p[4] = A[4] & B;
assign p[5] = A[5] & B;
assign p[6] = A[6] & B;
assign p[7] = A[7] & B;
assign p[8] = A[8] & B;
assign p[9] = A[9] & B;
assign p[10] = A[10] & B;
assign p[11] = A[11] & B;
assign p[12] = A[12] & B;
assign p[13] = A[13] & B;
assign p[14] = A[14] & B;
assign p[15] = A[15] & B;
assign p[16] = A[16] & B;
assign p[17] = A[17] & B;
assign p[18] = A[18] & B;
assign p[19] = A[19] & B;
assign p[20] = A[20] & B;
assign p[21] = A[21] & B;
assign p[22] = A[22] & B;
assign p[23] = A[23] & B;
assign p[24] = A[24] & B;
assign p[25] = A[25] & B;
assign p[26] = A[26] & B;
assign p[27] = A[27] & B;
assign p[28] = A[28] & B;
assign p[29] = A[29] & B;
assign p[30] = A[30] & B;
assign p[31] = A[31] & B;
assign p[32] = A[32] & B;
endmodule
module FullAdder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;

assign sum = a ^ b ^ cin;
assign cout = ((a^b)&cin) | (a&b) ;

endmodule

module CSA (X ,Y ,Z ,S ,C);

 input [63:0] X, Y, Z;
    output [63:0] S, C;

    assign C[0] = 1'b0;
    FullAdder FA0(X[0], Y[0], Z[0], S[0], C[1]);
    FullAdder FA1(X[1], Y[1], Z[1], S[1], C[2]);
    FullAdder FA2(X[2], Y[2], Z[2], S[2], C[3]);
    FullAdder FA3(X[3], Y[3], Z[3], S[3], C[4]);
    FullAdder FA4(X[4], Y[4], Z[4], S[4], C[5]);
    FullAdder FA5(X[5], Y[5], Z[5], S[5], C[6]);
    FullAdder FA6(X[6], Y[6], Z[6], S[6], C[7]);
    FullAdder FA7(X[7], Y[7], Z[7], S[7], C[8]);
    FullAdder FA8(X[8], Y[8], Z[8], S[8], C[9]);
    FullAdder FA9(X[9], Y[9], Z[9], S[9], C[10]);
    FullAdder FA10(X[10], Y[10], Z[10], S[10], C[11]);
    FullAdder FA11(X[11], Y[11], Z[11], S[11], C[12]);
    FullAdder FA12(X[12], Y[12], Z[12], S[12], C[13]);
    FullAdder FA13(X[13], Y[13], Z[13], S[13], C[14]);
    FullAdder FA14(X[14], Y[14], Z[14], S[14], C[15]);
    FullAdder FA15(X[15], Y[15], Z[15], S[15], C[16]);
    FullAdder FA16(X[16], Y[16], Z[16], S[16], C[17]);
    FullAdder FA17(X[17], Y[17], Z[17], S[17], C[18]);
    FullAdder FA18(X[18], Y[18], Z[18], S[18], C[19]);
    FullAdder FA19(X[19], Y[19], Z[19], S[19], C[20]);
    FullAdder FA20(X[20], Y[20], Z[20], S[20], C[21]);
    FullAdder FA21(X[21], Y[21], Z[21], S[21], C[22]);
    FullAdder FA22(X[22], Y[22], Z[22], S[22], C[23]);
    FullAdder FA23(X[23], Y[23], Z[23], S[23], C[24]);
    FullAdder FA24(X[24], Y[24], Z[24], S[24], C[25]);
    FullAdder FA25(X[25], Y[25], Z[25], S[25], C[26]);
    FullAdder FA26(X[26], Y[26], Z[26], S[26], C[27]);
    FullAdder FA27(X[27], Y[27], Z[27], S[27], C[28]);
    FullAdder FA28(X[28], Y[28], Z[28], S[28], C[29]);
    FullAdder FA29(X[29], Y[29], Z[29], S[29], C[30]);
    FullAdder FA30(X[30], Y[30], Z[30], S[30], C[31]);
    FullAdder FA31(X[31], Y[31], Z[31], S[31], C[32]);
    FullAdder FA32(X[32], Y[32], Z[32], S[32], C[33]);
    FullAdder FA33(X[33], Y[33], Z[33], S[33], C[34]);
    FullAdder FA34(X[34], Y[34], Z[34], S[34], C[35]);
    FullAdder FA35(X[35], Y[35], Z[35], S[35], C[36]);
    FullAdder FA36(X[36], Y[36], Z[36], S[36], C[37]);
    FullAdder FA37(X[37], Y[37], Z[37], S[37], C[38]);
    FullAdder FA38(X[38], Y[38], Z[38], S[38], C[39]);
    FullAdder FA39(X[39], Y[39], Z[39], S[39], C[40]);
    FullAdder FA40(X[40], Y[40], Z[40], S[40], C[41]);
    FullAdder FA41(X[41], Y[41], Z[41], S[41], C[42]);
    FullAdder FA42(X[42], Y[42], Z[42], S[42], C[43]);
    FullAdder FA43(X[43], Y[43], Z[43], S[43], C[44]);
    FullAdder FA44(X[44], Y[44], Z[44], S[44], C[45]);
    FullAdder FA45(X[45], Y[45], Z[45], S[45], C[46]);
    FullAdder FA46(X[46], Y[46], Z[46], S[46], C[47]);
    FullAdder FA47(X[47], Y[47], Z[47], S[47], C[48]);
    FullAdder FA48(X[48], Y[48], Z[48], S[48], C[49]);
    FullAdder FA49(X[49], Y[49], Z[49], S[49], C[50]);
    FullAdder FA50(X[50], Y[50], Z[50], S[50], C[51]);
    FullAdder FA51(X[51], Y[51], Z[51], S[51], C[52]);
    FullAdder FA52(X[52], Y[52], Z[52], S[52], C[53]);
    FullAdder FA53(X[53], Y[53], Z[53], S[53], C[54]);
    FullAdder FA54(X[54], Y[54], Z[54], S[54], C[55]);
    FullAdder FA55(X[55], Y[55], Z[55], S[55], C[56]);
    FullAdder FA56(X[56], Y[56], Z[56], S[56], C[57]);
    FullAdder FA57(X[57], Y[57], Z[57], S[57], C[58]);
    FullAdder FA58(X[58], Y[58], Z[58], S[58], C[59]);
    FullAdder FA59(X[59], Y[59], Z[59], S[59], C[60]);
    FullAdder FA60(X[60], Y[60], Z[60], S[60], C[61]);
    FullAdder FA61(X[61], Y[61], Z[61], S[61], C[62]);
    FullAdder FA62(X[62], Y[62], Z[62], S[62], C[63]);
    assign S[63] = 1'b0;

endmodule
module multiplier (A, B, C);

    input [31:0] A;
    input B;
    output reg [31:0] C;
    
    always@(A, B)
    begin
        if(B != 0)
            C = A;
        else
            C = 32'b0000_0000_0000_0000_0000_0000_0000_0000;   
    end
    
endmodule
module RecursiveDoubling (a,b,cin,sum,cout);

input [32:1] a,b;
input cin;

output wire [32:1] sum;
output wire cout;

wire [1:0] pgk [32:1];

wire [1:0] temp_1 [32:1];
wire [1:0] temp_2 [32:1];
wire [1:0] temp_3 [32:1];
wire [1:0] temp_4 [32:1];
wire [1:0] temp_5 [32:1];

wire [32:1] gk;

// pgk  00-kill  11-generate  10-propagate


//pgk generation

assign pgk[1][0]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);
assign pgk[1][1]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);

assign pgk[2][0]=a[2]&b[2]; 
assign pgk[2][1]=a[2]|b[2];

assign pgk[3][0]=a[3]&b[3]; 
assign pgk[3][1]=a[3]|b[3];

assign pgk[4][0]=a[4]&b[4]; 
assign pgk[4][1]=a[4]|b[4];

assign pgk[5][0]=a[5]&b[5]; 
assign pgk[5][1]=a[5]|b[5];

assign pgk[6][0]=a[6]&b[6]; 
assign pgk[6][1]=a[6]|b[6];

assign pgk[7][0]=a[7]&b[7]; 
assign pgk[7][1]=a[7]|b[7];

assign pgk[8][0]=a[8]&b[8]; 
assign pgk[8][1]=a[8]|b[8];

assign pgk[9][0]=a[9]&b[9]; 
assign pgk[9][1]=a[9]|b[9];

assign pgk[10][0]=a[10]&b[10]; 
assign pgk[10][1]=a[10]|b[10];

assign pgk[11][0]=a[11]&b[11]; 
assign pgk[11][1]=a[11]|b[11];

assign pgk[12][0]=a[12]&b[12]; 
assign pgk[12][1]=a[12]|b[12];

assign pgk[13][0]=a[13]&b[13]; 
assign pgk[13][1]=a[13]|b[13];

assign pgk[14][0]=a[14]&b[14]; 
assign pgk[14][1]=a[14]|b[14];

assign pgk[15][0]=a[15]&b[15]; 
assign pgk[15][1]=a[15]|b[15];

assign pgk[16][0]=a[16]&b[16]; 
assign pgk[16][1]=a[16]|b[16];

assign pgk[17][0]=a[17]&b[17]; 
assign pgk[17][1]=a[17]|b[17];

assign pgk[18][0]=a[18]&b[18]; 
assign pgk[18][1]=a[18]|b[18];

assign pgk[19][0]=a[19]&b[19]; 
assign pgk[19][1]=a[19]|b[19];

assign pgk[20][0]=a[20]&b[20]; 
assign pgk[20][1]=a[20]|b[20];

assign pgk[21][0]=a[21]&b[21]; 
assign pgk[21][1]=a[21]|b[21];

assign pgk[22][0]=a[22]&b[22]; 
assign pgk[22][1]=a[22]|b[22];

assign pgk[23][0]=a[23]&b[23]; 
assign pgk[23][1]=a[23]|b[23];

assign pgk[24][0]=a[24]&b[24]; 
assign pgk[24][1]=a[24]|b[24];

assign pgk[25][0]=a[25]&b[25]; 
assign pgk[25][1]=a[25]|b[25];

assign pgk[26][0]=a[26]&b[26]; 
assign pgk[26][1]=a[26]|b[26];

assign pgk[27][0]=a[27]&b[27]; 
assign pgk[27][1]=a[27]|b[27];

assign pgk[28][0]=a[28]&b[28]; 
assign pgk[28][1]=a[28]|b[28];

assign pgk[29][0]=a[29]&b[29]; 
assign pgk[29][1]=a[29]|b[29];

assign pgk[30][0]=a[30]&b[30]; 
assign pgk[30][1]=a[30]|b[30];

assign pgk[31][0]=a[31]&b[31]; 
assign pgk[31][1]=a[31]|b[31];

assign pgk[32][0]=a[32]&b[32]; 
assign pgk[32][1]=a[32]|b[32];





//PGK Reducing

//  1 - 32.31 
//  2   32.30
//  4   32.28
//  8   32.24
//  16  32.16
 


// 1 jump
assign temp_1[1][0]=pgk[1][0];
assign temp_1[1][1]=pgk[1][1];

assign temp_1[2][0]=(pgk[2][0])|(pgk[2][1]&pgk[1][0]);
assign temp_1[2][1]=(pgk[2][0])|(pgk[2][1]&pgk[1][1]);

assign temp_1[3][0]=(pgk[3][0])|(pgk[3][1]&pgk[2][0]);
assign temp_1[3][1]=(pgk[3][0])|(pgk[3][1]&pgk[2][1]);

assign temp_1[4][0]=(pgk[4][0])|(pgk[4][1]&pgk[3][0]);
assign temp_1[4][1]=(pgk[4][0])|(pgk[4][1]&pgk[3][1]);

assign temp_1[5][0]=(pgk[5][0])|(pgk[5][1]&pgk[4][0]);
assign temp_1[5][1]=(pgk[5][0])|(pgk[5][1]&pgk[4][1]);

assign temp_1[6][0]=(pgk[6][0])|(pgk[6][1]&pgk[5][0]);
assign temp_1[6][1]=(pgk[6][0])|(pgk[6][1]&pgk[5][1]);

assign temp_1[7][0]=(pgk[7][0])|(pgk[7][1]&pgk[6][0]);
assign temp_1[7][1]=(pgk[7][0])|(pgk[7][1]&pgk[6][1]);

assign temp_1[8][0]=(pgk[8][0])|(pgk[8][1]&pgk[7][0]);
assign temp_1[8][1]=(pgk[8][0])|(pgk[8][1]&pgk[7][1]);

assign temp_1[9][0]=(pgk[9][0])|(pgk[9][1]&pgk[8][0]);
assign temp_1[9][1]=(pgk[9][0])|(pgk[9][1]&pgk[8][1]);

assign temp_1[10][0]=(pgk[10][0])|(pgk[10][1]&pgk[9][0]);
assign temp_1[10][1]=(pgk[10][0])|(pgk[10][1]&pgk[9][1]);

assign temp_1[11][0]=(pgk[11][0])|(pgk[11][1]&pgk[10][0]);
assign temp_1[11][1]=(pgk[11][0])|(pgk[11][1]&pgk[10][1]);

assign temp_1[12][0]=(pgk[12][0])|(pgk[12][1]&pgk[11][0]);
assign temp_1[12][1]=(pgk[12][0])|(pgk[12][1]&pgk[11][1]);

assign temp_1[13][0]=(pgk[13][0])|(pgk[13][1]&pgk[12][0]);
assign temp_1[13][1]=(pgk[13][0])|(pgk[13][1]&pgk[12][1]);

assign temp_1[14][0]=(pgk[14][0])|(pgk[14][1]&pgk[13][0]);
assign temp_1[14][1]=(pgk[14][0])|(pgk[14][1]&pgk[13][1]);

assign temp_1[15][0]=(pgk[15][0])|(pgk[15][1]&pgk[14][0]);
assign temp_1[15][1]=(pgk[15][0])|(pgk[15][1]&pgk[14][1]);

assign temp_1[16][0]=(pgk[16][0])|(pgk[16][1]&pgk[15][0]);
assign temp_1[16][1]=(pgk[16][0])|(pgk[16][1]&pgk[15][1]);

assign temp_1[17][0]=(pgk[17][0])|(pgk[17][1]&pgk[16][0]);
assign temp_1[17][1]=(pgk[17][0])|(pgk[17][1]&pgk[16][1]);

assign temp_1[18][0]=(pgk[18][0])|(pgk[18][1]&pgk[17][0]);
assign temp_1[18][1]=(pgk[18][0])|(pgk[18][1]&pgk[17][1]);

assign temp_1[19][0]=(pgk[19][0])|(pgk[19][1]&pgk[18][0]);
assign temp_1[19][1]=(pgk[19][0])|(pgk[19][1]&pgk[18][1]);

assign temp_1[20][0]=(pgk[20][0])|(pgk[20][1]&pgk[19][0]);
assign temp_1[20][1]=(pgk[20][0])|(pgk[20][1]&pgk[19][1]);

assign temp_1[21][0]=(pgk[21][0])|(pgk[21][1]&pgk[20][0]);
assign temp_1[21][1]=(pgk[21][0])|(pgk[21][1]&pgk[20][1]);

assign temp_1[22][0]=(pgk[22][0])|(pgk[22][1]&pgk[21][0]);
assign temp_1[22][1]=(pgk[22][0])|(pgk[22][1]&pgk[21][1]);

assign temp_1[23][0]=(pgk[23][0])|(pgk[23][1]&pgk[22][0]);
assign temp_1[23][1]=(pgk[23][0])|(pgk[23][1]&pgk[22][1]);

assign temp_1[24][0]=(pgk[24][0])|(pgk[24][1]&pgk[23][0]);
assign temp_1[24][1]=(pgk[24][0])|(pgk[24][1]&pgk[23][1]);

assign temp_1[25][0]=(pgk[25][0])|(pgk[25][1]&pgk[24][0]);
assign temp_1[25][1]=(pgk[25][0])|(pgk[25][1]&pgk[24][1]);

assign temp_1[26][0]=(pgk[26][0])|(pgk[26][1]&pgk[25][0]);
assign temp_1[26][1]=(pgk[26][0])|(pgk[26][1]&pgk[25][1]);

assign temp_1[27][0]=(pgk[27][0])|(pgk[27][1]&pgk[26][0]);
assign temp_1[27][1]=(pgk[27][0])|(pgk[27][1]&pgk[26][1]);

assign temp_1[28][0]=(pgk[28][0])|(pgk[28][1]&pgk[27][0]);
assign temp_1[28][1]=(pgk[28][0])|(pgk[28][1]&pgk[27][1]);

assign temp_1[29][0]=(pgk[29][0])|(pgk[29][1]&pgk[28][0]);
assign temp_1[29][1]=(pgk[29][0])|(pgk[29][1]&pgk[28][1]);

assign temp_1[30][0]=(pgk[30][0])|(pgk[30][1]&pgk[29][0]);
assign temp_1[30][1]=(pgk[30][0])|(pgk[30][1]&pgk[29][1]);

assign temp_1[31][0]=(pgk[31][0])|(pgk[31][1]&pgk[30][0]);
assign temp_1[31][1]=(pgk[31][0])|(pgk[31][1]&pgk[30][1]);

assign temp_1[32][0]=(pgk[32][0])|(pgk[32][1]&pgk[31][0]);
assign temp_1[32][1]=(pgk[32][0])|(pgk[32][1]&pgk[31][1]);


// 2 jump

assign temp_2[1][0]=temp_1[1][0];
assign temp_2[1][1]=temp_1[1][1];

assign temp_2[2][0]=temp_1[2][0];
assign temp_2[2][1]=temp_1[2][1];

assign temp_2[3][0]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][0]);
assign temp_2[3][1]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][1]);

assign temp_2[4][0]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][0]);
assign temp_2[4][1]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][1]);

assign temp_2[5][0]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][0]);
assign temp_2[5][1]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][1]);

assign temp_2[6][0]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][0]);
assign temp_2[6][1]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][1]);

assign temp_2[7][0]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][0]);
assign temp_2[7][1]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][1]);

assign temp_2[8][0]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][0]);
assign temp_2[8][1]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][1]);

assign temp_2[9][0]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][0]);
assign temp_2[9][1]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][1]);

assign temp_2[10][0]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][0]);
assign temp_2[10][1]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][1]);

assign temp_2[11][0]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][0]);
assign temp_2[11][1]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][1]);

assign temp_2[12][0]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][0]);
assign temp_2[12][1]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][1]);

assign temp_2[13][0]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][0]);
assign temp_2[13][1]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][1]);

assign temp_2[14][0]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][0]);
assign temp_2[14][1]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][1]);

assign temp_2[15][0]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][0]);
assign temp_2[15][1]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][1]);

assign temp_2[16][0]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][0]);
assign temp_2[16][1]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][1]);

assign temp_2[17][0]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][0]);
assign temp_2[17][1]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][1]);

assign temp_2[18][0]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][0]);
assign temp_2[18][1]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][1]);

assign temp_2[19][0]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][0]);
assign temp_2[19][1]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][1]);

assign temp_2[20][0]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][0]);
assign temp_2[20][1]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][1]);

assign temp_2[21][0]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][0]);
assign temp_2[21][1]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][1]);

assign temp_2[22][0]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][0]);
assign temp_2[22][1]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][1]);

assign temp_2[23][0]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][0]);
assign temp_2[23][1]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][1]);

assign temp_2[24][0]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][0]);
assign temp_2[24][1]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][1]);

assign temp_2[25][0]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][0]);
assign temp_2[25][1]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][1]);

assign temp_2[26][0]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][0]);
assign temp_2[26][1]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][1]);

assign temp_2[27][0]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][0]);
assign temp_2[27][1]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][1]);

assign temp_2[28][0]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][0]);
assign temp_2[28][1]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][1]);

assign temp_2[29][0]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][0]);
assign temp_2[29][1]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][1]);

assign temp_2[30][0]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][0]);
assign temp_2[30][1]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][1]);

assign temp_2[31][0]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][0]);
assign temp_2[31][1]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][1]);

assign temp_2[32][0]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][0]);
assign temp_2[32][1]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][1]);


// 4 jumps
assign temp_3[1][0]=temp_2[1][0];
assign temp_3[1][1]=temp_2[1][1];

assign temp_3[2][0]=temp_2[2][0];
assign temp_3[2][1]=temp_2[2][1];

assign temp_3[3][0]=temp_2[3][0];
assign temp_3[3][1]=temp_2[3][1];

assign temp_3[4][0]=temp_2[4][0];
assign temp_3[4][1]=temp_2[4][1];

assign temp_3[5][0]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][0]);
assign temp_3[5][1]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][1]);

assign temp_3[6][0]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][0]);
assign temp_3[6][1]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][1]);

assign temp_3[7][0]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][0]);
assign temp_3[7][1]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][1]);

assign temp_3[8][0]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][0]);
assign temp_3[8][1]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][1]);

assign temp_3[9][0]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][0]);
assign temp_3[9][1]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][1]);

assign temp_3[10][0]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][0]);
assign temp_3[10][1]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][1]);

assign temp_3[11][0]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][0]);
assign temp_3[11][1]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][1]);

assign temp_3[12][0]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][0]);
assign temp_3[12][1]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][1]);

assign temp_3[13][0]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][0]);
assign temp_3[13][1]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][1]);

assign temp_3[14][0]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][0]);
assign temp_3[14][1]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][1]);

assign temp_3[15][0]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][0]);
assign temp_3[15][1]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][1]);

assign temp_3[16][0]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][0]);
assign temp_3[16][1]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][1]);

assign temp_3[17][0]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][0]);
assign temp_3[17][1]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][1]);

assign temp_3[18][0]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][0]);
assign temp_3[18][1]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][1]);

assign temp_3[19][0]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][0]);
assign temp_3[19][1]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][1]);

assign temp_3[20][0]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][0]);
assign temp_3[20][1]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][1]);

assign temp_3[21][0]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][0]);
assign temp_3[21][1]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][1]);

assign temp_3[22][0]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][0]);
assign temp_3[22][1]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][1]);

assign temp_3[23][0]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][0]);
assign temp_3[23][1]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][1]);

assign temp_3[24][0]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][0]);
assign temp_3[24][1]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][1]);

assign temp_3[25][0]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][0]);
assign temp_3[25][1]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][1]);

assign temp_3[26][0]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][0]);
assign temp_3[26][1]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][1]);

assign temp_3[27][0]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][0]);
assign temp_3[27][1]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][1]);

assign temp_3[28][0]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][0]);
assign temp_3[28][1]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][1]);

assign temp_3[29][0]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][0]);
assign temp_3[29][1]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][1]);

assign temp_3[30][0]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][0]);
assign temp_3[30][1]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][1]);

assign temp_3[31][0]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][0]);
assign temp_3[31][1]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][1]);

assign temp_3[32][0]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][0]);
assign temp_3[32][1]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][1]);


// 8 jumps
assign temp_4[1][0]=temp_3[1][0];
assign temp_4[1][1]=temp_3[1][1];

assign temp_4[2][0]=temp_3[2][0];
assign temp_4[2][1]=temp_3[2][1];

assign temp_4[3][0]=temp_3[3][0];
assign temp_4[3][1]=temp_3[3][1];

assign temp_4[4][0]=temp_3[4][0];
assign temp_4[4][1]=temp_3[4][1];

assign temp_4[5][0]=temp_3[5][0];
assign temp_4[5][1]=temp_3[5][1];

assign temp_4[6][0]=temp_3[6][0];
assign temp_4[6][1]=temp_3[6][1];

assign temp_4[7][0]=temp_3[7][0];
assign temp_4[7][1]=temp_3[7][1];

assign temp_4[8][0]=temp_3[8][0];
assign temp_4[8][1]=temp_3[8][1];

assign temp_4[9][0]=(temp_3[9][0])|(temp_3[9][1]&temp_3[1][0]);
assign temp_4[9][1]=(temp_3[9][0])|(temp_3[9][1]&temp_3[1][1]);

assign temp_4[10][0]=(temp_3[10][0])|(temp_3[10][1]&temp_3[2][0]);
assign temp_4[10][1]=(temp_3[10][0])|(temp_3[10][1]&temp_3[2][1]);

assign temp_4[11][0]=(temp_3[11][0])|(temp_3[11][1]&temp_3[3][0]);
assign temp_4[11][1]=(temp_3[11][0])|(temp_3[11][1]&temp_3[3][1]);

assign temp_4[12][0]=(temp_3[12][0])|(temp_3[12][1]&temp_3[4][0]);
assign temp_4[12][1]=(temp_3[12][0])|(temp_3[12][1]&temp_3[4][1]);

assign temp_4[13][0]=(temp_3[13][0])|(temp_3[13][1]&temp_3[5][0]);
assign temp_4[13][1]=(temp_3[13][0])|(temp_3[13][1]&temp_3[5][1]);

assign temp_4[14][0]=(temp_3[14][0])|(temp_3[14][1]&temp_3[6][0]);
assign temp_4[14][1]=(temp_3[14][0])|(temp_3[14][1]&temp_3[6][1]);

assign temp_4[15][0]=(temp_3[15][0])|(temp_3[15][1]&temp_3[7][0]);
assign temp_4[15][1]=(temp_3[15][0])|(temp_3[15][1]&temp_3[7][1]);

assign temp_4[16][0]=(temp_3[16][0])|(temp_3[16][1]&temp_3[8][0]);
assign temp_4[16][1]=(temp_3[16][0])|(temp_3[16][1]&temp_3[8][1]);

assign temp_4[17][0]=(temp_3[17][0])|(temp_3[17][1]&temp_3[9][0]);
assign temp_4[17][1]=(temp_3[17][0])|(temp_3[17][1]&temp_3[9][1]);

assign temp_4[18][0]=(temp_3[18][0])|(temp_3[18][1]&temp_3[10][0]);
assign temp_4[18][1]=(temp_3[18][0])|(temp_3[18][1]&temp_3[10][1]);

assign temp_4[19][0]=(temp_3[19][0])|(temp_3[19][1]&temp_3[11][0]);
assign temp_4[19][1]=(temp_3[19][0])|(temp_3[19][1]&temp_3[11][1]);

assign temp_4[20][0]=(temp_3[20][0])|(temp_3[20][1]&temp_3[12][0]);
assign temp_4[20][1]=(temp_3[20][0])|(temp_3[20][1]&temp_3[12][1]);

assign temp_4[21][0]=(temp_3[21][0])|(temp_3[21][1]&temp_3[13][0]);
assign temp_4[21][1]=(temp_3[21][0])|(temp_3[21][1]&temp_3[13][1]);

assign temp_4[22][0]=(temp_3[22][0])|(temp_3[22][1]&temp_3[14][0]);
assign temp_4[22][1]=(temp_3[22][0])|(temp_3[22][1]&temp_3[14][1]);

assign temp_4[23][0]=(temp_3[23][0])|(temp_3[23][1]&temp_3[15][0]);
assign temp_4[23][1]=(temp_3[23][0])|(temp_3[23][1]&temp_3[15][1]);

assign temp_4[24][0]=(temp_3[24][0])|(temp_3[24][1]&temp_3[16][0]);
assign temp_4[24][1]=(temp_3[24][0])|(temp_3[24][1]&temp_3[16][1]);

assign temp_4[25][0]=(temp_3[25][0])|(temp_3[25][1]&temp_3[17][0]);
assign temp_4[25][1]=(temp_3[25][0])|(temp_3[25][1]&temp_3[17][1]);

assign temp_4[26][0]=(temp_3[26][0])|(temp_3[26][1]&temp_3[18][0]);
assign temp_4[26][1]=(temp_3[26][0])|(temp_3[26][1]&temp_3[18][1]);

assign temp_4[27][0]=(temp_3[27][0])|(temp_3[27][1]&temp_3[19][0]);
assign temp_4[27][1]=(temp_3[27][0])|(temp_3[27][1]&temp_3[19][1]);

assign temp_4[28][0]=(temp_3[28][0])|(temp_3[28][1]&temp_3[20][0]);
assign temp_4[28][1]=(temp_3[28][0])|(temp_3[28][1]&temp_3[20][1]);

assign temp_4[29][0]=(temp_3[29][0])|(temp_3[29][1]&temp_3[21][0]);
assign temp_4[29][1]=(temp_3[29][0])|(temp_3[29][1]&temp_3[21][1]);

assign temp_4[30][0]=(temp_3[30][0])|(temp_3[30][1]&temp_3[22][0]);
assign temp_4[30][1]=(temp_3[30][0])|(temp_3[30][1]&temp_3[22][1]);

assign temp_4[31][0]=(temp_3[31][0])|(temp_3[31][1]&temp_3[23][0]);
assign temp_4[31][1]=(temp_3[31][0])|(temp_3[31][1]&temp_3[23][1]);

assign temp_4[32][0]=(temp_3[32][0])|(temp_3[32][1]&temp_3[24][0]);
assign temp_4[32][1]=(temp_3[32][0])|(temp_3[32][1]&temp_3[24][1]);



// 16 jumps 
assign temp_5[1][0]=temp_4[1][0];
assign temp_5[1][1]=temp_4[1][1];

assign temp_5[2][0]=temp_4[2][0];
assign temp_5[2][1]=temp_4[2][1];

assign temp_5[3][0]=temp_4[3][0];
assign temp_5[3][1]=temp_4[3][1];

assign temp_5[4][0]=temp_4[4][0];
assign temp_5[4][1]=temp_4[4][1];

assign temp_5[5][0]=temp_4[5][0];
assign temp_5[5][1]=temp_4[5][1];

assign temp_5[6][0]=temp_4[6][0];
assign temp_5[6][1]=temp_4[6][1];

assign temp_5[7][0]=temp_4[7][0];
assign temp_5[7][1]=temp_4[7][1];

assign temp_5[8][0]=temp_4[8][0];
assign temp_5[8][1]=temp_4[8][1];

assign temp_5[9][0]=temp_4[9][0];
assign temp_5[9][1]=temp_4[9][1];

assign temp_5[10][0]=temp_4[10][0];
assign temp_5[10][1]=temp_4[10][1];

assign temp_5[11][0]=temp_4[11][0];
assign temp_5[11][1]=temp_4[11][1];

assign temp_5[12][0]=temp_4[12][0];
assign temp_5[12][1]=temp_4[12][1];

assign temp_5[13][0]=temp_4[13][0];
assign temp_5[13][1]=temp_4[13][1];

assign temp_5[14][0]=temp_4[14][0];
assign temp_5[14][1]=temp_4[14][1];

assign temp_5[15][0]=temp_4[15][0];
assign temp_5[15][1]=temp_4[15][1];

assign temp_5[16][0]=temp_4[16][0];
assign temp_5[16][1]=temp_4[16][1];

assign temp_5[17][0]=(temp_4[17][0])|(temp_4[17][1]&temp_4[1][0]);
assign temp_5[17][1]=(temp_4[17][0])|(temp_4[17][1]&temp_4[1][1]);

assign temp_5[18][0]=(temp_4[18][0])|(temp_4[18][1]&temp_4[2][0]);
assign temp_5[18][1]=(temp_4[18][0])|(temp_4[18][1]&temp_4[2][1]);

assign temp_5[19][0]=(temp_4[19][0])|(temp_4[19][1]&temp_4[3][0]);
assign temp_5[19][1]=(temp_4[19][0])|(temp_4[19][1]&temp_4[3][1]);

assign temp_5[20][0]=(temp_4[20][0])|(temp_4[20][1]&temp_4[4][0]);
assign temp_5[20][1]=(temp_4[20][0])|(temp_4[20][1]&temp_4[4][1]);

assign temp_5[21][0]=(temp_4[21][0])|(temp_4[21][1]&temp_4[5][0]);
assign temp_5[21][1]=(temp_4[21][0])|(temp_4[21][1]&temp_4[5][1]);

assign temp_5[22][0]=(temp_4[22][0])|(temp_4[22][1]&temp_4[6][0]);
assign temp_5[22][1]=(temp_4[22][0])|(temp_4[22][1]&temp_4[6][1]);

assign temp_5[23][0]=(temp_4[23][0])|(temp_4[23][1]&temp_4[7][0]);
assign temp_5[23][1]=(temp_4[23][0])|(temp_4[23][1]&temp_4[7][1]);

assign temp_5[24][0]=(temp_4[24][0])|(temp_4[24][1]&temp_4[8][0]);
assign temp_5[24][1]=(temp_4[24][0])|(temp_4[24][1]&temp_4[8][1]);

assign temp_5[25][0]=(temp_4[25][0])|(temp_4[25][1]&temp_4[9][0]);
assign temp_5[25][1]=(temp_4[25][0])|(temp_4[25][1]&temp_4[9][1]);

assign temp_5[26][0]=(temp_4[26][0])|(temp_4[26][1]&temp_4[10][0]);
assign temp_5[26][1]=(temp_4[26][0])|(temp_4[26][1]&temp_4[10][1]);

assign temp_5[27][0]=(temp_4[27][0])|(temp_4[27][1]&temp_4[11][0]);
assign temp_5[27][1]=(temp_4[27][0])|(temp_4[27][1]&temp_4[11][1]);

assign temp_5[28][0]=(temp_4[28][0])|(temp_4[28][1]&temp_4[12][0]);
assign temp_5[28][1]=(temp_4[28][0])|(temp_4[28][1]&temp_4[12][1]);

assign temp_5[29][0]=(temp_4[29][0])|(temp_4[29][1]&temp_4[13][0]);
assign temp_5[29][1]=(temp_4[29][0])|(temp_4[29][1]&temp_4[13][1]);

assign temp_5[30][0]=(temp_4[30][0])|(temp_4[30][1]&temp_4[14][0]);
assign temp_5[30][1]=(temp_4[30][0])|(temp_4[30][1]&temp_4[14][1]);

assign temp_5[31][0]=(temp_4[31][0])|(temp_4[31][1]&temp_4[15][0]);
assign temp_5[31][1]=(temp_4[31][0])|(temp_4[31][1]&temp_4[15][1]);

assign temp_5[32][0]=(temp_4[32][0])|(temp_4[32][1]&temp_4[16][0]);
assign temp_5[32][1]=(temp_4[32][0])|(temp_4[32][1]&temp_4[16][1]);


//GK Calculating
assign gk[1]=temp_5[1][1];
assign gk[2]=temp_5[2][1];
assign gk[3]=temp_5[3][1];
assign gk[4]=temp_5[4][1];
assign gk[5]=temp_5[5][1];
assign gk[6]=temp_5[6][1];
assign gk[7]=temp_5[7][1];
assign gk[8]=temp_5[8][1];
assign gk[9]=temp_5[9][1];
assign gk[10]=temp_5[10][1];
assign gk[11]=temp_5[11][1];
assign gk[12]=temp_5[12][1];
assign gk[13]=temp_5[13][1];
assign gk[14]=temp_5[14][1];
assign gk[15]=temp_5[15][1];
assign gk[16]=temp_5[16][1];
assign gk[17]=temp_5[17][1];
assign gk[18]=temp_5[18][1];
assign gk[19]=temp_5[19][1];
assign gk[20]=temp_5[20][1];
assign gk[21]=temp_5[21][1];
assign gk[22]=temp_5[22][1];
assign gk[23]=temp_5[23][1];
assign gk[24]=temp_5[24][1];
assign gk[25]=temp_5[25][1];
assign gk[26]=temp_5[26][1];
assign gk[27]=temp_5[27][1];
assign gk[28]=temp_5[28][1];
assign gk[29]=temp_5[29][1];
assign gk[30]=temp_5[30][1];
assign gk[31]=temp_5[31][1];
assign gk[32]=temp_5[32][1];


//calculating sum
assign sum[1]=a[1]^b[1]^cin;
assign sum[2]=gk[1]^a[2]^b[2];
assign sum[3]=gk[2]^a[3]^b[3];
assign sum[4]=gk[3]^a[4]^b[4];
assign sum[5]=gk[4]^a[5]^b[5];
assign sum[6]=gk[5]^a[6]^b[6];
assign sum[7]=gk[6]^a[7]^b[7];
assign sum[8]=gk[7]^a[8]^b[8];
assign sum[9]=gk[8]^a[9]^b[9];
assign sum[10]=gk[9]^a[10]^b[10];
assign sum[11]=gk[10]^a[11]^b[11];
assign sum[12]=gk[11]^a[12]^b[12];
assign sum[13]=gk[12]^a[13]^b[13];
assign sum[14]=gk[13]^a[14]^b[14];
assign sum[15]=gk[14]^a[15]^b[15];
assign sum[16]=gk[15]^a[16]^b[16];
assign sum[17]=gk[16]^a[17]^b[17];
assign sum[18]=gk[17]^a[18]^b[18];
assign sum[19]=gk[18]^a[19]^b[19];
assign sum[20]=gk[19]^a[20]^b[20];
assign sum[21]=gk[20]^a[21]^b[21];
assign sum[22]=gk[21]^a[22]^b[22];
assign sum[23]=gk[22]^a[23]^b[23];
assign sum[24]=gk[23]^a[24]^b[24];
assign sum[25]=gk[24]^a[25]^b[25];
assign sum[26]=gk[25]^a[26]^b[26];
assign sum[27]=gk[26]^a[27]^b[27];
assign sum[28]=gk[27]^a[28]^b[28];
assign sum[29]=gk[28]^a[29]^b[29];
assign sum[30]=gk[29]^a[30]^b[30];
assign sum[31]=gk[30]^a[31]^b[31];
assign sum[32]=gk[31]^a[32]^b[32];

assign cout=gk[32];



endmodule






module WallaceTreeMul (A,B,C);

 input [31:0] A, B;
 output [63:0] C;
 wire cout;
 wire cout1;


    wire [63:0] AB [31:0], temp1 [31:0];
    wire [31:0] temp [31:0];
    wire [63:0] s [30:0];
    wire [63:0] c [30:0];
    wire K;
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1)
        begin : and_loop
            multiplier mul(A, B[i], temp[i]);
            assign temp1[i] = {{32{1'b0}}, temp[i]};
            assign AB[i] = temp1[i] << i;
        end
    endgenerate

    CSA ca01(AB[0], AB[1], AB[2], s[0], c[0]);
    CSA ca02(AB[3], AB[4], AB[5], s[1], c[1]);
    CSA ca03(AB[6], AB[7], AB[8], s[2], c[2]);
    CSA ca04(AB[9], AB[10], AB[11], s[3], c[3]);
    CSA ca05(AB[12], AB[13], AB[14], s[4], c[4]);
    CSA ca06(AB[15], AB[16], AB[17], s[5], c[5]);
    CSA ca07(AB[18], AB[19], AB[20], s[6], c[6]);
    CSA ca08(AB[21], AB[22], AB[23], s[7], c[7]);
    CSA ca09(AB[24], AB[25], AB[26], s[8], c[8]);
    CSA ca10(AB[27], AB[28], AB[29], s[9], c[9]);
    CSA ca11(s[0], c[0], s[1], s[10], c[10]);
    CSA ca12(c[1], s[2], c[2], s[11], c[11]);
    CSA ca13(c[3], s[3], s[4], s[12], c[12]);
    CSA ca14(c[4], s[5], c[5], s[13], c[13]);
    CSA ca15(s[6], c[6], s[7], s[14], c[14]);
    CSA ca16(c[7], c[8], s[8], s[15], c[15]);
    CSA ca17(s[9], c[9], AB[30], s[16], c[16]);
    CSA ca18(s[10], c[10], s[11], s[17], c[17]);
    CSA ca19(c[11], s[12], c[12], s[18], c[18]);
    CSA ca20(c[13], s[13], s[14], s[19], c[19]);
    CSA ca21(c[14], c[15], s[15], s[20], c[20]);
    CSA ca22(s[16], c[16], AB[31], s[21], c[21]);
    CSA ca23(s[17], c[17], s[18], s[22], c[22]);
    CSA ca24(c[18], s[19], c[19], s[23], c[23]);
    CSA ca25(c[20], s[20], s[21], s[24], c[24]);
    CSA ca26(s[22], c[22], s[23], s[25], c[25]);
    CSA ca27(c[23], s[24], c[24], s[26], c[26]);
    CSA ca28(c[25], s[25], s[26], s[27], c[27]);
    CSA ca29(c[26], c[21], {64{1'b0}}, s[28], c[28]);
    CSA ca30(s[27], c[27], s[28], s[29], c[29]);
    CSA ca31(c[28], s[29], c[29], s[30], c[30]);


// sixtyFourBitAdder SRA(s[30], c[30], 1'b0, C, K)
    RecursiveDoubling cla1(s[30][31:0],c[30][31:0],1'b0,C[31:0],cout);
    RecursiveDoubling cla2(s[30][63:32],c[30][63:32],cout,C[63:32],cout1);

    



endmodule