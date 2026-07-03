// ============================================
// 与门核心模块（正逻辑）
// 功能：out = a & b
// 用途：可复用的基础逻辑库
// ============================================

module core_and_gate (
    input  wire a,
    input  wire b,
    output wire out
);
    assign out = a & b;
endmodule
