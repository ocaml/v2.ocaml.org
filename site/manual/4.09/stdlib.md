<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li class="active"><a href="stdlib.html">The standard library</a></li><li><a href="parsing.html">The compiler front-end</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul>




<h1 class="chapter" id="sec558"><span>Chapter 25</span>&nbsp;&nbsp;The standard library</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">The standard library</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec559">Conventions</a>
</li></ul></nav></header>
<p> <a id="c:stdlib"></a></p><p>This chapter describes the functions provided by the OCaml
standard library. The modules from the standard library are
automatically linked with the user’s object code files by the <span class="c003">ocamlc</span>
command. Hence, these modules can be used in standalone programs without
having to add any <span class="c003">.cmo</span> file on the command line for the linking
phase. Similarly, in interactive use, these globals can be used in
toplevel phrases without having to load any <span class="c003">.cmo</span> file in memory.</p><p>Unlike the core <span class="c003">Stdlib</span> module, submodules are not automatically
“opened” when compilation starts, or when the toplevel system is launched.
Hence it is necessary to use qualified identifiers to refer to the functions
provided by these modules, or to add <span class="c003">open</span> directives.</p><p><a id="stdlib:top"></a></p><h2 class="section" id="sec559">Conventions</h2>
<p>For easy reference, the modules are listed below in alphabetical order
of module names.
For each module, the declarations from its signature are printed
one by one in typewriter font, followed by a short comment.
All modules and the identifiers they export are indexed at the end of
this report.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.09/Arg.html">Module <span class="c003">Arg</span>: parsing of command line arguments</a>
</li><li class="li-links"><a href="../../api/4.09/Array.html">Module <span class="c003">Array</span>: array operations</a>
</li><li class="li-links"><a href="../../api/4.09/ArrayLabels.html">Module <span class="c003">ArrayLabels</span>: array operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.09/Bigarray.html">Module <span class="c003">Bigarray</span>: large, multi-dimensional, numerical arrays</a>
</li><li class="li-links"><a href="../../api/4.09/Bool.html">Module <span class="c003">Bool</span>: boolean values</a>
</li><li class="li-links"><a href="../../api/4.09/Buffer.html">Module <span class="c003">Buffer</span>: extensible buffers</a>
</li><li class="li-links"><a href="../../api/4.09/Bytes.html">Module <span class="c003">Bytes</span>: byte sequences</a>
</li><li class="li-links"><a href="../../api/4.09/BytesLabels.html">Module <span class="c003">BytesLabels</span>: byte sequences (with labels)</a>
</li><li class="li-links"><a href="../../api/4.09/Callback.html">Module <span class="c003">Callback</span>: registering OCaml values with the C runtime</a>
</li><li class="li-links"><a href="../../api/4.09/Char.html">Module <span class="c003">Char</span>: character operations</a>
</li><li class="li-links"><a href="../../api/4.09/Complex.html">Module <span class="c003">Complex</span>: Complex numbers</a>
</li><li class="li-links"><a href="../../api/4.09/Digest.html">Module <span class="c003">Digest</span>: MD5 message digest</a>
</li><li class="li-links"><a href="../../api/4.09/Ephemeron.html">Module <span class="c003">Ephemeron</span>: Ephemerons and weak hash table</a>
</li><li class="li-links"><a href="../../api/4.09/Filename.html">Module <span class="c003">Filename</span>: operations on file names</a>
</li><li class="li-links"><a href="../../api/4.09/Float.html">Module <span class="c003">Float</span>: Floating-point numbers</a>
</li><li class="li-links"><a href="../../api/4.09/Format.html">Module <span class="c003">Format</span>: pretty printing</a>
</li><li class="li-links"><a href="../../api/4.09/Fun.html">Module <span class="c003">Fun</span>: function values</a>
</li><li class="li-links"><a href="../../api/4.09/Gc.html">Module <span class="c003">Gc</span>: memory management control and statistics; finalized values</a>
</li><li class="li-links"><a href="../../api/4.09/Genlex.html">Module <span class="c003">Genlex</span>: a generic lexical analyzer</a>
</li><li class="li-links"><a href="../../api/4.09/Hashtbl.html">Module <span class="c003">Hashtbl</span>: hash tables and hash functions</a>
</li><li class="li-links"><a href="../../api/4.09/Int.html">Module <span class="c003">Int</span>: integers</a>
</li><li class="li-links"><a href="../../api/4.09/Int32.html">Module <span class="c003">Int32</span>: 32-bit integers</a>
</li><li class="li-links"><a href="../../api/4.09/Int64.html">Module <span class="c003">Int64</span>: 64-bit integers</a>
</li><li class="li-links"><a href="../../api/4.09/Lazy.html">Module <span class="c003">Lazy</span>: deferred computations</a>
</li><li class="li-links"><a href="../../api/4.09/Lexing.html">Module <span class="c003">Lexing</span>: the run-time library for lexers generated by <span class="c003">ocamllex</span></a>
</li><li class="li-links"><a href="../../api/4.09/List.html">Module <span class="c003">List</span>: list operations</a>
</li><li class="li-links"><a href="../../api/4.09/ListLabels.html">Module <span class="c003">ListLabels</span>: list operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.09/Map.html">Module <span class="c003">Map</span>: association tables over ordered types</a>
</li><li class="li-links"><a href="../../api/4.09/Marshal.html">Module <span class="c003">Marshal</span>: marshaling of data structures</a>
</li><li class="li-links"><a href="../../api/4.09/MoreLabels.html">Module <span class="c003">MoreLabels</span>: Include modules <span class="c003">Hashtbl</span>, <span class="c003">Map</span> and <span class="c003">Set</span> with labels</a>
</li><li class="li-links"><a href="../../api/4.09/Nativeint.html">Module <span class="c003">Nativeint</span>: processor-native integers</a>
</li><li class="li-links"><a href="../../api/4.09/Oo.html">Module <span class="c003">Oo</span>: object-oriented extension</a>
</li><li class="li-links"><a href="../../api/4.09/Option.html">Module <span class="c003">Option</span>: option values</a>
</li><li class="li-links"><a href="../../api/4.09/Parsing.html">Module <span class="c003">Parsing</span>: the run-time library for parsers generated by <span class="c003">ocamlyacc</span></a>
</li><li class="li-links"><a href="../../api/4.09/Printexc.html">Module <span class="c003">Printexc</span>: facilities for printing exceptions</a>
</li><li class="li-links"><a href="../../api/4.09/Printf.html">Module <span class="c003">Printf</span>: formatting printing functions</a>
</li><li class="li-links"><a href="../../api/4.09/Queue.html">Module <span class="c003">Queue</span>: first-in first-out queues</a>
</li><li class="li-links"><a href="../../api/4.09/Random.html">Module <span class="c003">Random</span>: pseudo-random number generator (PRNG)</a>
</li><li class="li-links"><a href="../../api/4.09/Result.html">Module <span class="c003">Result</span>: result values</a>
</li><li class="li-links"><a href="../../api/4.09/Scanf.html">Module <span class="c003">Scanf</span>: formatted input functions</a>
</li><li class="li-links"><a href="../../api/4.09/Seq.html">Module <span class="c003">Seq</span>: functional iterators</a>
</li><li class="li-links"><a href="../../api/4.09/Set.html">Module <span class="c003">Set</span>: sets over ordered types</a>
</li><li class="li-links"><a href="../../api/4.09/Spacetime.html">Module <span class="c003">Spacetime</span>: memory profiler</a>
</li><li class="li-links"><a href="../../api/4.09/Stack.html">Module <span class="c003">Stack</span>: last-in first-out stacks</a>
</li><li class="li-links"><a href="../../api/4.09/StdLabels.html">Module <span class="c003">StdLabels</span>: Include modules <span class="c003">Array</span>, <span class="c003">List</span> and <span class="c003">String</span> with labels</a>
</li><li class="li-links"><a href="../../api/4.09/Stream.html">Module <span class="c003">Stream</span>: streams and parsers</a>
</li><li class="li-links"><a href="../../api/4.09/String.html">Module <span class="c003">String</span>: string operations</a>
</li><li class="li-links"><a href="../../api/4.09/StringLabels.html">Module <span class="c003">StringLabels</span>: string operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.09/Sys.html">Module <span class="c003">Sys</span>: system interface</a>
</li><li class="li-links"><a href="../../api/4.09/Uchar.html">Module <span class="c003">Uchar</span>: Unicode characters</a>
</li><li class="li-links"><a href="../../api/4.09/Unit.html">Module <span class="c003">Unit</span>: unit values</a>
</li><li class="li-links"><a href="../../api/4.09/Weak.html">Module <span class="c003">Weak</span>: arrays of weak pointers</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>