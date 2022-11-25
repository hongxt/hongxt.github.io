# 技术日记  
网址:https://hongxt.github.io  
## 1.ubuntu免卸载安装cmake实现多版本共存方法-2022.11.21
（1）	下载源码  
https://cmake.org/download/  
（2）	解压运行  
./bootstrap  
（2.1）另起终端，将原来的cmake改名cmake3.10，建立到update-alternatives中看看行不行，避免后续名字冲突  
cd /usr/bin/  
mv cmake cmake3.10  
sudo update-alternatives --install /usr/bin/cmake cmake /usr/bin/cmake3.10 10  
sudo update-alternatives --config cmake  
cmake --version  
（3）	编译构建  
make  
（4）	安装到指定自定义位置（注意路径不能有空格）  
sudo make install DESTDIR=/home/hongxt/tools/cmake3.25  
（5）	使用update-alternatives进行安装  
sudo update-alternatives --install /usr/bin/cmake cmake /home/hongxt/tools/cmake3.25/usr/local/bin/cmake 30  
（6）	查看cmake的配置  
sudo update-alternatives --config cmake  
ubuntu软件更新会导致/usr/bin/重新出现cmake可执行文件，破坏掉链接，可以再次修改cmake可执行文件的名字即可

## 2.ubuntu18.04配置gdal高版本-2022.11.21
ubuntu自带有proj（gdal的依赖）和gdal，但是版本较低，删除升级的时候，会牵扯到ros，下面提供一种不影响ros的方法  
下载proj和gdal的release文件进行编译安装  
1.安装sqlite3  
 sudo apt install sqlite3  
2.proj  
 cd proj-6.3.2  
 mkdir build  
 cd build  
 cmake ..  
 make -j8  
 sudo make install  
 设置路径
 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib  
<font color=red>3.删除原来的gdal  </font>  
 sudo rm -rf /usr/share/gdal/*  
 sudo rm -rf /usr/include/gdal/*  
4.安装新的  
 cd gdal332  
  ./configure  --with-proj=/usr/local  
 make   
 sudo make install  
5.完事  
 安装在了/usr/local里面的include和lib中  
 
 ## 3.c++计时函数  
 C系统调用方法，所需头文件ctime/time.h，即windows和linux都可以使用。  
1、clock()返回类型为clock_t类型  
2、clock_t实际为long 类型， typedef long clock_t  
3、clock() 函数，返回从 开启这个程序进程 到 程序中调用clock（）函数 时之间的CPU时钟计时单元（clock tick）数（挂钟时间），返回单位是毫秒，有的是微秒，这个看系统的定义  
4、可以用常量CLOCKS_PER_SEC， 这个常量表示每一秒（per second）有多少个时钟计时单元  
```c++
#include <time.h>　　　//引入头文件
int main()
{
clock_t start,end;　　　//定义clock_t变量
start = clock();  　　　//开始时间

fun()  //需计时的函数

end = clock();   //结束时间
cout<<"time = "<<double(end-start)/CLOCKS_PER_SEC<<"s"<<endl;  //输出时间（单位：ｓ）
}
```

## 4. snap、apt和apt-get
| 项目   | Apt                             | Snap                                       |
|------|---------------------------------|--------------------------------------------|
| 特点   | Apt中找不到的软件需要PPA安装。              | 软件运行更加安全                                   |
|      | 对与.deb后缀的包，双击可安装，dpkg安装。        | 独立和更加易控的版本                                 |
|      | deb 不是特别安全，安装授权后可以访问系统任何位置。     | 软件互不干预                                     |
|      | 多个软件可共享一个类库。                    | 易于打包软件和发行                                  |
|      | 仅支持deb系的Linux                   | 自动升级，你安装的软件永远都是最新的                         |
|      |                                 | 支持大量的Linux发行版                              |
|      |                                 | 易于版本回滚和改变。容易构建软件项目。同时支持开源和闭源软件发行。Snaps更加安全 |
| 常用命令 | 更新源                             | snap安装软件                                   |
|      | sudo apt update                 | sudo snap install firefox                  |
|      | 更新已经安装的软件                       | 列出安装的软件                                    |
|      | sudo apt upgrade                | snap list                                  |
|      | 安装软件                            | 搜索软件                                       |
|      | sudo apt install firefox        | snap find                                  |
|      | 移除软件                            | 更新软件                                       |
|      | sudo apt remove firefox         | sudo snap refresh firefox                  |
|      | # 删除并清除配置文件                     | # 更新全部                                     |
|      | sudo apt --purge remove firefox | sudo snap refresh all                      |
|      | 清理安装包                           | 卸载软件                                       |
|      | sudo apt autoclean              | snap remove firefox                        |
|      | #清理所有安装包                        |                                            |
|      | sudo apt clean                  |                                            |
|      | 搜索软件                            |                                            |
|      | apt search firefox              |                                            |
|      | 列出已安装的                          |                                            |
|      | apt list –installed             |                                            |
|      | 卸载多余依赖                          |                                            |
|      | sudo apt autoremove             |                                            |

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
![avatar](/pics/apt_snap_contrast.PNG)

## 7. python从文件读取数据，画三维图像  

## 8. ubuntu18.04配置python环境  

## 9. 安装ubuntu20.04过程  



# 关于学习  
吾生也有涯，而知也无涯，以有涯随无涯，殆矣

