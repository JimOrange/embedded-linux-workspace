// ============================================
// 与门 (AND)
// 功能：只有当 a 和 b 都为 1 时，out 才为 1
// ============================================

module and_gate (
    input  wire a,      // 输入 a
    input  wire b,      // 输入 b
    output wire out     // 输出（组合逻辑，用 wire）
);

    // 使用条件运算符实现与门功能
    assign out = a & b;

endmodule
