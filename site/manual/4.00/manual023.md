<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li class="active"><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc120"><span>Chapter 9</span></a>&nbsp;&nbsp;The toplevel system (ocaml)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The toplevel system (ocaml)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual023.html#toc90">Options</a>
</li><li><a href="manual023.html#toc91">Toplevel directives</a>
</li><li><a href="manual023.html#toc92">The toplevel and the module system</a>
</li><li><a href="manual023.html#toc93">Common errors</a>
</li><li><a href="manual023.html#toc94">Building custom toplevel systems: <tt>ocamlmktop</tt></a>
</li><li><a href="manual023.html#toc95">Options</a>
</li></ul></nav></header>
<p> <a name="c:camllight"></a>
</p><p>This chapter describes the toplevel system for OCaml, that permits interactive use of the OCaml system
through a read-eval-print loop. In this mode, the system repeatedly
reads OCaml phrases from the input, then typechecks, compile and
evaluate them, then prints the inferred type and result value, if
any. The system prints a <tt>#</tt> (sharp) prompt before reading each
phrase.</p><p>Input to the toplevel can span several lines. It is terminated by <tt>;;</tt> (a
double-semicolon). The toplevel input consists in one or several
toplevel phrases, with the following syntax:</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="toplevel-input" class="syntax"><font color="maroon">toplevel-input</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
{&nbsp;<i><a href="#toplevel-phrase" class="syntax"><font color="maroon">toplevel-phrase</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>;;</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="toplevel-phrase" class="syntax"><font color="maroon">toplevel-phrase</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual019.html#definition" class="syntax"><font color="maroon">definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;&nbsp;<i><a href="#directive-argument" class="syntax"><font color="maroon">directive-argument</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="directive-argument" class="syntax"><font color="maroon">directive-argument</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
є
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#string-literal" class="syntax"><font color="maroon">string-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#value-path" class="syntax"><font color="maroon">value-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A phrase can consist of a definition, similar to those found in
implementations of compilation units or in <font color="blue"><tt>struct</tt></font> … <font color="blue"><tt>end</tt></font>
module expressions. The definition can bind value names, type names,
an exception, a module name, or a module type name. The toplevel
system performs the bindings, then prints the types and values (if
any) for the names thus defined.</p><p>A phrase may also consist in a <tt>open</tt> directive (see
section&nbsp;<a href="manual019.html#s:module-expr">6.11</a>), or a value expression
(section&nbsp;<a href="expr.html#s:value-expr">6.7</a>). Expressions are simply evaluated,
without performing any bindings, and the value of the expression is
printed.</p><p>Finally, a phrase can also consist in a toplevel directive,
starting with <tt>#</tt> (the sharp sign). These directives control the
behavior of the toplevel; they are listed below in
section&nbsp;<a href="#s:toplevel-directives">9.2</a>.</p><blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp;
The toplevel system is started by the command <tt>ocaml</tt>, as follows:
<pre>        ocaml <i>options objects</i>                # interactive mode
        ocaml <i>options objects scriptfile</i>        # script mode
</pre>
<i>options</i> are described below.
<i>objects</i> are filenames ending in <tt>.cmo</tt> or <tt>.cma</tt>; they are
loaded into the interpreter immediately after <i>options</i> are set.
<i>scriptfile</i> is any file name not ending in <tt>.cmo</tt> or <tt>.cma</tt>.<p>If no <i>scriptfile</i> is given on the command line, the toplevel system
enters interactive mode: phrases are read on standard input, results
are printed on standard output, errors on standard error. End-of-file
on standard input terminates <tt>ocaml</tt> (see also the <tt>#quit</tt> directive
in section&nbsp;<a href="#s:toplevel-directives">9.2</a>).</p><p>On start-up (before the first phrase is read), if the file
<tt>.ocamlinit</tt> exists in the current directory,
its contents are read as a sequence of OCaml phrases
and executed as per the <tt>#use</tt> directive
described in section&nbsp;<a href="#s:toplevel-directives">9.2</a>.
The evaluation outcode for each phrase are not displayed.
If the current directory does not contain an <tt>.ocamlinit</tt> file, but
the user’s home directory (environment variable <tt>HOME</tt>) does, the
latter is read and executed as described below.</p><p>The toplevel system does not perform line editing, but it can
easily be used in conjunction with an external line editor such as
<tt>ledit</tt>, <tt>ocaml2</tt> or <tt>rlwrap</tt>


(see the
<a href="http://caml.inria.fr/humps/index_framed_caml.html">Caml Hump</a>).

Another option is to use <tt>ocaml</tt> under Gnu Emacs, which gives the
full editing power of Emacs (command <tt>run-caml</tt> from library <tt>inf-caml</tt>).</p><p>At any point, the parsing, compilation or evaluation of the current
phrase can be interrupted by pressing <tt>ctrl-C</tt> (or, more precisely,
by sending the <tt>INTR</tt> signal to the <tt>ocaml</tt> process). The toplevel
then immediately returns to the <tt>#</tt> prompt.</p><p>If <i>scriptfile</i> is given on the command-line to <tt>ocaml</tt>, the toplevel
system enters script mode: the contents of the file are read as a
sequence of OCaml phrases and executed, as per the <tt>#use</tt>
directive (section&nbsp;<a href="#s:toplevel-directives">9.2</a>). The outcome of the
evaluation is not printed. On reaching the end of file, the <tt>ocaml</tt>
command exits immediately. No commands are read from standard input.
<tt>Sys.argv</tt> is transformed, ignoring all OCaml parameters, and
starting with the script file name in <tt>Sys.argv.(0)</tt>.</p><p>In script mode, the first line of the script is ignored if it starts
with <tt>#!</tt>. Thus, it should be possible to make the script
itself executable and put as first line <tt>#!/usr/local/bin/ocaml</tt>,
thus calling the toplevel system automatically when the script is
run. However, <tt>ocaml</tt> itself is a <tt>#!</tt> script on most installations
of OCaml, and Unix kernels usually do not handle nested <tt>#!</tt>
scripts. A better solution is to put the following as the first line
of the script:
</p><pre>        #!/usr/local/bin/ocamlrun /usr/local/bin/ocaml
</pre></blockquote><blockquote class="quote"><font color="purple">Windows:</font>&nbsp;&nbsp;
In addition to the text-only command <tt>ocaml.exe</tt>, which works exactly
as under Unix (see above), a graphical user interface for the
toplevel is available under the name <tt>ocamlwin.exe</tt>. It should be
launched from the Windows file manager or program manager.
This interface provides a text window in which commands can be entered
and edited, and the toplevel responses are printed.
</blockquote><h2 class="section"><a name="toc90"></a><a name="htoc121">1</a>&nbsp;&nbsp;Options</h2><p> <a name="s:toplevel-options"></a></p><p>The following command-line options are recognized by the <tt>ocaml</tt> command.</p><dl class="description"><dt class="dt-description"><tt><b>-absname</b></tt></dt><dd class="dd-description">
Force error messages to show absolute paths for file names.</dd><dt class="dt-description"><b><tt>-I</tt> <i>directory</i></b></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
source and compiled files. By default, the current directory is
searched first, then the standard library directory. Directories added
with <tt>-I</tt> are searched after the current directory, in the order in
which they were given on the command line, but before the standard
library directory.<p>If the given directory starts with <tt>+</tt>, it is taken relative to the
standard library directory. For instance, <tt>-I +labltk</tt> adds the
subdirectory <tt>labltk</tt> of the standard library to the search path.</p><p>Directories can also be added to the list once
the toplevel is running with the <tt>#directory</tt> directive
(section&nbsp;<a href="#s:toplevel-directives">9.2</a>).</p></dd><dt class="dt-description"><b><tt>-init</tt> <i>file</i></b></dt><dd class="dd-description">
Load the given file instead of the default initialization file.
The default file is <tt>.ocamlinit</tt> in the current directory if it
exists, otherwise <tt>.ocamlinit</tt> in the user’s home directory.</dd><dt class="dt-description"><tt><b>-labels</b></tt></dt><dd class="dd-description">
Labels are not ignored in types, labels may be used in applications,
and labelled parameters can be given in any order. This is the default.</dd><dt class="dt-description"><tt><b>-noassert</b></tt></dt><dd class="dd-description">
Do not compile assertion checks. Note that the special form
<tt>assert false</tt> is always compiled because it is typed specially.</dd><dt class="dt-description"><tt><b>-nolabels</b></tt></dt><dd class="dd-description">
Ignore non-optional labels in types. Labels cannot be used in
applications, and parameter order becomes strict.</dd><dt class="dt-description"><tt><b>-noprompt</b></tt></dt><dd class="dd-description">
Do not display any prompt when waiting for input.</dd><dt class="dt-description"><tt><b>-nostdlib</b></tt></dt><dd class="dd-description">
Do not include the standard library directory in the list of
directories searched for source and compiled files.</dd><dt class="dt-description"><tt><b>-principal</b></tt></dt><dd class="dd-description">
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
are supported.</dd><dt class="dt-description"><tt><b>-unsafe</b></tt></dt><dd class="dd-description">
See the corresponding option for <tt>ocamlc</tt>, chapter&nbsp;<a href="manual022.html#c:camlc">8</a>.
Turn bound checking off on array and string accesses (the <tt>v.(i)</tt> and
<tt>s.[i]</tt> constructs). Programs compiled with <tt>-unsafe</tt> are therefore
slightly faster, but unsafe: anything can happen if the program
accesses an array or string outside of its bounds.</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><b><tt>-w</tt> <i>warning-list</i></b></dt><dd class="dd-description">
Enable or disable warnings according to the argument <i>warning-list</i>.
See section&nbsp;<a href="manual022.html#s:comp-options">8.2</a> for the syntax of the argument.</dd><dt class="dt-description"><b><tt>-warn-error</tt> <i>warning-list</i></b></dt><dd class="dd-description">
Treat as errors the warnings enabled by the argument <i>warning-list</i>.
See section&nbsp;<a href="manual022.html#s:comp-options">8.2</a> for the syntax of the argument.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><blockquote class="quote"><font color="purple">Unix:</font>&nbsp;&nbsp;
The following environment variables are also consulted:
<dl class="description"><dt class="dt-description">
<b><tt>LC_CTYPE</tt></b></dt><dd class="dd-description"> If set to <tt>iso_8859_1</tt>, accented characters (from the
ISO Latin-1 character set) in string and character literals are
printed as is; otherwise, they are printed as decimal escape sequences
(<tt>\</tt><i>ddd</i>).</dd><dt class="dt-description"><tt><b>TERM</b></tt></dt><dd class="dd-description"> When printing error messages, the toplevel system
attempts to underline visually the location of the error. It
consults the <tt>TERM</tt> variable to determines the type of output terminal
and look up its capabilities in the terminal database.</dd><dt class="dt-description"><tt><b>HOME</b></tt></dt><dd class="dd-description"> Directory where the <tt>.ocamlinit</tt> file is searched.
</dd></dl>
</blockquote><h2 class="section"><a name="toc91"></a><a name="htoc122">2</a>&nbsp;&nbsp;Toplevel directives</h2><p>
<a name="s:toplevel-directives"></a></p><p>The following directives control the toplevel behavior, load files in
memory, and trace program execution.</p><p><b>Note:</b> all directives start with a <tt>#</tt> (sharp) symbol. This <tt>#</tt>
must be typed before the directive, and must not be confused with the
<tt>#</tt> prompt displayed by the interactive loop. For instance,
typing <tt>#quit;;</tt> will exit the toplevel loop, but typing <tt>quit;;</tt>
will result in an “unbound value <tt>quit</tt>” error.</p><dl class="description"><dt class="dt-description"><tt><b>#quit;;</b></tt></dt><dd class="dd-description">
Exit the toplevel loop and terminate the <tt>ocaml</tt> command.</dd><dt class="dt-description"><b><tt>#labels </tt><i>bool</i><tt>;;</tt></b></dt><dd class="dd-description">
Ignore labels in function types if argument is <tt>false</tt>, or switch back
to default behaviour (commuting style) if argument is <tt>true</tt>.</dd><dt class="dt-description"><b><tt>#warnings "</tt><i>warning-list</i><tt>";;</tt></b></dt><dd class="dd-description">
Enable or disable warnings according to the argument.</dd><dt class="dt-description"><b><tt>#directory "</tt><i>dir-name</i><tt>";;</tt></b></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
source and compiled files.</dd><dt class="dt-description"><b><tt>#cd "</tt><i>dir-name</i><tt>";;</tt></b></dt><dd class="dd-description">
Change the current working directory.</dd><dt class="dt-description"><b><tt>#load "</tt><i>file-name</i><tt>";;</tt></b></dt><dd class="dd-description">
Load in memory a bytecode object file (<tt>.cmo</tt> file) or library file
(<tt>.cma</tt> file) produced by the batch compiler <tt>ocamlc</tt>.</dd><dt class="dt-description"><b><tt>#load_rec "</tt><i>file-name</i><tt>";;</tt></b></dt><dd class="dd-description">
Load in memory a bytecode object file (<tt>.cmo</tt> file) or library file
(<tt>.cma</tt> file) produced by the batch compiler <tt>ocamlc</tt>.
When loading an object file that depends on other modules
which have not been loaded yet, the .cmo files for these modules
are searched and loaded as well, recursively. The loading order
is not specified.</dd><dt class="dt-description"><b><tt>#use "</tt><i>file-name</i><tt>";;</tt></b></dt><dd class="dd-description">
Read, compile and execute source phrases from the given file.
This is textual inclusion: phrases are processed just as if
they were typed on standard input. The reading of the file stops at
the first error encountered.</dd><dt class="dt-description"><b><tt>#install_printer </tt><i>printer-name</i><tt>;;</tt></b></dt><dd class="dd-description">
This directive registers the function named <i>printer-name</i> (a
value path) as a printer for values whose types match the argument
type of the function. That is, the toplevel loop will call
<i>printer-name</i> when it has such a value to print.<p>The printing function <i>printer-name</i> should have type
<font color="blue"><tt>Format.formatter</tt> <tt>-&gt;</tt> <font color="maroon"><i>t</i></font> <tt>-&gt;</tt> <tt>unit</tt></font>, where <font color="maroon"><i>t</i></font> is the
type for the values to be printed, and should output its textual
representation for the value of type <font color="maroon"><i>t</i></font> on the given formatter,
using the functions provided by the <tt>Format</tt> library. For backward
compatibility, <i>printer-name</i> can also have type
<font color="maroon"><i>t</i></font> <font color="blue"><tt>-&gt;</tt> <tt>unit</tt></font> and should then output on the standard
formatter, but this usage is deprecated.</p></dd><dt class="dt-description"><b><tt>#remove_printer </tt><i>printer-name</i><tt>;;</tt></b></dt><dd class="dd-description">
Remove the named function from the table of toplevel printers.</dd><dt class="dt-description"><b><tt>#trace </tt><i>function-name</i><tt>;;</tt></b></dt><dd class="dd-description">
After executing this directive, all calls to the function named
<i>function-name</i> will be “traced”. That is, the argument and the
result are displayed for each call, as well as the exceptions escaping
out of the function, raised either by the function itself or by
another function it calls. If the function is curried, each argument
is printed as it is passed to the function.</dd><dt class="dt-description"><b><tt>#untrace </tt><i>function-name</i><tt>;;</tt></b></dt><dd class="dd-description">
Stop tracing the given function.</dd><dt class="dt-description"><b><tt>#untrace_all;;</tt></b></dt><dd class="dd-description">
Stop tracing all functions traced so far.</dd><dt class="dt-description"><b><tt>#print_depth </tt><i>n</i><tt>;;</tt></b></dt><dd class="dd-description">
Limit the printing of values to a maximal depth of <i>n</i>.
The parts of values whose depth exceeds <i>n</i> are printed as <tt>...</tt>
(ellipsis).</dd><dt class="dt-description"><b><tt>#print_length </tt><i>n</i><tt>;;</tt></b></dt><dd class="dd-description">
Limit the number of value nodes printed to at most <i>n</i>.
Remaining parts of values are printed as <tt>...</tt> (ellipsis).</dd></dl><h2 class="section"><a name="toc92"></a><a name="htoc123">3</a>&nbsp;&nbsp;The toplevel and the module system</h2><p> <a name="s:toplevel-modules"></a></p><p>Toplevel phrases can refer to identifiers defined in compilation units
with the same mechanisms as for separately compiled units: either by
using qualified names (<tt>Modulename.localname</tt>), or by using
the <tt>open</tt> construct and unqualified names (see section&nbsp;<a href="manual011.html#s:names">6.3</a>).</p><p>However, before referencing another compilation unit, an
implementation of that unit must be present in memory.
At start-up, the toplevel system contains implementations for all the
modules in the the standard library. Implementations for user modules
can be entered with the <tt>#load</tt> directive described above. Referencing
a unit for which no implementation has been provided
results in the error <tt>Reference to undefined global `...'</tt>.</p><p>Note that entering <tt>open </tt><i>Mod</i> merely accesses the compiled
interface (<tt>.cmi</tt> file) for <i>Mod</i>, but does not load the
implementation of <i>Mod</i>, and does not cause any error if no
implementation of <i>Mod</i> has been loaded. The error
“reference to undefined global <i>Mod</i>” will occur only when
executing a value or module definition that refers to <i>Mod</i>.</p><h2 class="section"><a name="toc93"></a><a name="htoc124">4</a>&nbsp;&nbsp;Common errors</h2><p>This section describes and explains the most frequently encountered
error messages.</p><dl class="description"><dt class="dt-description"><b>Cannot find file <i>filename</i></b></dt><dd class="dd-description">
The named file could not be found in the current directory, nor in the
directories of the search path.<p>If <i>filename</i> has the format <i>mod</i><tt>.cmi</tt>, this
means you have referenced the compilation unit <i>mod</i>, but its
compiled interface could not be found. Fix: compile <i>mod</i><tt>.mli</tt> or
<i>mod</i><tt>.ml</tt> first, to create the compiled interface <i>mod</i><tt>.cmi</tt>.</p><p>If <i>filename</i> has the format <i>mod</i><tt>.cmo</tt>, this
means you are trying to load with <tt>#load</tt> a bytecode object file that
does not exist yet. Fix: compile <i>mod</i><tt>.ml</tt> first.</p><p>If your program spans several directories, this error can also appear
because you haven’t specified the directories to look into. Fix: use
the <tt>#directory</tt> directive to add the correct directories to the
search path.</p></dd><dt class="dt-description"><b>This expression has type <i>t</i><sub>1</sub>, but is used with type <i>t</i><sub>2</sub></b></dt><dd class="dd-description">
See section&nbsp;<a href="manual022.html#s:comp-errors">8.4</a>.</dd><dt class="dt-description"><b>Reference to undefined global <i>mod</i></b></dt><dd class="dd-description">
You have neglected to load in memory an implementation for a module
with <tt>#load</tt>. See section&nbsp;<a href="#s:toplevel-modules">9.3</a> above.</dd></dl><h2 class="section"><a name="toc94"></a><a name="htoc125">5</a>&nbsp;&nbsp;Building custom toplevel systems: <tt>ocamlmktop</tt></h2><p>The <tt>ocamlmktop</tt> command builds OCaml toplevels that
contain user code preloaded at start-up.</p><p>The <tt>ocamlmktop</tt> command takes as argument a set of <tt>.cmo</tt> and <tt>.cma</tt>
files, and links them with the object files that implement the OCaml toplevel.
The typical use is:
</p><pre>        ocamlmktop -o mytoplevel foo.cmo bar.cmo gee.cmo
</pre><p>This creates the bytecode file <tt>mytoplevel</tt>, containing the OCaml toplevel
system, plus the code from the three <tt>.cmo</tt>
files. This toplevel is directly executable and is started by:
</p><pre>        ./mytoplevel
</pre><p>This enters a regular toplevel loop, except that the code from
<tt>foo.cmo</tt>, <tt>bar.cmo</tt> and <tt>gee.cmo</tt> is already loaded in memory, just as
if you had typed:
</p><pre>        #load "foo.cmo";;
        #load "bar.cmo";;
        #load "gee.cmo";;
</pre><p>on entrance to the toplevel. The modules <tt>Foo</tt>, <tt>Bar</tt> and <tt>Gee</tt> are
not opened, though; you still have to do
</p><pre>        open Foo;;
</pre><p>yourself, if this is what you wish.</p><h2 class="section"><a name="toc95"></a><a name="htoc126">6</a>&nbsp;&nbsp;Options</h2><p>The following command-line options are recognized by <tt>ocamlmktop</tt>.</p><dl class="description"><dt class="dt-description"><b><tt>-cclib</tt> <i>libname</i></b></dt><dd class="dd-description">
Pass the <tt>-l</tt><i>libname</i> option to the C linker when linking in
“custom runtime” mode. See the corresponding option for
<tt>ocamlc</tt>, in chapter&nbsp;<a href="manual022.html#c:camlc">8</a>.</dd><dt class="dt-description"><b><tt>-ccopt</tt> <i>option</i></b></dt><dd class="dd-description">
Pass the given option to the C compiler and linker, when linking in
“custom runtime” mode. See the corresponding option for
<tt>ocamlc</tt>, in chapter&nbsp;<a href="manual022.html#c:camlc">8</a>.</dd><dt class="dt-description"><tt><b>-custom</b></tt></dt><dd class="dd-description">
Link in “custom runtime” mode. See the corresponding option for
<tt>ocamlc</tt>, in chapter&nbsp;<a href="manual022.html#c:camlc">8</a>.</dd><dt class="dt-description"><b><tt>-I</tt> <i>directory</i></b></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
compiled object code files (<tt>.cmo</tt> and <tt>.cma</tt>).</dd><dt class="dt-description"><b><tt>-o</tt> <i>exec-file</i></b></dt><dd class="dd-description">
Specify the name of the toplevel file produced by the linker.
The default is <tt>a.out</tt>.</dd></dl><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>