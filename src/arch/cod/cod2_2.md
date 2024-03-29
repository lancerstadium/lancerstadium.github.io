# RISC-V 指令格式

## RISC-V 字段

1. 给出 RISC-V （R型）字段命名使其易于讨论：

```
|  funct7  |  rs2  |  rs1  |  funct3  |  rd  |  opcode  |            [R]
     7         5       5        3        5        7           
```

以下是 RISC-V 指令字段信息：

- **操作码**（*opcode*）：用于表示该指令操作和指令格式的字段；
- **目的操作数寄存器**（*rd*）：用来存放操作结果；
- **附加操作码字段**（*funct3 & funct7*）：另外的操作码字段；
- **第一源操作数寄存器**（*rs1*）：第一个源操作数；
- **第二源操作数寄存器**（*rs2*）：第一个源操作数；

问题：当指令需要两个寄存器和一个常数，则常数通常比31（2^5-1）大得多，5位字段太小。

> **设计原则3：优秀的设计需要适当的折中**
>
> RISC-V 对于不同指令使用不同格式，上述R型格式用于寄存器。另一种为I型，用于带一个常数的算数运算及加载指令。

2. I型字段如下：

```
|  immediate  |  rs1  |  funct3  |  rd  |  opcode  |                  [I]
       12         5        3        5        7
```

- 立即数（*immediate*）：为补码值，表示-2^11~2^11-1，用于加载指令时，表示一个字节的偏移量，可相对于基址寄存器`rd`偏移2^11（2048）字节；
- 对于加载双字指令`ld  x9, 64(x22)`：`22`存放在`rs1`，`64`存放在`immediate`，`9`存放在`rd`。

3. S型字段如下：适用于存储双字的指令，需要两个源寄存器（基址和数据）和地址偏移`immediate`

```
|  imm[11:5]  |  rs2  |  rs1  |  funct3  |  imm[4:0]  |  opcode  |     [S]
       7          5       5        3           5           7
```



## 总结

R型指令：

|  R   | funct7  |  rs2  |  rs1  | funct3 |  rd   | opcode  |      示例       |
| :--: | :-----: | :---: | :---: | :----: | :---: | :-----: | :-------------: |
| add  | 0000000 | 00011 | 00010 |  000   | 00001 | 0110011 | add  x1, x2, x3 |
| sub  | 0100000 | 00011 | 00010 |  000   | 00001 | 0110011 | sub  x1, x2, x3 |



I型指令：

|  I   |  immediate   |  rs1  | funct3 |  rd   | opcode  |       示例       |
| :--: | :----------: | :---: | :----: | :---: | :-----: | :--------------: |
| addi | 001111101000 | 00010 |  000   | 00001 | 0110011 | addi x1, x2, x3  |
|  ld  | 001111101000 | 00010 |  011   | 00001 | 0000011 | ld  x1, 1000(x2) |





S型指令：

|  S   | imm[11:5] | rs2   |  rs1  | funct3 | imm[4:0] | opcode  |       示例       |
| :--: | :-------: | ----- | :---: | :----: | :------: | :-----: | :--------------: |
|  sd  |  0011111  | 00001 | 00010 |  011   |  01000   | 0100011 | sd  x1, 1000(x2) |

