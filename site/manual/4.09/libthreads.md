<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li class="active"><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">The threads library</a></div></nav></header>




<h1 class="chapter" id="sec564"><span>Chapter 30</span>&nbsp;&nbsp;The threads library</h1>
<p>
<a id="c:threads"></a></p><p><span class="c013">Warning:</span> the <span class="c003">threads</span> library is deprecated since version
4.08.0 of OCaml. Please switch to system threads, which have the same
API. Lightweight threads with VM-level scheduling are provided by
third-party libraries such as Lwt, but with a different API.</p><p>The <span class="c003">threads</span> library allows concurrent programming in OCaml.
It provides multiple threads of control (also called lightweight
processes) that execute concurrently in the same memory space. Threads
communicate by in-place modification of shared data structures, or by
sending and receiving data on communication channels.</p><p>The <span class="c003">threads</span> library is implemented by time-sharing on a single
processor. It will not take advantage of multi-processor machines.
Using this library will therefore never make programs run
faster. However, many programs are easier to write when structured as
several communicating processes.</p><p>Two implementations of the <span class="c003">threads</span> library are available, depending
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
</p><pre>        ocamlc -I +threads <span class="c009">other options</span> unix.cma threads.cma <span class="c009">other files</span>
        ocamlopt -I +threads <span class="c009">other options</span> unix.cmxa threads.cmxa <span class="c009">other files</span>
</pre><p>
Compilation units that use the <span class="c003">threads</span> library must also be compiled with
the <span class="c003">-I +threads</span> option (see chapter&nbsp;<a href="comp.html#c%3Acamlc">9</a>).</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.09/Thread.html">Module <span class="c003">Thread</span>: lightweight threads</a>
</li><li class="li-links"><a href="../../api/4.09/Mutex.html">Module <span class="c003">Mutex</span>: locks for mutual exclusion</a>
</li><li class="li-links"><a href="../../api/4.09/Condition.html">Module <span class="c003">Condition</span>: condition variables to synchronize between threads</a>
</li><li class="li-links"><a href="../../api/4.09/Event.html">Module <span class="c003">Event</span>: first-class synchronous communication</a>
</li><li class="li-links"><a href="../../api/4.09/ThreadUnix.html">Module <span class="c003">ThreadUnix</span>: thread-compatible system calls</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>