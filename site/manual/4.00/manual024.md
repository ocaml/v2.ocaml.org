<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li class="active"><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc127"><span>Chapter 10</span></a>&nbsp;&nbsp;The runtime system (ocamlrun)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The runtime system (ocamlrun)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual024.html#toc96">Overview</a>
</li><li><a href="manual024.html#toc97">Options</a>
</li><li><a href="manual024.html#toc98">Dynamic loading of shared libraries</a>
</li><li><a href="manual024.html#toc99">Common errors</a>
</li></ul></nav></header>
<p> <a name="c:runtime"></a>
</p><p>The <tt>ocamlrun</tt> command executes bytecode files produced by the
linking phase of the <tt>ocamlc</tt> command.</p><h2 class="section"><a name="toc96"></a><a name="htoc128">1</a>&nbsp;&nbsp;Overview</h2><p>The <tt>ocamlrun</tt> command comprises three main parts: the bytecode
interpreter, that actually executes bytecode files; the memory
allocator and garbage collector; and a set of C functions that
implement primitive operations such as input/output.</p><p>The usage for <tt>ocamlrun</tt> is:
</p><pre>        ocamlrun <i>options bytecode-executable arg</i><sub>1</sub> ... <i>arg<sub>n</sub></i>
</pre><p>
The first non-option argument is taken to be the name of the file
containing the executable bytecode. (That file is searched in the
executable path as well as in the current directory.) The remaining
arguments are passed to the OCaml program, in the string array
<tt>Sys.argv</tt>. Element 0 of this array is the name of the
bytecode executable file; elements 1 to <i>n</i> are the remaining
arguments <i>arg</i><sub>1</sub> to <i>arg<sub>n</sub></i>.</p><p>As mentioned in chapter&nbsp;<a href="manual022.html#c:camlc">8</a>, the bytecode executable files
produced by the <tt>ocamlc</tt> command are self-executable, and manage to
launch the <tt>ocamlrun</tt> command on themselves automatically. That is,
assuming <tt>a.out</tt> is a bytecode executable file,
</p><pre>        a.out <i>arg</i><sub>1</sub> ... <i>arg<sub>n</sub></i>
</pre><p>
works exactly as
</p><pre>        ocamlrun a.out <i>arg</i><sub>1</sub> ... <i>arg<sub>n</sub></i>
</pre><p>
Notice that it is not possible to pass options to <tt>ocamlrun</tt> when
invoking <tt>a.out</tt> directly.</p><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
Under several versions of Windows, bytecode executable files are
self-executable only if their name ends in <tt>.exe</tt>. It is recommended
to always give <tt>.exe</tt> names to bytecode executables, e.g. compile
with <tt>ocamlc -o myprog.exe ...</tt> rather than <tt>ocamlc -o myprog ...</tt>.
</blockquote><h2 class="section"><a name="toc97"></a><a name="htoc129">2</a>&nbsp;&nbsp;Options</h2><p> <a name="ocamlrun-options"></a></p><p>The following command-line options are recognized by <tt>ocamlrun</tt>.</p><dl class="description"><dt class="dt-description"><tt><b>-b</b></tt></dt><dd class="dd-description">
When the program aborts due to an uncaught exception, print a detailed
“back trace” of the execution, showing where the exception was
raised and which function calls were outstanding at this point. The
back trace is printed only if the bytecode executable contains
debugging information, i.e. was compiled and linked with the <tt>-g</tt>
option to <tt>ocamlc</tt> set. This is equivalent to setting the <tt>b</tt> flag
in the <tt>OCAMLRUNPARAM</tt> environment variable (see below).
</dd><dt class="dt-description"><b><tt>-I</tt> <i>dir</i></b></dt><dd class="dd-description">
Search the directory <i>dir</i> for dynamically-loaded libraries,
in addition to the standard search path (see
section&nbsp;<a href="#s-ocamlrun-dllpath">10.3</a>).
</dd><dt class="dt-description"><tt><b>-p</b></tt></dt><dd class="dd-description">
Print the names of the primitives known to this version of
<tt>ocamlrun</tt> and exit.
</dd><dt class="dt-description"><tt><b>-v</b></tt></dt><dd class="dd-description">
Direct the memory manager to print some progress messages on
standard error. This is equivalent to setting <tt>v=63</tt> in the
<tt>OCAMLRUNPARAM</tt> environment variable (see below).
</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.
</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd></dl><p>The following environment variables are also consulted:</p><dl class="description"><dt class="dt-description">
<b><tt>CAML_LD_LIBRARY_PATH</tt></b></dt><dd class="dd-description"> Additional directories to search for
dynamically-loaded libraries (see section&nbsp;<a href="#s-ocamlrun-dllpath">10.3</a>).</dd><dt class="dt-description"><tt><b>OCAMLLIB</b></tt></dt><dd class="dd-description"> The directory containing the OCaml standard
library. (If <tt>OCAMLLIB</tt> is not set, <tt>CAMLLIB</tt> will be used instead.)
Used to locate the <tt>ld.conf</tt> configuration file for
dynamic loading (see section&nbsp;<a href="#s-ocamlrun-dllpath">10.3</a>). If not set,
default to the library directory specified when compiling OCaml.</dd><dt class="dt-description"><tt><b>OCAMLRUNPARAM</b></tt></dt><dd class="dd-description"> Set the runtime system options
and garbage collection parameters.
(If <tt>OCAMLRUNPARAM</tt> is not set, <tt>CAMLRUNPARAM</tt> will be used instead.)
This variable must be a sequence of parameter specifications.
A parameter specification is an option letter followed by an <tt>=</tt>
sign, a decimal number (or an hexadecimal number prefixed by <tt>0x</tt>),
and an optional multiplier. There are
nine options, six of which correspond to the fields of the
<tt>control</tt> record documented in
<a href="../../api/4.00/Gc.html">Module <tt>Gc</tt></a>.
<dl class="description"><dt class="dt-description">
<b>b</b></dt><dd class="dd-description"> (backtrace) Trigger the printing of a stack backtrace
when an uncaught exception aborts the program.
This option takes no argument.
</dd><dt class="dt-description"><b>p</b></dt><dd class="dd-description"> (parser trace) Turn on debugging support for
<tt>ocamlyacc</tt>-generated parsers. When this option is on,
the pushdown automaton that executes the parsers prints a
trace of its actions. This option takes no argument.
</dd><dt class="dt-description"><b>s</b></dt><dd class="dd-description"> (<tt>minor_heap_size</tt>) Size of the minor heap. (in words)
</dd><dt class="dt-description"><b>i</b></dt><dd class="dd-description"> (<tt>major_heap_increment</tt>) Default size increment for the
major heap. (in words)
</dd><dt class="dt-description"><b>o</b></dt><dd class="dd-description"> (<tt>space_overhead</tt>) The major GC speed setting.
</dd><dt class="dt-description"><b>O</b></dt><dd class="dd-description"> (<tt>max_overhead</tt>) The heap compaction trigger setting.
</dd><dt class="dt-description"><b>v</b></dt><dd class="dd-description"> (<tt>verbose</tt>) What GC messages to print to stderr. This
is a sum of values selected from the following:
<dl class="description"><dt class="dt-description">
<b>1 (= 0x001)</b></dt><dd class="dd-description"> Start of major GC cycle.
</dd><dt class="dt-description"><b>2 (= 0x002)</b></dt><dd class="dd-description"> Minor collection and major GC slice.
</dd><dt class="dt-description"><b>4 (= 0x004)</b></dt><dd class="dd-description"> Growing and shrinking of the heap.
</dd><dt class="dt-description"><b>8 (= 0x008)</b></dt><dd class="dd-description"> Resizing of stacks and memory manager tables.
</dd><dt class="dt-description"><b>16 (= 0x010)</b></dt><dd class="dd-description"> Heap compaction.
</dd><dt class="dt-description"><b>32 (= 0x020)</b></dt><dd class="dd-description"> Change of GC parameters.
</dd><dt class="dt-description"><b>64 (= 0x040)</b></dt><dd class="dd-description"> Computation of major GC slice size.
</dd><dt class="dt-description"><b>128 (= 0x080)</b></dt><dd class="dd-description"> Calling of finalisation functions
</dd><dt class="dt-description"><b>256 (= 0x100)</b></dt><dd class="dd-description"> Startup messages (loading the bytecode
executable file, resolving shared libraries).
</dd></dl>
</dd><dt class="dt-description"><b>l</b></dt><dd class="dd-description"> (<tt>stack_limit</tt>) The limit (in words) of the stack size.
</dd><dt class="dt-description"><b>h</b></dt><dd class="dd-description"> The initial size of the major heap (in words).
</dd></dl>
The multiplier is <tt>k</tt>, <tt>M</tt>, or <tt>G</tt>, for multiplication by 2<sup>10</sup>,
2<sup>20</sup>, and 2<sup>30</sup> respectively.
For example, on a 32-bit machine, under <tt>bash</tt> the command
<pre>        export OCAMLRUNPARAM='b,s=256k,v=0x015'
</pre> tells a subsequent <tt>ocamlrun</tt> to print backtraces for uncaught exceptions,
set its initial minor heap size to 1&nbsp;megabyte and
print a message at the start of each major GC cycle, when the heap
size changes, and when compaction is triggered.</dd><dt class="dt-description"><tt><b>CAMLRUNPARAM</b></tt></dt><dd class="dd-description"> If <tt>OCAMLRUNPARAM</tt> is not found in the
environment, then <tt>CAMLRUNPARAM</tt> will be used instead. If
<tt>CAMLRUNPARAM</tt> is not found, then the default values will be used.</dd><dt class="dt-description"><tt><b>PATH</b></tt></dt><dd class="dd-description"> List of directories searched to find the bytecode
executable file.
</dd></dl><h2 class="section"><a name="toc98"></a><a name="htoc130">3</a>&nbsp;&nbsp;Dynamic loading of shared libraries</h2><p> <a name="s-ocamlrun-dllpath"></a></p><p>On platforms that support dynamic loading, <tt>ocamlrun</tt> can link
dynamically with C shared libraries (DLLs) providing additional C primitives
beyond those provided by the standard runtime system. The names for
these libraries are provided at link time as described in
section&nbsp;<a href="manual033.html#dynlink-c-code">19.1.4</a>), and recorded in the bytecode executable
file; <tt>ocamlrun</tt>, then, locates these libraries and resolves references
to their primitives when the bytecode executable program starts.</p><p>The <tt>ocamlrun</tt> command searches shared libraries in the following
directories, in the order indicated:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
Directories specified on the <tt>ocamlrun</tt> command line with the
<tt>-I</tt> option.
</li><li class="li-enumerate">Directories specified in the <tt>CAML_LD_LIBRARY_PATH</tt> environment
variable.
</li><li class="li-enumerate">Directories specified at link-time via the <tt>-dllpath</tt> option to
<tt>ocamlc</tt>. (These directories are recorded in the bytecode executable
file.)
</li><li class="li-enumerate">Directories specified in the file <tt>ld.conf</tt>. This file resides
in the OCaml standard library directory, and lists directory
names (one per line) to be searched. Typically, it contains only one
line naming the <tt>stublibs</tt> subdirectory of the OCaml standard
library directory. Users can add there the names of other directories
containing frequently-used shared libraries; however, for consistency
of installation, we recommend that shared libraries are installed
directly in the system <tt>stublibs</tt> directory, rather than adding lines
to the <tt>ld.conf</tt> file.
</li><li class="li-enumerate">Default directories searched by the system dynamic loader.
Under Unix, these generally include <tt>/lib</tt> and <tt>/usr/lib</tt>, plus the
directories listed in the file <tt>/etc/ld.so.conf</tt> and the environment
variable <tt>LD_LIBRARY_PATH</tt>. Under Windows, these include the Windows
system directories, plus the directories listed in the <tt>PATH</tt>
environment variable.
</li></ol><h2 class="section"><a name="toc99"></a><a name="htoc131">4</a>&nbsp;&nbsp;Common errors</h2><p>This section describes and explains the most frequently encountered
error messages.</p><dl class="description"><dt class="dt-description"><b><i>filename</i><tt>: no such file or directory</tt></b></dt><dd class="dd-description">
If <i>filename</i> is the name of a self-executable bytecode file, this
means that either that file does not exist, or that it failed to run
the <tt>ocamlrun</tt> bytecode interpreter on itself. The second possibility
indicates that OCaml has not been properly installed on your
system.</dd><dt class="dt-description"><tt><b>Cannot exec ocamlrun</b></tt></dt><dd class="dd-description">
(When launching a self-executable bytecode file.) The <tt>ocamlrun</tt>
could not be found in the executable path. Check that OCaml
has been properly installed on your system.</dd><dt class="dt-description"><tt><b>Cannot find the bytecode file</b></tt></dt><dd class="dd-description">
The file that <tt>ocamlrun</tt> is trying to execute (e.g. the file given as
first non-option argument to <tt>ocamlrun</tt>) either does not exist, or is
not a valid executable bytecode file.</dd><dt class="dt-description"><tt><b>Truncated bytecode file</b></tt></dt><dd class="dd-description">
The file that <tt>ocamlrun</tt> is trying to execute is not a valid executable
bytecode file. Probably it has been truncated or mangled since
created. Erase and rebuild it.</dd><dt class="dt-description"><tt><b>Uncaught exception</b></tt></dt><dd class="dd-description">
The program being executed contains a “stray” exception. That is,
it raises an exception at some point, and this exception is never
caught. This causes immediate termination of the program. The name of
the exception is printed, along with its string and integer arguments
(arguments of more complex types are not correctly printed).
To locate the context of the uncaught exception, compile the program
with the <tt>-g</tt> option and either run it again under the <tt>ocamldebug</tt>
debugger (see chapter&nbsp;<a href="manual030.html#c:debugger">16</a>), or run it with <tt>ocamlrun -b</tt>
or with the <tt>OCAMLRUNPARAM</tt> environment variable set to <tt>b=1</tt>.</dd><dt class="dt-description"><tt><b>Out of memory</b></tt></dt><dd class="dd-description">
The program being executed requires more memory than available. Either
the program builds excessively large data structures; or the program
contains too many nested function calls, and the stack overflows. In
some cases, your program is perfectly correct, it just requires more
memory than your machine provides. In other cases, the “out of
memory” message reveals an error in your program: non-terminating
recursive function, allocation of an excessively large array or
string, attempts to build an infinite list or other data structure,
…<p>To help you diagnose this error, run your program with the <tt>-v</tt> option
to <tt>ocamlrun</tt>, or with the <tt>OCAMLRUNPARAM</tt> environment variable set to
<tt>v=63</tt>. If it displays lots of “<tt>Growing stack</tt>…”
messages, this is probably a looping recursive function. If it
displays lots of “<tt>Growing heap</tt>…” messages, with the heap size
growing slowly, this is probably an attempt to construct a data
structure with too many (infinitely many?) cells. If it displays few
“<tt>Growing heap</tt>…” messages, but with a huge increment in the
heap size, this is probably an attempt to build an excessively large
array or string.</p></dd></dl><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>