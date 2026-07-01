`timescale 1ns/1ns

module and_gate_tb();

    // 仿真步长参数（便于统一修改）
    localparam STEP = 20;

    // 激励信号（reg 类型，在 initial 块中赋值）
    reg a, b;

    // 输出信号（wire 类型，连接 DUT）
    wire and_gate_out;

    // 实例化被测模块（DUT = Device Under Test）
    and_gate u_and_gate(
        .a(a),
        .b(b),
        .out(and_gate_out)
    );

    initial begin
        // 波形输出（必须保留）
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        // 终端打印日志（便于调试）
        $monitor("Time=%0t: a=%b, b=%b, out=%b", 
                 $time, a, b, and_gate_out);

        // ============================================
        // 激励序列：覆盖所有 4 种输入组合
        // ============================================
        a = 0; b = 0; #(STEP);
        a = 0; b = 1; #(STEP);
        a = 1; b = 0; #(STEP);
        a = 1; b = 1; #(STEP);

        // 结束仿真
        $finish;
    end

endmodule
