// Two-input and gate test-bench
`timescale 1ns / 1ps  // Corrected timescale declaration

`include "and2.v"  // Corrected include statement and removed unnecessary space

module and2_tb();  // Corrected module name

  reg a;
  reg b;
  wire u;

  and2 iand2(a, b, u);  // Corrected module instantiation

  initial begin
    $dumpfile("and2.vcd");
    $dumpvars(0, and2_tb);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end

endmodule
