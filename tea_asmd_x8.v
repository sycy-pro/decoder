module tea_asmd_x8(
    input clk,
    input rst,
    input ena,
    input start,
    input [63:0] data,
    input [127:0] key,
    
    output valid,
    output rdy
);

wire rdy0, rdy1, rdy2, rdy3, rdy4, rdy5, rdy6, rdy7;
wire valid0 ,valid1, valid2, valid3, valid4, valid5, valid6, valid7;

assign rdy = rdy0 & rdy1 & rdy2 & rdy3 & rdy4 & rdy5 & rdy6 & rdy7;
assign valid = valid0 | valid1 | valid2 | valid3 | valid4 | valid5 | valid6 | valid7;
             

tea_asmd tea_asmd_0
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid0),
	.rdy(rdy0)
);


tea_asmd tea_asmd_1
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid1),
	.rdy(rdy1)
);


tea_asmd tea_asmd_2
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid2),
	.rdy(rdy2)
);

tea_asmd tea_asmd_3
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid3),
	.rdy(rdy3)
);

tea_asmd tea_asmd_4
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid4),
	.rdy(rdy4)
);

tea_asmd tea_asmd_5
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid5),
	.rdy(rdy5)
);

tea_asmd tea_asmd_6
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid6),
	.rdy(rdy6)
);

tea_asmd tea_asmd_7
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.valid(valid7),
	.rdy(rdy7)
);


endmodule