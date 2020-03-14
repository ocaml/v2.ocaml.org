<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li class="active"><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">The num library: arbitrary-precision rational arithmetic</a></div></nav></header>




<h1 class="chapter" id="sec562"><span>Chapter 28</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</h1>
<p>The <span class="c003">num</span> library implements integer arithmetic and rational
arithmetic in arbitrary precision. It was split off the core
OCaml distribution starting with the 4.06.0 release, and can now be found
at <a href="https://github.com/ocaml/num"><span class="c003">https://github.com/ocaml/num</span></a>.</p><p>New applications that need arbitrary-precision arithmetic should use the
<span class="c003">Zarith</span> library (<a href="https://github.com/ocaml/Zarith"><span class="c003">https://github.com/ocaml/Zarith</span></a>) instead of the <span class="c003">Num</span>
library, and older applications that already use <span class="c003">Num</span> are encouraged to
switch to <span class="c003">Zarith</span>. <span class="c003">Zarith</span> delivers much better performance than <span class="c003">Num</span>
and has a nicer API.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>