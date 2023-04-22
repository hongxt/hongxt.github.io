# 1 c++计时函数

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

# 2 c++向文件读写数据

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

