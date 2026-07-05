// ============================================
// 十六进制数码管显示 - 仿真测试
// 功能：覆盖 0~F 所有 16 种输入组合
// ============================================

`timescale 1ns/1ns

module hex_display_top_tb();

    // 仿真步长参数
    localparam STEP = 20;

    // 激励信号
    reg  [3:0] hex;
    // 输出信号
    wire [7:0] seg_out;

    // 实例化被测模块
    hex_display_top u_hex_display_top (
        .hex(hex),
        .seg(seg_out)
    );

    // 仿真激励序列
    initial begin
        // 生成波形文件
        $dumpfile("hex_display_top.vcd");
        $dumpvars(0, hex_display_top_tb);
        // 打印日志
        $monitor("Time=%0t: hex=%h, out=%b", $time, hex, seg_out);

        // 覆盖所有 16 种输入组合
        hex = 4'h0; #(STEP);
        hex = 4'h1; #(STEP);
        hex = 4'h2; #(STEP);
        hex = 4'h3; #(STEP);
        hex = 4'h4; #(STEP);
        hex = 4'h5; #(STEP);
        hex = 4'h6; #(STEP);
        hex = 4'h7; #(STEP);
        hex = 4'h8; #(STEP);
        hex = 4'h9; #(STEP);
        hex = 4'hA; #(STEP);
        hex = 4'hB; #(STEP);
        hex = 4'hC; #(STEP);
        hex = 4'hD; #(STEP);
        hex = 4'hE; #(STEP);
        hex = 4'hF; #(STEP);

        // 结束仿真
        $finish;
    end

endmodule
