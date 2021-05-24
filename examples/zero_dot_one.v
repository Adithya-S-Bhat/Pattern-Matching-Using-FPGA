module dot (input wire i, output wire o, input wire i1, i2, output wire o1, o2);
   assign o1 = i;
   assign o2 = i1;
   assign o = i2;
endmodule

module regex (input wire clk, reset, i, input wire i_c, output wire o);
   // zero bar one
   wire i1, i2, o1, o2;
   dot dot_0 (i, o, i1, i2, o1, o2);
   char_zero char_zero_1 (clk, reset, o1, i_c, i1);
   char_one char_one_2 (clk, reset, o2, i_c, i2); 
endmodule
