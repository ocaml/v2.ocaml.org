<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li class="active"><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.04</a></div><div class="toc_title"><a href="#">The num library: arbitrary-precision rational arithmetic</a></div></nav></header>




<h1 class="chapter" id="sec528"><span>Chapter 26</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</h1>
<p>The <span class="c006">num</span> library implements integer arithmetic and rational
arithmetic in arbitrary precision.</p><p>More documentation on the functions provided in this library can be found
in <em>The CAML Numbers Reference Manual</em> by
Valérie Ménissier-Morain, technical report 141, INRIA, july 1992
(available electronically,
<a href="http://hal.inria.fr/docs/00/07/00/27/PDF/RT-0141.pdf"><span class="c006">http://hal.inria.fr/docs/00/07/00/27/PDF/RT-0141.pdf</span></a>).</p><p>Programs that use the <span class="c006">num</span> library must be linked as follows:
</p><pre>        ocamlc <span class="c012">other options</span> nums.cma <span class="c012">other files</span>
        ocamlopt <span class="c012">other options</span> nums.cmxa <span class="c012">other files</span>
</pre><p>
For interactive use of the <span class="c006">nums</span> library, do:
</p><pre>        ocamlmktop -o mytop nums.cma
        ./mytop
</pre><p>
or (if dynamic linking of C libraries is supported on your platform),
start <span class="c006">ocaml</span> and type <span class="c006">#load "nums.cma";;</span>.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.04/Num.html">Module <span class="c006">Num</span>: operation on arbitrary-precision numbers</a>
</li><li class="li-links"><a href="../../api/4.04/Big_int.html">Module <span class="c006">Big_int</span>: operations on arbitrary-precision integers</a>
</li><li class="li-links"><a href="../../api/4.04/Arith_status.html">Module <span class="c006">Arith_status</span>: flags that control rational arithmetic</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>