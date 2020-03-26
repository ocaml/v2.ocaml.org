<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.03<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 April&nbsp;25, 2016<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.03</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual045.html#start-section">Index of keywords</a></li></ul></nav></header>
<table class="center"><tbody><tr><td><h1 class="part" id="sec6">Part&nbsp;I<br>
An introduction to OCaml</h1></td></tr>
</tbody></table>
<p>
<a id="p:tutorials"></a>
</p>
<ul>
<li><a href="coreexamples.html">The core language</a>
</li><li><a href="moduleexamples.html">The module system</a>
</li><li><a href="objectexamples.html">Objects in OCaml</a>
</li><li><a href="lablexamples.html">Labels and variants</a>
</li><li><a href="advexamples.html">Advanced examples with classes and modules</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec58">Part&nbsp;II<br>
The OCaml language</h1></td></tr>
</tbody></table>
<p>
<a id="p:refman"></a>
</p>
<ul>
<li><a href="language.html">The OCaml language</a>
</li><li><a href="extn.html">Language extensions</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec261">Part&nbsp;III<br>
The OCaml tools</h1></td></tr>
</tbody></table>
<p>
<a id="p:commands"></a></p>
<ul>
<li><a href="comp.html">Batch compilation (ocamlc)</a>
</li><li><a href="toplevel.html">The toplevel system (ocaml)</a>
</li><li><a href="runtime.html">The runtime system (ocamlrun)</a>
</li><li><a href="native.html">Native-code compilation (ocamlopt)</a>
</li><li><a href="lexyacc.html">Lexer and parser generators (ocamllex, ocamlyacc)</a>
</li><li><a href="depend.html">Dependency generator (ocamldep)</a>
</li><li><a href="browser.html">The browser/editor (ocamlbrowser)</a>
</li><li><a href="ocamldoc.html">The documentation generator (ocamldoc)</a>
</li><li><a href="debugger.html">The debugger (ocamldebug)</a>
</li><li><a href="profil.html">Profiling (ocamlprof)</a>
</li><li><a href="manual032.html">The ocamlbuild compilation manager</a>
</li><li><a href="intfc.html">Interfacing C with OCaml</a>
</li><li><a href="flambda.html">Optimisation with Flambda</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec509">Part&nbsp;IV<br>
The OCaml library</h1></td></tr>
</tbody></table>
<p>
<a id="p:library"></a>
</p>
<ul>
<li><a href="core.html">The core library</a>
</li><li><a href="stdlib.html">The standard library</a>
</li><li><a href="parsing.html">The compiler front-end</a>
</li><li><a href="libunix.html">The unix library: Unix system calls</a>
</li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a>
</li><li><a href="libstr.html">The str library: regular expressions and string processing</a>
</li><li><a href="libthreads.html">The threads library</a>
</li><li><a href="libgraph.html">The graphics library</a>
</li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a>
</li><li><a href="libbigarray.html">The bigarray library</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec531">Part&nbsp;V<br>
Appendix</h1></td></tr>
</tbody></table>
<p>
<a id="p:appendix"></a></p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.03/index_modules.html">Index of modules</a>
</li><li class="li-links"><a href="../../api/4.03/index_module_types.html">Index of module types</a>
</li><li class="li-links"><a href="../../api/4.03/index_types.html">Index of types</a>
</li><li class="li-links"><a href="../../api/4.03/index_exceptions.html">Index of exceptions</a>
</li><li class="li-links"><a href="../../api/4.03/index_values.html">Index of values</a>
</li></ul><ul>
<li><a href="manual045.html">Index of keywords</a>
</li></ul>

<hr style="height:2">

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>