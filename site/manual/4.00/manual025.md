<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li class="active"><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc132"><span>Chapter 11</span></a>&nbsp;&nbsp;Native-code compilation (ocamlopt)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Native-code compilation (ocamlopt)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc100">Overview of the compiler</a>
</li><li><a href="#toc101">Options</a>
</li><li><a href="#toc102">Common errors</a>
</li><li><a href="#toc103">Running executables produced by ocamlopt</a>
</li><li><a href="#toc104">Compatibility with the bytecode compiler</a>
</li></ul></nav></header>
<p> <a name="c:nativecomp"></a>
</p><p>This chapter describes the OCaml high-performance
native-code compiler <tt>ocamlopt</tt>, which compiles OCaml source files to
native code object files and link these object files to produce
standalone executables.</p><p>The native-code compiler is only available on certain platforms.
It produces code that runs faster than the bytecode produced by
<tt>ocamlc</tt>, at the cost of increased compilation time and executable code
size. Compatibility with the bytecode compiler is extremely high: the
same source code should run identically when compiled with <tt>ocamlc</tt> and
<tt>ocamlopt</tt>.</p><p>It is not possible to mix native-code object files produced by <tt>ocamlopt</tt>
with bytecode object files produced by <tt>ocamlc</tt>: a program must be
compiled entirely with <tt>ocamlopt</tt> or entirely with <tt>ocamlc</tt>. Native-code
object files produced by <tt>ocamlopt</tt> cannot be loaded in the toplevel
system <tt>ocaml</tt>.</p><h2 class="section"><a name="toc100"></a><a name="htoc133">1</a>&nbsp;&nbsp;Overview of the compiler</h2><p>The <tt>ocamlopt</tt> command has a command-line interface very close to that
of <tt>ocamlc</tt>. It accepts the same types of arguments, and processes them
sequentially:</p><ul class="itemize"><li class="li-itemize">
Arguments ending in <tt>.mli</tt> are taken to be source files for
compilation unit interfaces. Interfaces specify the names exported by
compilation units: they declare value names with their types, define
public data types, declare abstract data types, and so on. From the
file <i>x</i><tt>.mli</tt>, the <tt>ocamlopt</tt> compiler produces a compiled interface
in the file <i>x</i><tt>.cmi</tt>. The interface produced is identical to that
produced by the bytecode compiler <tt>ocamlc</tt>.</li><li class="li-itemize">Arguments ending in <tt>.ml</tt> are taken to be source files for compilation
unit implementations. Implementations provide definitions for the
names exported by the unit, and also contain expressions to be
evaluated for their side-effects. From the file <i>x</i><tt>.ml</tt>, the <tt>ocamlopt</tt>
compiler produces two files: <i>x</i><tt>.o</tt>, containing native object code,
and <i>x</i><tt>.cmx</tt>, containing extra information for linking and
optimization of the clients of the unit. The compiled implementation
should always be referred to under the name <i>x</i><tt>.cmx</tt> (when given
a <tt>.o</tt> or <tt>.obj</tt> file, <tt>ocamlopt</tt> assumes that it contains code compiled from C,
not from OCaml).<p>The implementation is checked against the interface file <i>x</i><tt>.mli</tt>
(if it exists) as described in the manual for <tt>ocamlc</tt>
(chapter&nbsp;<a href="manual022.html#c:camlc">8</a>).</p></li><li class="li-itemize">Arguments ending in <tt>.cmx</tt> are taken to be compiled object code. These
files are linked together, along with the object files obtained
by compiling <tt>.ml</tt> arguments (if any), and the OCaml standard
library, to produce a native-code executable program. The order in
which <tt>.cmx</tt> and <tt>.ml</tt> arguments are presented on the command line is
relevant: compilation units are initialized in that order at
run-time, and it is a link-time error to use a component of a unit
before having initialized it. Hence, a given <i>x</i><tt>.cmx</tt> file must come
before all <tt>.cmx</tt> files that refer to the unit <i>x</i>.</li><li class="li-itemize">Arguments ending in <tt>.cmxa</tt> are taken to be libraries of object code.
Such a library packs in two files (<i>lib</i><tt>.cmxa</tt> and <i>lib</i><tt>.a</tt>/<tt>.lib</tt>)
a set of object files (<tt>.cmx</tt> and <tt>.o</tt>/<tt>.obj</tt> files). Libraries are build with
<tt>ocamlopt -a</tt> (see the description of the <tt>-a</tt> option below). The object
files contained in the library are linked as regular <tt>.cmx</tt> files (see
above), in the order specified when the library was built. The only
difference is that if an object file contained in a library is not
referenced anywhere in the program, then it is not linked in.</li><li class="li-itemize">Arguments ending in <tt>.c</tt> are passed to the C compiler, which generates
a <tt>.o</tt>/<tt>.obj</tt> object file. This object file is linked with the program.</li><li class="li-itemize">Arguments ending in <tt>.o</tt>, <tt>.a</tt> or <tt>.so</tt> (<tt>.obj</tt>, <tt>.lib</tt> and <tt>.dll</tt>
under Windows) are assumed to be C object files and
libraries. They are linked with the program.</li></ul><p>The output of the linking phase is a regular Unix or Windows
executable file. It does not need <tt>ocamlrun</tt> to run.</p><h2 class="section"><a name="toc101"></a><a name="htoc134">2</a>&nbsp;&nbsp;Options</h2><p>The following command-line options are recognized by <tt>ocamlopt</tt>.
The options <tt>-pack</tt>, <tt>-a</tt>, <tt>-shared</tt>, <tt>-c</tt> and <tt>-output-obj</tt> are mutually
exclusive.</p><dl class="description"><dt class="dt-description"><tt><b>-a</b></tt></dt><dd class="dd-description">
Build a library (<tt>.cmxa</tt> and <tt>.a</tt>/<tt>.lib</tt> files) with the object files
(<tt>.cmx</tt> and <tt>.o</tt>/<tt>.obj</tt> files) given on the command line, instead of
linking them into an executable file. The name of the library must be
set with the <tt>-o</tt> option.<p>If <tt>-cclib</tt> or <tt>-ccopt</tt> options are passed on the command
line, these options are stored in the resulting <tt>.cmxa</tt> library. Then,
linking with this library automatically adds back the
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
Use <i>ccomp</i> as the C linker called to build the final executable
and as the C compiler for compiling <tt>.c</tt> source files.</dd><dt class="dt-description"><b><tt>-cclib</tt> <tt>-l</tt><i>libname</i></b></dt><dd class="dd-description">
Pass the <tt>-l</tt><i>libname</i> option to the linker. This causes the given
C library to be linked with the program.</dd><dt class="dt-description"><b><tt>-ccopt</tt> <i>option</i></b></dt><dd class="dd-description">
Pass the given option to the C compiler and linker. For instance,
<tt>-ccopt -L</tt><i>dir</i> causes the C linker to search for C libraries in
directory <i>dir</i>.</dd><dt class="dt-description"><tt><b>-compact</b></tt></dt><dd class="dd-description">
Optimize the produced code for space rather than for time. This
results in slightly smaller but slightly slower programs. The default is to
optimize for speed.</dd><dt class="dt-description"><tt><b>-config</b></tt></dt><dd class="dd-description">
Print the version number of <tt>ocamlopt</tt> and a detailed summary of its
configuration, then exit.</dd><dt class="dt-description"><b><tt>-for-pack</tt> <i>module-path</i></b></dt><dd class="dd-description">
Generate an object file (<tt>.cmx</tt> and <tt>.o</tt>/<tt>.obj</tt> files) that can later be included
as a sub-module (with the given access path) of a compilation unit
constructed with <tt>-pack</tt>. For instance, <tt>ocamlopt -for-pack P -c A.ml</tt>
will generate <tt>a.cmx</tt> and <tt>a.o</tt> files that can later be used with
<tt>ocamlopt -pack -o P.cmx a.cmx</tt>.</dd><dt class="dt-description"><tt><b>-g</b></tt></dt><dd class="dd-description">
Add debugging information while compiling and linking. This option is
required in order to produce stack backtraces when
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
(<tt>.cmx</tt>), and libraries (<tt>.cmxa</tt>). By default, the current directory
is searched first, then the standard library directory. Directories
added with <tt>-I</tt> are searched after the current directory, in the order
in which they were given on the command line, but before the standard
library directory.<p>If the given directory starts with <tt>+</tt>, it is taken relative to the
standard library directory. For instance, <tt>-I +labltk</tt> adds the
subdirectory <tt>labltk</tt> of the standard library to the search path.</p></dd><dt class="dt-description"><b><tt>-inline</tt> <i>n</i></b></dt><dd class="dd-description">
Set aggressiveness of inlining to <i>n</i>, where <i>n</i> is a positive
integer. Specifying <tt>-inline 0</tt> prevents all functions from being
inlined, except those whose body is smaller than the call site. Thus,
inlining causes no expansion in code size. The default aggressiveness,
<tt>-inline 1</tt>, allows slightly larger functions to be inlined, resulting
in a slight expansion in code size. Higher values for the <tt>-inline</tt>
option cause larger and larger functions to become candidate for
inlining, but can result in a serious increase in code size.</dd><dt class="dt-description"><b><tt>-intf</tt> <i>filename</i></b></dt><dd class="dd-description">
Compile the file <i>filename</i> as an interface file, even if its
extension is not <tt>.mli</tt>.</dd><dt class="dt-description"><b><tt>-intf-suffix</tt> <i>string</i></b></dt><dd class="dd-description">
Recognize file names ending with <i>string</i> as interface files
(instead of the default <tt>.mli</tt>).</dd><dt class="dt-description"><tt><b>-labels</b></tt></dt><dd class="dd-description">
Labels are not ignored in types, labels may be used in applications,
and labelled parameters can be given in any order. This is the default.</dd><dt class="dt-description"><tt><b>-linkall</b></tt></dt><dd class="dd-description">
Force all modules contained in libraries to be linked in. If this
flag is not given, unreferenced modules are not linked in. When
building a library (<tt>-a</tt> flag), setting the <tt>-linkall</tt> flag forces all
subsequent links of programs involving that library to link all the
modules contained in the library.</dd><dt class="dt-description"><tt><b>-noassert</b></tt></dt><dd class="dd-description">
Do not compile assertion checks. Note that the special form
<tt>assert false</tt> is always compiled because it is typed specially.
This flag has no effect when linking already-compiled files.</dd><dt class="dt-description"><tt><b>-noautolink</b></tt></dt><dd class="dd-description">
When linking <tt>.cmxa</tt> libraries, ignore <tt>-cclib</tt> and <tt>-ccopt</tt>
options potentially contained in the libraries (if these options were
given when building the libraries). This can be useful if a library
contains incorrect specifications of C libraries or C options; in this
case, during linking, set <tt>-noautolink</tt> and pass the correct C
libraries and options on the command line.</dd><dt class="dt-description"><tt><b>-nodynlink</b></tt></dt><dd class="dd-description">
Allow the compiler to use some optimizations that are valid only for code
that is never dynlinked.</dd><dt class="dt-description"><tt><b>-nolabels</b></tt></dt><dd class="dd-description">
Ignore non-optional labels in types. Labels cannot be used in
applications, and parameter order becomes strict.</dd><dt class="dt-description"><b><tt>-o</tt> <i>exec-file</i></b></dt><dd class="dd-description">
Specify the name of the output file produced by the linker. The
default output name is <tt>a.out</tt> under Unix and <tt>camlprog.exe</tt> under
Windows. If the <tt>-a</tt> option is given, specify the name of the library
produced. If the <tt>-pack</tt> option is given, specify the name of the
packed object file produced. If the <tt>-output-obj</tt> option is given,
specify the name of the output file produced. If the <tt>-shared</tt> option
is given, specify the name of plugin file produced.</dd><dt class="dt-description"><tt><b>-output-obj</b></tt></dt><dd class="dd-description">
Cause the linker to produce a C object file instead of an executable
file. This is useful to wrap OCaml code as a C library,
callable from any C program. See chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>,
section&nbsp;<a href="manual033.html#s:embedded-code">19.7.5</a>. The name of the output object file
must be set with the <tt>-o</tt> option.
This option can also be used to produce a compiled shared/dynamic
library (<tt>.so</tt> extension, <tt>.dll</tt> under Windows).</dd><dt class="dt-description"><tt><b>-p</b></tt></dt><dd class="dd-description">
Generate extra code to write profile information when the program is
executed. The profile information can then be examined with the
analysis program <tt>gprof</tt>. (See chapter&nbsp;<a href="manual031.html#c:profiler">17</a> for more
information on profiling.) The <tt>-p</tt> option must be given both at
compile-time and at link-time. Linking object files not compiled with
<tt>-p</tt> is possible, but results in less precise profiling.<blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp; See the Unix manual page for <tt>gprof(1)</tt> for more
information about the profiles.<p>Full support for <tt>gprof</tt> is only available for certain platforms
(currently: Intel x86 32 and 64 bits under Linux, BSD and MacOS X).
On other platforms, the <tt>-p</tt> option will result in a less precise
profile (no call graph information, only a time profile).
</p></blockquote><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
The <tt>-p</tt> option does not work under Windows.
</blockquote></dd><dt class="dt-description"><tt><b>-pack</b></tt></dt><dd class="dd-description">
Build an object file (<tt>.cmx</tt> and <tt>.o</tt>/<tt>.obj</tt> files) and its associated compiled
interface (<tt>.cmi</tt>) that combines the <tt>.cmx</tt> object
files given on the command line, making them appear as sub-modules of
the output <tt>.cmx</tt> file. The name of the output <tt>.cmx</tt> file must be
given with the <tt>-o</tt> option. For instance,
<pre>        ocamlopt -pack -o P.cmx A.cmx B.cmx C.cmx
</pre>generates compiled files <tt>P.cmx</tt>, <tt>P.o</tt> and <tt>P.cmi</tt> describing a
compilation unit having three sub-modules <tt>A</tt>, <tt>B</tt> and <tt>C</tt>,
corresponding to the contents of the object files <tt>A.cmx</tt>, <tt>B.cmx</tt> and
<tt>C.cmx</tt>. These contents can be referenced as <tt>P.A</tt>, <tt>P.B</tt> and <tt>P.C</tt>
in the remainder of the program.<p>The <tt>.cmx</tt> object files being combined must have been compiled with
the appropriate <tt>-for-pack</tt> option. In the example above,
<tt>A.cmx</tt>, <tt>B.cmx</tt> and <tt>C.cmx</tt> must have been compiled with
<tt>ocamlopt -for-pack P</tt>.</p><p>Multiple levels of packing can be achieved by combining <tt>-pack</tt> with
<tt>-for-pack</tt>. Consider the following example:
</p><pre>        ocamlopt -for-pack P.Q -c A.ml
        ocamlopt -pack -o Q.cmx -for-pack P A.cmx
        ocamlopt -for-pack P -c B.ml
        ocamlopt -pack -o P.cmx Q.cmx B.cmx
</pre><p>The resulting <tt>P.cmx</tt> object file has sub-modules <tt>P.Q</tt>, <tt>P.Q.A</tt>
and <tt>P.B</tt>.</p></dd><dt class="dt-description"><b><tt>-pp</tt> <i>command</i></b></dt><dd class="dd-description">
Cause the compiler to call the given <i>command</i> as a preprocessor
for each source file. The output of <i>command</i> is redirected to
an intermediate file, which is compiled. If there are no compilation
errors, the intermediate file is deleted afterwards.</dd><dt class="dt-description"><tt><b>-principal</b></tt></dt><dd class="dd-description">
Check information path during type-checking, to make sure that all
types are derived in a principal way. All programs accepted in
<tt>-principal</tt> mode are also accepted in default mode with equivalent
types, but different binary signatures.</dd><dt class="dt-description"><tt><b>-rectypes</b></tt></dt><dd class="dd-description">
Allow arbitrary recursive types during type-checking. By default,
only recursive types where the recursion goes through an object type
are supported. Note that once you have created an interface using this
flag, you must use it again for all dependencies.</dd><dt class="dt-description"><tt><b>-S</b></tt></dt><dd class="dd-description">
Keep the assembly code produced during the compilation. The assembly
code for the source file <i>x</i><tt>.ml</tt> is saved in the file <i>x</i><tt>.s</tt>.</dd><dt class="dt-description"><tt><b>-shared</b></tt></dt><dd class="dd-description">
Build a plugin (usually <tt>.cmxs</tt>) that can be dynamically loaded with
the <tt>Dynlink</tt> module. The name of the plugin must be
set with the <tt>-o</tt> option. A plugin can include a number of OCaml
modules and libraries, and extra native objects (<tt>.o</tt>, <tt>.obj</tt>, <tt>.a</tt>,
<tt>.lib</tt> files). Building native plugins is only supported for some
operating system. Under some systems (currently,
only Linux AMD 64), all the OCaml code linked in a plugin must have
been compiled without the <tt>-nodynlink</tt> flag. Some constraints might also
apply to the way the extra native objects have been compiled (under
Linux AMD 64, they must contain only position-independent code).</dd><dt class="dt-description"><tt><b>-thread</b></tt></dt><dd class="dd-description">
Compile or link multithreaded programs, in combination with the
system <tt>threads</tt> library described in chapter&nbsp;<a href="manual039.html#c:threads">25</a>.</dd><dt class="dt-description"><tt><b>-unsafe</b></tt></dt><dd class="dd-description">
Turn bound checking off for array and string accesses (the <tt>v.(i)</tt> and
<tt>s.[i]</tt> constructs). Programs compiled with <tt>-unsafe</tt> are therefore
faster, but unsafe: anything can happen if the program accesses an
array or string outside of its bounds. Additionally, turn off the
check for zero divisor in integer division and modulus operations.
With <tt>-unsafe</tt>, an integer division (or modulus) by zero can halt the
program or continue with an unspecified result instead of raising a
<tt>Division_by_zero</tt> exception.</dd><dt class="dt-description"><tt><b>-v</b></tt></dt><dd class="dd-description">
Print the version number of the compiler and the location of the
standard library directory, then exit.</dd><dt class="dt-description"><tt><b>-verbose</b></tt></dt><dd class="dd-description">
Print all external commands before they are executed, in particular
invocations of the assembler, C compiler, and linker.</dd><dt class="dt-description"><b><tt>-vnum</tt> or <tt>-version</tt></b></dt><dd class="dd-description">
Print the version number of the compiler in short form (e.g. <tt>3.11.0</tt>),
then exit.</dd><dt class="dt-description"><b><tt>-w</tt> <i>warning-list</i></b></dt><dd class="dd-description">
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

</dd></dl><p>The default setting is <tt>-w +a-4-6-7-9-27..29</tt>.
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
(none of the warnings is treated as an error).</p></dd><dt class="dt-description"><tt><b>-where</b></tt></dt><dd class="dd-description">
Print the location of the standard library, then exit.</dd><dt class="dt-description"><b><tt>-</tt> <i>file</i></b></dt><dd class="dd-description">
Process <i>file</i> as a file name, even if it starts with a dash (-)
character.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h5 class="paragraph">Options for the IA32 architecture</h5><p>
The IA32 code generator (Intel Pentium, AMD Athlon) supports the
following additional option:</p><dl class="description"><dt class="dt-description">
<tt><b>-ffast-math</b></tt></dt><dd class="dd-description"> Use the IA32 instructions to compute
trigonometric and exponential functions, instead of calling the
corresponding library routines. The functions affected are:
<tt>atan</tt>, <tt>atan2</tt>, <tt>cos</tt>, <tt>log</tt>, <tt>log10</tt>, <tt>sin</tt>, <tt>sqrt</tt> and <tt>tan</tt>.
The resulting code runs faster, but the range of supported arguments
and the precision of the result can be reduced. In particular,
trigonometric operations <tt>cos</tt>, <tt>sin</tt>, <tt>tan</tt> have their range reduced to
[−2<sup>64</sup>, 2<sup>64</sup>].
</dd></dl><h5 class="paragraph">Options for the AMD64 architecture</h5><p>
The AMD64 code generator (64-bit versions of Intel Pentium and AMD
Athlon) supports the following additional options:</p><dl class="description"><dt class="dt-description">
<tt><b>-fPIC</b></tt></dt><dd class="dd-description"> Generate position-independent machine code. This is
the default.
</dd><dt class="dt-description"><tt><b>-fno-PIC</b></tt></dt><dd class="dd-description"> Generate position-dependent machine code.
</dd></dl><h5 class="paragraph">Options for the Sparc architecture</h5><p>
The Sparc code generator supports the following additional options:
</p><dl class="description"><dt class="dt-description">
<tt><b>-march=v8</b></tt></dt><dd class="dd-description"> Generate SPARC version 8 code.
</dd><dt class="dt-description"><tt><b>-march=v9</b></tt></dt><dd class="dd-description"> Generate SPARC version 9 code.
</dd></dl><p>
The default is to generate code for SPARC version 7, which runs on all
SPARC processors.</p><h2 class="section"><a name="toc102"></a><a name="htoc135">3</a>&nbsp;&nbsp;Common errors</h2><p>The error messages are almost identical to those of <tt>ocamlc</tt>.
See section&nbsp;<a href="manual022.html#s:comp-errors">8.4</a>.</p><h2 class="section"><a name="toc103"></a><a name="htoc136">4</a>&nbsp;&nbsp;Running executables produced by ocamlopt</h2><p>Executables generated by <tt>ocamlopt</tt> are native, stand-alone executable
files that can be invoked directly. They do
not depend on the <tt>ocamlrun</tt> bytecode runtime system nor on
dynamically-loaded C/OCaml stub libraries.</p><p>During execution of an <tt>ocamlopt</tt>-generated executable,
the following environment variables are also consulted:
</p><dl class="description"><dt class="dt-description">
<tt><b>OCAMLRUNPARAM</b></tt></dt><dd class="dd-description"> Same usage as in <tt>ocamlrun</tt>
(see section&nbsp;<a href="manual024.html#ocamlrun-options">10.2</a>), except that option <tt>l</tt>
is ignored (the operating system’s stack size limit
is used instead).
</dd><dt class="dt-description"><tt><b>CAMLRUNPARAM</b></tt></dt><dd class="dd-description"> If <tt>OCAMLRUNPARAM</tt> is not found in the
environment, then <tt>CAMLRUNPARAM</tt> will be used instead. If
<tt>CAMLRUNPARAM</tt> is not found, then the default values will be used.
</dd></dl><h2 class="section"><a name="toc104"></a><a name="htoc137">5</a>&nbsp;&nbsp;Compatibility with the bytecode compiler</h2><p>
<a name="s:compat-native-bytecode"></a></p><p>This section lists the known incompatibilities between the bytecode
compiler and the native-code compiler. Except on those points, the two
compilers should generate code that behave identically.</p><ul class="itemize"><li class="li-itemize">Signals are detected only when the program performs an
allocation in the heap. That is, if a signal is delivered while in a
piece of code that does not allocate, its handler will not be called
until the next heap allocation.</li><li class="li-itemize">Stack overflow, typically caused by excessively deep recursion,
is handled in one of the following ways, depending on the
platform used:
<ul class="itemize"><li class="li-itemize">
By raising a <tt>Stack_overflow</tt> exception, like the bytecode
compiler does. (IA32/Linux, AMD64/Linux, PowerPC/MacOSX, MS Windows
32-bit ports).
</li><li class="li-itemize">By aborting the program on a “segmentation fault” signal.
(All other Unix systems.)
</li><li class="li-itemize">By terminating the program silently.
(MS Windows 64 bits).
</li></ul></li><li class="li-itemize">On IA32 processors only (Intel and AMD x86 processors in 32-bit
mode), some intermediate results in floating-point computations are
kept in extended precision rather than being rounded to double
precision like the bytecode compiler always does. Floating-point
results can therefore differ slightly between bytecode and native code.</li></ul><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>