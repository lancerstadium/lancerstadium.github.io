# win 终端美化



> 参考资料：
>
> 1. [WSL-zsh 终端美化](https://zhuanlan.zhihu.com/p/166103184)
> 2. [lunarvim 安装配置](https://digitalixy.com/linux/1083651.html#:~:text=添加存储库后，使用 apt 管理器安装最新版本的 Neovim 应用程序： sudo apt,update sudo apt install neovim 方法二、使用GitHub仓库安装Neovim √)
> 3. [lvim 配置](https://zhuanlan.zhihu.com/p/511992981)
> 4. [libcuda.so的链接问题](https://blog.csdn.net/qq_42756195/article/details/125769622)
> 5. [手把手安装 nvim](https://zhuanlan.zhihu.com/p/663335520#:~:text=直接使用官方提供的安装方法 LV_BRANCH%3D'release-1.3%2Fneovim-0.9' bash <(curl -s https%3A%2F%2Fraw.githubusercontent.com%2FLunarVim%2FLunarVim%2Frelease-1.3%2Fneovim-0.9%2Futils%2Finstaller%2Finstall.sh) 中途遇到询问，全部输入 yes,到目前为止你已经安装好了lunarvim，可以使用它了。 如果不能直接在bash中通过 lvim 命令启动lunarvim，那么应该是你的没有配置好环境变量，参考以下我的配置 (在安装好lvim后会有提示)。 注意将 user 改为你的实际用户名。)
> 6. [anaconda 环境变量](https://wenku.csdn.net/answer/10x8mj6nio#:~:text=在Linux中配置Anaconda环境变量，可以按照以下步骤进行： 打开终端，进入Anaconda安装目录，找到bin文件夹。 在终端中输入以下命令：,export PATH%3D%2Fpath%2Fto%2Fanaconda%2Fbin%3A%24PATH 其中，%2Fpath%2Fto%2Fanaconda是你的Anaconda安装路径。 将上述命令添加到.bashrc文件中，使其永久生效。)
>





步骤1：安装`zsh`

```
sudo apt-get install zsh
```