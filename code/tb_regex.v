`timescale 1 ns / 100 ps
`define WIDTH 21
`define DEPTH 10000


module tb;

   integer j, k;

   reg 	   clk, reset;
   reg 	   i, i_c;
   wire    o;
   reg [`WIDTH-1:0] input_file_data [0:`DEPTH-1];

   /* 
    * Uncomment the following line if you want to capture the waveforms
    * for viewing them on a waveform viewer such as gtkwave
    */

   initial begin $dumpfile("regex.vcd"); $dumpvars(0,tb); end
   initial begin reset = 1'b1; #12.5 reset = 1'b0; end
   initial clk = 1'b0; always #5 clk =~ clk;
   initial $readmemb("input-data-file.txt", input_file_data);

   initial {i, i_c} = 2'b10;
   regex regex_0 (clk, reset, i, i_c, o);

   initial
     begin
	#15 for (j = 0; j < `DEPTH; j = j + 1)
	  begin
	     #10 for (k = `WIDTH-1; k >= 0 ; k = k - 1)
	       begin
		  #10 {i_c} = input_file_data[j][k];
	       end

	     #10 if (o == 1'b1)
	       begin
		  $display("Pattern matched at line number: %d", j+1);
	       end
	  end
	#300 $finish;
     end

endmodule
