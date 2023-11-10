# meson 使用

> 参考资料：
>
> - [如何使用meson构建程序 | Sherlock's blog](https://wangzhou.github.io/如何使用meson构建程序/)
> - [The Meson Build system](https://mesonbuild.com/index.html)

## meson 简介

meson 和 make 类似，需要编写一个描述文件`meson.build`来告诉它需要如何构建，meson根据 `meson.build` 中的定义生成具体的构建定义文件 `build.ninja`，ninja 根据 build.ninja 完成具体构建。

## meson 基本使用

1. 首先在源码根目录下创建`meson.build`文件：该文件定义了learn_meson这个工程，并定义了hello这个可执行程序（其使用了源文件test.c）。

```
project('learn_meson', 'c')
executable('hello', 'test.c')
```

2. 在需要构建的源码根目录运行：表面程序构建目录在build文件夹内。

```shell
meson setup build
```

3. 通过配置文件构建：其中，rv_cross_file是指定一些构建要用的参数，当然你的系统里要有riscv的工具链。rv_cross_file内容如下：

```toml
[host_machine]
system = 'linux'
cpu_family = 'riscv64'
cpu = 'riscv64'
endian = 'little'

[properties]
c_args = []
c_link_args = []

[binaries]
c = 'riscv64-linux-gnu-gcc'
cpp = 'riscv64-linux-gnu-g++'
ar = 'riscv64-linux-gnu-ar'
ld = 'riscv64-linux-gnu-ld'
objcopy = 'riscv64-linux-gnu-objcopy'
strip = 'riscv64-linux-gnu-strip'
```

4. 构建成功后，编译程序：

```shell
meson compile -C build
```

5. 可以在build目录下看见生成的可执行程序：看到编译好的hello是动态链接的。进入build，运行meson configure可以看到default_library一项是shared，meson configure显示构建的配置，默认为动态链接，可以使用如下命令修改为静态链接：(注意，要在build下运行)

```shell
meson configure -Ddefault_library=static
```



 





## meson 生成配置文件

