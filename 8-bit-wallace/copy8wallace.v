module threeleveladder(input [63:0] x, input [63:0] y, input [63:0]z, output [63:0]s, output [63:0]c);
assign s = x^y^z;
assign c[0] = 1'b0;
assign c[63:1] = (x[63:0]&y[63:0]) | (y[63:0]&z[63:0]) | (z[63:0]&x[63:0]);
endmodule

module partialmulti(output reg[31:0][63:0] p, input [31:0] a, input [31:0] b);
	integer i;
	always @(a or b)
	begin
		for(i=0; i<32; i=i+1)
		begin
			if(b[i] === 1)
			begin
				p[i] <= (a << i);
			end
			else
			 p[i] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		end
	end
endmodule

module sixtyfour_bit_Recursive_Carry_Adder(
output [63:0] sum,
output cout,
input [63:0] a,b);
  
wire cin = 1'b0;
wire [63:0] c,g,p;
  
kgpchoose kgp[63:0](g, p, a, b);
wire [63:1] g2, p2;
buff buff_0(c[0], g[0]);
calcblock calc_0[63:1](g2[63:1], p2[63:1], g[63:1], p[63:1], g[62:0], p[62:0]);

wire [63:2] g3, p3;
buff buff_1(c[1], g2[1]);
calcblock calc_1[63:2](g3[63:2], p3[63:2], g2[63:2], p2[63:2], {g2[61:1],g[0]}, {p2[61:1],p[0]});

wire [63:4] g4, p4;
buff buff_2[3:2](c[3:2], g3[3:2]);
calcblock calc_2[63:4](g4[63:4], p4[63:4], g3[63:4], p3[63:4], {g3[59:2],g2[1],g[0]}, {p3[59:2],p2[1],p[0]});

wire [63:8] g5, p5;
buff buff_3[7:4](c[7:4], g4[7:4]);
calcblock calc_3[63:8](g5[63:8], p5[63:8], g4[63:8], p4[63:8], {g4[55:4],g3[3:2],g2[1],g[0]}, {p4[55:4],p3[3:2],p2[1],p[0]});
        
wire [63:16] g6, p6;
buff buff_4[15:8](c[15:8], g5[15:8]);
calcblock calc_4[63:16](g6[63:16], p6[63:16], g5[63:16], p5[63:16], {g5[47:8],g4[7:4],g3[3:2],g2[1],g[0]}, {p5[47:8],p4[7:4],p3[3:2],p2[1],p[0]});
  
wire [63:32] g7, p7;
buff buff_5[31:16](c[31:16], g6[31:16]);
calcblock calc_5[63:32](g7[63:32], p7[63:32], g6[63:32], p6[63:32], {g6[31:16],g5[15:8],g4[7:4],g3[3:2],g2[1],g[0]}, {p6[31:16],p5[15:8],p4[7:4],p3[3:2],p2[1],p[0]});

buff buff_6[63:32](c[63:32], g6[63:32]);
finaladder adder_0(sum[0],p[0],cin);
finaladder addr_1[63:1](sum[63:1],p[63:1], c[62:0]);
buf(cout, c[63]);
endmodule

module kgpchoose(
output G, P,
input Ai, Bi);
and(G, Ai, Bi);
xor(P, Ai, Bi);
endmodule

module finaladder(
output Si,
input Pi, Ci);
xor(Si, Pi, Ci);
endmodule

module finaladderr(
output Si,
input ai,bi,Ci);
wire w;
xor(w,ai,bi);
xor(Si,w,Ci);
endmodule

module buff(
output Ci,
input Gi);
//buf(Ci, Gi);
assign Ci=Gi;
endmodule

module calcblock(output G, P, input Gi, Pi, Gip, Pip);
wire w;
and(w, Pi, Gip);
or(G, w, Gi);
and(P, Pi, Pip);
endmodule

module thirty_two_wallace_multipiler(
output [31:0] prod, 	
input [31:0] a,		
input [31:0] b, 
output ovf);

wire twosComp;
assign twosComp = a[31] ^ b[31];

// if MSB = 1 toggle flag
//assign twosComp = a[31] ? ~twosComp : twosComp;
//assign twosComp = b[31] ? ~twosComp : twosComp;
// If MSB = 1 do twos comp
wire [31:0] compA, compB;
assign compA = a[31] ? (~a) + 1 : a; // 2s comp A to positive
assign compB = b[31] ? (~b) + 1 : b; // 2s comp B to positive

// if toggle flag = 1 then twos comp product
wire [63:0] product, compProd;
assign compProd = twosComp ? (~product) + 1 : product;

assign prod = compProd[31:0];

// Overflow logic
wire allones, allzeros, highBit, msb_match;
assign allones = & compProd[63:32];
assign allzeros = | compProd[63:32];
assign topAllSame = allones ^ allzeros; //ovf = 1 if !allzeros and !allones
assign msb_match = allzeros ^ compProd[31];
assign ovf = topAllSame | msb_match;

wire [31:0][63:0]pps;		//partial products
	partialmulti partialmultiplications(pps,compA,compB);


wire [63:0] s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,c11,c12,c13,c14,c15,c16,c17,c18,c19,c110;

	threeleveladder add11(pps[0][63:0],pps[1][63:0],pps[2][63:0],s11[63:0],c11[63:0]);
	threeleveladder add12(pps[3][63:0],pps[4][63:0],pps[5][63:0],s12[63:0],c12[63:0]);
	threeleveladder add13(pps[6][63:0],pps[7][63:0],pps[8][63:0],s13[63:0],c13[63:0]);
	threeleveladder add14(pps[9][63:0],pps[10][63:0],pps[11][63:0],s14[63:0],c14[63:0]);
	threeleveladder add15(pps[12][63:0],pps[13][63:0],pps[14][63:0],s15[63:0],c15[63:0]);
	threeleveladder add16(pps[15][63:0],pps[16][63:0],pps[17][63:0],s16[63:0],c16[63:0]);
	threeleveladder add17(pps[18][63:0],pps[19][63:0],pps[20][63:0],s17[63:0],c17[63:0]);
	threeleveladder add18(pps[21][63:0],pps[22][63:0],pps[23][63:0],s18[63:0],c18[63:0]);
	threeleveladder add19(pps[24][63:0],pps[25][63:0],pps[26][63:0],s19[63:0],c19[63:0]);
	threeleveladder add110(pps[27][63:0],pps[28][63:0],pps[29][63:0],s110[63:0],c110[63:0]);

wire [63:0] s21,s22,s23,s24,s25,s26,s27,c21,c22,c23,c24,c25,c26,c27;

	threeleveladder add21(s11[63:0],c11[63:0],s12[63:0],s21[63:0],c21[63:0]);
	threeleveladder add22(c12[63:0],s13[63:0],c13[63:0],s22[63:0],c22[63:0]);
	threeleveladder add23(s14[63:0],c14[63:0],s15[63:0],s23[63:0],c23[63:0]);
	threeleveladder add24(c15[63:0],s16[63:0],c16[63:0],s24[63:0],c24[63:0]);
	threeleveladder add25(s17[63:0],c17[63:0],s18[63:0],s25[63:0],c25[63:0]);
	threeleveladder add26(c18[63:0],s19[63:0],c19[63:0],s26[63:0],c26[63:0]);
	threeleveladder add27(s110[63:0],c110[63:0],pps[30][63:0],s27[63:0],c27[63:0]);

wire [63:0] s31,s32,s33,s34,s35,c31,c32,c33,c34,c35;

	threeleveladder add31(s21[63:0],c21[63:0],s22[63:0],s31[63:0],c31[63:0]);
	threeleveladder add32(c22[63:0],s23[63:0],c23[63:0],s32[63:0],c32[63:0]);
	threeleveladder add33(s24[63:0],c24[63:0],s25[63:0],s33[63:0],c33[63:0]);
	threeleveladder add34(c25[63:0],s26[63:0],c26[63:0],s34[63:0],c34[63:0]);
	threeleveladder add35(s27[63:0],c27[63:0],pps[31][63:0],s35[63:0],c35[63:0]);

wire [63:0] s41,s42,s43,c41,c42,c43;

	threeleveladder add41(s31[63:0],c31[63:0],s32[63:0],s41[63:0],c41[63:0]);
	threeleveladder add42(c32[63:0],s33[63:0],c33[63:0],s42[63:0],c42[63:0]);
	threeleveladder add43(s34[63:0],c34[63:0],s35[63:0],s43[63:0],c43[63:0]);

wire [63:0] s51,s52,c51,c52;

	threeleveladder add51(s41[63:0],c41[63:0],s42[63:0],s51[63:0],c51[63:0]);
	threeleveladder add52(c42[63:0],s43[63:0],c43[63:0],s52[63:0],c52[63:0]);

wire [63:0] s61,c61;

	threeleveladder add61(s51[63:0],c51[63:0],s52[63:0],s61[63:0],c61[63:0]);

wire [63:0] s71,c71;

	threeleveladder add71(s61[63:0],c61[63:0],c52[63:0],s71[63:0],c71[63:0]);

wire [63:0] s81,c81;

	threeleveladder add81(s71[63:0],c71[63:0],c35[63:0],s81[63:0],c81[63:0]);

wire cout;
sixtyfour_bit_Recursive_Carry_Adder cla(product,cout,s81,c81);


endmodule
