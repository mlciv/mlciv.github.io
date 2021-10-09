---
layout: page
title: "Mavericks CLT"
date: 2013-12-11 00:17
comments: true
categories: Mac 
---

After the Apple Inc. make the Mavericks free, I upgrade my os of MBP into Mac OS X
Mavericks.But I found that some basic header files such as "stdio.h" are gone and some
tools can not be build normally.

So the problem is the Command Line Tools which has not be installed right, .
For the early version of xcode. you can install the CLT by find it in the
xcode->preferences->download. But for Mavericks, there is no more CLT in the
download list. And the following is the right method to install.
<pre>
<code>
xcode-select --install
</code>
</pre>

