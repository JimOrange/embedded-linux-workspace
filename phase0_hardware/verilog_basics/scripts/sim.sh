#!/bin/bash
# ============================================
# 通用 FPGA 仿真脚本 (Icarus + GTKWave)
# 用法：在包含 .v 文件的目录下执行此脚本
# ============================================

set -e

# 获取当前所在的实验目录（即你执行脚本的地方）
PROJECT_DIR="$(pwd)"

echo "======================================"
echo "🚀 FPGA 仿真流程 (Icarus + GTKWave)"
echo "📁 项目目录: $PROJECT_DIR"
echo "======================================"

# 检查是否有 .v 文件
V_FILES=$(ls *.v 2>/dev/null)
if [ -z "$V_FILES" ]; then
    echo "❌ 错误：当前目录下没有找到 .v 文件！"
    exit 1
fi
echo "📁 检测到文件："
ls *.v | sed 's/^/   /'

# 清理旧文件
rm -f sim_top *.vcd 2>/dev/null

# 编译
echo ""
echo "🔨 正在编译..."
iverilog -o sim_top -D SIM *.v
echo "✅ 编译成功！"

# 运行仿真
echo ""
echo "⚡ 正在运行仿真..."
./sim_top
echo "✅ 仿真运行完成！"

# 查找波形文件
VCD_FILE=$(ls *.vcd 2>/dev/null | head -n 1)
if [ -z "$VCD_FILE" ]; then
    echo ""
    echo "❌ 错误：未找到 .vcd 波形文件！"
    echo "请检查 testbench 文件是否包含："
    echo '   $dumpfile("xxx.vcd");'
    echo '   $dumpvars(0, your_module);'
    exit 1
fi

# 清理临时可执行文件
rm -f sim_top
echo "🧹 已清理临时文件 sim_top"

# 打开 GTKWave
echo ""
echo "📊 打开波形文件：$VCD_FILE"
gtkwave "$VCD_FILE" &

echo ""
echo "======================================"
echo "✅ 全部完成！GTKWave 已启动"
echo "======================================"
