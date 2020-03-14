<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li class="active"><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">The dynlink library: dynamic loading and linking of object files</a></div></nav></header>




<h1 class="chapter" id="sec570"><span>Chapter 33</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</h1>
<p>The <span class="c003">dynlink</span> library supports type-safe dynamic loading and linking
of bytecode object files (<span class="c003">.cmo</span> and <span class="c003">.cma</span> files) in a running
bytecode program, or of native plugins (usually <span class="c003">.cmxs</span> files) in a
running native program. Type safety is ensured by limiting the set of
modules from the running program that the loaded object file can
access, and checking that the running program and the loaded object
file have been compiled against the same interfaces for these modules.
In native code, there are also some compatibility checks on the
implementations (to avoid errors with cross-module optimizations); it
might be useful to hide <span class="c003">.cmx</span> files when building native plugins so
that they remain independent of the implementation of modules in the
main program.</p><p>Programs that use the <span class="c003">dynlink</span> library simply need to link
<span class="c003">dynlink.cma</span> or <span class="c003">dynlink.cmxa</span> with their object files and other libraries. </p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.08/Dynlink.html">Module <span class="c003">Dynlink</span>: dynamic loading of bytecode object files</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>