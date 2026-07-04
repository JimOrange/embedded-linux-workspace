// ============================================
// 三八译码器（门级实现）仿真测试
// 功能：覆盖所有 8 种输入组合
// ============================================

`timescale 1ns/1ns

module decoder_3_8_gate_tb();

    localparam STEP = 20;

    reg [2:0] in;
    wire [7:0] out;

    decoder_3_8_gate u_decoder (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("decoder_3_8_gate.vcd");
        $dumpvars(0, decoder_3_8_gate_tb);
        $monitor("Time=%0t: in=%b, out=%b", $time, in, out);

        in = 3'b000; #(STEP);
        in = 3'b001; #(STEP);
        in = 3'b010; #(STEP);
        in = 3'b011; #(STEP);
        in = 3'b100; #(STEP);
        in = 3'b101; #(STEP);
        in = 3'b110; #(STEP);
        in = 3'b111; #(STEP);

        $finish;
    end

endmodule
