# Doxyfile
- [Doxyfile](#doxyfile)
	- [Doxyfile配置](#doxyfile配置)
	- [使用`makrdown`做主页](#使用makrdown做主页)
## Doxyfile配置

[windows安装](https://www.cnblogs.com/silencehuan/p/11169084.html)

`ubuntu`安装：

```shell
sudo apt-get install doxygen
sudo apt-get install graphviz graphviz-doc
```

此处的`Doxyfile`为我使用的配置，一般需要修改的项为:

```makefile
# 编码
DOXYFILE_ENCODING      = UTF-8
# 项目名称
PROJECT_NAME           = task
# 版本号
PROJECT_NUMBER         = 1.0.0
# 项目描述
PROJECT_BRIEF          = 任务管理组件
# 项目Logo
PROJECT_LOGO           = favicon.ico
# 输出目录
OUTPUT_DIRECTORY       = task-doxygen
# 输出语言
OUTPUT_LANGUAGE        = Chinese
# 输入目录
INPUT                  = src
# 输入编码
INPUT_ENCODING         = UTF-8
# 生成chm
GENERATE_HTMLHELP      = NO
# chm名称
CHM_FILE               = task.chm
# chm生成工具路径,只有windows支持
HHC_LOCATION           = "C:/Program Files (x86)/HTML Help Workshop/hhc.exe"
GENERATE_CHI           = NO
# chm编码
CHM_INDEX_ENCODING     = GBK
# graphviz路径，冗余生成关系图
# linux使用：
# DOT_PATH               = /usr/bin/dot
DOT_PATH               = "C:\Program Files (x86)\Graphviz2.38\bin"
```

## 使用`makrdown`做主页

`doxygen`支持`markdown`，需要在`markdown`头部加上：

```shell
My Main Page                         {#mainpage}
============
```

当前`Doxyfile`配置为`ubuntu18`的环境，如果安装了前文描述的工具，可直接运行`doxygen`查看结果。
