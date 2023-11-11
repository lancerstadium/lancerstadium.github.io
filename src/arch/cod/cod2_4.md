# 决策指令

## if

**相等则分支** `beq`：如果寄存器`rs1`中值等于寄存器`rs2`中值，则转移到标签为L1的语句执行。

```assembly
beq  rs1, rs2, L1
```

**不等则分支** `bne`：如果寄存器`rs1`中值不等于寄存器`rs2`中值，则转移到标签为L1的语句执行。

```assembly
 bne  rs1, rs2, L1
```

**无条件分支**：遇到该指令必须分支。

```assembly
beq  x0, x0, Exit
```

**小于则分支** `blt`：比较`rs1`和`rs2`中值，若`rs1`较小则跳转。（无符号 `bltu`）

**大等则分支** `bge`：与上互补。（无符号 `bgeu`）

> ARM 指令系统通过保留额外的位（条件代码或标志位）来表示算术运算结果是否溢出等等。

有符号数 -> 无符号数能简便检查数组越界：二进制补码中负整数强转为无符号为很大的数。

```assembly
begu x20, x11, IndexOutOfBounds
; if x20 > x11 or x20 < 0 goto IndexOutOfBounds
```





## while

对于一个C语言常见循环：

```cpp
while (save[i] == k)
	i += 1;
// x22 <- i
// x24 <- k
// x25 <- save[]
```

汇编如下：

```assembly
Loop:
	slli x10, x22, 3    ; reg x10 = i * 8
	add  x10, x10, x25  ; reg x10 = save[]
	ld   x9, 0(x10)     ; reg x9 = save[]
	bne  x9, x24, Exit  ; if save[] != k goto Exit
	addi x22, x22, 1    ; i = i + 1
	beq  x0, x0, Loop   ; goto Loop
Exit:
```

