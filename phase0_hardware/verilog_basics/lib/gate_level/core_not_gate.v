// ============================================
// 非门核心模块（正逻辑）
// 功能：out = ~a
// 用途：可复用的基础逻辑库
// ============================================

module not_gate (
    input  wire a,
    output wire out
);
    assign out = ~a;
endmodule
