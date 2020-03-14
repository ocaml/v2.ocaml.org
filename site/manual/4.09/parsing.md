<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li><a href="stdlib.html">The standard library</a></li><li class="active"><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">The compiler front-end</a></div></nav></header>




<h1 class="chapter" id="sec560"><span>Chapter 26</span>&nbsp;&nbsp;The compiler front-end</h1>
<p> <a id="c:parsinglib"></a></p><p>
<a id="Compiler-underscorelibs"></a> </p><p>This chapter describes the OCaml front-end, which declares the abstract
syntax tree used by the compiler, provides a way to parse, print
and pretty-print OCaml code, and ultimately allows one to write abstract
syntax tree preprocessors invoked via the <span class="c003">-ppx</span> flag (see chapters&nbsp;<a href="comp.html#c%3Acamlc">9</a>
and&nbsp;<a href="native.html#c%3Anativecomp">12</a>).</p><p>It is important to note that the exported front-end interface follows the evolution of the OCaml language and implementation, and thus does not provide <span class="c013">any</span> backwards compatibility guarantees.</p><p>The front-end is a part of <span class="c003">compiler-libs</span> library.
Programs that use the <span class="c003">compiler-libs</span> library should be built as follows:
</p><pre>        ocamlfind ocamlc <span class="c009">other options</span> -package compiler-libs.common <span class="c009">other files</span>
        ocamlfind ocamlopt <span class="c009">other options</span> -package compiler-libs.common <span class="c009">other files</span>
</pre><p>
Use of the <span class="c003">ocamlfind</span> utility is recommended. However, if this is not possible, an alternative method may be used:
</p><pre>        ocamlc <span class="c009">other options</span> -I +compiler-libs ocamlcommon.cma <span class="c009">other files</span>
        ocamlopt <span class="c009">other options</span> -I +compiler-libs ocamlcommon.cmxa <span class="c009">other files</span>
</pre><p>
For interactive use of the <span class="c003">compiler-libs</span> library, start <span class="c003">ocaml</span> and
type<br>
<span class="c003">#load "compiler-libs/ocamlcommon.cma";;</span>.</p><ul class="ftoc2"><li class="li-links">
<a href="compilerlibref/Ast_helper.html">Module <span class="c003">Ast_helper</span>: helper functions for AST construction</a>
</li><li class="li-links"><a href="compilerlibref/Ast_mapper.html">Module <span class="c003">Ast_mapper</span>: -ppx rewriter interface</a>
</li><li class="li-links"><a href="compilerlibref/Asttypes.html">Module <span class="c003">Asttypes</span>: auxiliary types used by Parsetree</a>
</li><li class="li-links"><a href="compilerlibref/Location.html">Module <span class="c003">Location</span>: source code locations</a>
</li><li class="li-links"><a href="compilerlibref/Longident.html">Module <span class="c003">Longident</span>: long identifiers</a>
</li><li class="li-links"><a href="compilerlibref/Parse.html">Module <span class="c003">Parse</span>: OCaml syntax parsing</a>
</li><li class="li-links"><a href="compilerlibref/Parsetree.html">Module <span class="c003">Parsetree</span>: OCaml syntax tree</a>
</li><li class="li-links"><a href="compilerlibref/Pprintast.html">Module <span class="c003">Pprintast</span>: OCaml syntax printing</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>