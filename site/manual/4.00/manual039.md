<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li class="active"><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The threads library</a></div></nav></header>




<h1 class="chapter"><a name="htoc303"><span>Chapter 25</span></a>&nbsp;&nbsp;The threads library</h1><p>
<a name="c:threads"></a>
</p><p>The <tt>threads</tt> library allows concurrent programming in OCaml.
It provides multiple threads of control (also called lightweight
processes) that execute concurrently in the same memory space. Threads
communicate by in-place modification of shared data structures, or by
sending and receiving data on communication channels.</p><p>The <tt>threads</tt> library is implemented by time-sharing on a single
processor. It will not take advantage of multi-processor machines.
Using this library will therefore never make programs run
faster. However, many programs are easier to write when structured as
several communicating processes.</p><p>Two implementations of the <tt>threads</tt> library are available, depending
on the capabilities of the operating system:
</p><ul class="itemize"><li class="li-itemize">
System threads. This implementation builds on the OS-provided threads
facilities: POSIX 1003.1c threads for Unix, and Win32 threads for
Windows. When available, system threads support both bytecode and
native-code programs.
</li><li class="li-itemize">VM-level threads. This implementation performs time-sharing and
context switching at the level of the OCaml virtual machine (bytecode
interpreter). It is available on Unix systems, and supports only
bytecode programs. It cannot be used with native-code programs.
</li></ul><p>
Programs that use system threads must be linked as follows:
</p><pre>        ocamlc -thread <i>other options</i> unix.cma threads.cma <i>other files</i>
        ocamlopt -thread <i>other options</i> unix.cmxa threads.cmxa <i>other files</i>
</pre><p>
Compilation units that use the <tt>threads</tt> library must also be compiled with
the <tt>-thread</tt> option (see chapter&nbsp;<a href="manual022.html#c:camlc">8</a>).</p><p>Programs that use VM-level threads must be compiled with the <tt>-vmthread</tt>
option to <tt>ocamlc</tt> (see chapter&nbsp;<a href="manual022.html#c:camlc">8</a>), and be linked as follows:
</p><pre>        ocamlc -vmthread <i>other options</i> threads.cma <i>other files</i>
</pre><p>
Compilation units that use <tt>threads</tt> library must also be compiled with
the <tt>-vmthread</tt> option (see chapter&nbsp;<a href="manual022.html#c:camlc">8</a>).</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Thread.html">Module <tt>Thread</tt>: lightweight threads</a>
</li><li class="li-links"><a href="../../api/4.00/Mutex.html">Module <tt>Mutex</tt>: locks for mutual exclusion</a>
</li><li class="li-links"><a href="../../api/4.00/Condition.html">Module <tt>Condition</tt>: condition variables to synchronize between threads</a>
</li><li class="li-links"><a href="../../api/4.00/Event.html">Module <tt>Event</tt>: first-class synchronous communication</a>
</li><li class="li-links"><a href="../../api/4.00/ThreadUnix.html">Module <tt>ThreadUnix</tt>: thread-compatible system calls</a>
</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>