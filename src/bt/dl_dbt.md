# Deep Learning DBT

> 参考资料：
>
> 1. [Index of qemu version](https://download.qemu.org/)
> 2. [QEMU安装和基本使用方法](https://zhuanlan.zhihu.com/p/479666128)





## 1 架构



安装依赖库：

```shell
sudo apt install re2c
sudo apt install ninja-build
sudo apt install build-essential zlib1g-dev pkg-config libglib2.0-dev
sudo apt install binutils-dev libboost-all-dev autoconf libtool libssl-dev libpixman-1-dev libpython-dev python-pip python-capstone virtualenv
sudo apt install libpixman-1-dev
sudo apt install bison flex
sudo apt install meson
sudo apt install libpixman-1-dev
sudo apt-get install libpcap-dev libnids-dev libnet1-dev
sudo apt-get install libattr1-dev
sudo apt-get install libcap-ng-dev
```





下载Qemu-6.0.0

```shell
wget https://download.qemu.org/qemu-6.0.0-rc1.tar.xz
# 或者手动下载
tar xvJf qemu-6.0.0-rc1.tar.xz
cd qemu-6.0.0-rc1
mkdir build
cd build
../configure --target-list=aarch64-linux-user
make -j
```







