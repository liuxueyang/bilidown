# bilidown
批量下载哔哩哔哩视频和弹幕的工具

#### 安装

- 需要有 python 环境
- 如果没有安装 pip3，自行搜索各个平台的安装方法
- ```pip3 install youtube_dl``` 本脚本依赖 youtube-dl 下载视频

#### 参数

- -prefix (-p)下载的视频名字添加前缀
- -output (-o)指定下载的路径，如果不指定，则下载到当前的目录

#### 用例

##### 用例1

- 单个视频下载
- 下载完成后添加前缀 20200704
- 保存到路径 ~/desktop/video

```bash
python3 bilidown.py av1830060 -p 20200704 -o ~/desktop/video
```

##### 用例2

- 多个视频下载 `av号` `网页地址` `bv号`
  - av170001
  - https://www.bilibili.com/video/BV1Es411j7AE
  - BV15x411N7tu

- 其他参数对所有视频生效

```bash
python3 bilidown.py av170001 https://www.bilibili.com/video/BV1Es411j7AE BV15x411N7tu -p 20200704 -o ~/desktop/video
```

#### 更方便的用法

可以将 bilidown 定义为终端自定义命令

mac 去修改 `~/.bash_profile`

Linux/Ubuntu 去修改 `~/.bashrc`

以下是我的自定义 shell 内容，提供参考，可将其添加在文件末尾

`./bilidown.py `需要替换为脚本的路径

```bash
function download_video_danmu() {
		sudo python3 ./bilidown.py $*
	}

function download_video_danmu_to_default() {
		sudo python3 ./bilidown.py -o '~/bilidown' $*
	}

alias bilidown='download_video_danmu'

alias  bilidown_default="download_video_danmu_to_default"

```

修改完成后执行 ```source .bashxxx``` 使其立刻生效 .bashxxx 为刚刚修改的文件

Windows 需要编写 .bat 脚本，然后去 `我的电脑-右击-属性-高级系统设置-环境变量-系统变量-Path-编辑-新建-粘贴目录 `添加环境变量

或者win10可以去安装Ubuntu子系统