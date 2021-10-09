---
layout: page
title: "Octopress+Github"
date: 2013-06-23 02:23
comments: true
categories: tech
---


网上在github上搭建Octopress的资料和博客有很多，本文是自己的系统环境（Mac OS 10.8.3）安装中遇到的一些问题，记录在此，少走弯路。

## 0.  初识Octopress
   认识Octopress是希望能通过markdown语法方便的写一些文章，一直在Mac使用的Mou，然后就想是否有用markdown语法直接写博客的系统和程序，然后就发现了Octopress，当然还有Hexo，后续有时间会再补充，基于node.js的Hexo比Octopress速度要快一些，但是文章不多，而且Hexo当时还不成熟，就暂时选用这个Octopress的方式来练习markdown语法写博客文章，本文也是第一篇，简单介绍下今天折腾Octopress的过程和遇到的问题。第一部分先介绍些Octopress相关的几个概念<!--more -->

* ### Github 
程序员的facebook，服务稳定，版本控制和存储方便，Github pages也提供了方便的二级域名，也可以绑定自己的域名，可提供基于静态页面的发布和访问。
* ### Markdown
Markdown 是一种轻量级的标记语言，由John Gruber和Aaron Swartz创建，使其成为可读性最大并可再发行的可输入输出的格式。这种语言创建灵感来自于已经存在的带标记的电子邮件文本。Markdown 允许 HTML 语法，所以使用者如果需要可以直接用 HTML来表示是可以的。Markdown最初由Gruber应用在Perl语言中，但现在已经有多种编程语言应用了。它是开源项目，并以BSD-style许可证的许可方式以插件形式或内容管理系统形式发布。Markdown语法参考[这里](http://wowubuntu.com/markdown/)
* ### Jekyll  
Jekyll是一个静态网站生成工具。它允许用户使用HTML、Markdown或Textile来建立静态页面，然后通过模板引擎Liquid（Liquid Templating Engine）来运行。Jekyll是基于Ruby编写的，所以配置本地环境时候也要先配置Ruby。
* ### Octopress 
基于Jekyll的一款强大和方便的博客框架和静态网站上生成系统。用Jekyll写博客，你不得不编写你自己的HTML模板,CSS,JS等配置，但是试用Octopress框架已经简化了这一切的开发成本，包括基于Compass和Sass的主题UI控制，此外还支持HTML语法以及适合移动浏览的页面布局，内部支持POW和rake的部署。
    
    因此结合这几个介绍，Octopress+github就是一个很方便程序员的博客方案，下文几部分就是搭建环境和配置过程中遇到的问题。


## 1. 环境搭建

### 1.0 Homebrew 
为了Mac下软件包安装的方便，需要先安装好homebrew
<pre>
<code>
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
</code>
</pre>
其使用方法，参见[官网](http://mxcl.github.com/homebrew/)。
### 1.1 Ruby
mac本身自带了ruby,可以使用`ruby -v` 查看版本号，`which ruby` 查看$PATH中设置的当前路径。可以看到版本是1.8.3版本，而octopress需要1.9.3+的版本，以及需要进行升级，rvm（ruby version manager）是用于管理ruby版本的，用rbenv也可以，rake是ruby中类似于make工具。如果你打算学习ruby/rails, rvm是必不可少的工具之一。Ruby的更新和安装请详细请参考http://ruby-china.org/wiki/rvm-guide 这篇wiki
<pre>
<code>
$ rvm install 1.9.3 && rvm use 1.9.3 
$ rvm ruby gems latest
</code>
</pre>
特别的，10.8.3下会出现./configure 会有如下错误信息
<pre>
<code>
configure: error: C compiler cannot create executables
See `config.log' for more details
##然后看details log发现是如下错误
ld: library not found for -lcrt1.10.6.o
</code>
</pre>

上述安装异常的解决方案，是将MacOSX的相关库加入环境变量即可：
<pre>
<code>
export C_INCLUDE_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/usr/include
export LIBRARY_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/usr/lib
</code>
</pre>


### 1.2 Git
试用homebrew安装git即可
<pre>
<code>
brew install git
</code>
</pre>
但是配置SSH的github帐号，过程，其实可以通过下载和运行Mac版的桌面github客户端自动解决public生成和拷贝的问题。具体链接http://mac.github.com/  该客户端也能方便跟踪github上的动态，推荐使用。
同时需要在Github上，创建自己的github的pages,登录Github，假设你的用户名是username，首先要新建一个命名为 username.github.com 的Repo，命名必须是这个格式，如果不这样命名的话，在运行命令 rake setup_github_pages  之后不能够自动创建后面提到的master和source 分支，而是作为普通仓库生成 gh-pages 分支。
这个比较简单，打开 Github 点底部的＋ Creat new Repositories
填写 name：       username.github.com
      descripiton:  blog
      local path：  自己指定一个地方
注意看网站创建的提示即可。

### 1.3 Octopress
安装比较简单，安装http://octopress.org/docs/setup/ 官网的安装过程进行即可。
部署到github pages上面的时候，逐一下ssh的权限，github pages的帐号信息的细节和对应即可。具体参考http://octopress.org/docs/deploying/github/ 官网部署过程即可。
特别注意rake在本地生成、预览的命令，以及将修改同步到github的方法介绍，基本上就按官网指定步骤进行即可。

### 1.4 Markdown编辑工具
Mac下用Mou 在app store中下载即可。
对于想试用vim进行markdown编辑，github上也有vim-ocotopress的vim插件。
vim的环境配置，强烈推荐试用基于vim-pathogen bundle方式的[vbundle](https://github.com/gmarik/vundle)进行bundle式插件管理，同时可以直接和托管在github上的各个vim-script bundle进行安装和更新。想深入了解，关注https://github.com/gmarik/vundle 进行安装和配置即可。
特别的，配置完后，启动vim Mac OS 10.8.3 会遇到一个python IOERROR的错误如下，
<code>
unable to open /usr/include/python2.7/pyconfig.h (No such file or directory)
</code>
这个也折腾了下，建立该文件的软链接即可，具体参考这个gist，https://gist.github.com/hasanozgan/3186381

上述准备工作的第三步做完其实已经可以写博客文章了，按照官网给点的更新步骤和命令发布和更新即可，这里用法不赘述，但是默认的主题和配置肯定不会让爱折腾的你满足的。所以就有了下面的第二步的初步配置Octopress，这里仅是说配置，因为更多的是利用别人已经写好的主题和样式，仅需配置，不需要自己开发。后续进阶才涉及到开发细节的开发修改。

## 2. 初步配置Octopress

### 2.0 Octopress的资源
先可以看下别人的Octopress都做成什么样子的，看完估计你肯定想折腾了。

* [The ultimate Octopress themes & plugins collection](http://octopressthemes.com/)
* [Ocotopress Sites](https://github.com/imathis/octopress/wiki/Octopress-Sites)
* [3rd Party Octopress Themes](https://github.com/imathis/octopress/wiki/3rd-Party-Octopress-Themes)
* [Top 10+ Ocotopress Themes](http://www.evolument.com/blog/2013/03/02/top-10-plus-octopress-themes/)

### 2.1 Octopress的个性化配置

待续



