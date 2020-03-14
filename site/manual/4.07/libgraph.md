<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li class="active"><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.07</a></div><div class="toc_title"><a href="#">The graphics library</a></div></nav></header>




<h1 class="chapter" id="sec564"><span>Chapter 32</span>&nbsp;&nbsp;The graphics library</h1>
<p>The <span class="c003">graphics</span> library provides a set of portable drawing primitives.
Drawing takes place
in a separate window that is created when <span class="c003">Graphics.open_graph</span> is called.</p><blockquote class="quote"><span class="c007">Unix:</span>&nbsp;&nbsp;
This library is implemented under the X11 windows system. 
Programs that use the <span class="c003">graphics</span> library must be linked as follows:
<pre>        ocamlc <span class="c009">other options</span> graphics.cma <span class="c009">other files</span>
</pre>
For interactive use of the <span class="c003">graphics</span> library, do:
<pre>        ocamlmktop -o mytop graphics.cma
        ./mytop
</pre>
or (if dynamic linking of C libraries is supported on your platform),
start <span class="c003">ocaml</span> and type <span class="c003">#load "graphics.cma";;</span>.<p>Here are the graphics mode specifications supported by
<span class="c003">Graphics.open_graph</span> on
the X11 implementation of this library:
the argument to <span class="c003">Graphics.open_graph</span> has the format
<span class="c003">"</span><span class="c009">display-name geometry</span><span class="c003">"</span>,
where <span class="c009">display-name</span> is the name of the X-windows display to
connect to, and <span class="c009">geometry</span> is a standard X-windows geometry
specification. The two components are separated by a space. Either can
be omitted, or both. Examples:
</p><dl class="description"><dt class="dt-description">
<span class="c006">Graphics.open_graph "foo:0"</span></dt><dd class="dd-description">
connects to the display <span class="c003">foo:0</span> and creates a window with the default geometry
</dd><dt class="dt-description"><span class="c006">Graphics.open_graph "foo:0 300x100+50-0"</span></dt><dd class="dd-description">
connects to the display <span class="c003">foo:0</span> and creates a window 300 pixels wide
by 100 pixels tall, at location (50,0)
</dd><dt class="dt-description"><span class="c006">Graphics.open_graph " 300x100+50-0"</span></dt><dd class="dd-description">
connects to the default display and creates a window 300 pixels wide
by 100 pixels tall, at location (50,0)
</dd><dt class="dt-description"><span class="c006">Graphics.open_graph ""</span></dt><dd class="dd-description">
connects to the default display and creates a window with the default
geometry.
</dd></dl></blockquote><blockquote class="quote"><span class="c007">Windows:</span>&nbsp;&nbsp;
This library is available both for standalone compiled programs and
under the toplevel application <span class="c003">ocamlwin.exe</span>. For the latter, this
library must be loaded in-core by typing
<pre>        #load "graphics.cma";;
</pre></blockquote><p>The screen coordinates are interpreted as shown in the figure below.
Notice that the coordinate system used is the same as in mathematics:
<span class="c009">y</span> increases from the bottom of the screen to the top of the screen,
and angles are measured counterclockwise (in degrees).
Drawing is clipped to the screen.
</p><div class="center">
<img src="libgraph.gif">
</div><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.07/Graphics.html">Module <span class="c003">Graphics</span>: machine-independent graphics primitives</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>