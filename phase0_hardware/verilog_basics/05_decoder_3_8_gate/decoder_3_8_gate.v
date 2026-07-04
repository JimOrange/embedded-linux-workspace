// ============================================
// 三八译码器（门级实现）
// 功能：in=000 → out[0]=1, in=001 → out[1]=1, ..., in=111 → out[7]=1
// 
// 本实验是最后一个使用门级电路手工搭建的模块。
// 通过这个实验，我完成了对数字电路门级结构的深入理解。
// 后续所有模块将直接使用行为级描述（assign、always、case），
// 让综合器自动生成最优电路结构。
// ============================================

`include "../lib/core_and_gate.v"
`include "../lib/core_not_gate.v"

module decoder_3_8_gate (
    input  wire [2:0] in,
    output wire [7:0] out
);

    // 三个输入的反相信号
    wire [2:0] in_n;

    // 非门：对三个输入取反
    not_gate u_not0 (.a(in[0]), .out(in_n[0]));
    not_gate u_not1 (.a(in[1]), .out(in_n[1]));
    not_gate u_not2 (.a(in[2]), .out(in_n[2]));

    // 中间节点：每个输出由两个与门级联实现三输入与门
    wire t0, t1, t2, t3, t4, t5, t6, t7;

    //000 -> 0000_0001
    and_gate u_and0_0 (.a(in_n[2]), .b(in_n[1]), .out(t0));
    and_gate u_and0_1 (.a(t0), .b(in_n[0]), .out(out[0]));

    //001 -> 0000_0010
    and_gate u_and1_0 (.a(in_n[2]), .b(in_n[1]), .out(t1));
    and_gate u_and1_1 (.a(t1), .b(in[0]), .out(out[1]));

    //010 -> 0000_0100
    and_gate u_and2_0 (.a(in_n[2]), .b(in[1]), .out(t2));
    and_gate u_and2_1 (.a(t2), .b(in_n[0]), .out(out[2]));

    //011 -> 0000_1000
    and_gate u_and3_0 (.a(in_n[2]), .b(in[1]), .out(t3));
    and_gate u_and3_1 (.a(t3), .b(in[0]), .out(out[3]));

    //100 -> 0001_0000
    and_gate u_and4_0 (.a(in[2]), .b(in_n[1]), .out(t4));
    and_gate u_and4_1 (.a(t4), .b(in_n[0]), .out(out[4]));

    //101 -> 0010_0000
    and_gate u_and5_0 (.a(in[2]), .b(in_n[1]), .out(t5));
    and_gate u_and5_1 (.a(t5), .b(in[0]), .out(out[5]));

    //110 -> 0100_0000
    and_gate u_and6_0 (.a(in[2]), .b(in[1]), .out(t6));
    and_gate u_and6_1 (.a(t6), .b(in_n[0]), .out(out[6]));

    //111 -> 1000_0000
    and_gate u_and7_0 (.a(in[2]), .b(in[1]), .out(t7));
    and_gate u_and7_1 (.a(t7), .b(in[0]), .out(out[7]));

endmodule
