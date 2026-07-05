// ============================================
// 数码管显示 0~7（顶层适配层）
// 功能：3-8 译码器 + 八段译码器 → 数码管显示
// 
// 硬件说明：
//   - in[2]、in[1] 来自按键（低电平有效），需取反
//   - in[0] 来自跳线帽（直接控制电平），不取反
//   - 数码管为共阳（低电平点亮），输出需取反
// ============================================

`include "../lib/behavioral/decoder_3_8.v"

module decoder_3_8_display_top (
    input  wire [2:0] input_data,   // 物理输入
    output wire [7:0] out_seg       // 8 位段码输出
);

    wire [2:0] logic_in;
    wire [7:0] onehot;

`ifdef SIM
    assign logic_in = input_data;
`else
    assign logic_in[2] = ~input_data[2];
    assign logic_in[1] = ~input_data[1];
    assign logic_in[0] = input_data[0];
`endif

    decoder_3_8 u_decoder (
        .in(logic_in),
        .out(onehot)
    );

    eight_seg_decoder u_seg (
        .onehot(onehot),
        .seg(out_seg)
    );

endmodule
