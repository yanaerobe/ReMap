
module shifter32 ( num, k, m1 );
  input [31:0] num;
  output [4:0] k;
  output [27:0] m1;

  tri   [27:0] m1;
  assign m1[27] = 1'b0;
  assign m1[26] = 1'b0;
  assign m1[25] = 1'b0;
  assign m1[24] = 1'b0;
  assign m1[23] = 1'b0;
  assign m1[22] = 1'b0;
  assign m1[21] = 1'b0;
  assign m1[20] = 1'b0;
  assign m1[19] = 1'b0;
  assign m1[18] = 1'b0;
  assign m1[17] = 1'b0;
  assign m1[16] = 1'b0;
  assign m1[15] = 1'b0;
  assign m1[14] = 1'b0;
  assign m1[13] = 1'b0;
  assign m1[12] = 1'b0;
  assign m1[11] = 1'b0;
  assign m1[10] = 1'b0;
  assign m1[9] = 1'b0;
  assign m1[8] = 1'b0;
  assign m1[7] = 1'b0;
  assign m1[6] = 1'b0;
  assign m1[5] = 1'b0;
  assign m1[4] = 1'b0;
  assign m1[3] = 1'b0;
  assign m1[2] = 1'b0;
  assign m1[1] = 1'b0;
  assign m1[0] = 1'b0;

endmodule


module remap_top ( num_i, rslt_o );
  input [31:0] num_i;
  output [31:0] rslt_o;
  wire   n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84;
  tri   [31:0] rslt_o;
  tri   [27:0] keyvalues_m1;

  shifter32 values ( .num({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .k(rslt_o[31:27]), .m1(keyvalues_m1) );
  remap re_map ( .m1(keyvalues_m1), .m2(rslt_o[26:0]) );
  ND4SVTX1 U52 ( .A(n44), .B(1'b1), .C(1'b1), .D(n43), .Z(rslt_o[29]) );
  ND4SVTX1 U53 ( .A(1'b1), .B(1'b1), .C(1'b1), .D(n46), .Z(rslt_o[28]) );
  ND4SVTX1 U54 ( .A(n50), .B(1'b1), .C(n49), .D(n48), .Z(rslt_o[27]) );
  ND3SVTX1 U50 ( .A(n45), .B(n42), .C(n38), .Z(rslt_o[31]) );
  ND4ABSVTX1 U51 ( .A(n41), .B(n40), .C(n39), .D(1'b1), .Z(rslt_o[30]) );
  NR4SVTX1 U55 ( .A(num_i[10]), .B(num_i[11]), .C(num_i[8]), .D(num_i[9]), .Z(
        n54) );
  NR4SVTX1 U56 ( .A(num_i[28]), .B(num_i[31]), .C(num_i[30]), .D(num_i[29]), 
        .Z(n73) );
  ND3ABSVTX1 U57 ( .A(num_i[26]), .B(num_i[27]), .C(n73), .Z(n61) );
  NR3SVTX1 U58 ( .A(num_i[24]), .B(num_i[25]), .C(n61), .Z(n39) );
  ND3ABSVTX1 U59 ( .A(num_i[23]), .B(num_i[22]), .C(n39), .Z(n65) );
  NR3SVTX1 U60 ( .A(num_i[20]), .B(num_i[21]), .C(n65), .Z(n70) );
  ND3ABSVTX1 U61 ( .A(num_i[18]), .B(num_i[19]), .C(n70), .Z(n57) );
  NR3SVTX1 U62 ( .A(num_i[16]), .B(num_i[17]), .C(n57), .Z(n74) );
  NR4SVTX1 U63 ( .A(num_i[15]), .B(num_i[14]), .C(num_i[12]), .D(num_i[13]), 
        .Z(n77) );
  ND2SVTX1 U64 ( .A(n74), .B(n77), .Z(n51) );
  NR2SVTX1 U65 ( .A(n54), .B(n51), .Z(n40) );
  NR2ASVTX1 U66 ( .A(n74), .B(n77), .Z(n41) );
  NR2SVTX1 U67 ( .A(num_i[4]), .B(num_i[5]), .Z(n81) );
  NR2ASVTX1 U68 ( .A(n54), .B(n51), .Z(n82) );
  ND3ABSVTX1 U69 ( .A(num_i[6]), .B(num_i[7]), .C(n82), .Z(n68) );
  OR2SVTX1 U70 ( .A(num_i[23]), .B(num_i[22]), .Z(n52) );
  AO21SVTX1 U71 ( .A(num_i[20]), .B(num_i[21]), .C(n52), .D(n39), .Z(n42) );
  AO7SVTX1 U72 ( .A(n81), .B(n68), .C(n42), .Z(n53) );
  NR3ASVTX1 U73 ( .A(n73), .B(n41), .C(n53), .Z(n43) );
  AO2ASVTX1 U74 ( .C(num_i[7]), .D(n54), .A(num_i[10]), .B(num_i[9]), .Z(n55)
         );
  AO7ASVTX1 U75 ( .A(n55), .B(num_i[11]), .C(n77), .Z(n56) );
  AO7ASVTX1 U76 ( .A(num_i[13]), .B(num_i[14]), .C(n56), .Z(n60) );
  AO17ASVTX1 U77 ( .A(num_i[4]), .B(num_i[3]), .C(num_i[5]), .D(n82), .Z(n58)
         );
  IVSVTX0H U78 ( .A(n57), .Z(n84) );
  AO4ABSVTX1 U79 ( .C(num_i[6]), .D(n58), .A(n84), .B(num_i[17]), .Z(n59) );
  AO20SVTX1 U80 ( .A(num_i[15]), .B(n60), .C(n74), .D(n59), .Z(n48) );
  IVSVTX0H U82 ( .A(num_i[29]), .Z(n63) );
  IVSVTX0H U83 ( .A(num_i[25]), .Z(n62) );
  AO4SVTX1 U84 ( .A(num_i[30]), .B(n63), .C(n62), .D(n61), .Z(n67) );
  AO2SVTX1 U85 ( .A(n73), .B(num_i[27]), .C(n39), .D(num_i[23]), .Z(n64) );
  NR2ASVTX1 U86 ( .A(n64), .B(num_i[31]), .Z(n71) );
  AO7ASVTX1 U87 ( .A(num_i[21]), .B(n65), .C(n71), .Z(n66) );
  AO1SVTX1 U88 ( .A(num_i[19]), .B(n70), .C(n67), .D(n66), .Z(n49) );
  NR2SVTX1 U89 ( .A(num_i[2]), .B(num_i[3]), .Z(n83) );
  IVSVTX0H U90 ( .A(n68), .Z(n69) );
  ND4SVTX1 U91 ( .A(n81), .B(n83), .C(n69), .D(num_i[1]), .Z(n50) );
  AO7SVTX1 U92 ( .A(num_i[6]), .B(num_i[7]), .C(n82), .Z(n44) );
  AO7SVTX1 U93 ( .A(num_i[18]), .B(num_i[19]), .C(n70), .Z(n45) );
  AO7ABSVTX1 U94 ( .A(num_i[22]), .B(n39), .C(n71), .Z(n72) );
  AO1SVTX1 U95 ( .A(n73), .B(num_i[26]), .C(num_i[30]), .D(n72), .Z(n79) );
  OR2SVTX1 U96 ( .A(num_i[11]), .B(num_i[10]), .Z(n76) );
  OR2SVTX1 U97 ( .A(num_i[15]), .B(num_i[14]), .Z(n75) );
  AO17SVTX1 U98 ( .A(n77), .B(n76), .C(n75), .D(n74), .Z(n78) );
  ND4SVTX1 U99 ( .A(n79), .B(n44), .C(n78), .D(n45), .Z(n80) );
  AO8ASVTX1 U100 ( .A(n83), .B(n82), .C(n81), .D(n80), .Z(n46) );
  AO20DSVTX1 U102 ( .A(num_i[16]), .B(num_i[17]), .C(n84), .D(n39), .Z(n38) );
endmodule

