<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<font size="7">The OCaml system<br>
 release 4.00<br>
</font><font size="5">Documentation and user’s manual<br>
</font><font size="4">Xavier Leroy,<br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon<br>
 July&nbsp;26, 2012<br>
 &nbsp;
</font><font size="3">Copyright © 2012 Institut National de
Recherche en Informatique et en Automatique
</font></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr size="2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="manual002.html#start-section">Foreword</a>
</li><li class="top"><a href="manual044.html#start-section">Index of keywords</a></li></ul></nav></header>
<table class="center"><tbody><tr><td><h1 class="part"><a name="htoc1">Part&nbsp;I</a><br>
An introduction to OCaml</h1></td></tr>
</tbody></table><p>
<a name="p:tutorials"></a>
</p><ul>
<li><a href="manual003.html">The core language</a>
</li><li><a href="manual004.html">The module system</a>
</li><li><a href="manual005.html">Objects in OCaml</a>
</li><li><a href="manual006.html">Labels and variants</a>
</li><li><a href="manual007.html">Advanced examples with classes and modules</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part"><a name="htoc50">Part&nbsp;II</a><br>
The OCaml language</h1></td></tr>
</tbody></table><p>
<a name="p:refman"></a>
</p><ul>
<li><a href="language.html">The OCaml language</a>
</li><li><a href="manual021.html">Language extensions</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part"><a name="htoc114">Part&nbsp;III</a><br>
The OCaml tools</h1></td></tr>
</tbody></table><p>
<a name="p:commands"></a></p><ul>
<li><a href="manual022.html">Batch compilation (ocamlc)</a>
</li><li><a href="manual023.html">The toplevel system (ocaml)</a>
</li><li><a href="manual024.html">The runtime system (ocamlrun)</a>
</li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a>
</li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a>
</li><li><a href="manual027.html">Dependency generator (ocamldep)</a>
</li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a>
</li><li><a href="manual029.html">The documentation generator (ocamldoc)</a>
</li><li><a href="manual030.html">The debugger (ocamldebug)</a>
</li><li><a href="manual031.html">Profiling (ocamlprof)</a>
</li><li><a href="manual032.html">The ocamlbuild compilation manager</a>
</li><li><a href="manual033.html">Interfacing C with OCaml</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part"><a name="htoc295">Part&nbsp;IV</a><br>
The OCaml library</h1></td></tr>
</tbody></table><p>
<a name="p:library"></a>
</p><ul>
<li><a href="manual034.html">The core library</a>
</li><li><a href="manual035.html">The standard library</a>
</li><li><a href="manual036.html">The unix library: Unix system calls</a>
</li><li><a href="manual037.html">The num library: arbitrary-precision rational arithmetic</a>
</li><li><a href="manual038.html">The str library: regular expressions and string processing</a>
</li><li><a href="manual039.html">The threads library</a>
</li><li><a href="manual040.html">The graphics library</a>
</li><li><a href="manual041.html">The dynlink library: dynamic loading and linking of object files</a>
</li><li><a href="manual042.html">The LablTk library: Tcl/Tk GUI interface</a>
</li><li><a href="manual043.html">The bigarray library</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part"><a name="htoc313">Part&nbsp;V</a><br>
Appendix</h1></td></tr>
</tbody></table><p>
<a name="p:appendix"></a></p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.00/index_modules.html">Index of modules</a>
</li><li class="li-links"><a href="../../api/4.00/index_module_types.html">Index of module types</a>
</li><li class="li-links"><a href="../../api/4.00/index_types.html">Index of types</a>
</li><li class="li-links"><a href="../../api/4.00/index_exceptions.html">Index of exceptions</a>
</li><li class="li-links"><a href="../../api/4.00/index_values.html">Index of values</a>
</li></ul><ul>
<li><a href="manual044.html">Index of keywords</a>
</li></ul>

<hr size="2">

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>