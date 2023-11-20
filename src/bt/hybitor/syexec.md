# 符号执行工具



在二进制代码的符号执行库或工具方面，有一些知名的工具和库，如：

1. [**KLEE**](https://zhuanlan.zhihu.com/p/350222671)：这是一个基于LLVM的符号执行引擎，需要将原始程序（通常是程序源码）编译成LLVM IR，然后使用KLEE工具进行加载和解释执行。
2. [**Angr**](https://zhuanlan.zhihu.com/p/350222671)：这是一种针对二进制程序的符号执行引擎，它将二进制程序转换成VEX IR，并进行加载和解释执行。
3. [**SymCC**](https://zhuanlan.zhihu.com/p/350222671)：这是一种针对LLVM IR进行编译时插桩的LLVM Pass，将解释指令的代码插入到源程序中，在运行时使用了动态链接调用QSYM的相关库，能够显著提升执行速度。
4. [**DECAF**](https://zhuanlan.zhihu.com/p/350222671)：这是一款基于QEMU的二进制代码分析平台，也是DroidScope动态Android恶意软件分析平台的前身。
5. [**QSYM**](https://zhuanlan.zhihu.com/p/350222671)：这是一种针对二进制程序的符号执行引擎，它基于Intel PIN动态二进制插桩工具编写PINTool，而直接在原始程序的机器指令上进行插桩来解释执行，这种设计可以降低对中间语言进行解释的额外开销。

这些工具和库都有各自的优点和特性，可以根据具体的需求和场景进行选择。在LLVM内部，KLEE和SymCC都是基于LLVM的符号执行工具。