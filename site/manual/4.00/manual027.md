<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li class="active"><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc158"><span>Chapter 13</span></a>&nbsp;&nbsp;Dependency generator (ocamldep)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Dependency generator (ocamldep)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual027.html#toc112">Options</a>
</li><li><a href="manual027.html#toc113">A typical Makefile</a>
</li></ul></nav></header>
<p> <a name="c:camldep"></a>
</p><p>The <tt>ocamldep</tt> command scans a set of OCaml source files
(<tt>.ml</tt> and <tt>.mli</tt> files) for references to external compilation units,
and outputs dependency lines in a format suitable for the <tt>make</tt>
utility. This ensures that <tt>make</tt> will compile the source files in the
correct order, and recompile those files that need to when a source
file is modified.</p><p>The typical usage is:
</p><pre>        ocamldep <i>options</i> *.mli *.ml &gt; .depend
</pre><p>
where <tt>*.mli *.ml</tt> expands to all source files in the current
directory and <tt>.depend</tt> is the file that should contain the
dependencies. (See below for a typical <tt>Makefile</tt>.)</p><p>Dependencies are generated both for compiling with the bytecode
compiler <tt>ocamlc</tt> and with the native-code compiler <tt>ocamlopt</tt>.</p><p>The <tt>ocamlbuild</tt> compilation manager (see chapter&nbsp;<a href="manual032.html#c:ocamlbuild">18</a>)
provide a higher-level, more automated alternative to the combination
of <tt>make</tt> and <tt>ocamldep</tt>. </p><h2 class="section"><a name="toc112"></a><a name="htoc159">1</a>&nbsp;&nbsp;Options</h2><p>The following command-line options are recognized by <tt>ocamldep</tt>.</p><dl class="description"><dt class="dt-description"><b><tt>-I</tt> <i>directory</i></b></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
source files. If a source file <tt>foo.ml</tt> mentions an external
compilation unit <tt>Bar</tt>, a dependency on that unit’s interface
<tt>bar.cmi</tt> is generated only if the source for <tt>bar</tt> is found in the
current directory or in one of the directories specified with <tt>-I</tt>.
Otherwise, <tt>Bar</tt> is assumed to be a module from the standard library,
and no dependencies are generated. For programs that span multiple
directories, it is recommended to pass <tt>ocamldep</tt> the same <tt>-I</tt> options
that are passed to the compiler.</dd><dt class="dt-description"><b><tt>-ml-synonym</tt> <i>.ext</i></b></dt><dd class="dd-description">
Consider the given extension (with leading dot) to be a synonym for .ml.</dd><dt class="dt-description"><b><tt>-mli-synonym</tt> <i>.ext</i></b></dt><dd class="dd-description">
Consider the given extension (with leading dot) to be a synonym for .mli.</dd><dt class="dt-description"><tt><b>-modules</b></tt></dt><dd class="dd-description">
Output raw dependencies of the form
<pre>      filename: Module1 Module2 ... ModuleN
</pre>where <tt>Module1</tt>, …, <tt>ModuleN</tt> are the names of the compilation
units referenced within the file <tt>filename</tt>, but these names are not
resolved to source file names. Such raw dependencies cannot be used
by <tt>make</tt>, but can be post-processed by other tools such as <tt>Omake</tt>.</dd><dt class="dt-description"><tt><b>-native</b></tt></dt><dd class="dd-description">
Generate dependencies for a pure native-code program (no bytecode
version). When an implementation file (<tt>.ml</tt> file) has no explicit
interface file (<tt>.mli</tt> file), <tt>ocamldep</tt> generates dependencies on the
bytecode compiled file (<tt>.cmo</tt> file) to reflect interface changes.
This can cause unnecessary bytecode recompilations for programs that
are compiled to native-code only. The flag <tt>-native</tt> causes
dependencies on native compiled files (<tt>.cmx</tt>) to be generated instead
of on <tt>.cmo</tt> files. (This flag makes no difference if all source files
have explicit <tt>.mli</tt> interface files.)</dd><dt class="dt-description"><b><tt>-pp</tt> <i>command</i></b></dt><dd class="dd-description">
Cause <tt>ocamldep</tt> to call the given <i>command</i> as a preprocessor
for each source file.</dd><dt class="dt-description"><tt><b>-slash</b></tt></dt><dd class="dd-description">
Under Windows, use a forward slash (/) as the path separator instead
of the usual backward slash (\). Under Unix, this option does
nothing.</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h2 class="section"><a name="toc113"></a><a name="htoc160">2</a>&nbsp;&nbsp;A typical Makefile</h2><p>Here is a template <tt>Makefile</tt> for a OCaml program.</p><pre>OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLDEP=ocamldep
INCLUDES=                 # all relevant -I options here
OCAMLFLAGS=$(INCLUDES)    # add other options for ocamlc here
OCAMLOPTFLAGS=$(INCLUDES) # add other options for ocamlopt here

# prog1 should be compiled to bytecode, and is composed of three
# units: mod1, mod2 and mod3.

# The list of object files for prog1
PROG1_OBJS=mod1.cmo mod2.cmo mod3.cmo

prog1: $(PROG1_OBJS)
        $(OCAMLC) -o prog1 $(OCAMLFLAGS) $(PROG1_OBJS)

# prog2 should be compiled to native-code, and is composed of two
# units: mod4 and mod5.

# The list of object files for prog2
PROG2_OBJS=mod4.cmx mod5.cmx

prog2: $(PROG2_OBJS)
        $(OCAMLOPT) -o prog2 $(OCAMLFLAGS) $(PROG2_OBJS)

# Common rules
.SUFFIXES: .ml .mli .cmo .cmi .cmx

.ml.cmo:
        $(OCAMLC) $(OCAMLFLAGS) -c $&lt;

.mli.cmi:
        $(OCAMLC) $(OCAMLFLAGS) -c $&lt;

.ml.cmx:
        $(OCAMLOPT) $(OCAMLOPTFLAGS) -c $&lt;

# Clean up
clean:
        rm -f prog1 prog2
        rm -f *.cm[iox]

# Dependencies
depend:
        $(OCAMLDEP) $(INCLUDES) *.mli *.ml &gt; .depend

include .depend
</pre><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>