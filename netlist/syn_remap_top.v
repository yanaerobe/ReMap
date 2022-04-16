
module remap_top ( num_i, rslt_o );
  input [31:0] num_i;
  output [31:0] rslt_o;
  wire   n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77;
  assign rslt_o[26] = 1'b0;
  assign rslt_o[25] = 1'b0;
  assign rslt_o[24] = 1'b0;
  assign rslt_o[23] = 1'b0;
  assign rslt_o[22] = 1'b0;
  assign rslt_o[21] = 1'b0;
  assign rslt_o[20] = 1'b0;
  assign rslt_o[19] = 1'b0;
  assign rslt_o[18] = 1'b0;
  assign rslt_o[17] = 1'b0;
  assign rslt_o[16] = 1'b0;
  assign rslt_o[15] = 1'b0;
  assign rslt_o[14] = 1'b0;
  assign rslt_o[13] = 1'b0;
  assign rslt_o[12] = 1'b0;
  assign rslt_o[11] = 1'b0;
  assign rslt_o[10] = 1'b0;
  assign rslt_o[9] = 1'b0;
  assign rslt_o[8] = 1'b0;
  assign rslt_o[7] = 1'b0;
  assign rslt_o[6] = 1'b0;
  assign rslt_o[5] = 1'b0;
  assign rslt_o[4] = 1'b0;
  assign rslt_o[3] = 1'b0;
  assign rslt_o[2] = 1'b0;
  assign rslt_o[1] = 1'b0;
  assign rslt_o[0] = 1'b0;

  CTIVSVTX2 U48 ( .A(n51), .Z(rslt_o[31]) );
  F_ND2ASVTX1 U49 ( .A(num_i[18]), .B(n52), .Z(n67) );
  B_ND2SVTX0H U50 ( .A(n71), .B(n69), .Z(n74) );
  NR4SVTX1 U51 ( .A(num_i[15]), .B(num_i[12]), .C(num_i[14]), .D(num_i[13]), 
        .Z(n69) );
  AO21ASVTX1 U52 ( .A(num_i[5]), .B(num_i[6]), .C(n74), .D(n59), .Z(n60) );
  NR4SVTX1 U53 ( .A(num_i[31]), .B(num_i[28]), .C(num_i[30]), .D(num_i[29]), 
        .Z(n68) );
  NR4SVTX1 U54 ( .A(num_i[7]), .B(num_i[4]), .C(num_i[6]), .D(num_i[5]), .Z(
        n73) );
  F_ND2SVTX0H U55 ( .A(n70), .B(n68), .Z(n76) );
  NR4SVTX1 U56 ( .A(num_i[20]), .B(num_i[23]), .C(num_i[22]), .D(num_i[21]), 
        .Z(n77) );
  NR4SVTX1 U57 ( .A(num_i[8]), .B(num_i[11]), .C(num_i[10]), .D(num_i[9]), .Z(
        n71) );
  NR4SVTX1 U58 ( .A(num_i[27]), .B(num_i[26]), .C(num_i[24]), .D(num_i[25]), 
        .Z(n70) );
  NR4SVTX1 U59 ( .A(num_i[19]), .B(num_i[17]), .C(num_i[16]), .D(n67), .Z(n51)
         );
  AO21ASVTX1 U60 ( .A(num_i[21]), .B(num_i[22]), .C(n76), .D(n55), .Z(n64) );
  AO2SVTX1 U61 ( .A(n52), .B(num_i[18]), .C(n51), .D(n50), .Z(n53) );
  NR2ASVTX1 U62 ( .A(n77), .B(n76), .Z(n52) );
  IVSVTX0H U63 ( .A(n74), .Z(n48) );
  NR2ASVTX1 U64 ( .A(n73), .B(n74), .Z(n57) );
  AO2NSVTX1 U65 ( .A(n48), .B(num_i[7]), .C(n57), .D(num_i[3]), .Z(n43) );
  AO1SVTX1 U66 ( .A(n69), .B(num_i[11]), .C(num_i[15]), .D(n43), .Z(n45) );
  IVSVTX0H U67 ( .A(num_i[23]), .Z(n44) );
  AO4SVTX1 U68 ( .A(n45), .B(rslt_o[31]), .C(n44), .D(n76), .Z(n46) );
  AO1SVTX1 U69 ( .A(n52), .B(num_i[19]), .C(num_i[31]), .D(n46), .Z(n61) );
  OR2SVTX0H U70 ( .A(num_i[27]), .B(num_i[26]), .Z(n47) );
  AO17SVTX1 U71 ( .A(num_i[22]), .B(n70), .C(n47), .D(n68), .Z(n54) );
  AO17SVTX1 U72 ( .A(n73), .B(num_i[2]), .C(num_i[6]), .D(n48), .Z(n49) );
  IVSVTX0H U73 ( .A(num_i[14]), .Z(n56) );
  AO3ABSVTX1 U74 ( .A(n69), .B(num_i[10]), .C(n49), .D(n56), .Z(n50) );
  IVSVTX0H U75 ( .A(num_i[30]), .Z(n65) );
  ND4SVTX1 U76 ( .A(n61), .B(n54), .C(n53), .D(n65), .Z(rslt_o[28]) );
  AO17ASVTX1 U77 ( .A(num_i[26]), .B(num_i[25]), .C(num_i[27]), .D(n68), .Z(
        n55) );
  NR2ASVTX1 U78 ( .A(num_i[1]), .B(num_i[2]), .Z(n58) );
  AO2SVTX1 U79 ( .A(n58), .B(n57), .C(num_i[13]), .D(n56), .Z(n59) );
  AO8ASVTX1 U80 ( .A(num_i[10]), .B(n69), .C(num_i[9]), .D(n60), .Z(n62) );
  AO7SVTX1 U81 ( .A(n62), .B(rslt_o[31]), .C(n61), .Z(n63) );
  AO1SVTX1 U82 ( .A(num_i[29]), .B(n65), .C(n64), .D(n63), .Z(n66) );
  F_AO7ASVTX1 U83 ( .A(num_i[17]), .B(n67), .C(n66), .Z(rslt_o[27]) );
  AO7NSVTX1 U84 ( .A(n69), .B(rslt_o[31]), .C(n68), .Z(n72) );
  AO3SVTX1 U85 ( .A(n71), .B(rslt_o[31]), .C(n70), .D(n72), .Z(rslt_o[30]) );
  AO21NSVTX1 U87 ( .A(rslt_o[31]), .B(n74), .C(n73), .D(n72), .Z(n75) );
  AO7SVTX1 U88 ( .A(n77), .B(n76), .C(n75), .Z(rslt_o[29]) );
endmodule

