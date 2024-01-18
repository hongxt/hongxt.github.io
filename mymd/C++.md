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
        outfile.flush();
    }
    outfile.close();
}
```

# 3 线程的使用

## 3.1 线程的两种加入

### 3.1.1 使用detch()加入

`detach()`: 当一个线程被分离（detached），意味着它与主线程分离，运行时将独立执行，不再受主线程的控制。主线程可以继续执行后续代码，而不需要等待分离的线程完成。分离线程在完成后会自动释放其资源。使用 `detach()` 可以将线程从主线程中分离，使得线程在后台执行，主线程不需要等待它的完成。

```c++
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
#include <chrono>
#include <stdexcept>
using namespace std;

mutex mtx;
bool flag = true;

void print_flag(int dayin_hz) {
    while (1) {
        {
            lock_guard<mutex>lk(mtx);
            cout << "flag:" << flag << endl;
        }
        this_thread::sleep_for(chrono::seconds(dayin_hz));
    }
}

void set_flag(int change_hz) {
    while (1) {
        {
            lock_guard<mutex>lk(mtx);
            flag = !flag;
        }
        this_thread::sleep_for(chrono::seconds(change_hz));
    }
}

int main(int argc, char** argv) {
    cout<< "Hello, world!" << endl;
    std::thread t1(print_flag, 1);
    std::thread t2(set_flag, 5);
    t1.detach();
    t2.detach();
    cout<< "Hello, world!!!!!" << endl;
    while (1);
}
```

### 3.1.2 使用join()加入

`join()`: 当主线程需要等待一个线程完成后再继续执行，可以使用 `join()`。主线程会被阻塞，直到被 `join()` 的线程执行完成。这样可以确保在主线程继续执行之前，所有子线程都已经完成。

```c++
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
#include <chrono>
#include <stdexcept>
using namespace std;

mutex mtx;
bool flag = true;

void print_flag(int dayin_hz) {
    while (1) {
        {
            lock_guard<mutex>lk(mtx);
            cout << "flag:" << flag << endl;
        }
        this_thread::sleep_for(chrono::seconds(dayin_hz));
    }
}

void set_flag(int change_hz) {
    while (1) {
        {
            lock_guard<mutex>lk(mtx);
            flag = !flag;
        }
        this_thread::sleep_for(chrono::seconds(change_hz));
    }
}

int main(int argc, char** argv) {
    cout<< "Hello, world!" << endl;
    std::thread t1(print_flag, 1);
    std::thread t2(set_flag, 5);
    t1.join();
    t2.join();
    return 0;
}
```

## 3.2 线程锁的使用

### 3.2.1 使用lock_guard

lock_guard的作用域是局部的，最好采用{}进行选中，方便进行改变后自动解锁

```c++
void set_flag(int change_hz) {
    while (1) {
        {
            lock_guard<mutex>lk(mtx);
            flag = !flag;
        }
        this_thread::sleep_for(chrono::seconds(change_hz));
    }
}
```

### 3.2.2 使用mtx.lock()和mtx.unlock()

mtx.lock()和mtx.unlock()的配对使用

```c++
void print_flag(int dayin_hz) {
    while (1) {
        mtx.lock();
        lock_guard<mutex>lk(mtx);
        cout << "flag:" << flag << endl;
        mtx.unlock();
        this_thread::sleep_for(chrono::seconds(dayin_hz));
    }
}
```























