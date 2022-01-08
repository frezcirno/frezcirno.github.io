---
title: How to compile the linux kernel
date: 2022-01-08 14:42:04
category: Tech
tags:
- Linux
---

![](https://static.7c00h.xyz/images/NewTux.svg)

# 访问 https://www.kernel.org/ 查看最新的内核版本，获取下载链接

# 下载并解压到当前目录

```sh
wget -qO- https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.13.tar.xz | tar Jxvf -
cd linux-5.15.13
```

# 编译配置

```sh
cp /boot/config-`uname -r` .config
make menuconfig
```

# 开始编译

```sh
make -j $(nproc)
```

# 安装到系统中

```sh
sudo make INSTALL_MOD_STRIP=1 modules_install
sudo make headers_install
sudo make install
```