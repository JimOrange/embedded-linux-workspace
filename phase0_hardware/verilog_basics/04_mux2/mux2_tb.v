`timescale 1ns/1ns

module mux2_tb();

    // 仿真步长参数（便于统一修改）
    localparam STEP = 20;

    // 激励信号（reg 类型，在 initial 块中赋值）
    reg a, b, sel;

    // 输出信号（wire 类型，连接 DUT）
    wire mux2_out;

    // 实例化被测模块（DUT = Device Under Test）
    mux2 u_mux2(
        .a(a),
        .b(b),
        .sel(sel),
        .out(mux2_out)
    );

    initial begin
        // 波形输出（必须保留）
        $dumpfile("mux2.vcd");
        $dumpvars(0, mux2_tb);

        // 终端打印日志（便于调试）
        $monitor("Time=%0t: sel=%b, a=%b, b=%b, out=%b", 
                 $time, sel, a, b, mux2_out);

        // ============================================
        // 激励序列：覆盖所有 8 种输入组合
        // ============================================
        // sel=0 时，输出跟随 a
        sel = 0; b = 0; a = 0; #(STEP);
        sel = 0; b = 0; a = 1; #(STEP);
        sel = 0; b = 1; a = 0; #(STEP);
        sel = 0; b = 1; a = 1; #(STEP);

        // sel=1 时，输出跟随 b
        sel = 1; b = 0; a = 0; #(STEP);
        sel = 1; b = 0; a = 1; #(STEP);
        sel = 1; b = 1; a = 0; #(STEP);
        sel = 1; b = 1; a = 1; #(STEP);

        // 结束仿真
        $finish;
    end

endmodule
