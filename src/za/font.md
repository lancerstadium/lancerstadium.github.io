# Linux 字体安装



> 参考链接：
>
> 1. [Ubuntu 20.04安装字体](https://huaweicloud.csdn.net/63561c77d3efff3090b5aad8.html?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~activity-3-125994811-blog-120167317.235^v38^pc_relevant_anti_t3_base&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~activity-3-125994811-blog-120167317.235^v38^pc_relevant_anti_t3_base&utm_relevant_index=6)
> 2. [ubuntu 安装字体](https://blog.csdn.net/wxl095/article/details/120167317)
> 3. [Linux 环境安装 mkfontscale](https://blog.csdn.net/soulmate_P/article/details/87856420)
> 4. [GetNF 使用](https://github.com/ronniedroid/getnf)



步骤5：安装字体

```
#更改文件夹权限
sudo chmod -R 777  /usr/share/fonts/truetype/windows-font
cd /usr/share/fonts/truetype/windows-font

# 如果提示 mkfontscale: command not found
# 在Ubuntu下运行如下命令
# sudo apt-get install ttf-mscorefonts-installer
# 在cent os下运行如下命令
# yum install mkfontscale 
sudo mkfontscale
sudo mkfontdir

# 如果提示 fc-cache: command not found
# 在Ubuntu下运行如下命令
# sudo apt-get install fontconfig
# 在cent os下运行如下命令
# yum install fontconfig
sudo fc-cache -fv
```