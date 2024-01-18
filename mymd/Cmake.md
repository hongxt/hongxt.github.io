# 1常见的几种cmake文件
## 1.1最基本的CMakeLists.txt文件
```cmake
cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(CalculateSqrt) 

# add the executable 
add_executable(CalculateSqrt hello.cxx) 
```
# 2关于CMakeLists.txt种关键命令的解析
## 2.1 cmake_minimum_required
解释：cmake_minimum_required(VERSION <min>[...<max>] [FATAL_ERROR])
该命令指明了对cmake的最低(高)版本的要求，...为低版本和高版本之间的连接符号，没有其他含义
例子：```cmake_minimum_required (VERSION 2.8.0)```
## 2.2 project
解释：project命令用于指定cmake工程的名称，实际上，它还可以指定cmake工程的版本号（VERSION关键字）、简短的描述（DESCRIPTION关键字）、主页URL（HOMEPAGE_URL关键字）和编译工程使用的语言（LANGUAGES关键字）。
例子：
```cmake
# test/CMakeLists.txt
cmake_minimum_required (VERSION 3.10.2)
set (TOP_PROJECT_NAME "mytest") # 定义了变量TOP_PROJECT_NAME为"mytest"
project (${TOP_PROJECT_NAME}) 

message (">>> top PROJECT_NAME: ${PROJECT_NAME}")
message (">>> top PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message (">>> top <PROJECT_NAME>_SOURCE_DIR: ${${TOP_PROJECT_NAME}_SOURCE_DIR}") 
message (">>> top PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}")
message (">>> top <PROJECT_NAME>_BINARY_DIR: ${${TOP_PROJECT_NAME}_BINARY_DIR}")
message (">>> top CMAKE_PROJECT_NAME: ${CMAKE_PROJECT_NAME}")

add_subdirectory (sub_test) # 调用sub_test下的CMakeList.txt进行构建
```
## 2.3 add_executable
add_executable (<name> [WIN32] [MACOSX_BUNDLE]
      [EXCLUDE_FROM_ALL]
      [source1] [source2 ...])
通过指定的源文件列表构建出可执行目标文件。
```add_executable(runtest main.cpp)```

## 2.4   add_definitions()
是定义宏的一种方式,下面两行内容的关系是等价的
```cmake
add_definitions(-DLIBEVENT_VERSION_NUMBER=0x02010800)
#define LIBEVENT_VERSION_NUMBER 0x02010800
```

# 3 拷贝文件到文件夹

## 3.1 编译后进行拷贝

```cmake
add_custom_command(
   TARGET file_to_copy POST_BUILD
   COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:file_to_copy> ${CMAKE_SOURCE_DIR}/../../xxfds/xfdzz_1/build/
)
```

其中

file_to_copy是需要拷贝的文件

${CMAKE_SOURCE_DIR}/../../xxfds/xfdzz_1/build/是放置的路径

## 3.2 拷贝文件

```cmake
file(COPY ${CMAKE_SOURCE_DIR}/xmlconfig/EquipmentConfigNet.xml DESTINATION ${CMAKE_SOURCE_DIR}/../../xxfds/xfdzz_1/xmlconfig/)
```

将文件从某处拷贝到某处
