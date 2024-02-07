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







































































































































