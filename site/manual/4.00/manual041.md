<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual034.html">The core library</a></li><li><a href="manual035.html">The standard library</a></li><li><a href="manual036.html">The unix library: Unix system calls</a></li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="manual038.html">The str library: regular expressions and string processing</a></li><li><a href="manual039.html">The threads library</a></li><li><a href="manual040.html">The graphics library</a></li><li class="active"><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a></li><li><a href="manual043.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The dynlink library: dynamic loading and linking of object files</a></div></nav></header>




<h1 class="chapter"><a name="htoc305"><span>Chapter 27</span></a>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</h1><p>The <tt>dynlink</tt> library supports type-safe dynamic loading and linking
of bytecode object files (<tt>.cmo</tt> and <tt>.cma</tt> files) in a running
bytecode program, or of native plugins (usually <tt>.cmxs</tt> files) in a
running native program. Type safety is ensured by limiting the set of
modules from the running program that the loaded object file can
access, and checking that the running program and the loaded object
file have been compiled against the same interfaces for these modules.
In native code, there are also some compatibility checks on the
implementations (to avoid errors with cross-module optimizations); it
might be useful to hide <tt>.cmx</tt> files when building native plugins so
that they remain independent of the implementation of modules in the
main program.</p><p>Programs that use the <tt>dynlink</tt> library simply need to link
<tt>dynlink.cma</tt> or <tt>dynlink.cmxa</tt> with their object files and other libraries. </p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/Dynlink.html">Module <tt>Dynlink</tt>: dynamic loading of bytecode object files</a>
</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>