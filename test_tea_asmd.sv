`timescale 1ns/1ns

module test_tea_asmd;
  
  logic [127:0] key;
  logic [63:0] data;
  
  logic clk;
  logic rst;
  logic ena;
  logic valid;
  logic rdy;
  logic start;
  
  integer i;
  
  tea_asmd tea_asmd_0
  (
      .clk(clk),
      .rst(rst),
      .ena(ena),
      .start(start),
      .data(data),
      .key(key),
      .valid(valid),
      .rdy(rdy)
  );
  
  logic [199:0] test_vector[5000:0];
  logic [7:0] expected_value;

  initial begin
    $readmemh("C:\\Users\\krzys\\Programs\\Verilog\\SYCY\\TEA_ASMD\\test_vector.txt", test_vector);
    rst <= 1; #10;
    rst <= 0;
    ena <= 1;
    start <= 1;
    i <= 0;
    #10;
  end
  
  always @(posedge rdy) begin
    {key, data, expected_value} = test_vector[i]; #10;
if({valid} != expected_value) begin
      $error("Invalid value at vector %d.", i);
    end //else $display("Valid value at vector %d.", i);
    i <= i + 1;
  end
  
  always begin
    clk <= 0; #5;
    clk <= 1; #5;
  end
  
endmodule