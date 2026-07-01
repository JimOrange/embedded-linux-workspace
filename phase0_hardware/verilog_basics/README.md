# Verilog 基础模块实验集

> **适用对象**：FPGA / 数字电路初学者
> **硬件平台**：逻辑派 G1 (高云 GW2A-LV18PG256C8/I7)
> **开发环境**：macOS (M3 Max) + Icarus Verilog + GTKWave

---

## 📌 实验列表

| 编号 | 模块名 | 功能描述 | 仿真状态 | 上板状态 |
|:---:|--------|----------|:---:|:---:|
| 01 | `and_gate` | 二输入与门 | ✅ | ✅ |
| 02 | `or_gate` | 二输入或门 | ✅ | ✅ |
| 03 | `not_gate` | 非门 | ✅ | ✅ |
| 04 | `mux2` | 二选一多路器 | ✅ | ✅ |
| 05 | `decoder_3_8` | 3-8译码器 | ✅ | 🔄 |

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
本项目在根目录提供了自动化脚本 scripts/sim.sh。你无需记忆任何编译命令，只需三步即可完成仿真并查看波形。

第一步：进入任意实验目录（以04_mux2为例）
```bash
cd phase0_hardware/verilog_basics/04_mux2
```

第二步：运行仿真脚本
```bash
../scripts/sim.sh
```

如果第一次运行提示 Permission denied，请先执行：
```bash
chmod +x ../scripts/sim.sh
```
然后再运行 ../scripts/sim.sh。

第三步：查看自动弹出的 GTKWave 波形窗口
脚本会自动完成编译、仿真、清理中间文件，并打开 GTKWave 加载波形。
成功的终端输出示例

```bash
$ ../scripts/sim.sh
```

```txt
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
mux2_tb.v:36: $finish called at 160 (1ns)
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
