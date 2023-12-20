# Angr使用

很抱歉，由于Angr框架在处理真实的编译器生成的二进制文件时可能会遇到一些挑战，因此在Angr框架中编写一个程序来实现您所需的功能可能会比较复杂。Angr框架主要是用于进行符号执行和二进制分析，而不是用于编译器生成的二进制文件的后续处理。

```
sudo apt-get install gcc-aarch64-linux-gnu

```



不过，您可以使用Angr框架来分析预先编译好的二进制文件，以获取它们的控制流图（CFG）并比较两个二进制文件的CFG。以下是一个示例代码，演示如何使用Angr框架来获取二进制文件的CFG：

```python
import angr

# 加载二进制文件
def load_binary(binary_path):
    project = angr.Project(binary_path, load_options={'auto_load_libs': False})
    return project

# 获取CFG图
def get_cfg(project):
    cfg = project.analyses.CFGFast()
    return cfg

# 主程序
def main():
    # 加载x86_64和arm64的二进制文件
    x86_64_binary_path = '/path/to/your/x86_64/binary'
    arm64_binary_path = '/path/to/your/arm64/binary'
    
    x86_64_project = load_binary(x86_64_binary_path)
    arm64_project = load_binary(arm64_binary_path)

    # 获取x86_64和arm64的CFG图
    x86_64_cfg = get_cfg(x86_64_project)
    arm64_cfg = get_cfg(arm64_project)

    # 比较两个CFG图，寻找相对应基本块的入口地址对
    for x86_64_node in x86_64_cfg.graph.nodes():
        for arm64_node in arm64_cfg.graph.nodes():
            if x86_64_node.name == arm64_node.name:
                print(f"Corresponding basic blocks: x86_64: {hex(x86_64_node.addr)}, arm64: {hex(arm64_node.addr)}")

if __name__ == '__main__':
    main()
```

在这个示例中，我们首先加载了x86_64和arm64的二进制文件，然后使用Angr框架获取它们的CFG图。接下来，我们比较两个CFG图，寻找相对应基本块的入口地址对。请注意，这只是一个简单的示例，实际情况可能更复杂，需要根据具体的二进制文件和需求进行调整。