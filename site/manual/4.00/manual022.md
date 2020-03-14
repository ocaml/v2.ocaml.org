<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc115"><span>Chapter 8</span></a>&nbsp;&nbsp;Batch compilation (ocamlc)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Batch compilation (ocamlc)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc86">Overview of the compiler</a>
</li><li><a href="#toc87">Options</a>
</li><li><a href="#toc88">Modules and the file system</a>
</li><li><a href="#toc89">Common errors</a>
</li></ul></nav></header>
<p> <a name="c:camlc"></a>
</p><p>This chapter describes the OCaml batch compiler <tt>ocamlc</tt>,
which compiles OCaml source files to bytecode object files and links
these object files to produce standalone bytecode executable files.
These executable files are then run by the bytecode interpreter
<tt>ocamlrun</tt>.</p><h2 class="section"><a name="toc86"></a><a name="htoc116">1</a>&nbsp;&nbsp;Overview of the compiler</h2><p>The <tt>ocamlc</tt> command has a command-line interface similar to the one of
most C compilers. It accepts several types of arguments and processes them
sequentially:</p><ul class="itemize"><li class="li-itemize">
Arguments ending in <tt>.mli</tt> are taken to be source files for
compilation unit interfaces. Interfaces specify the names exported by
compilation units: they declare value names with their types, define
public data types, declare abstract data types, and so on. From the
file <i>x</i><tt>.mli</tt>, the <tt>ocamlc</tt> compiler produces a compiled interface
in the file <i>x</i><tt>.cmi</tt>.</li><li class="li-itemize">Arguments ending in <tt>.ml</tt> are taken to be source files for compilation
unit implementations. Implementations provide definitions for the
names exported by the unit, and also contain expressions to be
evaluated for their side-effects. From the file <i>x</i><tt>.ml</tt>, the <tt>ocamlc</tt>
compiler produces compiled object bytecode in the file <i>x</i><tt>.cmo</tt>.<p>If the interface file <i>x</i><tt>.mli</tt> exists, the implementation
<i>x</i><tt>.ml</tt> is checked against the corresponding compiled interface
<i>x</i><tt>.cmi</tt>, which is assumed to exist. If no interface
<i>x</i><tt>.mli</tt> is provided, the compilation of <i>x</i><tt>.ml</tt> produces a
compiled interface file <i>x</i><tt>.cmi</tt> in addition to the compiled
object code file <i>x</i><tt>.cmo</tt>. The file <i>x</i><tt>.cmi</tt> produced
corresponds to an interface that exports everything that is defined in
the implementation <i>x</i><tt>.ml</tt>.</p></li><li class="li-itemize">Arguments ending in <tt>.cmo</tt> are taken to be compiled object bytecode. These
files are linked together, along with the object files obtained
by compiling <tt>.ml</tt> arguments (if any), and the OCaml standard
library, to produce a standalone executable program. The order in
which <tt>.cmo</tt> and <tt>.ml</tt> arguments are presented on the command line is
relevant: compilation units are initialized in that order at
run-time, and it is a link-time error to use a component of a unit
before having initialized it. Hence, a given <i>x</i><tt>.cmo</tt> file must come
before all <tt>.cmo</tt> files that refer to the unit <i>x</i>.</li><li class="li-itemize">Arguments ending in <tt>.cma</tt> are taken to be libraries of object bytecode.
A library of object bytecode packs in a single file a set of object
bytecode files (<tt>.cmo</tt> files). Libraries are built with <tt>ocamlc -a</tt>
(see the description of the <tt>-a</tt> option below). The object files
contained in the library are linked as regular <tt>.cmo</tt> files (see
above), in the order specified when the <tt>.cma</tt> file was built. The
only difference is that if an object file contained in a library is
not referenced anywhere in the program, then it is not linked in.</li><li class="li-itemize">Arguments ending in <tt>.c</tt> are passed to the C compiler, which generates
a <tt>.o</tt> object file (<tt>.obj</tt> under Windows). This object file is linked
with the program if the <tt>-custom</tt> flag is set (see the description of
<tt>-custom</tt> below).</li><li class="li-itemize">Arguments ending in <tt>.o</tt> or <tt>.a</tt> (<tt>.obj</tt> or <tt>.lib</tt> under Windows)
are assumed to be C object files and libraries. They are passed to the
C linker when linking in <tt>-custom</tt> mode (see the description of
<tt>-custom</tt> below).</li><li class="li-itemize">Arguments ending in <tt>.so</tt> (<tt>.dll</tt> under Windows)
are assumed to be C shared libraries (DLLs). During linking, they are
searched for external C functions referenced from the OCaml code,
and their names are written in the generated bytecode executable.
The run-time system <tt>ocamlrun</tt> then loads them dynamically at program
start-up time.</li></ul><p>The output of the linking phase is a file containing compiled bytecode
that can be executed by the OCaml bytecode interpreter:
the command named <tt>ocamlrun</tt>. If <tt>a.out</tt> is the name of the file
produced by the linking phase, the command
</p><pre>        ocamlrun a.out <i>arg</i><sub>1</sub> <i>arg</i><sub>2</sub> … <i>arg<sub>n</sub></i>
</pre><p>
executes the compiled code contained in <tt>a.out</tt>, passing it as
arguments the character strings <i>arg</i><sub>1</sub> to <i>arg<sub>n</sub></i>.
(See chapter&nbsp;<a href="manual024.html#c:runtime">10</a> for more details.)</p><p>On most systems, the file produced by the linking
phase can be run directly, as in:
</p><pre>        ./a.out <i>arg</i><sub>1</sub> <i>arg</i><sub>2</sub> … <i>arg<sub>n</sub></i>
</pre><p>
The produced file has the executable bit set, and it manages to launch
the bytecode interpreter by itself.</p><h2 class="section"><a name="toc87"></a><a name="htoc117">2</a>&nbsp;&nbsp;Options</h2><p><a name="s:comp-options"></a></p><p>The following command-line options are recognized by <tt>ocamlc</tt>.
The options <tt>-pack</tt>, <tt>-a</tt>, <tt>-c</tt> and <tt>-output-obj</tt> are mutually exclusive.</p><dl class="description"><dt class="dt-description"><tt><b>-a</b></tt></dt><dd class="dd-description">
Build a library (<tt>.cma</tt> file) with the object files (<tt>.cmo</tt> files)
given on the command line, instead of linking them into an executable
file. The name of the library must be set with the <tt>-o</tt> option.<p>If <tt>-custom</tt>, <tt>-cclib</tt> or <tt>-ccopt</tt> options are passed on the command
line, these options are stored in the resulting <tt>.cma</tt> library. Then,
linking with this library automatically adds back the <tt>-custom</tt>,
<tt>-cclib</tt> and <tt>-ccopt</tt> options as if they had been provided on the
command line, unless the <tt>-noautolink</tt> option is given.</p></dd><dt class="dt-description"><tt><b>-absname</b></tt></dt><dd class="dd-description">
Force error messages to show absolute paths for file names.</dd><dt class="dt-description"><tt><b>-annot</b></tt></dt><dd class="dd-description">
Dump detailed information about the compilation (types, bindings,
tail-calls, etc). The information for file <i>src</i><tt>.ml</tt>
is put into file <i>src</i><tt>.annot</tt>. In case of a type error, dump
all the information inferred by the type-checker before the error.
The <i>src</i><tt>.annot</tt> file can be used with the emacs commands given in
<tt>emacs/caml-types.el</tt> to display types and other annotations
interactively.</dd><dt class="dt-description"><tt><b>-c</b></tt></dt><dd class="dd-description">
Compile only. Suppress the linking phase of the
compilation. Source code files are turned into compiled files, but no
executable file is produced. This option is useful to
compile modules separately.</dd><dt class="dt-description"><b><tt>-cc</tt> <i>ccomp</i></b></dt><dd class="dd-description">
Use <i>ccomp</i> as the C linker when linking in “custom runtime”
mode (see the <tt>-custom</tt> option)
and as the C compiler for compiling <tt>.c</tt> source files.</dd><dt class="dt-description"><b><tt>-cclib</tt> <tt>-l</tt><i>libname</i></b></dt><dd class="dd-description">
Pass the <tt>-l</tt><i>libname</i> option to the C linker when linking in
“custom runtime” mode (see the <tt>-custom</tt> option). This causes the
given C library to be linked with the program.</dd><dt class="dt-description"><b><tt>-ccopt</tt> <i>option</i></b></dt><dd class="dd-description">
Pass the given option to the C compiler and linker. When linking in
“custom runtime” mode, for instance,
<tt>-ccopt -L</tt><i>dir</i> causes the C linker to search for C libraries in
directory <i>dir</i>. (See the <tt>-custom</tt> option.)</dd><dt class="dt-description"><tt><b>-config</b></tt></dt><dd class="dd-description">
Print the version number of <tt>ocamlc</tt> and a detailed summary of its
configuration, then exit.</dd><dt class="dt-description"><tt><b>-custom</b></tt></dt><dd class="dd-description">
Link in “custom runtime” mode. In the default linking mode, the
linker produces bytecode that is intended to be executed with the
shared runtime system, <tt>ocamlrun</tt>. In the custom runtime mode, the
linker produces an output file that contains both the runtime system
and the bytecode for the program. The resulting file is larger, but it
can be executed directly, even if the <tt>ocamlrun</tt> command is not
installed. Moreover, the “custom runtime” mode enables static
linking of OCaml code with user-defined C functions, as described in
chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>.
<blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp;
Never use the <tt>strip</tt> command on executables produced by <tt>ocamlc -custom</tt>,
this would remove the bytecode part of the executable.
</blockquote></dd><dt class="dt-description"><b><tt>-dllib</tt> <tt>-l</tt><i>libname</i></b></dt><dd class="dd-description">
Arrange for the C shared library <tt>dll</tt><i>libname</i><tt>.so</tt>
(<tt>dll</tt><i>libname</i><tt>.dll</tt> under Windows) to be loaded dynamically
by the run-time system <tt>ocamlrun</tt> at program start-up time.</dd><dt class="dt-description"><b><tt>-dllpath</tt> <i>dir</i></b></dt><dd class="dd-description">
Adds the directory <i>dir</i> to the run-time search path for shared
C libraries. At link-time, shared libraries are searched in the
standard search path (the one corresponding to the <tt>-I</tt> option).
The <tt>-dllpath</tt> option simply stores <i>dir</i> in the produced
executable file, where <tt>ocamlrun</tt> can find it and use it as
described in section&nbsp;<a href="manual024.html#s-ocamlrun-dllpath">10.3</a>.</dd><dt class="dt-description"><tt><b>-g</b></tt></dt><dd class="dd-description">
Add debugging information while compiling and linking. This option is
required in order to be able to debug the program with <tt>ocamldebug</tt>
(see chapter&nbsp;<a href="manual030.html#c:debugger">16</a>), and to produce stack backtraces when
the program terminates on an uncaught exception (see
section&nbsp;<a href="manual024.html#ocamlrun-options">10.2</a>).</dd><dt class="dt-description"><tt><b>-i</b></tt></dt><dd class="dd-description">
Cause the compiler to print all defined names (with their inferred
types or their definitions) when compiling an implementation (<tt>.ml</tt>
file). No compiled files (<tt>.cmo</tt> and <tt>.cmi</tt> files) are produced.
This can be useful to check the types inferred by the
compiler. Also, since the output follows the syntax of interfaces, it
can help in writing an explicit interface (<tt>.mli</tt> file) for a file:
just redirect the standard output of the compiler to a <tt>.mli</tt> file,
and edit that file to remove all declarations of unexported names.</dd><dt class="dt-description"><b><tt>-I</tt> <i>directory</i></b></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
compiled interface files (<tt>.cmi</tt>), compiled object code files
(<tt>.cmo</tt>), libraries (<tt>.cma</tt>), and C libraries specified with
<tt>-cclib -lxxx</tt>. By default, the current directory is
searched first, then the standard library directory. Directories added
with <tt>-I</tt> are searched after the current directory, in the order in
which they were given on the command line, but before the standard
library directory.<p>If the given directory starts with <tt>+</tt>, it is taken relative to the
standard library directory. For instance, <tt>-I +labltk</tt> adds the
subdirectory <tt>labltk</tt> of the standard library to the search path.</p></dd><dt class="dt-description"><b><tt>-impl</tt> <i>filename</i></b></dt><dd class="dd-description">
Compile the file <i>filename</i> as an implementation file, even if its
extension is not <tt>.ml</tt>.</dd><dt class="dt-description"><b><tt>-intf</tt> <i>filename</i></b></dt><dd class="dd-description">
Compile the file <i>filename</i> as an interface file, even if its
extension is not <tt>.mli</tt>.</dd><dt class="dt-description"><b><tt>-intf-suffix</tt> <i>string</i></b></dt><dd class="dd-description">
Recognize file names ending with <i>string</i> as interface files
(instead of the default <tt>.mli</tt>).</dd><dt class="dt-description"><tt><b>-labels</b></tt></dt><dd class="dd-description">
Labels are not ignored in types, labels may be used in applications,
and labelled parameters can be given in any order. This is the default.</dd><dt class="dt-description"><tt><b>-linkall</b></tt></dt><dd class="dd-description">
Force all modules contained in libraries to be linked in. If this
flag is not given, unreferenced modules are not linked in. When
building a library (option <tt>-a</tt>), setting the <tt>-linkall</tt> option forces all
subsequent links of programs involving that library to link all the
modules contained in the library.</dd><dt class="dt-description"><tt><b>-make-runtime</b></tt></dt><dd class="dd-description">
Build a custom runtime system (in the file specified by option <tt>-o</tt>)
incorporating the C object files and libraries given on the command
line. This custom runtime system can be used later to execute
bytecode executables produced with the
<tt>ocamlc -use-runtime</tt> <i>runtime-name</i> option.
See section&nbsp;<a href="manual033.html#s:custom-runtime">19.1.6</a> for more information.</dd><dt class="dt-description"><tt><b>-noassert</b></tt></dt><dd class="dd-description">
Do not compile assertion checks. Note that the special form
<tt>assert false</tt> is always compiled because it is typed specially.
This flag has no effect when linking already-compiled files.</dd><dt class="dt-description"><tt><b>-noautolink</b></tt></dt><dd class="dd-description">
When linking <tt>.cma</tt> libraries, ignore <tt>-custom</tt>, <tt>-cclib</tt> and <tt>-ccopt</tt>
options potentially contained in the libraries (if these options were
given when building the libraries). This can be useful if a library
contains incorrect specifications of C libraries or C options; in this
case, during linking, set <tt>-noautolink</tt> and pass the correct C
libraries and options on the command line.</dd><dt class="dt-description"><tt><b>-nolabels</b></tt></dt><dd class="dd-description">
Ignore non-optional labels in types. Labels cannot be used in
applications, and parameter order becomes strict.</dd><dt class="dt-description"><b><tt>-o</tt> <i>exec-file</i></b></dt><dd class="dd-description">
Specify the name of the output file produced by the compiler. The
default output name is <tt>a.out</tt> under Unix and <tt>camlprog.exe</tt> under
Windows. If the <tt>-a</tt> option is given, specify the name of the library
produced. If the <tt>-pack</tt> option is given, specify the name of the
packed object file produced. If the <tt>-output-obj</tt> option is given,
specify the name of the output file produced. If the <tt>-c</tt> option is
given, specify the name of the object file produced for the <em>next</em>
source file that appears on the command line.</dd><dt class="dt-description"><tt><b>-output-obj</b></tt></dt><dd class="dd-description">
Cause the linker to produce a C object file instead of a bytecode
executable file. This is useful to wrap OCaml code as a C library,
callable from any C program. See chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>,
section&nbsp;<a href="manual033.html#s:embedded-code">19.7.5</a>. The name of the output object file
must be set with the <tt>-o</tt> option. This
option can also be used to produce a C source file (<tt>.c</tt> extension) or
a compiled shared/dynamic library (<tt>.so</tt> extension, <tt>.dll</tt> under Windows).</dd><dt class="dt-description"><tt><b>-pack</b></tt></dt><dd class="dd-description">
Build a bytecode object file (<tt>.cmo</tt> file) and its associated compiled
interface (<tt>.cmi</tt>) that combines the object
files given on the command line, making them appear as sub-modules of
the output <tt>.cmo</tt> file. The name of the output <tt>.cmo</tt> file must be
given with the <tt>-o</tt> option. For instance,
<pre>        ocamlc -pack -o p.cmo a.cmo b.cmo c.cmo
</pre>generates compiled files <tt>p.cmo</tt> and <tt>p.cmi</tt> describing a compilation
unit having three sub-modules <tt>A</tt>, <tt>B</tt> and <tt>C</tt>, corresponding to the
contents of the object files <tt>a.cmo</tt>, <tt>b.cmo</tt> and <tt>c.cmo</tt>. These
contents can be referenced as <tt>P.A</tt>, <tt>P.B</tt> and <tt>P.C</tt> in the remainder
of the program.</dd><dt class="dt-description"><b><tt>-pp</tt> <i>command</i></b></dt><dd class="dd-description">
Cause the compiler to call the given <i>command</i> as a preprocessor
for each source file. The output of <i>command</i> is redirected to
an intermediate file, which is compiled. If there are no compilation
errors, the intermediate file is deleted afterwards.</dd><dt class="dt-description"><tt><b>-principal</b></tt></dt><dd class="dd-description">
Check information path during type-checking, to make sure that all
types are derived in a principal way. When using labelled arguments
and/or polymorphic methods, this flag is required to ensure future
versions of the compiler will be able to infer types correctly, even
if internal algorithms change.
All programs accepted in <tt>-principal</tt> mode are also accepted in the
default mode with equivalent types, but different binary signatures,
and this may slow down type checking; yet it is a good idea to
use it once before publishing source code.</dd><dt class="dt-description"><tt><b>-rectypes</b></tt></dt><dd class="dd-description">
Allow arbitrary recursive types during type-checking. By default,
only recursive types where the recursion goes through an object type
are supported. Note that once you have created an interface using this
flag, you must use it again for all dependencies.</dd><dt class="dt-description"><b><tt>-runtime-variant</tt> <i>suffix</i></b></dt><dd class="dd-description">
Add the <i>suffix</i> string to the name of the runtime library used by
the program. Currently, only one such suffix is supported: <tt>d</tt>, and
only if the OCaml compiler was configured with option
<tt>-with-debug-runtime</tt>. This suffix gives the debug version of the
runtime, which is useful for debugging pointer problems in low-level
code such as C stubs.</dd><dt class="dt-description"><tt><b>-thread</b></tt></dt><dd class="dd-description">
Compile or link multithreaded programs, in combination with the
system <tt>threads</tt> library described in chapter&nbsp;<a href="manual039.html#c:threads">25</a>.</dd><dt class="dt-description"><tt><b>-unsafe</b></tt></dt><dd class="dd-description">
Turn bound checking off for array and string accesses (the <tt>v.(i)</tt> and
<tt>s.[i]</tt> constructs). Programs compiled with <tt>-unsafe</tt> are therefore
slightly faster, but unsafe: anything can happen if the program
accesses an array or string outside of its bounds.</dd><dt class="dt-description"><b><tt>-use-runtime</tt> <i>runtime-name</i></b></dt><dd class="dd-description">
Generate a bytecode executable file that can be executed on the custom
runtime system <i>runtime-name</i>, built earlier with
<tt>ocamlc -make-runtime</tt> <i>runtime-name</i>.
See section&nbsp;<a href="manual033.html#s:custom-runtime">19.1.6</a> for more information.</dd><dt class="dt-description"><tt><b>-v</b></tt></dt><dd class="dd-description">
Print the version number of the compiler and the location of the
standard library directory, then exit.</dd><dt class="dt-description"><tt><b>-verbose</b></tt></dt><dd class="dd-description">
Print all external commands before they are executed, in particular
invocations of the C compiler and linker in <tt>-custom</tt> mode. Useful to
debug C library problems.</dd><dt class="dt-description"><b><tt>-vnum</tt> or <tt>-version</tt></b></dt><dd class="dd-description">
Print the version number of the compiler in short form (e.g. <tt>3.11.0</tt>),
then exit.</dd><dt class="dt-description"><tt><b>-vmthread</b></tt></dt><dd class="dd-description">
Compile or link multithreaded programs, in combination with the
VM-level <tt>threads</tt> library described in chapter&nbsp;<a href="manual039.html#c:threads">25</a>.</dd><dt class="dt-description"><b><tt>-w</tt> <i>warning-list</i></b></dt><dd class="dd-description">
Enable, disable, or mark as errors the warnings specified by the argument
<i>warning-list</i>.
Each warning can be <em>enabled</em> or <em>disabled</em>, and each warning
can be <em>marked</em> or <em>unmarked</em>.
If a warning is disabled, it isn’t displayed and doesn’t affect
compilation in any way (even if it is marked). If a warning is
enabled, it is displayed normally by the compiler whenever the source
code triggers it. If it is enabled and marked, the compiler will stop
with an error after displaying that warning if the source code
triggers it.<p>The <i>warning-list</i> argument is a sequence of warning specifiers,
with no separators between them. A warning specifier is one of the
following:</p><dl class="description"><dt class="dt-description">
<b><tt>+</tt><i>num</i></b></dt><dd class="dd-description"> Enable warning number <i>num</i>.
</dd><dt class="dt-description"><b><tt>-</tt><i>num</i></b></dt><dd class="dd-description"> Disable warning number <i>num</i>.
</dd><dt class="dt-description"><b><tt>@</tt><i>num</i></b></dt><dd class="dd-description"> Enable and mark warning number <i>num</i>.
</dd><dt class="dt-description"><b><tt>+</tt><i>num1</i>..<i>num2</i></b></dt><dd class="dd-description"> Enable warnings in the given range.
</dd><dt class="dt-description"><b><tt>-</tt><i>num1</i>..<i>num2</i></b></dt><dd class="dd-description"> Disable warnings in the given range.
</dd><dt class="dt-description"><b><tt>@</tt><i>num1</i>..<i>num2</i></b></dt><dd class="dd-description"> Enable and mark warnings in the given range.
</dd><dt class="dt-description"><b><tt>+</tt><i>letter</i></b></dt><dd class="dd-description"> Enable the set of warnings corresponding to
<i>letter</i>. The letter may be uppercase or lowercase.
</dd><dt class="dt-description"><b><tt>-</tt><i>letter</i></b></dt><dd class="dd-description"> Disable the set of warnings corresponding to
<i>letter</i>. The letter may be uppercase or lowercase.
</dd><dt class="dt-description"><b><tt>@</tt><i>letter</i></b></dt><dd class="dd-description"> Enable and mark the set of warnings
corresponding to <i>letter</i>. The letter may be uppercase or
lowercase.
</dd><dt class="dt-description"><i><b>uppercase-letter</b></i></dt><dd class="dd-description"> Enable the set of warnings corresponding
to <i>uppercase-letter</i>.
</dd><dt class="dt-description"><i><b>lowercase-letter</b></i></dt><dd class="dd-description"> Disable the set of warnings corresponding
to <i>lowercase-letter</i>.
</dd></dl><p>Warning numbers and letters which are out of the range of warnings
that are currently defined are ignored. The warning are as follows.
</p><dl class="description"><dt class="dt-description">
<b>1</b></dt><dd class="dd-description"> Suspicious-looking start-of-comment mark.
</dd><dt class="dt-description"><b>2</b></dt><dd class="dd-description"> Suspicious-looking end-of-comment mark.
</dd><dt class="dt-description"><b>3</b></dt><dd class="dd-description"> Deprecated syntax.
</dd><dt class="dt-description"><b>4</b></dt><dd class="dd-description"> Fragile pattern matching: matching that will remain complete even
if additional constructors are added to one of the variant types
matched.
</dd><dt class="dt-description"><b>5</b></dt><dd class="dd-description"> Partially applied function: expression whose result has function
type and is ignored.
</dd><dt class="dt-description"><b>6</b></dt><dd class="dd-description"> Label omitted in function application.
</dd><dt class="dt-description"><b>7</b></dt><dd class="dd-description"> Method overridden.
</dd><dt class="dt-description"><b>8</b></dt><dd class="dd-description"> Partial match: missing cases in pattern-matching.
</dd><dt class="dt-description"><b>9</b></dt><dd class="dd-description"> Missing fields in a record pattern.
</dd><dt class="dt-description"><b>10</b></dt><dd class="dd-description"> Expression on the left-hand side of a sequence that doesn’t have type
<tt>unit</tt> (and that is not a function, see warning number 5).
</dd><dt class="dt-description"><b>11</b></dt><dd class="dd-description"> Redundant case in a pattern matching (unused match case).
</dd><dt class="dt-description"><b>12</b></dt><dd class="dd-description"> Redundant sub-pattern in a pattern-matching.
</dd><dt class="dt-description"><b>13</b></dt><dd class="dd-description"> Instance variable overridden.
</dd><dt class="dt-description"><b>14</b></dt><dd class="dd-description"> Illegal backslash escape in a string constant.
</dd><dt class="dt-description"><b>15</b></dt><dd class="dd-description"> Private method made public implicitly.
</dd><dt class="dt-description"><b>16</b></dt><dd class="dd-description"> Unerasable optional argument.
</dd><dt class="dt-description"><b>17</b></dt><dd class="dd-description"> Undeclared virtual method.
</dd><dt class="dt-description"><b>18</b></dt><dd class="dd-description"> Non-principal type.
</dd><dt class="dt-description"><b>19</b></dt><dd class="dd-description"> Type without principality.
</dd><dt class="dt-description"><b>20</b></dt><dd class="dd-description"> Unused function argument.
</dd><dt class="dt-description"><b>21</b></dt><dd class="dd-description"> Non-returning statement.
</dd><dt class="dt-description"><b>22</b></dt><dd class="dd-description"> Camlp4 warning.
</dd><dt class="dt-description"><b>23</b></dt><dd class="dd-description"> Useless record <tt>with</tt> clause.
</dd><dt class="dt-description"><b>24</b></dt><dd class="dd-description"> Bad module name: the source file name is not a valid OCaml module name.
</dd><dt class="dt-description"><b>25</b></dt><dd class="dd-description"> Pattern-matching with all clauses guarded. Exhaustiveness cannot be
checked.
</dd><dt class="dt-description"><b>26</b></dt><dd class="dd-description"> Suspicious unused variable: unused variable that is bound
with <tt>let</tt> or <tt>as</tt>, and doesn’t start with an underscore (<tt>_</tt>)
character.
</dd><dt class="dt-description"><b>27</b></dt><dd class="dd-description"> Innocuous unused variable: unused variable that is not bound with
<tt>let</tt> nor <tt>as</tt>, and doesn’t start with an underscore (<tt>_</tt>)
character.
</dd><dt class="dt-description"><b>28</b></dt><dd class="dd-description"> Wildcard pattern given as argument to a constant constructor.
</dd><dt class="dt-description"><b>29</b></dt><dd class="dd-description"> Unescaped end-of-line in a string constant (non-portable code).
</dd><dt class="dt-description"><b>30</b></dt><dd class="dd-description"> Two labels or constructors of the same name are defined in two
mutually recursive types.
</dd><dt class="dt-description"><b>31</b></dt><dd class="dd-description"> A module is linked twice in the same executable.
</dd><dt class="dt-description"><b>32</b></dt><dd class="dd-description"> Unused value declaration.
</dd><dt class="dt-description"><b>33</b></dt><dd class="dd-description"> Unused open statement.
</dd><dt class="dt-description"><b>34</b></dt><dd class="dd-description"> Unused type declaration.
</dd><dt class="dt-description"><b>35</b></dt><dd class="dd-description"> Unused for-loop index.
</dd><dt class="dt-description"><b>36</b></dt><dd class="dd-description"> Unused ancestor variable.
</dd><dt class="dt-description"><b>37</b></dt><dd class="dd-description"> Unused constructor.
</dd><dt class="dt-description"><b>38</b></dt><dd class="dd-description"> Unused exception constructor.
</dd><dt class="dt-description"><b>39</b></dt><dd class="dd-description"> Unused rec flag.
</dd><dt class="dt-description"><b>A</b></dt><dd class="dd-description"> All warnings.
</dd><dt class="dt-description"><b>C</b></dt><dd class="dd-description"> Set of warnings 1, 2.
</dd><dt class="dt-description"><b>D</b></dt><dd class="dd-description"> Synonym for warning 3.
</dd><dt class="dt-description"><b>E</b></dt><dd class="dd-description"> Synonym for warning 4.
</dd><dt class="dt-description"><b>F</b></dt><dd class="dd-description"> Synonym for warning 5.
</dd><dt class="dt-description"><b>K</b></dt><dd class="dd-description"> Set of warnings 32, 33, 34, 35, 36, 37, 38, 39.
</dd><dt class="dt-description"><b>L</b></dt><dd class="dd-description"> Synonym for warning 6.
</dd><dt class="dt-description"><b>M</b></dt><dd class="dd-description"> Synonym for warning 7.
</dd><dt class="dt-description"><b>P</b></dt><dd class="dd-description"> Synonym for warning 8.
</dd><dt class="dt-description"><b>R</b></dt><dd class="dd-description"> Synonym for warning 9.
</dd><dt class="dt-description"><b>S</b></dt><dd class="dd-description"> Synonym for warning 10.
</dd><dt class="dt-description"><b>U</b></dt><dd class="dd-description"> Set of warnings 11, 12.
</dd><dt class="dt-description"><b>V</b></dt><dd class="dd-description"> Synonym for warning 13.
</dd><dt class="dt-description"><b>X</b></dt><dd class="dd-description"> Set of warnings 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 30.
</dd><dt class="dt-description"><b>Y</b></dt><dd class="dd-description"> Synonym for warning 26.
</dd><dt class="dt-description"><b>Z</b></dt><dd class="dd-description"> Synonym for warning 27.

</dd></dl><p>The default setting is <tt>-w +a-4-6-7-9-27-29-32..37</tt>.
Note that warnings 5 and 10 are not always triggered, depending on
the internals of the type checker.</p></dd><dt class="dt-description"><b><tt>-warn-error</tt> <i>warning-list</i></b></dt><dd class="dd-description">
Mark as errors the warnings specified in the argument <i>warning-list</i>.
The compiler will stop with an error when one of these warnings is
emitted. The <i>warning-list</i> has the same meaning as for
the <tt>-w</tt> option: a <tt>+</tt> sign (or an uppercase letter) turns the
corresponding warnings into errors, a <tt>-</tt>
sign (or a lowercase letter) turns them back into warnings, and a
<tt>@</tt> sign both enables and marks the corresponding warnings.<p>Note: it is not recommended to use warning sets (i.e. letters) as
arguments to <tt>-warn-error</tt>
in production code, because this can break your build when future versions
of OCaml add some new warnings.</p><p>The default setting is <tt>-warn-error -a</tt>
(none of the warnings is treated as an error).</p></dd><dt class="dt-description"><tt><b>-warn-help</b></tt></dt><dd class="dd-description">
Show description for all available warning numbers.</dd><dt class="dt-description"><tt><b>-where</b></tt></dt><dd class="dd-description">
Print the location of the standard library, then exit.</dd><dt class="dt-description"><b><tt>-</tt> <i>file</i></b></dt><dd class="dd-description">
Process <i>file</i> as a file name, even if it starts with a dash (<tt>-</tt>)
character.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h2 class="section"><a name="toc88"></a><a name="htoc118">3</a>&nbsp;&nbsp;Modules and the file system</h2><p>This short section is intended to clarify the relationship between the
names of the modules corresponding to compilation units and the names
of the files that contain their compiled interface and compiled
implementation.</p><p>The compiler always derives the module name by taking the capitalized
base name of the source file (<tt>.ml</tt> or <tt>.mli</tt> file). That is, it
strips the leading directory name, if any, as well as the <tt>.ml</tt> or
<tt>.mli</tt> suffix; then, it set the first letter to uppercase, in order to
comply with the requirement that module names must be capitalized.
For instance, compiling the file <tt>mylib/misc.ml</tt> provides an
implementation for the module named <tt>Misc</tt>. Other compilation units
may refer to components defined in <tt>mylib/misc.ml</tt> under the names
<tt>Misc.</tt><i>name</i>; they can also do <tt>open Misc</tt>, then use unqualified
names <i>name</i>.</p><p>The <tt>.cmi</tt> and <tt>.cmo</tt> files produced by the compiler have the same
base name as the source file. Hence, the compiled files always have
their base name equal (modulo capitalization of the first letter) to
the name of the module they describe (for <tt>.cmi</tt> files) or implement
(for <tt>.cmo</tt> files).</p><p>When the compiler encounters a reference to a free module identifier
<tt>Mod</tt>, it looks in the search path for a file named <tt>Mod.cmi</tt> or <tt>mod.cmi</tt>
and loads the compiled interface
contained in that file. As a consequence, renaming <tt>.cmi</tt> files is not
advised: the name of a <tt>.cmi</tt> file must always correspond to the name
of the compilation unit it implements. It is admissible to move them
to another directory, if their base name is preserved, and the correct
<tt>-I</tt> options are given to the compiler. The compiler will flag an
error if it loads a <tt>.cmi</tt> file that has been renamed.</p><p>Compiled bytecode files (<tt>.cmo</tt> files), on the other hand, can be
freely renamed once created. That’s because the linker never attempts
to find by itself the <tt>.cmo</tt> file that implements a module with a
given name: it relies instead on the user providing the list of <tt>.cmo</tt>
files by hand.</p><h2 class="section"><a name="toc89"></a><a name="htoc119">4</a>&nbsp;&nbsp;Common errors</h2><p> <a name="s:comp-errors"></a></p><p>This section describes and explains the most frequently encountered
error messages.</p><dl class="description"><dt class="dt-description"><b>Cannot find file <i>filename</i></b></dt><dd class="dd-description">
The named file could not be found in the current directory, nor in the
directories of the search path. The <i>filename</i> is either a
compiled interface file (<tt>.cmi</tt> file), or a compiled bytecode file
(<tt>.cmo</tt> file). If <i>filename</i> has the format <i>mod</i><tt>.cmi</tt>, this
means you are trying to compile a file that references identifiers
from module <i>mod</i>, but you have not yet compiled an interface for
module <i>mod</i>. Fix: compile <i>mod</i><tt>.mli</tt> or <i>mod</i><tt>.ml</tt>
first, to create the compiled interface <i>mod</i><tt>.cmi</tt>.<p>If <i>filename</i> has the format <i>mod</i><tt>.cmo</tt>, this
means you are trying to link a bytecode object file that does not
exist yet. Fix: compile <i>mod</i><tt>.ml</tt> first.</p><p>If your program spans several directories, this error can also appear
because you haven’t specified the directories to look into. Fix: add
the correct <tt>-I</tt> options to the command line.</p></dd><dt class="dt-description"><b>Corrupted compiled interface <i>filename</i></b></dt><dd class="dd-description">
The compiler produces this error when it tries to read a compiled
interface file (<tt>.cmi</tt> file) that has the wrong structure. This means
something went wrong when this <tt>.cmi</tt> file was written: the disk was
full, the compiler was interrupted in the middle of the file creation,
and so on. This error can also appear if a <tt>.cmi</tt> file is modified after
its creation by the compiler. Fix: remove the corrupted <tt>.cmi</tt> file,
and rebuild it.</dd><dt class="dt-description"><b>This expression has type <i>t</i><sub>1</sub>, but is used with type <i>t</i><sub>2</sub></b></dt><dd class="dd-description">
This is by far the most common type error in programs. Type <i>t</i><sub>1</sub> is
the type inferred for the expression (the part of the program that is
displayed in the error message), by looking at the expression itself.
Type <i>t</i><sub>2</sub> is the type expected by the context of the expression; it
is deduced by looking at how the value of this expression is used in
the rest of the program. If the two types <i>t</i><sub>1</sub> and <i>t</i><sub>2</sub> are not
compatible, then the error above is produced.<p>In some cases, it is hard to understand why the two types <i>t</i><sub>1</sub> and
<i>t</i><sub>2</sub> are incompatible. For instance, the compiler can report that
“expression of type <tt>foo</tt> cannot be used with type <tt>foo</tt>”, and it
really seems that the two types <tt>foo</tt> are compatible. This is not
always true. Two type constructors can have the same name, but
actually represent different types. This can happen if a type
constructor is redefined. Example:
</p><pre>        type foo = A | B
        let f = function A -&gt; 0 | B -&gt; 1
        type foo = C | D
        f C
</pre><p>This result in the error message “expression <tt>C</tt> of type <tt>foo</tt> cannot
be used with type <tt>foo</tt>”.</p></dd><dt class="dt-description"><b>The type of this expression, <i>t</i>, contains type variables
that cannot be generalized</b></dt><dd class="dd-description">
Type variables (<tt>'a</tt>, <tt>'b</tt>, …) in a type <i>t</i> can be in either
of two states: generalized (which means that the type <i>t</i> is valid
for all possible instantiations of the variables) and not generalized
(which means that the type <i>t</i> is valid only for one instantiation
of the variables). In a <tt>let</tt> binding <tt>let </tt><i>name</i><tt> = </tt><i>expr</i>,
the type-checker normally generalizes as many type variables as
possible in the type of <i>expr</i>. However, this leads to unsoundness
(a well-typed program can crash) in conjunction with polymorphic
mutable data structures. To avoid this, generalization is performed at
<tt>let</tt> bindings only if the bound expression <i>expr</i> belongs to the
class of “syntactic values”, which includes constants, identifiers,
functions, tuples of syntactic values, etc. In all other cases (for
instance, <i>expr</i> is a function application), a polymorphic mutable
could have been created and generalization is therefore turned off for
all variables occuring in contravariant or non-variant branches of the
type. For instance, if the type of a non-value is <tt>'a list</tt> the
variable is generalizable (<tt>list</tt> is a covariant type constructor),
but not in <tt>'a list -&gt; 'a list</tt> (the left branch of <tt>-&gt;</tt> is
contravariant) or <tt>'a ref</tt> (<tt>ref</tt> is non-variant).<p>Non-generalized type variables in a type cause no difficulties inside
a given structure or compilation unit (the contents of a <tt>.ml</tt> file,
or an interactive session), but they cannot be allowed inside
signatures nor in compiled interfaces (<tt>.cmi</tt> file), because they
could be used inconsistently later. Therefore, the compiler
flags an error when a structure or compilation unit defines a value
<i>name</i> whose type contains non-generalized type variables. There
are two ways to fix this error:
</p><ul class="itemize"><li class="li-itemize">
Add a type constraint or a <tt>.mli</tt> file to give a monomorphic
type (without type variables) to <i>name</i>. For instance, instead of
writing
<pre>    let sort_int_list = Sort.list (&lt;)
    (* inferred type 'a list -&gt; 'a list, with 'a not generalized *)
</pre>write
<pre>    let sort_int_list = (Sort.list (&lt;) : int list -&gt; int list);;
</pre></li><li class="li-itemize">If you really need <i>name</i> to have a polymorphic type, turn
its defining expression into a function by adding an extra parameter.
For instance, instead of writing
<pre>    let map_length = List.map Array.length
    (* inferred type 'a array list -&gt; int list, with 'a not generalized *)
</pre>write
<pre>    let map_length lv = List.map Array.length lv
</pre></li></ul></dd><dt class="dt-description"><b>Reference to undefined global <i>mod</i></b></dt><dd class="dd-description">
This error appears when trying to link an incomplete or incorrectly
ordered set of files. Either you have forgotten to provide an
implementation for the compilation unit named <i>mod</i> on the command line
(typically, the file named <i>mod</i><tt>.cmo</tt>, or a library containing
that file). Fix: add the missing <tt>.ml</tt> or <tt>.cmo</tt> file to the command
line. Or, you have provided an implementation for the module named
<i>mod</i>, but it comes too late on the command line: the
implementation of <i>mod</i> must come before all bytecode object files
that reference <i>mod</i>. Fix: change the order of <tt>.ml</tt> and <tt>.cmo</tt>
files on the command line.<p>Of course, you will always encounter this error if you have mutually
recursive functions across modules. That is, function <tt>Mod1.f</tt> calls
function <tt>Mod2.g</tt>, and function <tt>Mod2.g</tt> calls function <tt>Mod1.f</tt>.
In this case, no matter what permutations you perform on the command
line, the program will be rejected at link-time. Fixes:
</p><ul class="itemize"><li class="li-itemize">
Put <tt>f</tt> and <tt>g</tt> in the same module.
</li><li class="li-itemize">Parameterize one function by the other.
That is, instead of having
<pre>mod1.ml:    let f x = ... Mod2.g ...
mod2.ml:    let g y = ... Mod1.f ...
</pre>define
<pre>mod1.ml:    let f g x = ... g ...
mod2.ml:    let rec g y = ... Mod1.f g ...
</pre>and link <tt>mod1.cmo</tt> before <tt>mod2.cmo</tt>.
</li><li class="li-itemize">Use a reference to hold one of the two functions, as in :
<pre>mod1.ml:    let forward_g =
                ref((fun x -&gt; failwith "forward_g") : &lt;type&gt;)
            let f x = ... !forward_g ...
mod2.ml:    let g y = ... Mod1.f ...
            let _ = Mod1.forward_g := g
</pre></li></ul></dd><dt class="dt-description"><b>The external function <i>f</i> is not available</b></dt><dd class="dd-description">
This error appears when trying to link code that calls external
functions written in C. As explained in
chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>, such code must be linked with C libraries that
implement the required <i>f</i> C function. If the C libraries in
question are not shared libraries (DLLs), the code must be linked in
“custom runtime” mode. Fix: add the required C libraries to the
command line, and possibly the <tt>-custom</tt> option.</dd></dl><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>