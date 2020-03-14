<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li class="active"><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">The str library: regular expressions and string processing</a></div></nav></header>




<h1 class="chapter" id="sec556"><span>Chapter 30</span>&nbsp;&nbsp;The str library: regular expressions and string processing</h1>
<p>The <span class="c003">str</span> library provides high-level string processing functions,
some based on regular expressions. It is intended to support the kind
of file processing that is usually performed with scripting languages
such as <span class="c003">awk</span>, <span class="c003">perl</span> or <span class="c003">sed</span>.</p><p>Programs that use the <span class="c003">str</span> library must be linked as follows:
</p><pre>        ocamlc <span class="c009">other options</span> str.cma <span class="c009">other files</span>
        ocamlopt <span class="c009">other options</span> str.cmxa <span class="c009">other files</span>
</pre><p>
For interactive use of the <span class="c003">str</span> library, do:
</p><pre>        ocamlmktop -o mytop str.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <span class="c003">ocaml</span> and type <span class="c003">#load "str.cma";;</span>.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.06/Str.html">Module <span class="c003">Str</span>: regular expressions and string processing</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>