# 🧭 embedded-linux-workspace

> A systematic, hands-on journey from C++ developer to embedded Linux engineer.  
> Focus: BSP, Linux kernel drivers, system programming, FPGA, CPU design.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: TaishanPi](https://img.shields.io/badge/Platform-TaishanPi-brightgreen)](https://wiki.lckfb.com/zh-hans/tspi-rk3566/)
[![FPGA: LogicPi G1](https://img.shields.io/badge/FPGA-LogicPiG1-blue)](https://wiki.lckfb.com/zh-hans/fpga-ljpi/)

---

## 📌 About Me

- **15+ years** of C++ development experience (MFC / Windows desktop)
- **2026**: Started a structured transition to embedded Linux and system-level programming
- **Motivation**: Build from the bottom up — understand computers not just as a user, but as an engineer who can design and debug the full stack
- **Daily learning**: ~30 hours/week, combining theory (CSAPP / OSTEP) with hands-on hardware projects (TaishanPi / LogicPi G1)
- **Target industries**: Robotics, Autonomous Driving, Semiconductor

---

## 🎯 Learning Roadmap

| Phase | Focus | Platform | Key Deliverable | Status |
|:---|:---|:---|:---|:---:|
| **0** | CPU Design & FPGA | LogicPi G1 (GOWIN GW2A) | 5-stage pipelined CPU | 🔄 In Progress |
| **1** | OS Theory + System Programming | TaishanPi (RK3566) | Character Device Driver | 📋 Planned |
| **2** | Linux Kernel & BSP | TaishanPi | Custom Buildroot + Device Tree | 📋 Planned |
| **3** | Networking + Full Stack Project | TaishanPi | Robot Controller (Web + Driver) | 📋 Planned |

---

## 📚 Core Tech Stack

| Domain | Technologies |
|:---|:---|
| **Languages** | C, C++ (C++98/11/14), Verilog |
| **Linux** | Kernel modules, device trees, U-Boot, Buildroot, cross-compilation |
| **System Programming** | POSIX, pthread, IPC, epoll, socket programming |
| **Embedded HW** | ARM Cortex-A55, I2C, SPI, UART, GPIO, PWM |
| **FPGA** | GOWIN, Verilog, simulation |
| **Debug / Perf** | gdb, perf, trace-cmd, dmesg |
| **Tools** | Git, Docker, Make, CMake |

---

## 🗂️ Repository Structure

```
embedded-linux-workspace/
├── phase0_hardware/           # FPGA / CPU design (in progress)
│   ├── verilog_basics/        # Basic modules: adder, mux, counter
│   ├── ddca_arm_notes/        # ARM edition reading notes
│   ├── ddca_rv_notes/         # RISC-V edition comparison
│   └── pipelined_cpu/         # 5-stage pipelined CPU implementation
├── phase1_system/             # OS + System programming
├── phase2_kernel/             # Linux kernel + BSP
├── phase3_network/            # Networking + Final Project
└── docs/                      # Blog posts, notes, videos
    ├── blog_posts/
    └── project_videos/
```

---

## 🔧 Key Completed Projects

### 1. TaishanPi System Bring-up
- Compiled SDK (Buildroot) for RK3566
- Modified device tree to enable HDMI audio and disable DSI
- Configured Wi-Fi auto-connect on boot

### 2. 3.1-inch MIPI Display
- Enabled landscape mode by using rotate perperty of dts
- Learn modifying panel initialization sequence

---

## 🧪 How to Use This Repository

Each subdirectory contains its own README with specific instructions.

### Example: Build a kernel module on TaishanPi

```bash
cd phase1_system/character_driver/
make
insmod myled.ko
echo 1 > /dev/myled
```

---

## 📝 Blog & Progress Log

- **Technical Blog**: [Write regularly on problems solved and lessons learned]
- **Project Videos**: [Record each phase demo]

---

## 🎯 Career Goal

| Aspect | Description |
|:---|:---|
| **Target Role** | Embedded Linux Engineer / BSP Engineer |
| **Target Industries** | Robotics, Autonomous Driving, Semiconductor |
| **Expected Timeline** | 1.6–2.7 years (already started) |
| **Location** | Guangzhou, China |

---

## 📫 Contact

- **GitHub**: [jimorange](https://github.com/jimorange)
- **Email**: 87614722@qq.com

---

## 📄 License

MIT License — free to use, learn, and build upon.
