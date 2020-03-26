<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li class="active"><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc211"><span>Chapter 17</span></a>&nbsp;&nbsp;Profiling (ocamlprof)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Profiling (ocamlprof)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual031.html#toc133">Compiling for profiling</a>
</li><li><a href="manual031.html#toc134">Profiling an execution</a>
</li><li><a href="manual031.html#toc135">Printing profiling information</a>
</li><li><a href="manual031.html#toc136">Time profiling</a>
</li></ul></nav></header>
<p> <a name="c:profiler"></a>
</p><p>This chapter describes how the execution of OCaml
programs can be profiled, by recording how many times functions are
called, branches of conditionals are taken, …</p><h2 class="section"><a name="toc133"></a><a name="htoc212">1</a>&nbsp;&nbsp;Compiling for profiling</h2><p>Before profiling an execution, the program must be compiled in
profiling mode, using the <tt>ocamlcp</tt> front-end to the <tt>ocamlc</tt> compiler
(see chapter&nbsp;<a href="manual022.html#c:camlc">8</a>) or the <tt>ocamloptp</tt> front-end to the
<tt>ocamlopt</tt> compiler (see chapter&nbsp;<a href="manual025.html#c:nativecomp">11</a>). When compiling
modules separately, <tt>ocamlcp</tt> or <tt>ocamloptp</tt> must be used when
compiling the modules (production of <tt>.cmo</tt> or <tt>.cmx</tt> files), and can
also be used (though this is not strictly necessary) when linking them
together.</p><h5 class="paragraph">Note</h5><p> If a module (<tt>.ml</tt> file) doesn’t have a corresponding
interface (<tt>.mli</tt> file), then compiling it with <tt>ocamlcp</tt> will produce
object files (<tt>.cmi</tt> and <tt>.cmo</tt>) that are not compatible with the ones
produced by <tt>ocamlc</tt>, which may lead to problems (if the <tt>.cmi</tt> or
<tt>.cmo</tt> is still around) when switching between profiling and
non-profiling compilations. To avoid this problem, you should always
have a <tt>.mli</tt> file for each <tt>.ml</tt> file. The same problem exists with
<tt>ocamloptp</tt>.</p><h5 class="paragraph">Note</h5><p> To make sure your programs can be compiled in
profiling mode, avoid using any identifier that begins with
<tt>__ocaml_prof</tt>.</p><p>The amount of profiling information can be controlled through the <tt>-P</tt>
option to <tt>ocamlcp</tt> or <tt>ocamloptp</tt>, followed by one or several letters
indicating which parts of the program should be profiled:</p><dl class="description"><dt class="dt-description">
<tt><b>a</b></tt></dt><dd class="dd-description"> all options
</dd><dt class="dt-description"><tt><b>f</b></tt></dt><dd class="dd-description"> function calls : a count point is set at the beginning of
each function body
</dd><dt class="dt-description"><tt><b>i</b></tt></dt><dd class="dd-description"> <b>if …then …else …</b> : count points are set in
both <b>then</b> branch and <b>else</b> branch
</dd><dt class="dt-description"><tt><b>l</b></tt></dt><dd class="dd-description"> <b>while, for</b> loops: a count point is set at the beginning of
the loop body
</dd><dt class="dt-description"><tt><b>m</b></tt></dt><dd class="dd-description"> <b>match</b> branches: a count point is set at the beginning of the
body of each branch
</dd><dt class="dt-description"><tt><b>t</b></tt></dt><dd class="dd-description"> <b>try …with …</b> branches: a count point is set at the
beginning of the body of each branch
</dd></dl><p>For instance, compiling with <tt>ocamlcp -P film</tt> profiles function calls,
if…then…else…, loops and pattern matching.</p><p>Calling <tt>ocamlcp</tt> or <tt>ocamloptp</tt> without the <tt>-P</tt> option defaults to
<tt>-P fm</tt>, meaning that only function calls and pattern matching are
profiled.</p><h5 class="paragraph">Note</h5><p> For compatibility with previous releases, <tt>ocamlcp</tt>
also accepts the <tt>-p</tt> option, with the same arguments and behaviour as
<tt>-P</tt>.</p><p>The <tt>ocamlcp</tt> and <tt>ocamloptp</tt> commands also accept all the options of
the corresponding <tt>ocamlc</tt> or <tt>ocamlopt</tt> compiler, except the <tt>-pp</tt>
(preprocessing) option.</p><h2 class="section"><a name="toc134"></a><a name="htoc213">2</a>&nbsp;&nbsp;Profiling an execution</h2><p>Running an executable that has been compiled with <tt>ocamlcp</tt> or
<tt>ocamloptp</tt> records the execution counts for the specified parts of
the program and saves them in a file called <tt>ocamlprof.dump</tt> in the
current directory.</p><p>If the environment variable <tt>OCAMLPROF_DUMP</tt> is set when the program
exits, its value is used as the file name instead of <tt>ocamlprof.dump</tt>.</p><p>The dump file is written only if the program terminates
normally (by calling <tt>exit</tt> or by falling through). It is not written
if the program terminates with an uncaught exception.</p><p>If a compatible dump file already exists in the current directory, then the
profiling information is accumulated in this dump file. This allows, for
instance, the profiling of several executions of a program on
different inputs. Note that dump files produced by byte-code
executables (compiled with <tt>ocamlcp</tt>) are compatible with the dump
files produced by native executables (compiled with <tt>ocamloptp</tt>).</p><h2 class="section"><a name="toc135"></a><a name="htoc214">3</a>&nbsp;&nbsp;Printing profiling information</h2><p>The <tt>ocamlprof</tt> command produces a source listing of the program modules
where execution counts have been inserted as comments. For instance,
</p><pre>        ocamlprof foo.ml
</pre><p>prints the source code for the <tt>foo</tt> module, with comments indicating
how many times the functions in this module have been called. Naturally,
this information is accurate only if the source file has not been modified
after it was compiled.</p><p>The following options are recognized by <tt>ocamlprof</tt>:</p><dl class="description"><dt class="dt-description"><b><tt>-f</tt> <i>dumpfile</i></b></dt><dd class="dd-description">
Specifies an alternate dump file of profiling information to be read.</dd><dt class="dt-description"><b><tt>-F</tt> <i>string</i></b></dt><dd class="dd-description">
Specifies an additional string to be output with profiling information.
By default, <tt>ocamlprof</tt> will annotate programs with comments of the form
<tt>(* <i>n</i> *)</tt> where <i>n</i> is the counter value for a profiling
point. With option <tt>-F <i>s</i></tt>, the annotation will be
<tt>(* <i>sn</i> *)</tt>.</dd><dt class="dt-description"><b><tt>-impl</tt> <i>filename</i></b></dt><dd class="dd-description">
Process the file <i>filename</i> as an implementation file, even if its
extension is not <tt>.ml</tt>.</dd><dt class="dt-description"><b><tt>-intf</tt> <i>filename</i></b></dt><dd class="dd-description">
Process the file <i>filename</i> as an interface file, even if its
extension is not <tt>.mli</tt>.</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h2 class="section"><a name="toc136"></a><a name="htoc215">4</a>&nbsp;&nbsp;Time profiling</h2><p>Profiling with <tt>ocamlprof</tt> only records execution counts, not the actual
time spent within each function. There is currently no way to perform
time profiling on bytecode programs generated by <tt>ocamlc</tt>.</p><p>Native-code programs generated by <tt>ocamlopt</tt> can be profiled for time
and execution counts using the <tt>-p</tt> option and the standard Unix
profiler <tt>gprof</tt>. Just add the <tt>-p</tt> option when compiling and linking
the program:
</p><pre>        ocamlopt -o myprog -p <i>other-options files</i>
        ./myprog
        gprof myprog
</pre><p>
OCaml function names in the output of <tt>gprof</tt> have the following format:
</p><pre>        <i>Module-name</i>_<i>function-name</i>_<i>unique-number</i>
</pre><p>
Other functions shown are either parts of the OCaml run-time system or
external C functions linked with the program.</p><p>The output of <tt>gprof</tt> is described in the Unix manual page for
<tt>gprof(1)</tt>. It generally consists of two parts: a “flat” profile
showing the time spent in each function and the number of invocation
of each function, and a “hierarchical” profile based on the call
graph. Currently, only the Intel x86 ports of <tt>ocamlopt</tt> under
Linux, BSD and MacOS X support the two profiles. On other platforms,
<tt>gprof</tt> will report only the “flat” profile with just time
information. When reading the output of <tt>gprof</tt>, keep in mind that
the accumulated times computed by <tt>gprof</tt> are based on heuristics and
may not be exact.</p><h5 class="paragraph">Note</h5><p> The <tt>ocamloptp</tt> command also accepts the <tt>-p</tt>
option. In that case, both kinds of profiling are performed by the
program, and you can display the results with the <tt>gprof</tt> and <tt>ocamlprof</tt>
commands, respectively.

</p><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>