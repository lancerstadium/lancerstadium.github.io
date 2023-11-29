# Rule Based DBT 项目分析

> 参考资料：
>
> 1. [fudan-ppi/Rule_based_DBT](https://github.com/fudan-ppi/Rule_based_DBT)
> 2. [基于学习的动态二进制翻译方法](https://ppi.fudan.edu.cn/c0/cf/c36730a442575/page.htm)
> 2. [Linaro Snapshots](https://snapshots.linaro.org/gnu-toolchain/)
> 2. [Install Arm GNU Toolchain on Ubuntu 22.04 | Lindevs](https://lindevs.com/install-arm-gnu-toolchain-on-ubuntu)





## 环境部署

从 github 下载项目：

```shell
git clone https://github.com/fudan-ppi/Rule_based_DBT.git
```

进入`qemu-dbt`文件夹：

```shell
cd ./Rule_based_DBT/qemu-dbt
./configure --target-list=aarch64-linux-user
make -j4
```

>备注：查看 Deep Learning DBT 编译安装 QEMU

安装clang，llvm和arm tool chain：

```
sudo apt install clang-15 llvm-15
sudo apt install binutils-arm-linux-gnueabi
sudo apt-get install gcc-multilib g++-multilib module-assistant
```



修改`learning/arm/arm.py`：

```python
import re
import copy
import sys

ARCH_STR = "arm"

CC = "clang-15"
LC = "llc-15"
BC = "arm_bc"
IR = "arm_ir"
ASM = BC + ".s"
ASM_D = BC + "_dump.s"
OBJ = BC + ".o"

AS = "arm-none-eabi-as"
OBJDUMP = "/usr/bin/objdump"

```

