// ============================================
// 二选一多路器 (MUX2)
// 功能：sel=0 → out=a；sel=1 → out=b
// ============================================

module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);

    assign out = sel ? b : a;

endmodule
