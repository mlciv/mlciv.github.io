---
layout: page
author: Jiessie.Cao
comments: true
date: 2010-07-21 15:32:35+00:00
slug: None
title: Xenoprof 安装和使用
wordpress_id: 1003
categories:
- Virtualization
tag:
- Xenoprof
- Oprofile
- opcontrol
- CPU_CLK_UNHALTED
- xenoprof安装使用
---

>   
> 
> 关于Xenoprof的功能简介这里不详细介绍，可以查看[这里](http://xenoprof.sourceforge.net/)，而其前身Oprofile的安装和使用可以看[这里](http://oprofile.sourceforge.net/news/)。         
本文主要记录本人关于Xenoprof的安装和使用，以及在其中可能曾经遇到的问题。 

<!-- more -->
 

**Xenoprof的安装**         
前文已经介绍了Xen的源码编译和安装，如果在之前Xen的安装中没有考虑Oprofile的安装配置，则这里需要进行如下配置并做轻量级编译。

  

    
  1. **软件包下载**          
Oprofile是一个用户级别的工具，Xenoprof已经被包括在Xen中，仅仅需要对在Oprofile的网站([_http://Oprofile.sourceforge.net/_](http://Oprofile.sourceforge.net/))上下载的Oprofile源代码包，并且在Xenoprof的网站上([_http://xenoprof.sourceforge.net/_](http://xenoprof.sourceforge.net/))下载对应的Patch。
     
  2. **打Patch,安装Oprofile**   
打Patch的命令，网上可以找到很多，从[这里](http://blog.chinaunix.net/u2/68236/showart_686359.html)可以得到比较实践性的理解。          
执行patch -p1 < ../../oprofile-0.9.3-xen-r2.patch 注意p1和p0可以自行选择使用.          
执行./configure --with-kernel-support命令进行编译前的配置(可能提示没有libertylibrary，需要yum installbinutils-devel，同时需要gcc-c++编译器)； 配置好以后，按照Oprofile的README文件中执行make | make install即可完成OProfile的安装。
     
  3. **配置Xen，重新编译**          
如果你的Xen已经编译安装过啦，那么这时你就需要更改配置文件进行轻量级编译安装。          
在编译前，需要修改一下配置文件，进入Xen源代码目录使用命令makelinux-2.6-xen-config CONFIGMODE=menuconfig，进入图形界面后需要将instrumentationsupport中的OProfile选中(一共两个选项，选择第一个选项以及第一个选项下的子选项即可)，保存并退出，然后进行Xen的轻量级安装，具体的过程可以查看Xen的ReadMe文件：      
<pre>
<code>    

# make linux-2.6-xen-build        
# make linux-2.6-xen-instal  
</code>
</pre>

**Xenopof的使用**

 

** **Xen编译安装好后，重新启动进入新编好的内核，其详细用法可以详细参考Oprofile的使用例子[_http://oprofile.sourceforge.net/examples/_](http://oprofile.sourceforge.net/examples/)      
这里从虚拟机的测试来说明他的用法，它的相关资料可以在[http://www.xen.org/files/summit_3/**xenoprof_tutorial**.pdf](http://www.xen.org/files/summit_3/xenoprof_tutorial.pdf)找到.      
虚拟化下oprofile的测试分为两种，一种是主动模式，一种是被动模式，对于半虚拟化建议使用主动模式方式，而被动模式仅在镜像无法自定义修改的情况下使用，并且实验证明主动模式对于测试xen或者内核的开发的测试所获得的信息比被动模式要多.Xenoprof会建立一个profile的session，在这个session里可以有选择性地对多个虚拟机进行profile，以获取内核或应用程序的性能信息。启动这个会话的过程尤为重要，执行顺序特别要按照tutorial中来。其实这两种方式在tutoria中其实已经写得非常清楚了，这里不浪费资源重复写。这里特别说一下执行顺序和相关问题:

 

  
  1. **环境检查**。opcontrol --reset做安装检查，在dom0中一般都可以通过，domu中无法通过，则需要检查一下你的半虚拟化镜像的制作是否是在oprofile安装好之后。
   
  2. **opcontrol –help 可以查看相关的帮助,**
   
  3. **开始要分别在各个dom0和domu中做opcontrol --reset的操作**
   
  4. **start-daemon的配置。         
**dom0> opcontrol --start-daemon --event=GLOBAL_POWER_EVENTS:1000000        
--xen=/boot/xen-syms-3.0-unstable –vmlinux=/boot/vmlinux-syms-2.6.16.13-xen0        
--active-domains=1,3        
如上所示，可以用opcontrol --help|more来查看一些需要配置的信息。最主要的是以下几个：        
**-e/event:监测的事件。**比如我想去监测CPU不空闲的时候的比率。用CPU_CLK_UNHALTED(这个对不同的CPU是不一定相同的，还有硬件不支持的，只能用时钟中断的方式来监测,注意CPUHalted的理解：        
_ 无论什么时候，只要操作系统调用HALT指令，CPU就会进入一种称之为HALT（译注：处于停机指令周期状态，又称C1状态，下同）的状态。具体来讲，当CPU进入HALT状态时，它的时钟信号就会被切断关闭一段时间。就在时钟信号关闭期间，CPU芯片逻辑单元也会相应地停止工作，这样就达到了节能目的。与此同时，系统性能也会受到较大影响。不过，HALT指令通常在系统繁忙期间并不会被调用，所以，HALT的性能损失并不大。（[http://bbs.ocer.net/thread-271444-2-1.html](http://bbs.ocer.net/thread-271444-2-1.html)）          
_--xen 指向xen的为压缩的镜像        
--vmlinux/--no-vmlinux:指定未压缩的内核文件，这个我在之前的文章[《Xen源码编译安装总结》](http://ijiessie.appspot.com/?p=43001)中提到过,在Xen编译过程中，同时还会生成一个未压缩的vmlinux文件在/lib/modules/2.6.18.8-xen/build，直接将其拷出来引用即可.        
--active-domains 则是指定将要评测的dom的ID，这个可用通过xm list命令查看得到.
   
  5. **在会话start-daemon启动之后，先启动domu的 start，再启动dom0的start,会话结束时，却是先直接用dom0的stop关掉，然后再一次shutdown，这里频繁切换dom,可能觉得不方便，可以使用ssh/rsh执行远程命令的方式进行，可以尽可能的减少反应时间引起的误差.**
   
  6. **Opreport的使用         
**在测试结束后，需要用opreport进行分析，opreport的选项可以参考Oprofile的使用例子[_http://oprofile.sourceforge.net/examples/_](http://oprofile.sourceforge.net/examples/)        
opreport --help可以参看详细的用法和选项。通常我们在opreport中加入如下选项        
opreport -a -g --symbols --image-path=/lib/modules/2.6.18.8-xen/kernel >result        
其中-a指accumulate，即累加的，他可以方便的看到这段时间内某个事件的总时间,以CPU_CLK_UNHALTED为例，测试中，我们采用计算密集型程序进行测试，理论团队CPU应该几乎没有HLATED的时间，总的抽样数和CPU总的CLK数几乎吻合。        
-g，则表示会细化到某个模块源代码的某一行        
-l/—symobols 只相关符号，如函数等        
-p/—image-path表示相关模块的查找位置，通常我们选用/lib/modules文件夹下所用内核对应的模块，当然不同的需求可以按需指定。        
其余的命令不一一介绍，需要的话直接opreport --help就知道.        

