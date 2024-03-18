# 1 从文件读取数据，画三维图像

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

# 2 关于pip和python

命令行中切换python环境以后，pip并没有随之切换。

例如原来是python3.8的环境，此时切换到python3.11，安装了个jsbsim，但是运行文件发现找不到，就是因为pip是和python3.8绑定的，安装的包安装到了3.8中，3.11是看不见的。

最好的方法是使用下述命令进行安装，这样安装的位置是当前python环境的位置

```bash
python -m pip install jsbsim
```

查看当前pip是隶属于谁，可以通过下面命令进行查看

```bash
pip -V
```



