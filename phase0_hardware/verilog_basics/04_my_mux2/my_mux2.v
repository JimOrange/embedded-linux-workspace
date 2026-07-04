// ============================================
// 二选一多路器（物理适配层）
// 仿真：直接透传正逻辑
// 烧录：负逻辑适配（按键按下为0，LED点亮为0）
// ============================================

module my_mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);

    wire a_in, b_in, sel_in, core_out;

`ifdef SIM
    // 仿真模式：正逻辑直通
    assign a_in   = a;
    assign b_in   = b;
    assign sel_in = sel;
    assign out    = core_out;
`else
    // 烧录模式：负逻辑适配
    // a 和 b 来自按键，需要取反；sel 来自跳线帽，直接控制电平
    assign a_in   = ~a;
    assign b_in   = ~b;
    assign sel_in = sel;
    assign out    = ~core_out;
`endif

    // 核心逻辑只调用一次
    my_mux2_core u_core (
        .a(a_in),
        .b(b_in),
        .sel(sel_in),
        .out(core_out)
    );

endmodule
