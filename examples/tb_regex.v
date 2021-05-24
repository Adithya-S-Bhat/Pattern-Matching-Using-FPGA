`timescale 1 ns / 100 ps
`define TESTVECS 40

module tb;

   integer k;

   reg 	   clk, reset;
   wire    o;
   
   reg 	   i, i_c;
   
   reg 	   [1:0] test_vecs [0:(`TESTVECS-1)];


   initial begin $dumpfile("regex.vcd"); $dumpvars(0,tb); end

   initial begin reset = 1'b1; #1.5 reset = 1'b0; end
   initial clk = 1'b0; always #5 clk =~ clk;

   initial begin
      test_vecs[0]   =  2'b11;
      test_vecs[1]   =  2'b11;
      test_vecs[2]   =  2'b11;
      test_vecs[3]   =  2'b10;
      test_vecs[4]   =  2'b10;
      test_vecs[5]   =  2'b10;
      test_vecs[6]   =  2'b10;
      test_vecs[7]   =  2'b10;
      test_vecs[8]   =  2'b10;
      test_vecs[9]   =  2'b10;
      test_vecs[10]  =  2'b10;
      test_vecs[11]  =  2'b10;
      test_vecs[12]  =  2'b10;
      test_vecs[13]  =  2'b10;
      test_vecs[14]  =  2'b10;
      test_vecs[15]  =  2'b10;
      test_vecs[16]  =  2'b10;
      test_vecs[17]  =  2'b10;
      test_vecs[18]  =  2'b11;
      test_vecs[19]  =  2'b11;
      test_vecs[20]  =  2'b11;
      test_vecs[21]  =  2'b11;
      test_vecs[22]  =  2'b11;
      test_vecs[23]  =  2'b10;
      test_vecs[24]  =  2'b10;
      test_vecs[25]  =  2'b10;
      test_vecs[26]  =  2'b10;
      test_vecs[27]  =  2'b10;
      test_vecs[28]  =  2'b10;
      test_vecs[29]  =  2'b10;
      test_vecs[30]  =  2'b10;
      test_vecs[31]  =  2'b10;
      test_vecs[32]  =  2'b10;
      test_vecs[33]  =  2'b10;
      test_vecs[34]  =  2'b10;
      test_vecs[35]  =  2'b10;
      test_vecs[36]  =  2'b10;
      test_vecs[37]  =  2'b10;
      test_vecs[38]  =  2'b10;
      test_vecs[39]  =  2'b00;
  end

   initial {i, i_c} = 0;
   
   regex regex_0 (clk, reset, i, i_c, o);
   
   initial begin
      #50 for(k=0;k<`TESTVECS;k=k+1)
	begin #10 {i, i_c}=test_vecs[k];
	if (o == 1'b1)
	       begin
		  $display("Pattern matched at line number: %d", k+1);
	       end  end
	
      #100 $finish;
   end
endmodule
