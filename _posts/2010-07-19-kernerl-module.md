---
layout: page
author: jiec
comments: true
date: 2010-07-19 11:29:52+00:00
slug: None
title: kernel module编写系统调用--关于sys_call_table
categories:
    - Linux
    - Architecture
tag:
    - sys_call_table
    - kernel module
---


以下为08年时本科的一篇sys_call_table相关的日志【从原ijiessie.appspot.com迁移过来的】，算是我接触内核的第一篇日志，当时看到同学每次修改代码都得重新编译内核进行调试，我则先以模块形式配合系统调用表进行调试，加快了内核调试过程，有些许得意，遂记下这篇日志如下:<!-- more -->

 

最近做Linux内核编程的课程设计，借此机会记录一下自己遇到的问题和解决方案吧。      
我们知道sys_call_table保存的是系统的调用的函数地址，它的长度由系统调用的多少决定。       
而我们的做法是，sys.c中，添加我们的系统抵用函数，把它编译到内核中去。       
我们有印象，在unistd.h中，define了一个叫做NR_syscall常量，他就是这个数组的大小，既然这个数组储存的是函数的地址，我们可以想到如果可以将自己函数给某一个sys_call_table赋值，这样我们在用户程序中直接调用系统调用的话，就会转到我们的函数去执行了。对于这个内核态变量的修改，自然也只能是在内核态去做，即在内核模块编程中可以很简单的是实现。       
现在我们整理一下思路：   
    
* 1.在自己编写内核模块中，获得sys_call_table的地址，从而操作每一个系统调用的函数入口地址。       
* 2.编写自己的函数       
* 3.将原系统调用的地址保存在一个变量中，等到模块卸载的时候，恢复函数的地址。       
* 4.将自己函数的地址，赋值给相应的sys_call_table数组相应系统调用号的单元。       
* 5.在模块退出的函数部分，必须恢复原调用的函数地址。       

内核模块源代码如下： 
<pre>    
<code>  
#include <linux/syscalls.h>       
#include <asm/uaccess.h>       
#include <asm/io.h>       
#include <asm/unistd.h>       
#include <linux/kernel.h>       
#include <linux/init.h>       
#include <linux/module.h>       
MODULE_DESCRIPTION("My kernel module");       
MODULE_AUTHOR("Jiessie [(Jiessie@localhost.localdomain)](mailto:%28Jiessie@localhost.localdomain%29)");       
MODULE_LICENSE("$LICENSE$");       
static int (*anything_saved)(void);       
//注意asmlinkage，必须注明是堆栈传递参数的，不然会出错       
asmlinkage int sys_mynum(int num1,int num2)       
{       
	printk("sys_mynum: you have called me :)? And send me 2 num:%d,%d",num1,num2);       
	return num2;       
}       
static int test_init_module(void)       
{       
	extern long sys_call_table[];       
	anything_saved=(int(*)(void))(sys_call_table[325]);//替换，你最好选一个自己新添加的系统调用       
	sys_call_table[325]=(unsigned long)sys_mynum;       
	printk( KERN_DEBUG "Module test init\n" );       
	return 0;       
}       
static void test_exit_module(void)       
{       
	extern long sys_call_table[];       
	sys_call_table[325]=(unsigned long)anything_saved; //恢复系统调用       
	printk( KERN_DEBUG "Module test exit\n" );       
}       
module_init(test_init_module);       
module_exit(test_exit_module);       
</code>
</pre>
但是，在编译之后，用insmod插入的时候，出现错误，提示有非法的符号，你可以用dmesg进行查看，你会发现提示sys_call_table是非法的字符，即你用的extern没有访问到sys_call_table,发现这个问题，上网查到，原来sys_call_table没有在2.4以后的版本中EXPORT,需要自己在一个叫做ksyms.h文件中，将其导出。       
具体查了一下，是一个在/usr/src/linux-2.6.23.1/arch/i386/kernel/i386-ksyms.c里面。       
好了，这样，你在上述文件中，加上
<pre>
<code>       
extern long sys_call_table[];       
EXPORT_SYMBOL(sys_call_table);       
</code>
</pre>
重新编译一次内核即可，这样在以后，如果发现自己的系统调用有错，或是想调试，不需要每次都去编译内核，直接插入前面的内核模块，即可实现内核系统调用的改变，从而方便的调试和修改了。       
如果你还在不停的编译内核，不妨试一试，在一次编译之前加上       
<pre>
<code>
extern long sys_call_table[];       
EXPORT_SYMBOL(sys_call_table);       
</code>
</pre>
将sys_call_table导出，以后你改系统调用就很简单了，甚至你还可以其他的“安全实验”。       
当然，你可以让你重新编译别人的内核是不太可能的，所以，这样导出sys_call_table是没有实战价值的，你可以参考       
[http://www.gd-emb.org/detail/id-43615.html](http://www.gd-emb.org/detail/id-43615.html)       
[http://www.hackhome.com/InfoView/Article_80923.html](http://www.hackhome.com/InfoView/Article_80923.html)       
这两种是通过查找0x80中断的处理程序来获得sys_call_table的地址的。大家也可以试一试。
