<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li class="active"><a href="liblabltk.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The LablTk library: Tcl/Tk GUI interface</a></div></nav></header>




<h1 class="chapter" id="sec476"><span>Chapter 28</span>&nbsp;&nbsp;The LablTk library: Tcl/Tk GUI interface</h1>
<p>The <span class="c007">labltk</span> library provides access to the Tcl/Tk GUI from
OCaml programs. This interface is generated in an automated way, and
you should refer to Tcl/Tk books and man pages for detailed
information on the behavior of the numerous functions. We also suggest
to use <span class="c007">ocamlbrowser</span> to see the types of the various functions, that
are the best documentation for the library itself.</p><p><br>
Programs that use the <span class="c007">labltk</span> library must be linked as follows:
</p><pre>        ocamlc <span class="c013">other options</span> -I +labltk labltk.cma <span class="c013">other files</span>
        ocamlopt <span class="c013">other options</span> -I +labltk labltk.cmxa <span class="c013">other files</span>
</pre><blockquote class="quote"><span class="c011">Unix:</span>&nbsp;&nbsp;
The <span class="c007">labltk</span> library is available for any system with Tcl/Tk installed,
starting from Tcl 7.5/Tk 4.1 up to Tcl/Tk 8.4. Beware that some beta
versions may have compatibility problems.<p>If the library was not compiled correctly, try to run again the
<span class="c007">configure</span> script with the option <span class="c007">-tkdefs</span> <span class="c013">switches</span>,
where <span class="c013">switches</span> is a list of C-style inclusion paths leading to
the right <span class="c007">tcl.h</span> and <span class="c007">tk.h</span>, for instance
<span class="c007">"-I/usr/local/include/tcl8.4 -I/usr/local/include/tk8.4"</span>.</p><p>A script is installed, to make easier the use of the <span class="c007">labltk</span>
library as toplevel.
</p><dl class="description"><dt class="dt-description">
<span class="c010">labltk</span></dt><dd class="dd-description">
This is a toplevel including the <span class="c007">labltk</span> library, and the path is
already set as to allow the use of the various modules. It also
includes code for the Unix and Str libraries. You can use it
in place of <span class="c007">ocaml</span>.
</dd></dl></blockquote><blockquote class="quote"><span class="c011">Windows:</span>&nbsp;&nbsp;
The <span class="c007">labltk</span> library has been precompiled for use with Tcl/Tk 8.4.
You must first have it installed on your system.
It can be downloaded from <br>
<span class="c007">http://www.activestate.com/products/ActiveTcl/</span>.
After installing it, you must put the dynamically loaded libraries
<span class="c007">tcl84.dll</span> and <span class="c007">tk84.dll</span> (from the <span class="c007">bin</span> directory of the Tcl
installation) in a directory included in you path.<p>No toplevel is available, but you can load the library from the
standard toplevel with the following commands.
</p><blockquote class="quote">
<pre># #directory "+labltk";;
# #load "labltk.cma";;
</pre></blockquote><p>
You can also load it directly from the command line.
</p><blockquote class="quote">
<pre>C:\ocaml\bin&gt; ocaml -I +labltk labltk.cma
</pre></blockquote></blockquote><p>The <span class="c007">labltk</span> library is composed of a large number of modules.
</p><blockquote class="quote">
<pre>Bell                Imagebitmap         Place
Button              Imagephoto          Radiobutton
Canvas              Label               Scale
Checkbutton         Listbox             Scrollbar
Clipboard           Menu                Selection
Dialog              Menubutton          Text
Entry               Message             Tk
Focus               Option              Tkwait
Frame               Optionmenu          Toplevel
Grab                Pack                Winfo
Grid                Palette             Wm
</pre></blockquote><p>Giving a detailed account of each of these module would be impractical
here. We will just present some of the basic functions in the module
<span class="c007">Tk</span>. Note that for most other modules information can be found in the
Tcl <span class="c007">man</span> page of their name.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.01/Tk.html">The <span class="c007">Tk</span> library: Basic functions and types for LablTk</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>