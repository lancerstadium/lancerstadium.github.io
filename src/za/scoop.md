# Scoop 安装



> 参考链接：
>
> 1. [Scoop安装、使用与卸载 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/609534833)
> 2. [Scoop 安装、配置国内镜像、备份与迁移 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/594363658)
> 3. [搭建 Windows 统一开发环境（Scoop） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/128955118)



## 步骤 1：在 PowerShell 中打开远程权限

```sh
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```

## 步骤 2：自定义 Scoop 安装目录

```
irm get.scoop.sh -outfile 'irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir 'D:\app\Scoop' -ScoopGlobalDir 'D:\app\GlobalScoop_Path' -NoProxy
```

## 步骤3：设置国内镜像

```
iwr -useb https://gitee.com/glsnames/scoop-installer/raw/master/bin/install.ps1 | iex
scoop config SCOOP_REPO 'https://gitee.com/glsnames/scoop-installer'
scoop update
```

## 步骤4：更新scoop

```
scoop install git
scoop update
```

## 步骤5：scoop下载加速

```
scoop install aria2 
scoop config aria2-warning-enabled false
# aria2 在 Scoop 中默认开启
scoop config aria2-enabled true
# 关于以下参数的作用，详见aria2的相关资料
scoop config aria2-retry-wait 4
scoop config aria2-split 16
scoop config aria2-max-connection-per-server 16
scoop config aria2-min-split-size 4M
```



> 注意：下载错误建议关闭 `aria2`
>
> ```
> scoop config aria2-enabled false
> # scoop config aria2-enabled true 开启
> ```



## 步骤6：安装bucket

```
scoop bucket add extras 
scoop bucket add java 
scoop bucket add versions
scoop bucket add dorado https://github.com/chawyehsu/dorado
```