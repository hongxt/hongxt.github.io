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
# 关于学习  
吾生也有涯，而知也无涯，以有涯随无涯，殆矣

