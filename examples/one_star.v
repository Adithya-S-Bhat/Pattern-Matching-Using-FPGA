module star (input wire i, output wire o, input wire i1, output wire o1);
   or2 or2_0 (i, i1, o1);
   assign o = o1;
endmodule

module regex (input wire clk, reset, i, input wire i_c, output wire o);
   wire i1, o1;
   star star_0 (i, o, i1, o1);
   char_one char_one_1 (clk, reset, o1, i_c, i1);
endmodule
