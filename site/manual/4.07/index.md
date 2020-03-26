<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="maintitle">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.07<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 July&nbsp;13, 2018<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.07/ocaml-4.07-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.07</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual049.html#start-section">Index of keywords</a></li></ul></nav></header>
<table class="center"><tbody><tr><td><h1 class="part" id="sec6">Part&nbsp;I<br>
An introduction to OCaml</h1></td></tr>
</tbody></table>
<p>
<a id="p:tutorials"></a>
</p>
<ul>
<li><a href="coreexamples.html"><span>Chapter 1</span>&nbsp;&nbsp;The core language</a>
</li><li><a href="moduleexamples.html"><span>Chapter 2</span>&nbsp;&nbsp;The module system</a>
</li><li><a href="objectexamples.html"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</a>
</li><li><a href="lablexamples.html"><span>Chapter 4</span>&nbsp;&nbsp;Labels and variants</a>
</li><li><a href="polymorphism.html"><span>Chapter 5</span>&nbsp;&nbsp;Polymorphism and its limitations</a>
</li><li><a href="advexamples.html"><span>Chapter 6</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec70">Part&nbsp;II<br>
The OCaml language</h1></td></tr>
</tbody></table>
<p>
<a id="p:refman"></a>
</p>
<ul>
<li><a href="language.html"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</a>
</li><li><a href="extn.html"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec280">Part&nbsp;III<br>
The OCaml tools</h1></td></tr>
</tbody></table>
<p>
<a id="p:commands"></a></p>
<ul>
<li><a href="comp.html"><span>Chapter 9</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
</li><li><a href="toplevel.html"><span>Chapter 10</span>&nbsp;&nbsp;The toplevel system or REPL (ocaml)</a>
</li><li><a href="runtime.html"><span>Chapter 11</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
</li><li><a href="native.html"><span>Chapter 12</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
</li><li><a href="lexyacc.html"><span>Chapter 13</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
</li><li><a href="depend.html"><span>Chapter 14</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
</li><li><a href="browser.html"><span>Chapter 15</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
</li><li><a href="ocamldoc.html"><span>Chapter 16</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
</li><li><a href="debugger.html"><span>Chapter 17</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
</li><li><a href="profil.html"><span>Chapter 18</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
</li><li><a href="manual033.html"><span>Chapter 19</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
</li><li><a href="intfc.html"><span>Chapter 20</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
</li><li><a href="flambda.html"><span>Chapter 21</span>&nbsp;&nbsp;Optimisation with Flambda</a>
</li><li><a href="spacetime.html"><span>Chapter 22</span>&nbsp;&nbsp;Memory profiling with Spacetime</a>
</li><li><a href="afl-fuzz.html"><span>Chapter 23</span>&nbsp;&nbsp;Fuzzing with afl-fuzz</a>
</li><li><a href="plugins.html"><span>Chapter 24</span>&nbsp;&nbsp;Compiler plugins</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec550">Part&nbsp;IV<br>
The OCaml library</h1></td></tr>
</tbody></table>
<p>
<a id="p:library"></a>
</p>
<ul>
<li><a href="core.html"><span>Chapter 25</span>&nbsp;&nbsp;The core library</a>
</li><li><a href="stdlib.html"><span>Chapter 26</span>&nbsp;&nbsp;The standard library</a>
</li><li><a href="parsing.html"><span>Chapter 27</span>&nbsp;&nbsp;The compiler front-end</a>
</li><li><a href="libunix.html"><span>Chapter 28</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li><a href="libnum.html"><span>Chapter 29</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li><a href="libstr.html"><span>Chapter 30</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li><a href="libthreads.html"><span>Chapter 31</span>&nbsp;&nbsp;The threads library</a>
</li><li><a href="libgraph.html"><span>Chapter 32</span>&nbsp;&nbsp;The graphics library</a>
</li><li><a href="libdynlink.html"><span>Chapter 33</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li><a href="libbigarray.html"><span>Chapter 34</span>&nbsp;&nbsp;The bigarray library</a>
</li></ul>
<table class="center"><tbody><tr><td><h1 class="part" id="sec567">Part&nbsp;V<br>
Appendix</h1></td></tr>
</tbody></table>
<p>
<a id="p:appendix"></a></p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.07/index_modules.html">Index of modules</a>
</li><li class="li-links"><a href="../../api/4.07/index_module_types.html">Index of module types</a>
</li><li class="li-links"><a href="../../api/4.07/index_types.html">Index of types</a>
</li><li class="li-links"><a href="../../api/4.07/index_exceptions.html">Index of exceptions</a>
</li><li class="li-links"><a href="../../api/4.07/index_values.html">Index of values</a>
</li></ul><ul>
<li><a href="manual049.html">Index of keywords</a>
</li></ul>

<hr style="height:2">

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>