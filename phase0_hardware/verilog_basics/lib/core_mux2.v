// ============================================
// 二选一多路器 (MUX2)
// 功能：sel=0 选通 a；sel=1 选通 b
// ============================================

module core_mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);
    assign out = (sel == 0) ? a : b;
endmodule
