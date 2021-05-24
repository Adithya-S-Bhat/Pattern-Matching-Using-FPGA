module invert (input wire i, output wire o);
   assign o = !i;
endmodule

module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module or2 (input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule

module xor2 (input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule

module nand2 (input wire i0, i1, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module nor2 (input wire i0, i1, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module xnor2 (input wire i0, i1, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module and3 (input wire i0, i1, i2, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   and2 and2_1 (i2, t, o);
endmodule

module or3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   or2 or2_1 (i2, t, o);
endmodule

module nor3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   nor2 nor2_0 (i2, t, o);
endmodule

module nand3 (input wire i0, i1, i2, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   nand2 nand2_1 (i2, t, o);
endmodule

module xor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xor2 xor2_1 (i2, t, o);
endmodule

module xnor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xnor2 xnor2_0 (i2, t, o);
endmodule

module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module df (input wire  clk, in, output wire  out);
reg df_out;
   initial df_out = 1'b1;
   always@(posedge clk) df_out <= in;
   assign out = df_out;
endmodule

module dfr (input wire  clk, reset, in, output wire  out);
  wire  df_in, reset_;
  invert invert_0(reset, reset_);
  and2 and2_1(in, reset_, df_in);
  df df_2(clk, df_in, out);
endmodule

module char_zero (input wire clk, reset, i, input wire ip_c, output wire o);
   wire a, b;
   xnor2 xnor2_0(ip_c, 1'b0, a);
   dfr dfr_1(clk, reset, i, b);
   and2 and2_2(a, b, o);
endmodule

module char_one (input wire clk, reset, i, input wire ip_c, output wire o);
   wire a, b;
   xnor2 xnor2_0(ip_c, 1'b1, a);
   dfr dfr_1(clk, reset, i, b);
   and2 and2_2(a, b, o);
endmodule
