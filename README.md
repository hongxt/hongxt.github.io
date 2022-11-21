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
  
# 关于学习  
吾生也有涯，而知也无涯，以有涯随无涯，殆矣

