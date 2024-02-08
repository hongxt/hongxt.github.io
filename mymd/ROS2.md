# 1 环境设置

## 1.1 source环境脚本

在当前命令行

```bash
source /opt/ros/galactic/setup.bash
```

或者，配置每个命令行

```bash
echo "source /opt/ros/galactic/setup.bash" >> ~/.bashrc
```

## 1.2 检查环境变量

检查安装的环境

```bash
printenv | grep -i ROS
```

得到的输出包含以下内容

```bash
ROS_VERSION=2
ROS_PYTHON_VERSION=3
ROS_DISTRO=galactic
```

## 1.3 域id

域id可以避免同一个物理网络中不同组之间通信的混乱，基于DDS的特性，1-100最好

```bash
export ROS_DOMAIN_ID=<your_domain_id>
```

实现所有是一样的

```bash
echo "export ROS_DOMAIN_ID=<your_domain_id>" >> ~/.bashrc
```

## 1.4 是否本地

ros默认是多机通信，关闭以后实现本地

```bash
export ROS_LOCALHOST_ONLY=1
```

多个终端

```bash
echo "export ROS_LOCALHOST_ONLY=1" >> ~/.bashrc
```

# 2 rqt工具

`rqt`工具，实现可视化的topic，server，action等，还有通信的拓扑

```bash
rqt
```

# 3 node节点

## 3.1 ros2 run

启动节点

```bash
ros2 run <package_name> <executable_name>
```

## 3.2 ros2 node list

展示所有运行中的节点

```bash
ros2 node list
```

## 3.3 remapping

改变节点属性

```bash
ros2 run turtlesim turtlesim_node --ros-args --remap __node:=my_turtle
```

## 3.4 ros2 node info

展示节点信息

``` bash
ros2 node info <node_name>
```



# 4 topic概念

## 4.1 rqt_graph

可视化话题之间的关系

```bash
rqt_graph
```

## 4.2 ros2 topic list

显示当前的话题

```bash
ros2 topic list
```

## 4.3 ros2 topic echo

话题重复

```bash
ros2 topic echo <topic_name>
```

## 4.4 ros2 topic info

显示话题的细节

```bash
ros2 topic info /turtle1/cmd_vel
```

## 4.5 ros2 interface show

显示话题消息格式

```bash
ros2 interface show geometry_msgs/msg/Twist
```

## 4.6 ros2 topic pub 

发布消息

```bash
ros2 topic pub <topic_name> <msg_type> '<args>'
```

只发布一次

```bash
ros2 topic pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"
```

按照频率发布

```bash
ros2 topic pub --rate 1 /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"
```

## 4.7 ros2 topic hz

展示消息发布的频率

```
ros2 topic hz /turtle1/pose
```

# 5 service概念

## 5.1 ros2 service list

查看当前所有的服务

```bash
ros2 service list
```

## 5.2 ros2 service type

查看服务的数据类型

```bash
ros2 service type <service_name>
```

## 5.3 ros2 service list -t

查看当前的服务，以及其类型

```bash
ros2 service list -t
```

## 5.4 ros2 service find

查看指定类型的服务

```bash
ros2 service find <type_name>
```

## 5.5 ros2 interface show 

查看消息的格式

```bash
ros2 interface show <type_name>
```

## 5.6 ros2 service call

调用服务

```bash
ros2 service call <service_name> <service_type> <arguments>
```

上述命令，先敲service_name，随后tab补齐出来service_type，随后输入一个`"`，然后tab，补齐基本的格式

# 6 parameters概念

一个节点有一系列参数，参数和节点是绑定关系，有可以配置一个专门的节点作为黑板

## 6.1 ros2 param list

展示所有的参数

```bash
ros2 param list
```

## 6.2 ros2 param get 

获取参数

```bash
ros2 param get <node_name> <parameter_name>
```

## 6.3 ros2 param set 

设置参数

```bash
ros2 param set <node_name> <parameter_name> <value>
```

## 6.4 ros2 param dump

下载参数

```bash
ros2 param dump <node_name>
```

## 6.5 ros2 param load

加载参数

```bash
ros2 param load <node_name> <parameter_file>
```

## 6.6 启动节点时加载文件

```bash
ros2 run <package_name> <executable_name> --ros-args --params-file <file_name>
```

# 7 action概念

## 7.1 构成

目标，反馈，结果

## 7.2 ros2 node info

查看有没有action

```
ros2 node info
```

## 7.3 ros2 action list

查看所有的action

```
ros2 action list
```

## 7.4 ros2 action list -t

查看动作的数据类型

```bash
ros2 action list -t
```

## 7.5 ros2 action info 

查看action的详细信息

```bash
ros2 action info /turtle1/rotate_absolute
```

目标，结果，反馈

## 7.6 调用action

一样的多用tab实现

```bash
ros2 action send_goal <action_name> <action_type> <values>
```





































































































































































































































