// ============================================
// 门级二选一多路器（核心逻辑）
// 功能：sel=0 选通 a；sel=1 选通 b
// 注：输入输出均为正逻辑
// ============================================
`include "../lib/core_and_gate.v"
`include "../lib/core_or_gate.v"
`include "../lib/core_not_gate.v"

module my_mux2_core (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);
    wire sel_n, and_a, and_b;

    not_gate u_not (.a(sel), .out(sel_n));
    and_gate u_and_a (.a(sel_n), .b(a), .out(and_a));
    and_gate u_and_b (.a(sel), .b(b), .out(and_b));
    or_gate  u_or   (.a(and_a), .b(and_b), .out(out));
endmodule
