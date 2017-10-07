---
layout: page
title: "Raspberry-GPIO试用"
date: 2013-07-03 22:14
comments: true
categories: tech 
tag:
- 树莓派
- raspberry
- gpio
---

# Raspberry pi GPIO 试用

最近入手了Raspberry Pi,安装了Raspxbmc系统 一个很漂亮的多媒体系统，在树莓派的论坛
和博客上也看到了用Raspberry Pi制作fm收音机的帖子，比较简单，只需要一根杜邦线和一
个调频的收音机即可。然后github上也有python版本的收音机的代码，因此可以很容易的实
践和研究，这篇介绍下Raspberry Pi GPIO和RPI.GPIO控制LED灯测试.<!-- more -->

## Raspberry Pi GPIO
### 0. GPIO 简介
树莓的两个特性就是OS+GPIO控制，General Purpose Input Output （通用输入/输出）简
称为GPIO，或总线扩展器，利用工业标准I2C、SMBus或SPI接口简化了I/O口的扩展。当微控
制器或芯片组没有足够的I/O端口，或当系统需要采用远端串行通信或控制时，GPIO产品能
够提供额外的控制和监视功能。因此利用GPIO口可以控制各种连接到Raspberry pi 上的LED
或者无线电发射器等等电子器件，从而达到将二进制的程序输出为电位的高低，达到控制的
目的。具体每个引脚的作用笔者写时并不完全清楚，请参考附录中的相关资料，在此不一一
赘述。
### 1. Python操作树莓派GPIO的必要准备
GPIO有很多语言提供的方便的类库接口，这里我介绍的python相关的操作。
<pre>
<code>
sudo apt-get install python-setuptools
sudo easy_install -U distribute
sudo apt-get install python-dev
sudo easy_install RPi.GPIO
</code>
</pre>
完成上述操作之后，可以简单实现一个对LED灯的控制，检测对输出的控制。

### 2. 了解GPIO编号 使用RPi.GPIO 控制LED灯闪烁
LED灯的一端接地，一端接上能控制高低电压输出的口，就可以控制LED灯的闪烁了。很多教
程中还强调尽可能在LED上还连上一定大小的电阻作为保护，仅是测试用就可以不用加电
阻了。
这里的规范请参考附录中的[Rasspberry Pi GPIO 编号规范
](ttp://pan.baidu.com/share/link?shareid=3603724891&uk=3559354163) 其中接地端连
接Ground可选择BOARD编号为6的接口，而控制高低信号的，可以选择BOARD编号为11的
GPIO17接口。具体的代码如下：
<pre>
<code>
!/usr/bin/env python
# -*- coding: utf-8 -*-
import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BOARD)
# need to set up every channel which are using as an input or an output
    GPIO.setup(11, GPIO.OUT)

    while True:
        print "set output low"
            GPIO.output(11, GPIO.LOW)
        time.sleep(1)
        print "set output high"
            GPIO.output(11, GPIO.HIGH)
        time.sleep(1)
</code>
</pre>

接好线后，运行上述python代码就可以看到LED等的闪烁效果了

## GPIO 附录

* [Rasspberry Pi GPIO 编号规范](http://pan.baidu.com/share/link?shareid=3603724891&uk=3559354163)
* [使用GPIO控制发光二极管](http://www.wutianqi.com/?p=3629)
