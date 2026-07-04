// ============================================
// 二选一多路器 (MUX2)
// 功能：sel=0 选通 a；sel=1 选通 b
// 仿真：正逻辑直通
// 烧录：负逻辑适配（按键按下为0，LED点亮为0）
// ============================================

module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);

`ifdef SIM
    // 仿真模式：教科书标准二选一
    assign out = sel ? b : a;
`else
    // 烧录模式：负逻辑适配（a, b 取反；sel 不取反；输出取反）
    wire a_n = ~a;
    wire b_n = ~b;
    assign out = ~(sel ? b_n : a_n);
`endif

endmodule
