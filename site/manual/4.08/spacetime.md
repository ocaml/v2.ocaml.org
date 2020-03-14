<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="comp.html">Batch compilation (ocamlc)</a></li><li><a href="toplevel.html">The toplevel system or REPL (ocaml)</a></li><li><a href="runtime.html">The runtime system (ocamlrun)</a></li><li><a href="native.html">Native-code compilation (ocamlopt)</a></li><li><a href="lexyacc.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="depend.html">Dependency generator (ocamldep)</a></li><li><a href="browser.html">The browser/editor (ocamlbrowser)</a></li><li><a href="ocamldoc.html">The documentation generator (ocamldoc)</a></li><li><a href="debugger.html">The debugger (ocamldebug)</a></li><li><a href="profil.html">Profiling (ocamlprof)</a></li><li><a href="manual057.html">The ocamlbuild compilation manager</a></li><li><a href="intfc.html">Interfacing C with OCaml</a></li><li><a href="flambda.html">Optimisation with Flambda</a></li><li class="active"><a href="spacetime.html">Memory profiling with Spacetime</a></li><li><a href="afl-fuzz.html">Fuzzing with afl-fuzz</a></li><li><a href="plugins.html">Compiler plugins</a></li></ul>




<h1 class="chapter" id="sec539"><span>Chapter 22</span>&nbsp;&nbsp;Memory profiling with Spacetime</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">Memory profiling with Spacetime</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec540">1&nbsp;&nbsp;Overview</a>
</li><li><a href="#sec541">2&nbsp;&nbsp;How to use it</a>
</li><li><a href="#sec545">3&nbsp;&nbsp;Runtime overhead</a>
</li><li><a href="#sec546">4&nbsp;&nbsp;For developers</a>
</li></ul></nav></header>

<h2 class="section" id="sec540">1&nbsp;&nbsp;Overview</h2>
<p>Spacetime is the name given to functionality within the OCaml compiler that
provides for accurate profiling of the memory behaviour of a program.
Using Spacetime it is possible to determine the source of memory leaks
and excess memory allocation quickly and easily. Excess allocation slows
programs down both by imposing a higher load on the garbage collector and
reducing the cache locality of the program’s code. Spacetime provides
full backtraces for every allocation that occurred on the OCaml heap
during the lifetime of the program including those in C stubs.</p><p>Spacetime only analyses the memory behaviour of a program with respect to
the OCaml heap allocators and garbage collector. It does not analyse
allocation on the C heap. Spacetime does not affect the memory behaviour
of a program being profiled with the exception of any change caused by the
overhead of profiling (see section <a href="#runtimeoverhead">22.3</a>)—for example
the program running slower might cause it to allocate less memory in total.</p><p>Spacetime is currently only available for x86-64 targets and has only been
tested on Linux systems (although it is expected to work on most modern
Unix-like systems and provision has been made for running under
Windows). It is expected that the set of supported platforms will
be extended in the future.</p>
<h2 class="section" id="sec541">2&nbsp;&nbsp;How to use it</h2>
<h3 class="subsection" id="sec542">2.1&nbsp;&nbsp;Building</h3>
<p>To use Spacetime it is necessary to use an OCaml compiler that was
configured with the <span class="c003">-spacetime</span> option. It is not possible to select
Spacetime on a per-source-file basis or for a subset of files in a project;
all files involved in the executable being profiled must be built with the
Spacetime compiler. Only native code compilation is supported (not
bytecode).</p><p>If the <span class="c003">libunwind</span> library is not available on the system then it will
not be possible for Spacetime to profile allocations occurring within
C stubs. If the <span class="c003">libunwind</span> library is available but in an unusual
location then that location may be specified to the <span class="c003">configure</span> script
using the <span class="c003">-libunwinddir</span> option (or alternatively, using separate
<span class="c003">-libunwindinclude</span> and <span class="c003">-libunwindlib</span> options).</p><p>OPAM switches will be provided for Spacetime-configured compilers.</p><p>Once the appropriate compiler has been selected the program should be
built as normal (ensuring that all files are built with the Spacetime
compiler—there is currently no protection to ensure this is the case, but
it is essential). For many uses it will not be necessary to change the
code of the program to use the profiler.</p><p>Spacetime-configured compilers run slower and occupy more memory than their
counterparts. It is hoped this will be fixed in the future as part of
improved cross compilation support.</p>
<h3 class="subsection" id="sec543">2.2&nbsp;&nbsp;Running</h3>
<p>Programs built with Spacetime instrumentation have a dependency on
the <span class="c003">libunwind</span> library unless that was unavailable at configure time or
the <span class="c003">-disable-libunwind</span> option was specified
(see section <a href="#runtimeoverhead">22.3</a>).</p><p>Setting the <span class="c003">OCAML_SPACETIME_INTERVAL</span> environment variable to an
integer representing a number of milliseconds before running a program built
with Spacetime will cause memory profiling to be in operation when the
program is started. The contents of the OCaml heap will be sampled each
time the number of milliseconds that the program has spent executing since the
last sample exceeds the given number. (Note that the time base is combined
user plus system time—<em>not</em> wall clock time. This peculiarity may be
changed in future.)</p><p>The program being profiled must exit normally or be caused to exit using
the <span class="c003">SIGINT</span> signal (e.g. by pressing Ctrl+C). When the program exits
files will be written in the directory that was the working directory when
the program was started. One Spacetime file will be written for each
process that was involved, indexed by process ID; there will normally only
be one such. The Spacetime files may be substantial. The directory to which
they are written may be overridden by setting
the <span class="c003">OCAML_SPACETIME_SNAPSHOT_DIR</span> environment variable before the
program is started.</p><p>Instead of using the automatic snapshot facility described above it is also
possible to manually control Spacetime profiling. (The environment variables
<span class="c003">OCAML_SPACETIME_INTERVAL</span> and <span class="c003">OCAML_SPACETIME_SNAPSHOT_DIR</span>
are then not relevant.) Full documentation as regards this method of profiling
is provided in the standard library documentation (section <a href="stdlib.html#c%3Astdlib">26</a>)
for the <span class="c003">Spacetime</span> module.</p>
<h3 class="subsection" id="sec544">2.3&nbsp;&nbsp;Analysis</h3>
<p>The compiler distribution does not itself provide the facility for analysing
Spacetime output files; this is left to external tools. The first such tool
will appear in OPAM as a package called <span class="c003">prof_spacetime</span>. That tool will
provide interactive graphical and terminal-based visualisation of
the results of profiling.</p>
<h2 class="section" id="sec545">3&nbsp;&nbsp;Runtime overhead</h2>
<p><a id="runtimeoverhead"></a></p><p>The runtime overhead imposed by Spacetime varies considerably depending on
the particular program being profiled. The overhead may be as low as
ten percent—but more usually programs should be expected to run at perhaps
a third or quarter of their normal speed. It is expected that this overhead
will be reduced in future versions of the compiler.</p><p>Execution speed of instrumented programs may be increased by using a compiler
configured with the <span class="c003">-disable-libunwind</span> option. This prevents collection
of profiling information from C stubs.</p><p>Programs running with Spacetime instrumentation consume significantly more
memory than their non-instrumented counterparts. It is expected that this
memory overhead will also be reduced in the future.</p>
<h2 class="section" id="sec546">4&nbsp;&nbsp;For developers</h2>
<p>The compiler distribution provides an “<span class="c003">otherlibs</span>” library called
<span class="c003">raw_spacetime_lib</span> for decoding Spacetime files. This library
provides facilities to read not only memory profiling information but also
the full dynamic call graph of the profiled program which is written into
Spacetime output files.</p><p>A library package <span class="c003">spacetime_lib</span> will be provided in OPAM
to provide an interface for decoding profiling information at a higher
level than that provided by <span class="c003">raw_spacetime_lib</span>.

</p>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>