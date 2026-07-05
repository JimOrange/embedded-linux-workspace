# 06 - 3-8 译码器数码管显示

> 实验目标：将 3-8 译码器的输出通过八段译码器转换，在数码管上显示数字 0~7。


## 设计说明

本实验展示了一个完整的组合逻辑链路：

```
输入 (3位) → 3-8 译码器 → 独热码 (8位) → 八段译码器 → 段码 (8位) → 数码管
```

### 模块说明

| 模块 | 说明 |
|------|------|
| `decoder_3_8` | 行为级 3-8 译码器（来自 `lib/behavioral/`） |
| `eight_seg_decoder` | 八段译码器，本实验专用（不放入 lib） |


## 真值表

| input_data[2:0] | 独热码 | 数码管显示 |
|:---:|:---:|:---:|
| 000 | 00000001 | 0 |
| 001 | 00000010 | 1 |
| 010 | 00000100 | 2 |
| 011 | 00001000 | 3 |
| 100 | 00010000 | 4 |
| 101 | 00100000 | 5 |
| 110 | 01000000 | 6 |
| 111 | 10000000 | 7 |


## Verilog 实现

```verilog
module decoder_3_8_display_top (
    input  wire [2:0] input_data,
    output wire [7:0] out_seg
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
        .data_in(onehot),
        .seg_out(out_seg)
    );

endmodule
```


## 硬件验证（逻辑派 G1）

### 引脚分配

| 模块端口 | FPGA 管脚 | 连接外设 | 电平特性 |
|:---:|:---:|:---|:---|
| input_data[2] | F10 | KEY1（左侧按键） | 低电平有效，烧录时取反 |
| input_data[1] | D11 | KEY0（右侧按键） | 低电平有效，烧录时取反 |
| input_data[0] | M6 | 扩展排针（右侧 15 号） | 跳线帽直控，不取反 |
| out_seg[7] | L14 | 数码管 DP（小数点） | 共阳，低电平点亮 |
| out_seg[6] | G11 | 数码管 G 段 | 共阳，低电平点亮 |
| out_seg[5] | G12 | 数码管 F 段 | 共阳，低电平点亮 |
| out_seg[4] | H14 | 数码管 E 段 | 共阳，低电平点亮 |
| out_seg[3] | H13 | 数码管 D 段 | 共阳，低电平点亮 |
| out_seg[2] | H12 | 数码管 C 段 | 共阳，低电平点亮 |
| out_seg[1] | H16 | 数码管 B 段 | 共阳，低电平点亮 |
| out_seg[0] | G13 | 数码管 A 段 | 共阳，低电平点亮 |


## 仿真波形

![仿真波形](./decoder_3_8_display_sim_waveform.png)


## RTL 视图

![RTL视图](./decoder_3_8_display_rtl.png)


## 设计心得

- 展示了模块组合的思路：`decoder_3_8` + `eight_seg_decoder`
- `eight_seg_decoder` 是本实验专用模块，不放入 lib
- 实验 7 将引入通用 `hex_7seg`，支持 0~F 显示


## 完成日期

2026-07-05
