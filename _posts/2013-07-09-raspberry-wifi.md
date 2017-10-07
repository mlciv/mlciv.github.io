---
layout: page
title: "Raspberry 无线网卡无法使用问题"
date: 2013-07-09 00:25
comments: true
categories: tech
tag:
- Raspberry
- wifi
---

最近入手了Raspberry Pi玩下，一起也买了推荐的免驱的EDUP N8508GS, 买回来用了几天，
实测确实免驱，不用自己折腾驱动了，刚开始使用的时候是将无线网卡接在HUB上的，使用
没有什么问题，但是用了几天，突然wifi突然不能自动获取到IP了，设置静态的IP也不能访
问网关，于是我试着重新切换到其他的系统，NOOBS确实是个入门尝鲜的好工具，可以很方
便的安装各种raspberry pi的系统进行尝试，我依次尝试了raspbmc，raspbian,Pidora都不
行。。。<!-- more -->

后来发现，我将EDUP wifi网卡直接插在Raspberry的USB上，而不经过USB HUB,发现就可以
了，目前还不清楚具体的是什么问题，看启动过程，插在hub上的时候，其实也是识别出了
wlan0网卡的，但是就是获取不到IP地址，而且手动配置也不行了，怀疑是电压或者hub本身
的问题导致不能正常工作，同样有这样的问题，还有rapoo的键鼠套装。具体原因未知，遇
到此类USB设备不好用的，可以试下直接连在Raspberry Pi的USB上试试，不经过USB HUB.

