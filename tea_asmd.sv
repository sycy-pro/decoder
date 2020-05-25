 module tea_asmd(
    input clk,
    input rst,
    input ena,
    input start,
    input [63:0] data,
    input [47:0] key,
    
    output valid,
    output [47:0] key_out
);


localparam DELTA = 32'h9E3779B9;


localparam STATE_SIZE = 2;
localparam [STATE_SIZE-1:0] idle = 2'h0,
                            deco = 2'h1,
                            fini = 2'h2;


reg [STATE_SIZE-1:0] state_reg, state_next;

reg [47:0] key_reg, key_next;
reg [31:0] v0_reg, v0_next;
reg [31:0] v1_reg, v1_next;
reg [31:0] sum_reg, sum_next;
reg [5:0] cnt_reg, cnt_next;


wire [63:0] v;
assign v = {v0_reg, v1_reg};

reg rdy_reg, rdy_next;


assign valid = v[63:32] == 32'h46445025 && v[23:16] == 8'h2e && v[7:0] == 8'h2d;
//assign valid = v == 64'h417eb462f765c165;
assign rdy = rdy_reg;


wire [31:0] k0, k1, k2, k3;


assign k3 = {key_reg[7:0], key_reg[15:8], key_reg[23:16], key_reg[31:24]};
assign k2 = {key_reg[39:32], key_reg[47:40], "ht"};
assign k1 = " si "; //key_reg[95:64];
assign k0 = "kluh"; //key_reg[127:96];

assign key_out = key_reg;

always @(posedge clk, posedge rst) begin
    if(rst) begin
        state_reg <= idle;
    end else if(ena) begin
        state_reg <= state_next;
    end
end


always @(posedge clk, posedge rst) begin
    if(rst) begin
        v0_reg <= 32'h00_00_00_00;
        v1_reg <= 32'h00_00_00_00;
        sum_reg <= 32'h00_00_00_00;
        cnt_reg <= 5'b00000;
        key_reg <= 48'h00000000_0000;
    end else if(ena) begin
        v0_reg <= v0_next;
        v1_reg <= v1_next;
        sum_reg <= sum_next;
        cnt_reg <= cnt_next;
        key_reg <= key_next;
    end
end


always @(*) begin
    case(state_reg) 
        idle: state_next = start ? deco : idle;
        deco: state_next = cnt_next >= 32 ? fini : deco;
        fini: state_next = idle;
    endcase
end


always @(*) begin
    v0_next = v0_reg;
    v1_next = v1_reg;
    sum_next = sum_reg;
    cnt_next = cnt_reg;
    key_next = key_reg;
    
    case(state_reg) 
        idle: begin
            if(start) begin
                v0_next = data[63:32];//{data[39:32], data[47:40], data[55:48], data[63:56]};
                v1_next = data[31:0];//{data[7:0], data[15:8], data[23:16], data[31:24]};
                cnt_next = 6'h0;
                sum_next = 32'hC6EF3720;
                key_next = key;
            end
        end
        deco: begin
            sum_next = sum_reg - DELTA;
            v1_next = v1_reg - (((v0_reg >> 5) + k3) ^ (v0_reg + sum_reg) ^ ((v0_reg << 4) + k2));
            v0_next = v0_reg - ((v1_next + sum_reg) ^ ((v1_next >> 5) + k1) ^ ((v1_next << 4) + k0));
            cnt_next = cnt_reg + 5'd1;
        end
    endcase
end


endmodule