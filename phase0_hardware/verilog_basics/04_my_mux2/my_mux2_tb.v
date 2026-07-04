// ============================================
// my_mux2 仿真测试
// 功能：覆盖所有 8 种输入组合
// ============================================

`timescale 1ns/1ns

module my_mux2_tb();

    localparam STEP = 20;

    reg a, b, sel;
    wire out;

    my_mux2 u_my_mux2 (
        .a(a),
        .b(b),
        .sel(sel),
        .out(my_mux2_out)
    );

    initial begin
        $dumpfile("my_mux2.vcd");
        $dumpvars(0, my_mux2_tb);
        $monitor("Time=%0t: sel=%b, a=%b, b=%b, out=%b",
                 $time, sel, a, b, my_mux2_out);

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

        $finish;
    end

endmodule
