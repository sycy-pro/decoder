module tea_asmd_x64(
    input clk,
    input rst,
    input ena,
    input start,
    input [63:0] data,
    input [127:0] key,
    
    output [63:0] res,
    output rdy
);

wire rdy0, rdy1, rdy2, rdy3, rdy4, rdy5, rdy6, rdy7;
wire [63:0] res0 ,res1, res2, res3, res4, res5, res6, res7;

assign rdy = rdy0 & rdy1 & rdy2 & rdy3 & rdy4 & rdy5 & rdy6 & rdy7;

assign res = rdy0 ? res0 :
             rdy1 ? res1 :
             rdy2 ? res2 :
             rdy3 ? res3 :
             rdy4 ? res4 :
             rdy5 ? res5 :
             rdy6 ? res6 : 
             rdy7 ? res7 : 64'h0;
             

tea_asmd_x8 tea_asmd_x8_0
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res0),
	.rdy(rdy0)
);

tea_asmd_x8 tea_asmd_x8_1
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res1),
	.rdy(rdy1)
);

tea_asmd_x8 tea_asmd_x8_2
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res2),
	.rdy(rdy2)
);

tea_asmd_x8 tea_asmd_x8_3
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res3),
	.rdy(rdy3)
);

tea_asmd_x8 tea_asmd_x8_4
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res4),
	.rdy(rdy4)
);

tea_asmd_x8 tea_asmd_x8_5
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res5),
	.rdy(rdy5)
);

tea_asmd_x8 tea_asmd_x8_6
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res6),
	.rdy(rdy6)
);

tea_asmd_x8 tea_asmd_x8_7
(
	.clk(clk),
	.rst(rst),
	.ena(ena),
	.start(start),
	.data(data),
	.key(key),
	.res(res7),
	.rdy(rdy7)
);


endmodule