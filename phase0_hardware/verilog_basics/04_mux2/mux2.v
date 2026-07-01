// ============================================
// 二选一多路器 (MUX2)
// 功能：sel=0 选通 a；sel=1 选通 b
// ============================================

module mux2 (
    input  wire a,      // 输入 a
    input  wire b,      // 输入 b
    input  wire sel,    // 选择信号
    output wire out     // 输出（组合逻辑，用 wire）
);

    // 使用条件运算符实现二选一
    assign out = (sel == 0) ? a : b;

endmodule