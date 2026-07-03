# Verilog 基础模块实验集

> **适用对象**：FPGA / 数字电路初学者
>
> **硬件平台**：逻辑派 G1（高云 GW2A-LV18PG256C8/I7）
>
> **开发环境**：macOS（M3 Max）+ Icarus Verilog + GTKWave


## 📌 实验列表

| 编号 | 模块名 | 功能描述 | 仿真状态 | 上板状态 |
|:---:|--------|----------|:---:|:---:|
| 01 | `and_gate` | 二输入与门 | ✅ | ✅ |
| 02 | `or_gate` | 二输入或门 | ✅ | ✅ |
| 03 | `not_gate` | 非门 | ✅ | ✅ |
| 04 | `mux2` | 二选一多路器 | ✅ | ✅ |
| 05 | `decoder_3_8` | 3-8译码器 | ✅ | 🔄 |


## 硬件说明（逻辑派 G1）

### 1. 按键（低电平有效）

逻辑派 G1 的板载按键通过上拉电阻连接到 3.3V，按下时引脚对地短路。

| 状态 | 引脚电平 | 逻辑值 |
|------|----------|--------|
| 松开 | 3.3V | 1（高电平） |
| 按下 | 0V | 0（低电平） |

结论：按键是**低电平有效**（按下为 0，松开为 1）。

### 2. LED（低电平点亮）

逻辑派 G1 的板载 LED 采用共阳接法，LED 正极通过限流电阻接 3.3V，负极连接 FPGA 引脚。

| 状态 | 引脚电平 | LED 状态 |
|------|----------|----------|
| 输出 1 | 3.3V | 熄灭 |
| 输出 0 | 0V | 点亮 |

结论：LED 是**低电平点亮**（输出 0 亮，输出 1 灭）。

### 3. 负逻辑对 Verilog 代码的影响

由于输入和输出都是低电平有效，整个系统工作在**负逻辑**下。这会影响布尔表达式的理解：

- 物理层：`按键按下 = 0`，`LED 亮 = 0`
- 逻辑层：`事件发生 = 0`（而不是通常的 1）

在编写 Verilog 代码时，需要根据实际期望的物理行为来调整逻辑表达式，而不是直接套用正逻辑下的标准表达式。

### 4. 可用引脚

以下引脚经测试可作为普通用户 I/O 使用：

| 引脚 | 板载外设 | 备注 |
|------|----------|------|
| D11 | KEY0 | 按键输入 |
| F10 | KEY1 | 按键输入 |
| R9 | LED2 红色 | LED 输出 |
| R7 | LED2 蓝色 | LED 输出 |
| N6 | LED3 红色 | LED 输出 |
| P7 | LED3 蓝色 | LED 输出 |
| M6 | 扩展排针 | 自由 I/O |

以下引脚为专用配置引脚，请勿用作普通 I/O：

| 引脚 | 功能 | 说明 |
|------|------|------|
| C10 | SSPI_CS_N | SPI 配置片选 |
| T10 | SSPI 数据脚 | SPI 配置数据 |

> 完整引脚定义请参考逻辑派 G1 官方引脚分配表。

---

## 🛠️ 环境准备（第一次使用需要做的）

### 1. 安装仿真工具

在 Mac 终端中执行以下命令：

```bash
# 安装 Homebrew（如已安装可跳过）
/bin/bash -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

# 安装 Icarus Verilog
brew install icarus-verilog

# 安装 GTKWave（使用社区维护版本，兼容 Apple Silicon）
brew tap randomplum/gtkwave
brew install --HEAD randomplum/gtkwave/gtkwave

# 验证安装是否成功
iverilog -v
gtkwave --version
```


### 2. 🚀 如何运行仿真？（标准操作流程——使用脚本）

本项目在根目录提供了自动化脚本 `scripts/sim.sh`。你无需记忆任何编译命令，只需三步即可完成仿真并查看波形。

#### 第一步：进入任意实验目录（以04_mux2为例）

```bash
cd phase0_hardware/verilog_basics/04_mux2
```

#### 第二步：运行仿真脚本

```bash
../scripts/sim.sh
```

如果第一次运行提示 `Permission denied`，请先执行：

```bash
chmod +x ../scripts/sim.sh
```

然后再运行 `../scripts/sim.sh`。

#### 第三步：查看自动弹出的 GTKWave 波形窗口

脚本会自动完成编译、仿真、清理中间文件，并打开 GTKWave 加载波形。

#### 成功的终端输出示例

```bash
$ ../scripts/sim.sh
======================================
🚀 FPGA 仿真流程 (Icarus + GTKWave)
📁 项目目录: /.../embedded-linux-workspace/phase0_hardware/verilog_basics/04_mux2
======================================
📁 检测到文件：
   mux2_tb.v
   mux2.v

🔨 正在编译...
✅ 编译成功！

⚡ 正在运行仿真...
VCD info: dumpfile mux2.vcd opened for output.
Time=0: sel=0, a=0, b=0, out=0
Time=20: sel=0, a=1, b=0, out=1
Time=40: sel=0, a=0, b=1, out=0
Time=60: sel=0, a=1, b=1, out=1
Time=80: sel=1, a=0, b=0, out=0
Time=100: sel=1, a=1, b=0, out=0
Time=120: sel=1, a=0, b=1, out=1
Time=140: sel=1, a=1, b=1, out=1
mux2_tb.v:47: $finish called at 160 (1ns)
✅ 仿真运行完成！
🧹 已清理临时文件 sim_top

📊 打开波形文件：mux2.vcd

======================================
✅ 全部完成！GTKWave 已启动
======================================
```


### 3. 🧪 进阶操作：手动仿真（理解底层命令）

如果你想手动执行每一步来加深理解，可以不用脚本，自己敲命令：

```bash
# 1. 进入实验目录
cd phase0_hardware/verilog_basics/04_mux2

# 2. 编译
iverilog -o sim_top mux2.v mux2_tb.v

# 3. 运行仿真
./sim_top

# 4. 查看波形
gtkwave mux2.vcd

# 5. 清理（可选）
rm -f sim_top *.vcd
```

建议初学者先用脚本跑通流程，再手动执行一次理解底层。


## 📂 目录结构

```
verilog_basics/
├── README.md                # 本文档（总览）
├── scripts/
│   └── sim.sh               # 通用仿真脚本
├── lib/                     # 可复用基础库（正逻辑，无条件编译）
│   ├── core_and_gate.v
│   ├── core_or_gate.v
│   ├── core_not_gate.v
│   ├── core_mux2.v
│   └── ...
├── 01_and_gate/
│   ├── README.md
│   ├── and_gate.v
│   ├── and_gate_tb.v
│   └── and_gate_sim_waveform.png
├── 02_or_gate/...
├── 03_not_gate/...
├── 04_mux2/...
└── 05_decoder_3_8/...
```


## 📚 基础库（`lib/`）说明

本目录下的 `lib/` 文件夹存放可复用的基础逻辑模块，供后续更复杂的电路设计（如全加器、ALU、CPU等）直接调用。

### 1. 命名规范

| 前缀 | 含义 | 示例 |
|:---:|------|------|
| `core_` | 基础库模块（正逻辑，无条件编译） | `core_and_gate.v` |

所有 `lib/` 中的模块均采用**干净的正逻辑**（教科书标准），**不包含**条件编译（`ifdef SIM`）。它们只关注功能本身，与具体硬件平台无关，可在任何开发板上复用。

条件编译版本（用于适配逻辑派 G1 的负逻辑硬件）仅保留在各个实验目录中，作为教学示例。

### 2. 如何引用基础库？

在更复杂的模块中，可以通过以下方式引用 `lib/` 中的模块：

**方式一：在仿真脚本中指定搜索路径**

```bash
iverilog -o sim_top -I ./lib *.v
```

**方式二：在代码中使用 `include`**

```verilog
`include "core_and_gate.v"
```

**方式三：在 `sim.sh` 中统一配置**

在 `scripts/sim.sh` 的 `iverilog` 命令中添加 `-I ../lib` 参数，所有实验均可自动引用。

### 3. 已包含的基础模块

| 模块名 | 文件 | 功能 |
|--------|------|------|
| 与门 | `core_and_gate.v` | `out = a & b` |
| 或门 | `core_or_gate.v` | `out = a \| b` |
| 非门 | `core_not_gate.v` | `out = ~a` |
| 二选一多路器 | `core_mux2.v` | `sel=0` 选通 `a`，`sel=1` 选通 `b` |

> 更多模块将在后续实验中逐步添加到 `lib/` 中，以下是后续待实现模块：

| 模块名 | 文件 | 功能 |
|--------|------|------|
| 半加器 | `core_half_adder.v` | 求和 + 进位 |
| 全加器 | `core_full_adder.v` | 带进位的加法 |
| D触发器 | `core_d_ff.v` | 边沿触发存储单元 |


## 🔗 相关资源

- [逻辑派 G1 官方维基](https://wiki.lckfb.com/zh-hans/fpga-ljpi/index.html)
- [高云云源软件下载](https://www.gowinsemi.com/)
- [本仓库 GitHub 地址](https://github.com/JimOrange/embedded-linux-workspace)
