<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li class="active"><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">The graphics library</a></div></nav></header>




<h1 class="chapter" id="sec573"><span>Chapter 31</span>&nbsp;&nbsp;The graphics library</h1>
<p>Since OCaml 4.09, the <span class="c003">graphics</span> library is distributed as an external
package. Its new home is:</p><p><a href="https://github.com/ocaml/graphics"><span class="c003">https://github.com/ocaml/graphics</span></a></p><p>If you are using the opam package manager, you should install the
corresponding <span class="c003">graphics</span> package:</p><pre>        opam install graphics
</pre><p>Before OCaml 4.09, this package simply ensures that the <span class="c003">graphics</span>
library was installed by the compiler, and starting from OCaml 4.09
this package effectively provides the <span class="c003">graphics</span> library.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>