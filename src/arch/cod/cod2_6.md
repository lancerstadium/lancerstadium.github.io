# ASCII 人机交互

ASCII（*American Standard Code for Information Interchange*）是每个人用来遵循的字符表示方法：

![image-20231113191916314](cod2_6.assets/image-20231113191916314.png)



## 字节转移指令

**加载无符号字节指令**`lbu`：从内存中加载一个字节，将其放在寄存器最右边8位。

**存储字节指令**`sb`：从寄存器的最右边8位取一个字节将其写入内存。

复制一个字节的顺序如下：

```assembly
lbu  x12, 0(x10)    ; 读取源字节 0(x10) 到寄存器 x12
sb   x12, 0(x11)    ; 写入字节 x12 到内存 0(x11) 中
```

字符串通常有三种表示：

1. 字符串第一个位置保留，用于给出字符串长度；
2. 附加带有字符串长度的变量（如结构体）；
3. 字符串最后位置用一个字符标记结尾。

###### C语言使用第三种选择，使用值为 0 的字节表示终止字符串（ASCII中命名为`null`）。因此，字符串`Cal`一般用`67 97 108 0`来表示。



接下来要编译一个字符串复制程序：将字符串y复制到字符串x

```cpp
void strcpy (char x[], char y[])
{
    size_t i;
    i = 0;
    while ((x[i] = y[i]) != '\0')
        i += 1;
}
// x10 <- x[]
// x11 <- y[]
// x19 <- i
```

编译后的 RISC-V 汇编代码如下：

```assembly
strcpy:
	addi sp, sp, -8     ; 栈申请 1 Byte 空间
	sd   x19, 0(sp)     ; 将 x19 的值压栈
	add  x19, x0, x0    ; i = reg x19 = 0 + 0
	; 循环开始
L1:
	add  x5, x19, x11   ; reg x5 = addr of y[i]
	lbu  x6, 0(x5)      ; reg x6 <- y[i]
	add  x7, x19, x10   ; reg x7 = addr of x[i]
	sb   x6, 0(x7)      ; x[i] <- reg x6 = y[i]
	beq  x6, x0, L2     ; if y[i] = 0 goto L2
	; if y[i] != 0 continue
	addi x19, x19, i    ; i = i + 1
	jal  x0, L1         ; goto L1
L2:
	ld   x19, 0(sp)     ; 弹栈到 x19
	addi sp, sp, 8      ; 栈释放 1 Byte 空间
	jalr x0, 0(x1)      ; return
```



## Unicode

Unicode 是大多数人类语言中字母表的通用编码，16位半字。

RISC-V 具有加载存储半字的指令：

```assembly
lhu  x19, 0(x10)     ; reg x19 <- 0(x10)
sh   x19, 0(x11)     ; 0(x11) <- x19
```



