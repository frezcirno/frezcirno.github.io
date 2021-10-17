---
title: VIM YouCompleteMe自动补全插件配置
date: 2021-10-17 19:39:43
category: 编程
tags:
- vim
- linux
---

# YouCompleteMe插件

# 配置步骤

## 编译支持 C++17 的 GCC

gcc源代码以ftp的形式发布，除了gnu官方的服务器外，在世界各地都有镜像站，国内靠谱的镜像站有[阿里云](https://mirrors.aliyun.com/gnu/gcc/)等。

下载源码并解压:

这里使用9.4.0版

```bash
wget https://mirrors.aliyun.com/gnu/gcc/gcc-9.4.0/gcc-9.4.0.tar.gz
tar -zxf gcc-9.4.0.tar.gz
```

创建编译用的目录，我一般习惯命名为build：

```bash
mkdir build && cd build
```

编译配置：

此处可配置的选项极多，具体含义可以在[gcc网站](https://gcc.gnu.org/install/configure.html)上查询. 如果不知道应该加什么参数，可以参考系统上已有的gcc的配置参数：`gcc -v`。

```bash
../configure -v \
    --prefix=/usr/local
    --enable-languages=c,c++ \
    --with-gcc-major-version-only \
    --enable-shared \
    --enable-linker-build-id \
    --without-included-gettext \
    --enable-threads=posix \
    --enable-nls \
    --enable-bootstrap \
    --enable-clocale=gnu \
    --enable-libstdcxx-debug \
    --enable-libstdcxx-time=yes \
    --with-default-libstdcxx-abi=new \
    --enable-gnu-unique-object \
    --disable-vtable-verify \
    --enable-libmpx \
    --enable-plugin \
    --enable-default-pie \
    --with-system-zlib \
    --with-target-system-zlib \
    --enable-multiarch \
    --disable-werror \
    --with-arch-32=i686 \
    --with-abi=m64 \
    --with-multilib-list=m32,m64,mx32 \
    --enable-multilib \
    --with-tune=generic \
    --enable-offload-targets=nvptx-none \
    --without-cuda-driver \
    --enable-checking=release \
    --build=x86_64-linux-gnu \
    --host=x86_64-linux-gnu \
    --target=x86_64-linux-gnu
```

此处解释几个关键配置

- --build

    当前正在使用的机器的环境

- --host

    编译产物(gcc)将会运行在的环境

- --target

    编译出来的gcc的编译产物的目标环境

以上三个参数用于交叉编译，比如在x86_64机器上(build)编译一个即将在arm上运行(host)的编译器，该编译器产生在arm上(target)运行的程序。三个参数的格式均为`cpu-company-system`

- --prefix=/usr/local

    编译产物的安装目录。系统默认的gcc一般会安装在/usr下，为了不影响系统的gcc，建议设置为不同的路径

- --enable-languages
  
    配置gcc支持的语言类型，可选项有ada, c, c++, go等, 由于笔者只需要c和c++，因此只开启了c和c++.

- --enable-multilib

    是否编译target上的multilib, multilib是在target上编译和运行架构不同程序所需的库，比如在x86_64上编译运行32位程序。

- --with-multilib-list

    开启的multilib列表，对于不同target，此处允许的值有所不同。在`x86_64-*-linux*`上有m32, m64, mx32三个可选项。

开始编译并安装：

```bash
make
sudo make install
```

环境变量配置：

下面的`$INSTALLDIR`要换成对应的值。

```bash
echo export PATH="$INSTALLDIR/bin:\$PATH" >> $HOME/.bashrc
echo export CPPFLAGS="-I$INSTALLDIR/include \$CPPFLAGS" >> $HOME/.bashrc
echo export LDFLAGS="-L$INSTALLDIR/lib64 -L$INSTALLDIR/lib \$LDFLAGS" >> $HOME/.bashrc
echo export LD_LIBRARY_PATH="$INSTALLDIR/lib64:$INSTALLDIR/lib:\$LD_LIBRARY_PATH" >> $HOME/.bashrc
```

## 安装 Python 3

YouCompleteMe需要最低Python3.6的环境，如果不满足，则需要安装

如果软件源中包含了满足要求的python版本，则可以直接安装；否则需要从源码编译。

a. 直接从软件源安装

```bash
sudo apt install python3.8 python3.8-dev
```

b. 从源码编译Python3

暂时没有用到，略过

## 编译 VIM

VIM的编译过程相对简单了很多

克隆代码，可以直接克隆最新版本：

```bash
git clone --depth 1 https://github.com/vim/vim.git    
```

编译配置：

```bash
cd vim/src
./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=$(python2.7-config --configdir) \
    --enable-python3interp=dynamic \
    --with-python3-config-dir=$(python3.8-config --configdir) \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="xxxxx@xx.com" \
    --enable-fail-if-missing
```

编译安装：

```bash
make
sudo make install
```

## 安装 CMAKE

下载cmake并安装：

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3-linux-x86_64.sh
chmod +x cmake-3.21.3-linux-x86_64.sh
./cmake-3.21.3-linux-x86_64.sh
```

配置环境变量：

```
echo export PATH=$(pwd)/cmake-3.21.3-linux-x86_64/bin:\$PATH >> $HOME/.bashrc  
```

## 安装 YouCompleteMe 插件

——待更新