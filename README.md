# mini_any

众所周知迷你世界的安装目录下会有两个浏览器，本项目允许你使用它们打开任何网页。

下载: 直接下载zip文件就可以了。

minibr.bat/mbs.bat公用语法:

```batch
mbs/minibr <地址> 使用默认版本打开网页(Chrome内核)
mbs/minibr -o <地址> 使用旧版打开网页(IE内核)
```

mbs.bat专用语法:

```batch
mbs 交互式打开一个网页(相当于直接双击, 需要选择版本)
mbs -o 交互式使用旧版打开一个网页
```

mbs.bat可以下载迷你世界客户端(使用Windows Powershell), 但是需要手动补全文件, 即登录并完成一次启动。启动一次后会生成标签文件, 内容无关紧要, 默认是`114514`。

程序不需要手动提供用户名(但是包含空格和中文的用户名未测试), 但是删除USERPROFILE环境变量会导致无法获取路径。

若希望移动游戏安装路径, 请创建链接(不是快捷方式!), 或更改脚本中的路径。
