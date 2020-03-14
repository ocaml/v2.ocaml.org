<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li class="active"><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The str library: regular expressions and string processing</a></div></nav></header>




<h1 class="chapter"><a name="htoc302"><span>Chapter 24</span></a>&nbsp;&nbsp;The str library: regular expressions and string processing</h1><p>The <tt>str</tt> library provides high-level string processing functions,
some based on regular expressions. It is intended to support the kind
of file processing that is usually performed with scripting languages
such as <tt>awk</tt>, <tt>perl</tt> or <tt>sed</tt>.</p><p>Programs that use the <tt>str</tt> library must be linked as follows:
</p><pre>        ocamlc <i>other options</i> str.cma <i>other files</i>
        ocamlopt <i>other options</i> str.cmxa <i>other files</i>
</pre><p>
For interactive use of the <tt>str</tt> library, do:
</p><pre>        ocamlmktop -o mytop str.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <tt>ocaml</tt> and type <tt>#load "str.cma";;</tt>.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Str.html">Module <tt>Str</tt>: regular expressions and string processing</a>
</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>