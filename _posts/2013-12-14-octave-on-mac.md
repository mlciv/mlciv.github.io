---
layout: page
title: "Octave on Mac"
date: 2013-12-14 19:21
comments: true
categories: Mac
tag:
- Mac
- Octave
---


For learning the [online machine learning course on coursera](https://class.coursera.org/ml-004/lecture/index), which use Octave for programming exercise, I need a Octave development enviroment on my MBP. But when I use <code>brew install octave</code>, I got a lot of errors, especially on Mac OS 10.9. After many times retry, eventually I sucesseed to install it, so I will depict my process on handle these problems occured in the tough installing process.
<pre>
<code>
brew doctor
brew update
brew search octave
brew tap homebrew/science
</code>
</pre>

<!-- more -->

# 0.Before using brew
 Before using brew, I have tried to download the octave pkg on its official site. But this drag-and-drop version pkg is always crashed on my Mac OS 10.9. So maybe installed by compling source through homebrew is good idea. And then you will find you will get the following compiler not found error as following:
<pre>
<code>
configure: error: no acceptable C compiler found in
</code>
</pre>
For handling the error above, you should update your xcode and install the Command Line Tool. In the Mac OS 10.9, you need use <code>xcode-select --install</code>. 
    
# 1.gfortran
By using <code>brew install gfortran</code>, you can succeed to installed it, but when <code>brew install octave</code> you will get the following error:
<pre>
<code>
Undefined symbols for architecture x86_64:
"_append_history", referenced from:
_octave_append_history in liboctave_la-oct-rl-hist.o
(maybe you meant: _octave_append_history)
"_history_list", referenced from:
_octave_history_list in liboctave_la-oct-rl-hist.o
(maybe you meant: _octave_history_list)
"_read_history_range", referenced from:
_octave_read_history_range in liboctave_la-oct-rl-hist.o
(maybe you meant: _octave_read_history_range)
"_rl_basic_quote_characters", referenced from:
...
...
</code>
</pre>
And I managed to solve this problem by installing a GCC compiler from the high performance computing website:
<code>
http://hpc.sourceforge.net/
</code>



Now you can try <code>brew install octave</code> again. Then maybe you will get the following error again.
<pre>
<code>
configure: error: A BLAS library was detected but found incompatible with
your Fortran 77 compiler settings
</code>
</pre>
    
For this you should use another octave link as following:
<pre>
<code>
brew install https://raw.github.com/Homebrew/homebrew-science/3c3fe3baaf926437f750f65456769c124d6be8e1/octave.rb --env=std
</code>
</pre>

To here, every things seems ok. It will take several minutes to compile the whole octave.

# 3. Link octave to /usr/local/
Please pay attention that for gcc-4.8-bin.tar.gz the unziped destination fold is /usr/local. you need sudo, bu after that you will get every fold in /usr/local has a wrong pessmion, and when you use try <code>brew install octave</code> you will encouter the following error:
<pre>
<code>
The formula built, but is not symlinked into /usr/local
Error: Permission denied - /usr/local/
</code>
</pre>

So for permission issue, you can do 
<code>
sudo chown -R yourname:admin /usr/local/
</code>
and linke the octave again.
To here, you already succeed a half and you can run octave in the the terminal now.

# 4. gnuplot
<pre><code>brew install gnuplot</code></pre>
Try run octave again, you will get this:
<pre>
<code>
gnuplot> set terminal aqua enhanced title "Figure 1" size 560 420  font
"*,6"
</code>
</pre>
    
For handling this error, you can type <code> setenv("GNUTERM", "X11")</code>
before you use plot() in octave.(And of course you need install X11 first.)

Wish this passage can hlep you!
