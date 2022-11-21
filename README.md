# hongxt.github.io
4.	基本流程  
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
