# MeowCompiler

Meow Compiler是一个C语言的编译器，能够将C语言的源代码编译成汇编代码。我们的项目采用flex、bison以及C语言编写编译器前端，并使用LLVM作为编译器的后端。整个项目基于Makefile来实现整体架构的搭建、编译与运行。

### 环境要求

目前，我们的项目均是在**Linux**操作系统下运行和测试。我们暂时还没有在Windows或者Mac OS等其他操作系统上进行测试。如果您在其他操作系统中遇到了任何问题，欢迎及时与我们联系。

运行环境中各个工具链的整体配置要求如下。

- Ubuntu 22.04
- clang 14.0.0
- flex 2.6.4
- bison 3.8.2
- LLVM 14.0.0



### 环境配置

为了安装Meow Compiler的运行环境，您可以按照如下步骤进行配置。需要注意的是，这里我们所有的环境配置均是在Linux操作系统上完成的。如果您使用的是Windows操作系统，您可以尝试使用WSL来获取Linux运行环境。

实际运行过程中，各个编译工具链版本的最低要求如下。

- clang >= 10
- flex >= 2.6.4
- bison >= 3.8.2
- LLVM >=10

首先，请您更新您的软件列表，并对系统中的软件进行更新，以确保您能够安装到最新版本的相关程序以及相应的依赖。

```shell
sudo apt-get update
sudo apt-get upgrade
```



对于 Ubuntu 20.04 或更新版本，官方源中的 clnag、flex、bison 以及 LLVM 版本已经默认能够满足最低我们项目的编译要求了，因此您执行以下命令，使用apt-get工具来获取我们所需要的各类编译工具。

```shell
sudo apt-get install clang
sudo apt-get install flex bison
sudo apt-get install llvm
```



安装完成后可以通过以下命令进行测试：

```shell
clang -v # 查看版本，若出现版本信息则说明安装成功
flex --version # 查看版本，若出现版本信息则说明安装成功
bison -version # 查看版本，若出现版本信息则说明安装成功
lli --version # 查看版本，若出现版本信息则说明安装成功
```



### 编译测试

在我们的项目中，我们已经采用Makefile为你搭建好了各个模块的测试工具。

在src目录下存放了我们项目所有的源代码，你可以借助Makefile实现如下功能。

```shell
make       # 编译整个工程项目并运行
make run   # 运行可执行程序
make test  # 对编译器表现的正确性进行标准测试
make clean # 清理编译所生成的中间文件
```



在test目录下存放了我们项目的标准测试代码与测试程序，你可以借助Makefile实现如下功能。

```shell
make       # 对编译器表现的正确性进行标准测试
make clean # 清理编译所生成的中间文件
```



### 直接运行

我们项目所生成的编译器可执行文件为`meow.out`，你可以直接运行该可执行文件并输入需要编译的源代码。程序执行完成后，将会输出源程序所编译的可执行程序。你可以直接在你的机器上运行该可执行程序观察结果。

例如，如果你要编译`test.c`程序，那么你可以执行如下命令：

```shell
./meow.out test.c # 编译生成可执行程序
./test.out        # 执行可执行程序
```

