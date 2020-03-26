<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="core.html">The core library</a></li><li class="active"><a href="stdlib.html">The standard library</a></li><li><a href="libunix.html">The unix library: Unix system calls</a></li><li><a href="libnum.html">The num library: arbitrary-precision rational arithmetic</a></li><li><a href="libstr.html">The str library: regular expressions and string processing</a></li><li><a href="libthreads.html">The threads library</a></li><li><a href="libgraph.html">The graphics library</a></li><li><a href="libdynlink.html">The dynlink library: dynamic loading and linking of object files</a></li><li><a href="libbigarray.html">The bigarray library</a></li></ul>




<h1 class="chapter" id="sec477"><span>Chapter 21</span>&nbsp;&nbsp;The standard library</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.02</a></div><div class="toc_title"><a href="#">The standard library</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="stdlib.html#sec478">Conventions</a>
</li></ul></nav></header>
<p> <a id="c:stdlib"></a></p><p>This chapter describes the functions provided by the OCaml
standard library. The modules from the standard library are
automatically linked with the user’s object code files by the <span class="c007">ocamlc</span>
command. Hence, these modules can be used in standalone programs without
having to add any <span class="c007">.cmo</span> file on the command line for the linking
phase. Similarly, in interactive use, these globals can be used in
toplevel phrases without having to load any <span class="c007">.cmo</span> file in memory.</p><p>Unlike the <span class="c007">Pervasives</span> module from the core library, the modules from the
standard library are not automatically “opened” when a compilation
starts, or when the toplevel system is launched. Hence it is necessary
to use qualified identifiers to refer to the functions provided by these
modules, or to add <span class="c007">open</span> directives.</p><p><a id="stdlib:top"></a></p><h2 class="section" id="sec478">Conventions</h2>
<p>For easy reference, the modules are listed below in alphabetical order
of module names.
For each module, the declarations from its signature are printed
one by one in typewriter font, followed by a short comment.
All modules and the identifiers they export are indexed at the end of
this report.</p><ul class="ftoc2"><li class="li-links">
<a href="../../api/4.02/Arg.html">Module <span class="c007">Arg</span>: parsing of command line arguments</a>
</li><li class="li-links"><a href="../../api/4.02/Array.html">Module <span class="c007">Array</span>: array operations</a>
</li><li class="li-links"><a href="../../api/4.02/ArrayLabels.html">Module <span class="c007">ArrayLabels</span>: array operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.02/Buffer.html">Module <span class="c007">Buffer</span>: extensible buffers</a>
</li><li class="li-links"><a href="../../api/4.02/Bytes.html">Module <span class="c007">Bytes</span>: byte sequences</a>
</li><li class="li-links"><a href="../../api/4.02/Callback.html">Module <span class="c007">Callback</span>: registering OCaml values with the C runtime</a>
</li><li class="li-links"><a href="../../api/4.02/Char.html">Module <span class="c007">Char</span>: character operations</a>
</li><li class="li-links"><a href="../../api/4.02/Complex.html">Module <span class="c007">Complex</span>: Complex numbers</a>
</li><li class="li-links"><a href="../../api/4.02/Digest.html">Module <span class="c007">Digest</span>: MD5 message digest</a>
</li><li class="li-links"><a href="../../api/4.02/Filename.html">Module <span class="c007">Filename</span>: operations on file names</a>
</li><li class="li-links"><a href="../../api/4.02/Format.html">Module <span class="c007">Format</span>: pretty printing</a>
</li><li class="li-links"><a href="../../api/4.02/Gc.html">Module <span class="c007">Gc</span>: memory management control and statistics; finalized values</a>
</li><li class="li-links"><a href="../../api/4.02/Genlex.html">Module <span class="c007">Genlex</span>: a generic lexical analyzer</a>
</li><li class="li-links"><a href="../../api/4.02/Hashtbl.html">Module <span class="c007">Hashtbl</span>: hash tables and hash functions</a>
</li><li class="li-links"><a href="../../api/4.02/Int32.html">Module <span class="c007">Int32</span>: 32-bit integers</a>
</li><li class="li-links"><a href="../../api/4.02/Int64.html">Module <span class="c007">Int64</span>: 64-bit integers</a>
</li><li class="li-links"><a href="../../api/4.02/Lazy.html">Module <span class="c007">Lazy</span>: deferred computations</a>
</li><li class="li-links"><a href="../../api/4.02/Lexing.html">Module <span class="c007">Lexing</span>: the run-time library for lexers generated by <span class="c007">ocamllex</span></a>
</li><li class="li-links"><a href="../../api/4.02/List.html">Module <span class="c007">List</span>: list operations</a>
</li><li class="li-links"><a href="../../api/4.02/ListLabels.html">Module <span class="c007">ListLabels</span>: list operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.02/Map.html">Module <span class="c007">Map</span>: association tables over ordered types</a>
</li><li class="li-links"><a href="../../api/4.02/Marshal.html">Module <span class="c007">Marshal</span>: marshaling of data structures</a>
</li><li class="li-links"><a href="../../api/4.02/MoreLabels.html">Module <span class="c007">MoreLabels</span>: Include modules <span class="c007">Hashtbl</span>, <span class="c007">Map</span> and <span class="c007">Set</span> with labels</a>
</li><li class="li-links"><a href="../../api/4.02/Nativeint.html">Module <span class="c007">Nativeint</span>: processor-native integers</a>
</li><li class="li-links"><a href="../../api/4.02/Oo.html">Module <span class="c007">Oo</span>: object-oriented extension</a>
</li><li class="li-links"><a href="../../api/4.02/Parsing.html">Module <span class="c007">Parsing</span>: the run-time library for parsers generated by <span class="c007">ocamlyacc</span></a>
</li><li class="li-links"><a href="../../api/4.02/Printexc.html">Module <span class="c007">Printexc</span>: facilities for printing exceptions</a>
</li><li class="li-links"><a href="../../api/4.02/Printf.html">Module <span class="c007">Printf</span>: formatting printing functions</a>
</li><li class="li-links"><a href="../../api/4.02/Queue.html">Module <span class="c007">Queue</span>: first-in first-out queues</a>
</li><li class="li-links"><a href="../../api/4.02/Random.html">Module <span class="c007">Random</span>: pseudo-random number generator (PRNG)</a>
</li><li class="li-links"><a href="../../api/4.02/Scanf.html">Module <span class="c007">Scanf</span>: formatted input functions</a>
</li><li class="li-links"><a href="../../api/4.02/Set.html">Module <span class="c007">Set</span>: sets over ordered types</a>
</li><li class="li-links"><a href="../../api/4.02/Sort.html">Module <span class="c007">Sort</span>: sorting and merging lists</a>
</li><li class="li-links"><a href="../../api/4.02/Stack.html">Module <span class="c007">Stack</span>: last-in first-out stacks</a>
</li><li class="li-links"><a href="../../api/4.02/StdLabels.html">Module <span class="c007">StdLabels</span>: Include modules <span class="c007">Array</span>, <span class="c007">List</span> and <span class="c007">String</span> with labels</a>
</li><li class="li-links"><a href="../../api/4.02/Stream.html">Module <span class="c007">Stream</span>: streams and parsers</a>
</li><li class="li-links"><a href="../../api/4.02/String.html">Module <span class="c007">String</span>: string operations</a>
</li><li class="li-links"><a href="../../api/4.02/StringLabels.html">Module <span class="c007">StringLabels</span>: string operations (with labels)</a>
</li><li class="li-links"><a href="../../api/4.02/Sys.html">Module <span class="c007">Sys</span>: system interface</a>
</li><li class="li-links"><a href="../../api/4.02/Weak.html">Module <span class="c007">Weak</span>: arrays of weak pointers</a>
</li></ul>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>