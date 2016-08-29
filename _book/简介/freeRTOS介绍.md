长达12年里Real Time Engineers公司与世界领先的芯片厂商紧密合作，开发的`freeRTOS`是一个市场领先、商业级但是完全免费的高质量RTOS，可以使用在任何场景而不必担心有任何知识产权侵权的风险。*(freeRTOS完全开源且免费，感谢开源)*

## 什么是通用操作系统
操作系统是一个用以提供基础计算机功能的计算机程序，向其他程序提供服务。应用完成用户想要实现的功能，操作系统对应用程序的支持使得开发者在开发应用程序时更加快捷、简单、易维护。比如你现在使用的浏览器就是一个应用，它运行在一个操作系统提供的环境中。

## 什么是RTOS
大部分的操作系统都允许多个应用程序同时执行，这称之为多任务(multi-tasking).事实上，在任何一个时间点上，只有一个进程在独立执行，只不过应用程序间的切换足够快，好像是同时在执行一样。操作系统中有一个称为调度器(`scheduler`)的部分负责调度应用程序，决定什么时候执行哪个应用程序，调度器在每个程序之间的切换需要足够快速。

调度器(`scheduler`)的工作方式就决定了这个操作系统的类型。比如在多用户的操作系统中（Unix等）调度器将保证每个用户得到的处理器时间尽可能的相等。类似windows的桌面操作系统，调度器试图保证向用户足够的响应性。(freeRTOS并不是一个大型的操作系统，并不是为了去完成桌面计算机级别的处理而设计，它所能提供的功能是有限的，之所以举如上栗子，仅仅是因为它们有相似性)。

实时操作系统(`RTOS`)中的调度器设计成可以提供确定的执行模式。对于对实时性有特俗需求的嵌入式系统，这个特性是尤其有用的。实时性意味着嵌入式系统对某个具体事件的响应事件必须严格的控制在一个预定的事件内(`deadline`)，为了实现这点，调度器的执行必须是可预测的。

传统的实时调度器，例如freeRTOS中使用的调度器，被设计成由用户为每个进程提供一个优先级，调度器根据优先级决定下一个执行的任务，在freeRTOS中，进程被称为任务。

## freeRTOS
`freeRTOS`是RTOS的一类，设计目的是足够小以便允许运行在微控制器上，虽然它的应用范围不局限于此。

微控制器的小型的资源紧缺的处理器，ROM中保存程序代码，程序代码运行时需要的内存由RAM提供，通常代码直接在ROM中执行以节省RAM的占用。

嵌入式系统通常时为了完成特定的任务而设计，资源紧凑、任务特定的特性使得很难保证去使用一个全功能的RTOS来实现。因此freeRTOS只提供实时调度核心、任务间通信、时间管理、同步原语。这意味着，freeRTOS更准确的定义是一个实时内核。除了上述功能外，通过附加组件，也可以为freeRTOS添加如命令行接口、TCP、TF等功能。

目前`freeRTOS`支持35种架构，2014年期间总计超过113000次下载。`freeRTOS`通过专业的开发、极其严格的质量控制、健壮的、支持良好并且对用商业应用是免费的，同时也没有任何要求您公布源代码的要求。

通过移除一些[使用自由软件的争议部分](http://www.freertos.org/open-source-software.html)，`freeRTOS`已经成为事实上的微控制器RTOS标准，提供一个吸引人的自由软件模式。

### freeRTOS价值主张
执行严格的质量管理，不仅体现在编码标准上，同时体现在执行上。`freeRTOS`的价值主张:
- 严格的配置管理下的高质量的C源代码
- 安全版本确保可靠性
- 跨平台支持固定的时间投入
- 提供用于培训工程师的教程文档
- 对所有支持的平台提供提前配置好的实例工程
- 免费支持，引述比一些商业的替代品更好
- 快速增长的用户和社区规模
- 省心 - 低成本的商业版本可以随时获取

### freeRTOS技术亮点
- 抢占式调度(可选)
- 协作式调度(可选)
- 快速的任务通知
- 6K到12K的ROM占用
- 可配置/可裁剪
- 芯片、编译器无关
- 有些部分不完全禁用中断
- 消息传递易用
- 时间片轮询
- 优先级继承的互斥量
- 递归互斥量
- 二进制和计数信号量
- 高效的软件定时器
- 易用的API

### freeRTOS特点
`freeRTOS`是为小型嵌入式系统设计的可裁剪的实时内核，主要特点如下：

- 调度器支持抢占式、协助式或二者混合(配置可选)，时间片可选
- The SafeRTOS derivative product provides a high level of confidence in the code integrity.
- 低速tick时钟模式用于低功耗应用
- RTOS的组件(任务、队列、信号量、软件定时器、互斥量、事件组)可以使用动态或者静态分配内存的方式创建
- 占用空间小
- 官方支持超过30种嵌入式架构
- `FreeRTOS-MPU`支持cortex-M3的内存保护单元
- 小型化、简单、易用的设计目的，典型的RTOS的二进制镜像在4K到9K范围
- 大部分代码采用C编写，方便移植的源代码架构
- 同时支持实时任务和协同例程
- 直接到任务的通知机制、队列、二值信号量、计数信号量、递归信号量、递归互斥量用于任务间、或者任务和中断之间的通信和同步。
- 创新的事件组(`event group`)实现
- 互斥量拥有优先级继承特性，防止优先级反转
- 高效的软件定时器
- 强大的执行追踪功能
- 栈溢出检测
- 为选定的单板计算机提供预先配置的RTOS演示应用，实现'开箱即用'的操作和快速的学习曲线
- 免费自由的论坛支持，或可选的商业支持和许可
- 无限制的任务数量
- 无限制的任务优先级
- 优先级分配无限制，多个任务可共用同一个优先级
- 许多支持的架构提供免费的开发工具
- 免费的嵌入式软件源代码
- 免版税
- Cross development from a standard Windows host

### Mission

> 
"Provide a free product that surpasses the quality and service 
demanded by users of commercial alternatives"
The original mission of the FreeRTOS project was to provide a free RTOS solution that was easy to use. That is, easy to build and deploy, on a Windows (or Linux) host computer, without having to figure out which source files are required, which include paths are required, or how to configure the real time debugging environment. This has been achieved through the provision of pre-configured, build-able, example projects for each officially support port.

>
Naturally, as the FreeRTOS started circa 2003, how these projects are created has evolved for the better, and some original projects remain that don't demonstrate all of the RTOS functionality, or have become stale. However, each project is fully tested before it is added to the FreeRTOS zip file distribution, and many RTOS demo projects undergo active maintenance before each new release. Responding to user feedback, each new demo added to the distribution now also includes a simple "blinky" style getting started configuration to compliment the comprehensive examples.

### Design Goals

The primary design goals are:

> 
Easy to use
Small footprint
Robust

### FreeRTOS Founder

>
The FreeRTOS project was founded by Richard Barry. Richard graduated with 1st Class Honours in Computing for Real Time Systems. He's been directly involved in the start up of several companies, primarily working in the industrial automation and aerospace and simulation markets. Richard is currently a director of Real Time Engineers Ltd., owners and maintainers of the FreeRTOS project.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br />本作品采用<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">知识共享署名 4.0 国际许可协议</a>进行许可。