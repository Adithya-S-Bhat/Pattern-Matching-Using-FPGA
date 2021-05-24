module bar (input wire i, output wire o, input wire i1, i2, output wire o1, o2);
   assign o1 = i;
   assign o2 = i;
   or2 or2_0 (i1, i2, o);
endmodule

module dot (input wire i, output wire o, input wire i1, i2, output wire o1, o2);
   assign o1 = i;
   assign o2 = i1;
   assign o = i2;
endmodule

module star (input wire i, output wire o, input wire i1, output wire o1);
   or2 or2_0 (i, i1, o1);
   assign o = o1;
endmodule

module zero_bar_one (input wire clk, reset, i, input wire i_c, output wire o);
   wire i1, i2, o1, o2;
   bar bar_0 (i, o, i1, i2, o1, o2);
   char_zero char_zero_0 (clk, reset, o1, i_c, i1);
   char_one   char_one_0 (clk, reset, o2, i_c, i2);
endmodule

module zero_dot_one (input wire clk, reset, i, input wire i_c, output wire o);
   wire i1, i2, o1, o2;
   dot dot_0 (i, o, i1, i2, o1, o2);
   char_zero char_zero_1 (clk, reset, o1, i_c, i1);
   char_one char_one_2 (clk, reset, o2, i_c, i2); 
endmodule

module zero_bar_one_star (input wire clk, reset, i, input wire i_c, output wire o);
   wire i1, o1;
   star star_0 (i, o, i1, o1);
   zero_bar_one zero_bar_one_1 (clk, reset, o1, i_c, i1);
endmodule

module regex (input wire clk, reset, i, input wire i_c, output wire o);
   // zero bar one star zero dot one
   wire i1, i2, o1, o2;
   dot dot_0 (i, o, i1, i2, o1, o2);
   zero_bar_one_star zero_bar_one_star_1 (clk, reset, o1, i_c, i1);
   zero_dot_one zero_dot_one_2 (clk, reset, o2, i_c, i2); 
endmodule
