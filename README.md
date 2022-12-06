# 技术日记  
网址:https://hongxt.github.io  
## [1.ubuntu免卸载安装cmake实现多版本共存方法-2022.11.21](https://github.com/hongxt/hongxt.github.io/issues/1)

## [2.ubuntu18.04配置gdal高版本-2022.11.21](https://github.com/hongxt/hongxt.github.io/issues/2)

 ## [3.c++计时函数](https://github.com/hongxt/hongxt.github.io/issues/3)
 
## 4. snap、apt和apt-get
![avatar](/pics/apt_snap_contrast.PNG)

## 5.vscode配置编辑器的include路径
点击左边扩展栏图标—>搜索C/C++ -> 安装->Reload  
安装完成之后，打开你的包含c++的文件夹，将会生成一个.vscode文件夹，所有的配置将在这个文件夹中进行配置。  
扩展程序会根据当前系统环境配置基本信息，因此有可能配置不完整，这时需要通过生成c_cpp_properties.json文件来配置缺少的信息  
ctrl+shift+P打开Command Palette,运行C/Cpp: Edit configurations...生成c_cpp_properties.json：  
进行设置路径即可  
## 6.ubuntu的终端和github设置proxy
A.ubuntu设置终端代理和清除代理命令（命令行测试与设置是同步的）  
1.添加代理  
```shell
export http_proxy=http://proxyAddress:port  
export https_proxy=http://proxyAddress:port  
```  
2.查看代理  
```shell
env |grep -i proxy  
```
3.清除代理  
```shell
unset http_proxy  
unset https_proxy  
```

B. 设置github代理  
1.查看git配置  
```shell
git config -l  
```
2.一共两个协议，两种不同的协议对应后面不同的后缀名与当前的代理端口  
```shell
git config --global https.proxy https://127.0.0.1:12333  
git config --global http.proxy http://127.0.0.1:12333  
```
3.取消代理  
```shell
git config --global --unset http.proxy  
git config --global --unset https.proxy  
```  

## 6. c++向文件读写数据  
```c++
#include <fstream>
using namespace std;
void fwrite_path(vector<Vector3i> path){
    ofstream outfile;
    outfile.open("../scripts/path.txt");
    int value=1;
    for (size_t i = 0; i < path.size(); i++)
    {
        // id x y z value
        outfile<<i<<" "<<path[i](0)<<" "<<path[i](1)<<" "<<path[i](2)<<" "<<value<<endl;
    }
    outfile.close();
}

```  

## 7. python从文件读取数据，画三维图像  
```python
#!/usr/bin/env python3
import sys
from matplotlib import pyplot as plt
import numpy as np  # 用来处理数据
from mpl_toolkits.mplot3d import Axes3D

##读取path的数值
ID=[]
PX=[]
PY=[]
PZ=[]
VALUE=[]
filename = './path.txt'
with open(filename, 'r') as f:
    lines = f.readlines()
    for line in lines:
        try:
            temp=line.split(' ')
            # print(temp[0])
            ID.append(int(temp[0]))
            PX.append(int(temp[1]))
            PY.append(int(temp[2]))
            PZ.append(int(temp[3]))
            VALUE.append(int(temp[4]))
        except:
            continue

##读取map的数值
MX=[]
MY=[]
MZ=[]
filename = './map.txt'
with open(filename, 'r') as f:
    lines = f.readlines()
    for line in lines:
        try:
            temp=line.split(' ')
            # print(temp[0])
            MX.append(int(temp[1]))
            MY.append(int(temp[2]))
            MZ.append(int(temp[3]))
        except:
            continue


fig=plt.figure()
ax=Axes3D(fig)
# ax.scatter(PX,PY,PZ,s=20,c='g',marker='s')
# ax.plot3D(PX,PY,PZ,linewidth=10,c='r')
# ax.scatter(MX,MY,MZ,c='r')
ax.bar3d(MX,MY,MZ,10,10,1,alpha=0.5)
ax.bar3d(PX,PY,PZ,10,10,1,alpha=0.5)

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
ax.set_xlim([-150,400])
ax.set_ylim([-150,400])
# plt.savefig('com.jpg')
plt.gca().set_box_aspect((550, 550, 50))  # 当x、y、z轴范围之比为3:5:2时。
plt.show()
```

## 8. ubuntu18.04配置python环境  
目的是替代掉系统自带的python3，实现安装px4最新版本的时候很方便  
1下载安装的sh文件  
https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/  
https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/  
2复制到虚拟机中，在终端运行  
```shell
bash Anaconda3-2022.10-Linux-x86_64.sh
```
同意安装   
同意协议    
同意安装位置   
同意写入bashrc文件 <font color=red>【no】</font>    
3使用update-alternatives进行配置    
```shell
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 20
sudo update-alternatives --install /usr/bin/python python /home/hongxt/anaconda3/bin/python 30
sudo update-alternatives --config python
```
4配置python3  
除了上面配置python的环境，系统里面的python,python2,python3都是链接的形式，因此可以一样的方法为python3配置可以切换的多环境并存  
## 9. 安装ubuntu20.04过程  



# 关于学习  
吾生也有涯，而知也无涯，以有涯随无涯，殆矣

