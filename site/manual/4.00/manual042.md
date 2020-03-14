<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li class="active"><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The LablTk library: Tcl/Tk GUI interface</a></div></nav></header>




<h1 class="chapter"><a name="htoc306"><span>Chapter 28</span></a>&nbsp;&nbsp;The LablTk library: Tcl/Tk GUI interface</h1><p>The <tt>labltk</tt> library provides access to the Tcl/Tk GUI from
OCaml programs. This interface is generated in an automated way, and
you should refer to Tcl/Tk books and man pages for detailed
information on the behavior of the numerous functions. We also suggest
to use <tt>ocamlbrowser</tt> to see the types of the various functions, that
are the best documentation for the library itself.</p><p><br>
Programs that use the <tt>labltk</tt> library must be linked as follows:
</p><pre>        ocamlc <i>other options</i> -I +labltk labltk.cma <i>other files</i>
        ocamlopt <i>other options</i> -I +labltk labltk.cmxa <i>other files</i>
</pre><blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp;
The <tt>labltk</tt> library is available for any system with Tcl/Tk installed,
starting from Tcl 7.5/Tk 4.1 up to Tcl/Tk 8.4. Beware that some beta
versions may have compatibility problems.<p>If the library was not compiled correctly, try to run again the
<tt>configure</tt> script with the option <tt>-tkdefs</tt> <i>switches</i>,
where <i>switches</i> is a list of C-style inclusion paths leading to
the right <tt>tcl.h</tt> and <tt>tk.h</tt>, for instance
<tt>"-I/usr/local/include/tcl8.4 -I/usr/local/include/tk8.4"</tt>.</p><p>A script is installed, to make easier the use of the <tt>labltk</tt>
library as toplevel.
</p><dl class="description"><dt class="dt-description">
<tt><b>labltk</b></tt></dt><dd class="dd-description">
This is a toplevel including the <tt>labltk</tt> library, and the path is
already set as to allow the use of the various modules. It also
includes code for the Unix and Str libraries. You can use it
in place of <tt>ocaml</tt>.
</dd></dl></blockquote><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
The <tt>labltk</tt> library has been precompiled for use with Tcl/Tk 8.4.
You must first have it installed on your system.
It can be downloaded from<br>
<tt>http://www.activestate.com/products/ActiveTcl/</tt>.
After installing it, you must put the dynamically loaded libraries
<tt>tcl84.dll</tt> and <tt>tk84.dll</tt> (from the <tt>bin</tt> directory of the Tcl
installation) in a directory included in you path.<p>No toplevel is available, but you can load the library from the
standard toplevel with the following commands.
</p><blockquote class="quote">
<pre># #directory "+labltk";;
# #load "labltk.cma";;
</pre></blockquote><p>
You can also load it directly from the command line.
</p><blockquote class="quote">
<pre>C:\ocaml\bin&gt; ocaml -I +labltk labltk.cma
</pre></blockquote></blockquote><p>The <tt>labltk</tt> library is composed of a large number of modules.
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
<tt>Tk</tt>. Note that for most other modules information can be found in the
Tcl <tt>man</tt> page of their name.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Tk.html">The <tt>Tk</tt> library: Basic functions and types for LablTk</a>
</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>