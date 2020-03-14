<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li class="active"><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc216"><span>Chapter 18</span></a>&nbsp;&nbsp;The ocamlbuild compilation manager</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The ocamlbuild compilation manager</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#toc137">Features of <tt>ocamlbuild</tt></a>
</li><li><a href="#toc138">Limitations</a>
</li><li><a href="#toc139">Using <tt>ocamlbuild</tt></a>
</li><li><a href="#toc140">Appendix: Motivations</a>
</li><li><a href="#toc141">Appendix: Summary of default rules</a>
</li></ul></nav></header>
<p> <a name="c:ocamlbuild"></a>
</p><p></p><p><br>
<br>
</p><p><tt>ocamlbuild</tt> is a tool automating the compilation of most OCaml projects with minimal
user input. Its use is not restricted to projects having a simple structure –
the extra effort needed to make it work with the more complex projects is in
reasonable proportion with their added complexity. In practice, one will use a
set of small text files, and, if needed, an OCaml compilation module that can
fine-tune the behaviour and define custom rules.</p><h2 class="section"><a name="toc137"></a><a name="htoc217">1</a>&nbsp;&nbsp;Features of <tt>ocamlbuild</tt></h2><p>
<em>This section is intended to read like a sales brochure or a datasheet.</em></p><ul class="itemize"><li class="li-itemize">
Built-in compilation rules for OCaml projects handle all the nasty cases:
native and byte-code, missing <tt>.mli</tt> files, preprocessor rules,
libraries, package (-pack) debugging and profiling flags, C stubs.
</li><li class="li-itemize">Plugin mechanism for writing compilation rules and actions in a real programming language,
OCaml itself.
</li><li class="li-itemize">Automatic inference of dependencies.
</li><li class="li-itemize">Correct handling of dynamically discovered dependencies.
</li><li class="li-itemize">Object files and other temporary files are created in a specific directory, leaving your main directory uncluttered.
</li><li class="li-itemize">Sanity checks ensure that object files are where they are supposed to be: in the build directory.
</li><li class="li-itemize">Regular projects are built using a single command with no extra files.
</li><li class="li-itemize">Parallel compilation to speed up things on multi-core systems.
</li><li class="li-itemize">Sophisticated display mode to keep your screen free of boring and repetitive compilation message
while giving you important progress information in a glimpse, and correctly multiplexing the error messages.
</li><li class="li-itemize">Tags and flags provide a concise and convenient mechanism for automatic selection of compilation, preprocessing and
other options.
</li><li class="li-itemize">Extended shell-like glob patterns, that can be combined using boolean operators,
allow you to concisely define the tags that apply to a given file.
</li><li class="li-itemize">Mechanisms for defining the mutual visibility of subdirectories.
</li><li class="li-itemize">Cache mechanism avoiding unnecessary compilations where reasonably computable.
</li></ul><h2 class="section"><a name="toc138"></a><a name="htoc218">2</a>&nbsp;&nbsp;Limitations</h2><p>
<em>Not perfect nor complete yet, but already pretty damn useful.</em></p><p>We were not expecting to write the ultimate compilation tool in a few man-months, however we believe we have
a tool that solves many compilation problems, especially our own, in a satisfactory way. Hence there are a
lot of missing features, incomplete options and hideous bugs lurking in <tt>ocamlbuild</tt>, and we hope that the OCaml community
will find our first try at <tt>ocamlbuild</tt> useful and hopefully help it grow into a tool that satisfies most needs of most users
by providing feedback, bug reports and patches.</p><p>The plugin API maybe somewhat lacking in maturity, as it has only been tested
by a few people. We believe a good API can only evolve under pressure from
many peers and the courage to rewrite things cleanly when time is ripe by the
developers. Most of the important functions a user will need are encapsulated
in the plugin API, which is the <tt>Ocamlbuild_plugin</tt> module pack. We
intend to keep that API backwards compatible. It may happen that intricate
projects need features not available in that module – you may then use
functions or values directly from the core <tt>ocamlbuild</tt> modules. We ask you to report
such usage to the authors so that we may make the necessary changes to the API;
you may also want to isolate calls to the non-API parts of the <tt>ocamlbuild</tt> library
from the rest of your plugin to be able to keep the later when incompatible
changes arise.</p><p>The way that <tt>ocamlbuild</tt> handles the command-line options, the <tt>_tags</tt> file,
the target names, names of the tags, and so on, are not expected to change in
incompatible ways. We intend to keep a project that compiles without a plugin
compilable without modifications in the future.
</p><h2 class="section"><a name="toc139"></a><a name="htoc219">3</a>&nbsp;&nbsp;Using <tt>ocamlbuild</tt></h2><p>
<em>Learn how to use <tt>ocamlbuild</tt> with short, specific, straight-to-the-point examples.</em></p><p>The amount of time and effort spent on the compilation process of a project
should be proportionate to that spent on the project itself. It should be easy
to set up a small project, maybe a little harder for a medium-sized project,
and it may take some more time, but not too much, for a big project. Ideally
setting up a big project would be as easy as setting up a small project. However,
as projects grow, modularization techniques start to be used, and the probability
of using meta programming or multiple programming languages increases, thus making
the compilation process more delicate.</p><p><tt>ocamlbuild</tt> is intended to be very easy to use for projects, large or small, with a simple
compilation process: typing
<tt>ocamlbuild foo.native</tt> should be enough to compile the native version
of a program whose top module is <tt>foo.ml</tt> and whose dependencies are in
the same directory. As your project gets more complex, you will gradually
start to use command-line options to specify libraries to link with, then
configuration files, ultimately culminating in a custom OCaml plugin for
complex projects with arbitrary dependencies and actions.</p><h3 class="subsection"><a name="htoc220">18.3.1</a>&nbsp;&nbsp;Hygiene &amp; where is my code ?</h3><p>
Your code is in the <tt>_build</tt> directory, but <tt>ocamlbuild</tt> automatically creates
a symbolic link to the executables it produces in the current directory.
<tt>ocamlbuild</tt> copies the source files and compiles them in a separate directory
which is <tt>_build</tt> by default.</p><p>For <tt>ocamlbuild</tt>, any file that is not in the build directory is a source file.
It is not unreasonable to think that some users may have bought binary object files
they keep in their project directory. Usually binary files cluttering the project
directory are due to previous builds using other systems. <tt>ocamlbuild</tt> has so-called
“hygiene” rules that state that object files (<tt>.cmo</tt>, <tt>.cmi</tt>,
or <tt>.o</tt> files, for instance) must not appear outside of the build
directory. These rules are enforced at startup; any violations will be reported
and <tt>ocamlbuild</tt> will exit. You must then remove these files by hand or run, with caution,
the script <tt>sanitize.sh</tt>, which is generated in your source directory.
This script will contain commands to remove them for you.</p><p>To disable these checks, you can use the <tt>-no-hygiene</tt> flag. If you have
files that must elude the hygiene squad, just tag them with <tt>precious</tt>
or <tt>not_hygienic</tt>.
</p><h3 class="subsection"><a name="htoc221">18.3.2</a>&nbsp;&nbsp;Hello, world !</h3><p>
Assuming we are in a directory named <tt>example1</tt> containing one file <tt>hello.ml</tt>
whose contents are
</p><pre>let _ =
  Printf.printf "Hello, %s ! My name is %s\n"
    (if Array.length Sys.argv &gt; 1 then Sys.argv.(1) else "stranger")
    Sys.argv.(0)
;;
</pre><p>we can compile and link it into a native executable by invoking <tt>ocamlbuild hello.native</tt>.
Here, <tt>hello</tt> is the basename of the top-level module and <tt>native</tt> is an extension used
by <tt>ocamlbuild</tt> to denote native code executables.
</p><pre>% ls
hello.ml
% ocamlbuild hello.native
Finished, 4 targets (0 cached) in 00:00:00.
% ls -l
total 12
drwxrwx— 2 linus gallium 4096 2007-01-17 16:24 _build/
-rw-rw—- 1 linus gallium   43 2007-01-17 16:23 hello.ml
lrwxrwxrwx 1 linus gallium   19 2007-01-17 16:24 hello.native -&gt; _build/hello.native*
</pre><p>What’s this funny <tt>_build</tt> directory ? Well that’s where <tt>ocamlbuild</tt> does its dirty work
of compiling. You usually won’t have to look very often into this directory. Source files are copied
into <tt>_build</tt> and this is where the compilers will be run. Various cache files are also stored
there. Its contents may look like this:
</p><pre>% ls -l _build
total 208
-rw-rw—- 1 linus gallium    337 2007-01-17 16:24 _digests
-rw-rw—- 1 linus gallium    191 2007-01-17 16:24 hello.cmi
-rw-rw—- 1 linus gallium    262 2007-01-17 16:24 hello.cmo
-rw-rw—- 1 linus gallium    225 2007-01-17 16:24 hello.cmx
-rw-rw—- 1 linus gallium     43 2007-01-17 16:23 hello.ml
-rw-rw—- 1 linus gallium     17 2007-01-17 16:24 hello.ml.depends
-rwxrwx— 1 linus gallium 173528 2007-01-17 16:24 hello.native*
-rw-rw—- 1 linus gallium    936 2007-01-17 16:24 hello.o
-rw-rw—- 1 linus gallium     22 2007-01-17 16:24 ocamlc.where
</pre><h3 class="subsection"><a name="htoc222">18.3.3</a>&nbsp;&nbsp;Executing my code</h3><p>
You can execute your code the old-fashioned way (<tt>./hello.native</tt>).
You may also type
</p><pre>ocamlbuild hello.native – Caesar
</pre><p>and it will compile and then run <tt>hello.native</tt> with the arguments following <tt>--</tt>,
which should display:
</p><pre>% ocamlbuild hello.native – Caesar
Finished, 4 targets (0 cached) in 00:00:00.
Hello, Caesar ! My name is _build/hello.native
</pre><h3 class="subsection"><a name="htoc223">18.3.4</a>&nbsp;&nbsp;The log file, verbosity and debugging</h3><p>
By default, if you run <tt>ocamlbuild</tt> on a terminal, it will use some ANSI escape sequences
to display a nice, one-line progress indicator. To see what commands <tt>ocamlbuild</tt> has actually run,
you can check the contents of the <tt>_build/_log</tt> file. To change the name of the
log file or to disable logging, use the <tt>-log &lt;file&gt;</tt> or <tt>-no-log</tt> options.
Note that the log file is truncated at each execution of <tt>ocamlbuild</tt>.</p><p>The log file contains all the external commands that <tt>ocamlbuild</tt> ran or intended to
run along with the target name and the computed tags. With the
<tt>-verbose &lt;level&gt;</tt> option, <tt>ocamlbuild</tt> will also write more or less useful
debugging information; a verbosity level of 1 (which can also be specified
using the <tt>-verbose</tt> switch) prints generally useful information; higher
levels produce much more output.
</p><h3 class="subsection"><a name="htoc224">18.3.5</a>&nbsp;&nbsp;Cleaning</h3><p>
<tt>ocamlbuild</tt> may leave a <tt>_build</tt> directory and symbolic links to executables in
that directory (unless when using -no-links). All of these can be removed safely
by hand, or by invoking <tt>ocamlbuild</tt> with the <tt>-clean</tt> flag.
</p><h3 class="subsection"><a name="htoc225">18.3.6</a>&nbsp;&nbsp;Where and how to run <tt>ocamlbuild</tt>?</h3><p>
An important point is that <tt>ocamlbuild</tt> must be invoked from the root of the project,
even if this project has multiple, nested subdirectories. This is because <tt>ocamlbuild</tt> likes to store the object files in a single <tt>_build</tt> directory. You
can change the name of that directory with the <tt>-build-dir</tt> option.</p><p><tt>ocamlbuild</tt> can be either invoked manually from the UNIX or Windows shell, or
automatically from a build script or a Makefile. Unless run with the
<tt>-no-hygiene</tt> option, there is the possibility that <tt>ocamlbuild</tt> will prompt the
user for a response. By default, on UNIX systems, if <tt>ocamlbuild</tt> senses that the
standard output is a terminal, it will use a nice progress indicator using ANSI
codes, instrumenting the output of the processes it spawns to have a consistent
display. Under non-UNIX systems, or if the standard output is not a terminal,
it will run in classic mode where it will echo the executed commands on its
standard output. This selection can be overridden with the <tt>-classic-display</tt> option.
</p><h3 class="subsection"><a name="htoc226">18.3.7</a>&nbsp;&nbsp;Dependencies</h3><p>
<em>Dependencies are automatically discovered.</em></p><p>Most of the value of <tt>ocamlbuild</tt> lies in the fact that it often needs no extra
information to compile a project besides the name of the top-level module.
<tt>ocamlbuild</tt> calls <tt>ocamldep</tt> to automatically find the dependencies of any
modules it wants to compile. These dependencies are dynamically incorporated
in the dependency graph, something <tt>make</tt> cannot do.
For instance, let’s add a module <tt>Greet</tt> that implements various ways of
greeting people.
</p><pre>% cat greet.ml
type how = Nicely | Badly;;

let greet how who =
  match how with Nicely -&gt; Printf.printf "Hello, %s !\n" who
               | Badly  -&gt; Printf.printf "Oh, here is that %s again.\n" who
;;
% cat hello.ml
open Greet

let _ =
  let name =
    if Array.length Sys.argv &gt; 1 then
      Sys.argv.(1)
    else
      "stranger"
  in
  greet
    (if name = "Caesar" then Nicely else Badly)
    name;
  Printf.printf "My name is %s\n" Sys.argv.(0)
;;
</pre><p>Then the module <tt>Hello</tt> depends on the module <tt>Greet</tt> and <tt>ocamlbuild</tt> can
figure this out for himself – we still only have to invoke <tt>ocamlbuild hello.native</tt>. Needless to say, this works for any number of modules.
</p><h3 class="subsection"><a name="htoc227">18.3.8</a>&nbsp;&nbsp;Native and byte-code</h3><p>
If we want to compile byte-code instead of native, we just a target name of
<tt>hello.byte</tt> instead of <tt>hello.native</tt>, i.e., we type
<tt>ocamlbuild hello.byte</tt>.
</p><h3 class="subsection"><a name="htoc228">18.3.9</a>&nbsp;&nbsp;Compile flags</h3><p>
To pass a flag to the compiler, such as the <tt>-rectypes</tt> option,
use the <tt>-cflag</tt> option as in:
</p><pre>ocamlbuild -cflag -rectypes hello.native
</pre><p>You can put multiple <tt>-cflag</tt> options, they will be passed to the compiler
in the same order. You can also give them in a comma-separated list with the
<tt>-cflags</tt> option (notice the plural):
</p><pre>ocamlbuild -cflags -I,+lablgtk,-rectypes hello.native
</pre><p>These flags apply when compiling, that is, when producing <tt>.cmi</tt>,
<tt>.cmo</tt>,<tt>.cmx</tt> and <tt>.o</tt> files from <tt>.ml</tt> or
<tt>.mli</tt> files.
</p><h3 class="subsection"><a name="htoc229">18.3.10</a>&nbsp;&nbsp;Link flags</h3><p>
Link flags apply when the various object files are collected and linked into
one executable. These will typically be include directories for libraries.
They are given using the <tt>-lflag</tt> and <tt>-lflags</tt> options, which
work in the same way as the <tt>-cflag</tt> and <tt>-cflags</tt> options.
</p><h3 class="subsection"><a name="htoc230">18.3.11</a>&nbsp;&nbsp;Linking with external libraries</h3><p>
In our third example, we use one Unix system call and functions from the <tt>num</tt>
library:
</p><pre>% cat epoch.ml
let _ =
  let s = Num.num_of_string (Printf.sprintf "%.0f" (Unix.gettimeofday ())) in
  let ps = Num.mult_num (Num.num_of_string "1000000000000") s in
  Printf.printf "%s picoseconds have passed since January 1st, 1970.\n"
    (Num.string_of_num ps)
;;
</pre><p>This requires linking with the <tt>unix</tt> and <tt>num</tt> modules, which is accomplished
by using the <tt>-lib unix</tt> and <tt>-lib num</tt> flags, or, alternatively, <tt>-libs unix,num</tt>:
</p><pre>% ocamlbuild -libs nums,unix epoch.native –
Finished, 4 targets (4 cached) in 00:00:00.
1169051647000000000000 picoseconds have passed since January 1st, 1970.
</pre><p>You may need to add options such as <tt>-cflags -I,/usr/local/lib/ocaml/</tt>
and <tt>-lflags -I,/usr/local/lib/ocaml/</tt> if the libraries you wish to
link with are not in OCaml’s default search path.
</p><h3 class="subsection"><a name="htoc231">18.3.12</a>&nbsp;&nbsp;The <tt>_tags</tt> files</h3><p>
Finer control over the compiler flags applied to each source file, such as
preprocessing, debugging, profiling and linking options, can be gained using
<tt>ocamlbuild</tt>’s tagging mechanism.</p><p>Every source file has a set of tags which tells <tt>ocamlbuild</tt> what kind of file it is
and what to do with it. A tag is simply a string, usually lowercase, for
example <tt>ocaml</tt> or <tt>native</tt>. The set of tags attached to a file
is computed by applying the tagging rules to the filename. Tagging rules are
defined in <tt>_tags</tt> files in any parent directory of a file, up to the main
project directory.</p><p>Each line in the <tt>_tags</tt> file is made of a glob pattern (see subsection
<a href="#subsec:glob">18.3.13</a>) and a list of tags. More than one rule can apply to a file
and rules are applied in the order in which they appear in a file.
By preceding a tag with a minus sign, one may remove tags from one or more files.</p><h4 class="subsubsection">Example: the built-in <tt>_tags</tt> file</h4><pre>     &lt;**/*.ml&gt; or &lt;**/*.mli&gt; or &lt;**/*.mlpack&gt; or &lt;**/*.ml.depends&gt;: ocaml
     &lt;**/*.byte&gt;: ocaml, byte, program
     &lt;**/*.odoc&gt;: ocaml, doc
     &lt;**/*.native&gt;: ocaml, native, program
     &lt;**/*.cma&gt;: ocaml, byte, library
     &lt;**/*.cmxa&gt;: ocaml, native, library
     &lt;**/*.cmo&gt;: ocaml, byte
     &lt;**/*.cmi&gt;: ocaml, byte, native
     &lt;**/*.cmx&gt;: ocaml, native
</pre><p>
Two special tags made from the path name of the file relative to the toplevel
of the project are automatically defined for each file. For a file
<tt>foo/bar.ml</tt> those tags will be <tt>file:foo/bar.ml</tt>, and
<tt>extension:ml</tt>.</p><p>If you do not have subdirectories, you can put <tt>*.ml</tt> instead of
<tt>**/*.ml</tt>.
</p><h3 class="subsection"><a name="htoc232">18.3.13</a>&nbsp;&nbsp;Glob patterns and expressions</h3><p>
<a name="subsec:glob"></a>
Glob patterns have a syntax similar to those used by UNIX shells to select path
names (like <tt>foo_*.ba?</tt>). They are used in <tt>ocamlbuild</tt> to define the files
and directories to which tags apply. Glob expressions are glob patterns
enclosed in brackets <tt>&lt;</tt> and <tt>&gt;</tt> combined using the standard
boolean operators <tt>and</tt>, <tt>or</tt>, <tt>not</tt>. This allows one to
describe sets of path names in more concise and more readable ways.</p><p>Please note that file and directory names are supposed to be made of the
following characters: <tt>a</tt>, …, <tt>z</tt>, <tt>A</tt>,
…, <tt>Z</tt>, <tt>0</tt>, …, <tt>9</tt>, <tt>_</tt>,
<tt>-</tt> and <tt>.</tt>. This is called the pathname alphabet <i>P</i>.</p><blockquote class="table"><div class="center"><hr width="80%" size="2"></div>
<div class="center">
<table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td valign="top" align="left"> <em>Formal syntax</em></td><td valign="top" align="left" nowrap=""> <em>Example</em></td><td valign="top" align="left"><em>Matches</em></td><td valign="top" align="left"><em>Does not match</em></td><td valign="top" align="left"> <em>Meaning (formal meaning)</em></td></tr>
<tr><td valign="top" align="left"><i>u</i> <br>
 A string of pathname characters</td><td valign="top" align="left" nowrap=""> <tt>foo.ml</tt></td><td valign="top" align="left"> <tt>foo.ml</tt></td><td valign="top" align="left"> <tt>fo.ml</tt>, <tt>bar/foo.ml</tt></td><td valign="top" align="left"> The exact string <i>u</i>
({ <i>u</i> }, where <i>u</i> ∈ <i>P</i><sup>*</sup>)</td></tr>
<tr><td valign="top" align="left"><tt>*</tt> <br>
 The wild-card star</td><td valign="top" align="left" nowrap=""> <tt>*</tt></td><td valign="top" align="left"> ε, <tt>foo</tt>, <tt>bar</tt></td><td valign="top" align="left"> <tt>foo/bar</tt>, <tt>/bar</tt></td><td valign="top" align="left"> Any string not containing a slash
(<i>P</i><sup>*</sup>)</td></tr>
<tr><td valign="top" align="left"><tt>?</tt> <br>
 The joker</td><td valign="top" align="left" nowrap=""> <tt>?</tt></td><td valign="top" align="left"> <tt>a</tt>, <tt>b</tt>, <tt>z</tt></td><td valign="top" align="left"> <tt>/</tt>, <tt>bar</tt></td><td valign="top" align="left"> Any one-letter string, excluding the slash</td></tr>
<tr><td valign="top" align="left"><tt>**/</tt> <br>
 The prefix inter-directory star</td><td valign="top" align="left" nowrap=""> <tt>**/foo.ml</tt></td><td valign="top" align="left"> <tt>foo.ml</tt>, <tt>bar/foo.ml</tt>, <tt>bar/baz/foo.ml</tt></td><td valign="top" align="left"> <tt>foo/bar</tt>, <tt>/bar</tt></td><td valign="top" align="left"> The empty string, or any string ending with a slash
(ε ∪ <i>P</i><sup>*</sup><tt>/</tt>)</td></tr>
<tr><td valign="top" align="left"><tt>/**</tt> <br>
 The suffix inter-directory star</td><td valign="top" align="left" nowrap=""> <tt>foo/**</tt></td><td valign="top" align="left"> <tt>foo</tt>, <tt>foo/bar</tt></td><td valign="top" align="left"> <tt>bar/foo</tt></td><td valign="top" align="left"> Any string starting with a slash, or the empty string
(ε ∪ <tt>/</tt><i>P</i><sup>*</sup>)</td></tr>
<tr><td valign="top" align="left"><tt>/**/</tt> <br>
 The infix inter-directory star</td><td valign="top" align="left" nowrap=""> <tt>bar/**/foo.ml</tt></td><td valign="top" align="left"> <tt>bar/foo.ml</tt>, <tt>bar/baz/foo.ml</tt></td><td valign="top" align="left"> <tt>foo.ml</tt></td><td valign="top" align="left"> Any string starting and ending with a slash
(ε ∪ <tt>/</tt><i>P</i><sup>*</sup><tt>/</tt>)</td></tr>
<tr><td valign="top" align="left"><tt>[</tt> <i>r</i><sub>1</sub> <i>r</i><sub>2</sub> ⋯ <i>r<sub>k</sub></i> <tt>]</tt>
where <i>r<sub>i</sub></i> is either <i>c</i> or <i>c</i><sub>1</sub>−<i>c</i><sub>2</sub> (1 ≤ <i>i</i> ≤ <i>k</i>)
<br>
 The positive character class</td><td valign="top" align="left" nowrap=""> <tt>[a-fA-F0-9_.]</tt></td><td valign="top" align="left"> <tt>3</tt>, <tt>F</tt>, <tt>.</tt></td><td valign="top" align="left"> <tt>z</tt>, <tt>bar</tt></td><td valign="top" align="left"> Any one-letter string made of characters from one of the ranges
<i>r<sub>i</sub></i> (1 ≤ <i>i</i> ≤ <i>n</i>).
(<font color="red"><i>L</i></font>(<i>r</i><sub>1</sub>) ∪ ⋯ ∪ <font color="red"><i>L</i></font>(<i>r<sub>n</sub></i>))</td></tr>
<tr><td valign="top" align="left"><tt>[^</tt><i>r</i><sub>1</sub> <i>r</i><sub>2</sub> ⋯ <i>r<sub>k</sub></i> <tt>]</tt>
where <i>r<sub>i</sub></i> is either <i>c</i> or <i>c</i><sub>1</sub>−<i>c</i><sub>2</sub> (1 ≤ <i>i</i> ≤ <i>k</i>)
<br>
 The negative character class</td><td valign="top" align="left" nowrap=""> <tt>[^a-fA-F0-9_.]</tt></td><td valign="top" align="left"> <tt>z</tt>, <tt>bar</tt></td><td valign="top" align="left"> <tt>3</tt>, <tt>F</tt>, <tt>.</tt></td><td valign="top" align="left"> Any one-letter string NOT made of characters from one of the ranges
<i>r<sub>i</sub></i> (1 ≤ <i>i</i> ≤ <i>n</i>).
(Σ<sup>*</sup> ∖ (<font color="red"><i>L</i></font>(<i>r</i><sub>1</sub>) ∪ ⋯ ∪ <font color="red"><i>L</i></font>(<i>r<sub>n</sub></i>)))</td></tr>
<tr><td valign="top" align="left"><i>p</i><sub>1</sub> <i>p</i><sub>2</sub> <br>
 A concatenation of patterns</td><td valign="top" align="left" nowrap=""> <tt>foo*</tt></td><td valign="top" align="left"> <tt>foo</tt>, <tt>foob</tt>, <tt>foobar</tt></td><td valign="top" align="left"> <tt>fo</tt>, <tt>bar</tt></td><td valign="top" align="left"> Any string with a prefix matching <i>p</i><sub>1</sub> and the corresponding suffix
matching <i>p</i><sub>2</sub>,
({ <i>uv</i> ∣ <i>u</i> ∈ <font color="red"><i>L</i></font>(<i>p</i><sub>1</sub>), <i>v</i> ∈ <font color="red"><i>L</i></font>(<i>p</i><sub>2</sub>) })</td></tr>
<tr><td valign="top" align="left"><tt>{</tt> <i>p</i><sub>1</sub> <tt>,</tt> <i>p</i><sub>2</sub> <tt>,</tt> ⋯ <tt>,</tt> <i>p<sub>k</sub></i> <tt>}</tt> <br>
 A union of patterns</td><td valign="top" align="left" nowrap=""> <tt>toto.{ml,mli}</tt></td><td valign="top" align="left"> <tt>toto.ml</tt>, <tt>toto.mli</tt></td><td valign="top" align="left"> <tt>toto.</tt></td><td valign="top" align="left"> Any string matching one of the patterns <i>p<sub>i</sub></i> for 1 ≤ <i>i</i> ≤ <i>k</i>.
(<font color="red"><i>L</i></font>(<i>p</i><sub>1</sub>) ∪ ⋯ ∪ <font color="red"><i>L</i></font>(<i>p<sub>k</sub></i>))</td></tr>
</tbody></table>
</div>
<div class="caption"><table cellspacing="6" cellpadding="0"><tbody><tr><td valign="top" align="left">Table 18.1: 
Syntax and semantics of glob patterns.</td></tr>
</tbody></table></div>
<div class="center"><hr width="80%" size="2"></div></blockquote><blockquote class="table"><div class="center"><hr width="80%" size="2"></div>
<div class="center">
<table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td valign="top" align="left"> <em>Formal syntax</em></td><td valign="top" align="left" nowrap=""> <em>Example</em></td><td valign="top" align="left"> <em>Meaning (formal meaning)</em></td></tr>
<tr><td valign="top" align="left"> <tt>&lt;</tt><i>p</i><tt>&gt;</tt></td><td valign="top" align="left" nowrap=""> <tt>&lt;foo.ml&gt;</tt></td><td valign="top" align="left"> Pathnames matching the pattern <i>p</i></td></tr>
<tr><td valign="top" align="left"> <i>e</i><sub>1</sub> &nbsp; <i><tt>or</tt></i> &nbsp; <i>e</i><sub>2</sub></td><td valign="top" align="left" nowrap=""> <tt>&lt;*.ml&gt; or &lt;foo/bar.ml&gt;</tt></td><td valign="top" align="left"> Pathnames matching at least one of the expressions <i>e</i><sub>1</sub> and <i>e</i><sub>2</sub></td></tr>
<tr><td valign="top" align="left"> <i>e</i><sub>1</sub> &nbsp; <i><tt>and</tt></i> &nbsp; <i>e</i><sub>2</sub></td><td valign="top" align="left" nowrap=""> <tt>&lt;*.ml&gt; and &lt;foo_*&gt;</tt></td><td valign="top" align="left"> Pathnames matching both expressions <i>e</i><sub>1</sub> and <i>e</i><sub>2</sub></td></tr>
<tr><td valign="top" align="left"> <i><tt>not</tt></i> &nbsp; <i>e</i></td><td valign="top" align="left" nowrap=""> <tt>not &lt;*.mli&gt;</tt></td><td valign="top" align="left"> Pathnames not matching the expression <i>e</i></td></tr>
<tr><td valign="top" align="left"> <i><tt>true</tt></i></td><td valign="top" align="left" nowrap=""> <tt>true</tt></td><td valign="top" align="left"> All pathnames</td></tr>
<tr><td valign="top" align="left"> <i><tt>false</tt></i></td><td valign="top" align="left" nowrap=""> <tt>false</tt></td><td valign="top" align="left"> No pathnames</td></tr>
</tbody></table>
</div>
<div class="caption"><table cellspacing="6" cellpadding="0"><tbody><tr><td valign="top" align="left">Table 18.2: 
Syntax and semantics of glob expressions.</td></tr>
</tbody></table></div>
<div class="center"><hr width="80%" size="2"></div></blockquote><h3 class="subsection"><a name="htoc233">18.3.14</a>&nbsp;&nbsp;Subdirectories</h3><p>
If the files of your project are held in one or more subdirectories,
<tt>ocamlbuild</tt> must be made aware of that fact using the <tt>-I</tt> or <tt>-Is</tt> options
or by adding an <tt>include</tt> tag. For instance, assume your project is made
of three subdirectories, <tt>foo</tt>, <tt>bar</tt> and <tt>baz</tt> containing
various <tt>.ml</tt> files, the main file being <tt>foo/main.ml</tt>. Then you can
either type:
</p><pre>% ocamlbuild -Is foo,bar,baz foo/main.native
</pre><p>or add the following line in the <tt>_tags</tt> file
</p><pre>&lt;foo&gt; or &lt;bar&gt; or &lt;baz&gt;: include
</pre><p>and call
</p><pre>% ocamlbuild foo/main.native
</pre><p>
There are then two cases. If no other modules named <tt>Bar</tt> or
<tt>Baz</tt> exist elsewhere in the project, then you are done. Just use
<tt>Foo</tt>, <tt>Foo.Bar</tt> and <tt>Foo.Baz</tt> in your code.
Otherwise, you will need to use the plugin mechanism and define the mutual
visibility of the subdirectories using the <tt>Pathname.define_context</tt>
function.</p><h4 class="subsubsection">Note on subdirectory traversal</h4><p>
<tt>ocamlbuild</tt> used to traverse by default any subdirectory not explicitly excluded.
This is no longer the case. Note that you can still have a fine grained
control using your <tt>_tags</tt> file and the <tt>traverse</tt> tag.</p><p>There is no longer the <tt>true: traverse</tt> tag declaration by default. To
make <tt>ocamlbuild</tt> recursive use one of these:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
Give the <tt>-r</tt> flag to ocamlbuild.
</li><li class="li-enumerate">Have a <tt>_tags</tt> or myocamlbuild.ml file in your top directory.
</li></ol><h3 class="subsection"><a name="htoc234">18.3.15</a>&nbsp;&nbsp;Grouping targets with <tt>.itarget</tt></h3><p>
You can create a file named <tt>foo.itarget</tt> containing
a list of targets, one per line, such as
</p><pre>main.native
main.byte
stuff.docdir/index.html
</pre><p>Requesting the target <tt>foo.otarget</tt> will then build every target
listed in the file <tt>foo.itarget</tt>. Blank lines and lines starting
with a sharp (<tt>#</tt>) are ignored.
</p><h3 class="subsection"><a name="htoc235">18.3.16</a>&nbsp;&nbsp;Packing subdirectories into modules</h3><p>
OCaml’s <tt>-pack</tt> option allows you to structure the contents of a
module in a subdirectory. For instance, assume you have a directory
<tt>foo</tt> containing two modules <tt>bar.ml</tt> and <tt>baz.ml</tt>.
You want from these to build a module <tt>Foo</tt> containing <tt>Bar</tt>
and <tt>Baz</tt> as submodules. In the case where no modules named
<tt>Bar</tt> or <tt>Baz</tt> exist outside of <tt>Foo</tt>, to do this you
must write a file <tt>foo.mlpack</tt>, preferably sitting in the same
directory as the directory <tt>Foo</tt> and containing the list of modules
(one per line) it must contain:
</p><pre>Bar
Baz
</pre><p>Then when you will request for building <tt>foo.cmo</tt> the package will be
made from <tt>bar.cmo</tt> and <tt>baz.cmo</tt>.
</p><h3 class="subsection"><a name="htoc236">18.3.17</a>&nbsp;&nbsp;Making an OCaml library</h3><p>
In a similar way than for packaged modules you can make a library by putting
it’s contents in a file (with the mllib extension). For instance, assume you
have a two modules <tt>bar.ml</tt> and <tt>baz.ml</tt>. You want from these to
build a library <tt>foo.cmx?a</tt> containing <tt>Bar</tt> and <tt>Baz</tt>
modules. To do this you must write a file <tt>foo.mllib</tt> containing the
list of modules (one per line) it must contain:
</p><pre>Bar
Baz
</pre><p>Then when you will request for building <tt>foo.cma</tt> the library will be
made from <tt>bar.cmo</tt> and <tt>baz.cmo</tt>.
</p><h3 class="subsection"><a name="htoc237">18.3.18</a>&nbsp;&nbsp;Making an OCaml toplevel</h3><p>
Making a toplevel is almost the same thing than making a packaged module or a
library. Just write a file with the <tt>mltop</tt> extension (like
<tt>foo.mltop</tt>) and request for building the toplevel using the
<tt>top</tt> extension (<tt>foo.top</tt> in this example).
</p><h3 class="subsection"><a name="htoc238">18.3.19</a>&nbsp;&nbsp;Preprocessor options and tags</h3><p>
You can specify preprocessor options with <tt>-pp</tt> followed by the
preprocessor string, for instance <tt>ocamlbuild -pp camlp4o.opt -unsafe</tt>
would run your sources through CamlP4 with the <tt>-unsafe</tt> option.
Another way is to use the tags file.
</p><div class="center">
<table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td align="left" nowrap=""> <b>Tag</b></td><td align="left" nowrap=""><b>Preprocessor command</b></td><td align="left" nowrap=""><b>Remark</b></td></tr>
<tr><td align="left" nowrap=""> <tt>pp(cmd...)</tt></td><td align="left" nowrap=""><tt>cmd...</tt></td><td align="left" nowrap="">Arbitrary
preprocessor command<sup><a name="text3" href="#note3">1</a></sup></td></tr>
<tr><td align="left" nowrap=""> <tt>camlp4o</tt></td><td align="left" nowrap=""><tt>camlp4o</tt></td><td align="left" nowrap="">Original OCaml syntax</td></tr>
<tr><td align="left" nowrap=""> <tt>camlp4r</tt></td><td align="left" nowrap=""><tt>camlp4r</tt></td><td align="left" nowrap="">Revised OCaml syntax</td></tr>
<tr><td align="left" nowrap=""> <tt>camlp4of</tt></td><td align="left" nowrap=""><tt>camlp4of</tt></td><td align="left" nowrap="">Original OCaml syntax with extensions</td></tr>
<tr><td align="left" nowrap=""> <tt>camlp4rf</tt></td><td align="left" nowrap=""><tt>camlp4rf</tt></td><td align="left" nowrap="">Revised OCaml syntax with extensions</td></tr>
</tbody></table>
</div><h3 class="subsection"><a name="htoc239">18.3.20</a>&nbsp;&nbsp;Debugging byte code and profiling native code</h3><p>
The preferred way of compiling code suitable for debugging with <tt>ocamldebug</tt> or
profiling native code with <tt>ocamlprof</tt> is to use the appropriate target
extensions, <tt>.d.byte</tt> for debugging or <tt>.p.native</tt>.</p><p>Another way is to add use the <tt>debug</tt> or <tt>profile</tt> tags.
Note that these tags must be applied at the compilation and linking stages.
Hence you must either use <tt>-tag debug</tt> or <tt>-tag profile</tt>
on the command line, or add a
</p><pre>true: debug
</pre><p>line to your <tt>_tags</tt> file.
Please note that the byte-code profiler works in a wholly different way
and is not supported by <tt>ocamlbuild</tt>.
</p><h3 class="subsection"><a name="htoc240">18.3.21</a>&nbsp;&nbsp;Generating documentation using <tt>ocamldoc</tt></h3><p>
Write the names of the modules whose interfaces will be documented in a file
whose extension is <tt>.odocl</tt>, for example <tt>foo.odocl</tt>, then invoke
<tt>ocamlbuild</tt> on the target <tt>foo.docdir/index.html</tt>. This will collect all the
documentation from the interfaces (which will be build, if necessary) using
<tt>ocamldoc</tt> and generate a set of HTML files under the directory
<tt>foo.docdir/</tt>, which is actually a link to <tt>_build/foo.docdir/</tt>.
As for packing subdirectories into modules, the module names must be written
one per line, without extensions and correctly capitalized. Note that
generating documentation in formats other than HTML or from implementations is
not supported.
</p><h3 class="subsection"><a name="htoc241">18.3.22</a>&nbsp;&nbsp;The display line</h3><p>
Provided <tt>ocamlbuild</tt> runs in a terminal under a POSIX environment, it will
display a sophisticated progress-indicator line that graciously interacts
with the output of subcommands. This line looks like this:
</p><pre>00:00:02 210  (180 ) main.cmx                             ONbp–il /
</pre><p>Here, 00:00:02 is the elapsed time in hour:minute:second format since <tt>ocamlbuild</tt> has
been invoked; 210 is the number of external commands, typically calls to the
compiler or the like, that may or may not have been invoked; 180 is the number
of external commands that have not been invoked since their result is already
in the build directory; <tt>main.cmx</tt> is the name of the last target built;
<tt>ONbp--il</tt> is a short string that describes the tags that have been
encountered and the slash at the end is a frame from a rotating ticker. Hence,
the display line has the following structure:
</p><pre>HH:MM:SS JOBS (CACHED) PATHNAME                           TAGS TICKER
</pre><p>
The tag string is made of 8 indicators which each monitor a tag. These tags
are <tt>ocaml</tt>, <tt>native</tt>, <tt>byte</tt>, <tt>program</tt>,
<tt>pp</tt>, <tt>debug</tt>, <tt>interf</tt> and <tt>link</tt>. Initially,
each indicator displays a dash <tt>-</tt>. If the current target has the
monitored tag, then the indicator displays the corresponding character
(see table <a href="#tab:tag-chars">18.3</a>) in uppercase. Otherwise, it displays that
character in lowercase. This allows you to see the set of tags that have
been applied to files in your project during the current invocation of <tt>ocamlbuild</tt>.</p><p>Hence the tag string <tt>ONbp--il</tt> means that the current target
<tt>main.cmx</tt> has the tags <tt>ocaml</tt> and <tt>native</tt>, and that
the tags <tt>ocaml</tt>, <tt>native</tt>, <tt>byte</tt>, <tt>program</tt>,
<tt>interf</tt> and <tt>link</tt> have already been seen.</p><blockquote class="table"><div class="center"><hr width="80%" size="2"></div>
<div class="center">
<table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td align="left" nowrap=""> <b>Tag</b></td><td align="center" nowrap=""><b>Display character</b></td></tr>
<tr><td align="left" nowrap=""> ocaml</td><td align="center" nowrap="">O</td></tr>
<tr><td align="left" nowrap=""> native</td><td align="center" nowrap="">N</td></tr>
<tr><td align="left" nowrap=""> byte</td><td align="center" nowrap="">B</td></tr>
<tr><td align="left" nowrap=""> program</td><td align="center" nowrap="">P</td></tr>
<tr><td align="left" nowrap=""> pp</td><td align="center" nowrap="">R</td></tr>
<tr><td align="left" nowrap=""> debug</td><td align="center" nowrap="">D</td></tr>
<tr><td align="left" nowrap=""> interf</td><td align="center" nowrap="">I</td></tr>
<tr><td align="left" nowrap=""> link</td><td align="center" nowrap="">L</td></tr>
</tbody></table>
</div>
<div class="caption"><table cellspacing="6" cellpadding="0"><tbody><tr><td valign="top" align="left">Table 18.3: <a name="tab:tag-chars"></a> Relation between the characters displayed in
the tag string and the tags.</td></tr>
</tbody></table></div>
<div class="center"><hr width="80%" size="2"></div></blockquote><h3 class="subsection"><a name="htoc242">18.3.23</a>&nbsp;&nbsp;<tt>ocamllex</tt>, <tt>ocamlyacc</tt> and <tt>menhir</tt></h3><p>
<tt>ocamlbuild</tt> knows how to run the standard lexer and parser generator tools
<tt>ocamllex</tt> and <tt>ocamlyacc</tt> when your files have the
standard <tt>.mll</tt> and <tt>.mly</tt> extensions. If you want to
use <tt>menhir</tt> instead of <tt>ocamlyacc</tt>, you can either
launch <tt>ocamlbuild</tt> with the <tt>-use-menhir</tt> option or add a
</p><pre>true: use_menhir
</pre><p>line to your <tt>_tags</tt> file. Note that there is currently no way
of using <tt>menhir</tt> and <tt>ocamlyacc</tt> in the same execution
of <tt>ocamlbuild</tt>.
</p><h3 class="subsection"><a name="htoc243">18.3.24</a>&nbsp;&nbsp;Changing the compilers or tools</h3><p>
As <tt>ocamlbuild</tt> is part of your OCaml distribution, it knows if it can call the
native compilers and tools (<tt>ocamlc.opt</tt>, <tt>ocamlopt.opt</tt>...)
or not. However you may want <tt>ocamlbuild</tt> to use another <tt>ocaml</tt> compiler
for different reasons (such as cross-compiling or using a wrapper such as
<tt>ocamlfind</tt>). Here is the list of relevant options:
</p><ul class="itemize"><li class="li-itemize">
<tt>-ocamlc &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamlopt &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamldep &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamlyacc &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-menhir &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamllex &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamlmktop &lt;command&gt;</tt>
</li><li class="li-itemize"><tt>-ocamlrun &lt;command&gt;</tt>
</li></ul><h3 class="subsection"><a name="htoc244">18.3.25</a>&nbsp;&nbsp;Interaction with version control systems</h3><p>
Here are tips for configuring your version control system to ignore the files
and directories generated by <tt>ocamlbuild</tt>.</p><p>The directory <tt>_build</tt> and any symbolic links
pointing into <tt>_build</tt> should be ignored.
To do this, you must add the following ignore patterns to your version
control system’s ignore set:
</p><pre>_build
*.native
*.byte
*.d.native
*.p.byte
</pre><p>
For CVS, add the above lines to the <tt>.cvsignore</tt> file.
For Subversion (SVN), type <tt>svn propedit svn:ignore .</tt> and add the
above lines.
</p><h3 class="subsection"><a name="htoc245">18.3.26</a>&nbsp;&nbsp;A shell script for driving it all?</h3><p>
<em>To shell or to make ?</em>
Traditionally, makefiles have two major functions. The first one
is the dependency-ordering, rule-matching logic used for compiling.
The second one is as a dispatcher for various actions defined using
phony targets with shell script actions. These actions include cleaning,
cleaning really well, archiving, uploading and so on. Their characteristic
is that they rely little or not on the building process – they either need
the building to have been completed, or they don’t need anything.
As <tt>/bin/sh</tt> scripts have been here for three to four decades and are
not going anywhere, why not replace that functionality of makefiles with a
shell script ? We have thought of three bad reasons:
</p><ul class="itemize"><li class="li-itemize">
Typing <tt>make</tt> to compile is now an automatism,
</li><li class="li-itemize">We need to share variable definitions between rules and actions,
</li><li class="li-itemize">Escaping already way too special-character-sensitive shell code with
invisible tabs and backslashes is a dangerously fun game.
</li></ul><p>
We also have bad reasons for not using an OCaml script to drive everything:
</p><ul class="itemize"><li class="li-itemize">
<tt>Sys.command</tt> calls the <tt>/bin/sh</tt> anyway,
</li><li class="li-itemize">Shell scripts can execute partial commands or commands with badly formed arguments.
</li><li class="li-itemize">Shell scripts are more concise for expressing... shell scripts.
</li></ul><p>
Anyway you are of course free to use a makefile or an OCaml script to call ocamlbuild.
Here is an example shell driver script:
</p><pre>#!/bin/sh

set -e

TARGET=epoch
FLAGS="-libs unix,nums"
OCAMLBUILD=ocamlbuild

ocb()
{
  $OCAMLBUILD $FLAGS $*
}

rule() {
  case $1 in
    clean)  ocb -clean;;
    native) ocb $TARGET.native;;
    byte)   ocb $TARGET.byte;;
    all)    ocb $TARGET.native $TARGET.byte;;
    depend) echo "Not needed.";;
    *)      echo "Unknown action $1";;
  esac;
}

if [ $# -eq 0 ]; then
  rule all
else
  while [ $# -gt 0 ]; do
    rule $1;
    shift
  done
fi
</pre><h2 class="section"><a name="toc140"></a><a name="htoc246">4</a>&nbsp;&nbsp;Appendix: Motivations</h2><p>
<em>This inflammatory appendix describes the frustration that led us to write <tt>ocamlbuild</tt>.</em></p><p>Many people have painfully found that the utilities of the <tt>make</tt>
family, namely GNU Make, BSD Make, and their derivatives, fail to scale to
large projects, especially when using multi-stage compilation rules, such as
custom pre-processors, unless dependencies are hand-defined. But as your
project gets larger, more modular, and uses more diverse pre-processing tools,
it becomes increasingly difficult to correctly define dependencies by hand.
Hence people tend to use language-specific tools that attempt to extract
dependencies. However another problem then appears: <tt>make</tt> was designed
with the idea of a static dependency graph. Dependency extracting tools,
however, are typically run by a rule in <tt>make</tt> itself; this means that
make has to reload the dependency information. This is the origin of the
<tt>make clean; make depend; make</tt> mantra. This approach tends to work
quite well as long as all the files sit in a single directory and there is only
one stage of pre-processing. If there are two or more stages, then dependency
extracting tools must be run two or more times - and this means multiple
invocations of <tt>make</tt>. Also, if one distributes the modules of a large
project into multiple subdirectories, it becomes difficult to distribute the
makefiles themselves, because the language of <tt>make</tt> was not conceived
to be modular; the only two mechanisms permitted, inclusion of makefile
fragments, and invocation of other make instances, must be skillfully
coordinated with phony target names (<tt>depend1, depend2...</tt>) to insure
inclusion of generated dependencies with multi-stage programming; changes in
the structure of the project must be reflected by hand and the order of
variable definitions must be well-thought ahead to avoid long afternoons spent
combinatorially fiddling makefiles until it works but no one understands why.</p><p>These problems become especially apparent with OCaml: to ensure type safety and
to allow a small amount of cross-unit optimization when compiling native code,
interface and object files include cryptographical digests of interfaces they
are to be linked with. This means that linking is safer, but that makefile sloppiness
leads to messages such as:
</p><pre>Files foo.cmo and bar.cmo
make inconsistent assumptions over interface Bar
</pre><p>
The typical reaction is then to issue the mantra <tt>make clean; make
depend; make</tt> and everything compiles just fine... from the beginning. Hence
on medium projects, the programmer often has to wait for minutes instead of the
few seconds that would be taken if <tt>make</tt> could correctly guess the
small number of files that really had to be recompiled.</p><p>It is not surprising that hacking a build tool such as <tt>make</tt> to include
a programming language while retaining the original syntax and semantics gives
an improvised and cumbersome macro language of dubious expressive power. For
example, using GNU make, suppose you have a list of <tt>.ml</tt>s that you want
to convert into a list including both <tt>.cmo</tt>s and <tt>.cmi</tt>s, that
is you want to transform <tt>a.ml b.ml c.ml</tt> into <tt>a.cmi a.cmo b.cmi
b.cmo c.cmi c.cmo</tt> while preserving the dependency order which must be hand
specified for linking <sup><a name="text4" href="#note4">2</a></sup>.
Unfortunately <tt>$patsubst %.ml, %.cmi %.cmo, a.ml b.ml c.ml</tt> won’t
work since the %-sign in the right-hand of a <tt>patsubst</tt> gets
substituted only once. You then have to delve into something that is hardly
lambda calculus: an intricate network of <tt>foreach</tt>, <tt>eval</tt>,
<tt>call</tt> and <tt>define</tt>s may get you the job done, unless you chicken
out and opt for an external <tt>awk</tt>, <tt>sed</tt> or <tt>perl</tt> call.
People who at this point have not lost their temper or sanity usually resort to
metaprogramming by writing Makefile generators using a mixture of shell and m4.
One such an attempt gave something that is the nightmare of wannabe package
maintainers: it’s called <tt>autotools</tt>.</p><p>Note that it is also difficult to write <tt>Makefiles</tt> to build object
files in a separate directory. It is not impossible since the language of
<tt>make</tt> is Turing-complete, a proof of which is left as an exercise.
Note that building things in a separate directory is not necessarily a young
enthusiast’s way of giving a different look and feel to his projects – it may
be a good way of telling the computer that <tt>foo.mli</tt> is generated by
<tt>ocamlyacc</tt> using <tt>foo.mly</tt> and can thus be removed.
</p><h2 class="section"><a name="toc141"></a><a name="htoc247">5</a>&nbsp;&nbsp;Appendix: Summary of default rules</h2><p>
The contents of this table give a summary of the most important default rules.
To get the most accurate and up-to-date information, launch <tt>ocamlbuild</tt> with the
<tt>-documentation</tt> option.
</p><div class="center">
<table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td valign="top" align="left" nowrap=""> <b>Tags</b></td><td valign="top" align="left" nowrap=""><b>Dependencies</b></td><td valign="top" align="left"><b>Targets</b></td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.itarget</td><td valign="top" align="left">%.otarget</td></tr>
<tr><td valign="top" align="left" nowrap=""> ocaml</td><td valign="top" align="left" nowrap="">%.mli %.mli.depends</td><td valign="top" align="left">%.cmi</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, debug, ocaml</td><td valign="top" align="left" nowrap="">%.mlpack %.cmi</td><td valign="top" align="left">%.d.cmo</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, ocaml</td><td valign="top" align="left" nowrap="">%.mlpack</td><td valign="top" align="left">%.cmo %.cmi</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, ocaml</td><td valign="top" align="left" nowrap="">%.mli %.ml %.ml.depends %.cmi</td><td valign="top" align="left">%.d.cmo</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, ocaml</td><td valign="top" align="left" nowrap="">%.mli %.ml %.ml.depends %.cmi</td><td valign="top" align="left">%.cmo</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml, profile</td><td valign="top" align="left" nowrap="">%.mlpack %.cmi</td><td valign="top" align="left">%.p.cmx %.p.o</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml</td><td valign="top" align="left" nowrap="">%.mlpack %.cmi</td><td valign="top" align="left">%.cmx %.o</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml, profile</td><td valign="top" align="left" nowrap="">%.ml %.ml.depends %.cmi</td><td valign="top" align="left">%.p.cmx %.p.o</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml</td><td valign="top" align="left" nowrap="">%.ml %.ml.depends %.cmi</td><td valign="top" align="left">%.cmx %.o</td></tr>
<tr><td valign="top" align="left" nowrap=""> debug, ocaml</td><td valign="top" align="left" nowrap="">%.ml %.ml.depends %.cmi</td><td valign="top" align="left">%.d.cmo</td></tr>
<tr><td valign="top" align="left" nowrap=""> ocaml</td><td valign="top" align="left" nowrap="">%.ml %.ml.depends</td><td valign="top" align="left">%.cmo %.cmi</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, debug, ocaml, program</td><td valign="top" align="left" nowrap="">%.d.cmo</td><td valign="top" align="left">%.d.byte</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, ocaml, program</td><td valign="top" align="left" nowrap="">%.cmo</td><td valign="top" align="left">%.byte</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml, profile, program</td><td valign="top" align="left" nowrap="">%.p.cmx %.p.o</td><td valign="top" align="left">%.p.native</td></tr>
<tr><td valign="top" align="left" nowrap=""> native, ocaml, program</td><td valign="top" align="left" nowrap="">%.cmx %.o</td><td valign="top" align="left">%.native</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, debug, library, ocaml</td><td valign="top" align="left" nowrap="">%.mllib</td><td valign="top" align="left">%.d.cma</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, library, ocaml</td><td valign="top" align="left" nowrap="">%.mllib</td><td valign="top" align="left">%.cma</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, debug, library, ocaml</td><td valign="top" align="left" nowrap="">%.d.cmo</td><td valign="top" align="left">%.d.cma</td></tr>
<tr><td valign="top" align="left" nowrap=""> byte, library, ocaml</td><td valign="top" align="left" nowrap="">%.cmo</td><td valign="top" align="left">%.cma</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">lib%(libname).clib</td><td valign="top" align="left">lib%(libname).a dll%(libname).so</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%(path)/lib%(libname).clib</td><td valign="top" align="left">%(path)/lib%(libname).a %(path)/dll%(libname).so</td></tr>
<tr><td valign="top" align="left" nowrap=""> library, native, ocaml, profile</td><td valign="top" align="left" nowrap="">%.mllib</td><td valign="top" align="left">%.p.cmxa %.p.a</td></tr>
<tr><td valign="top" align="left" nowrap=""> library, native, ocaml</td><td valign="top" align="left" nowrap="">%.mllib</td><td valign="top" align="left">%.cmxa %.a</td></tr>
<tr><td valign="top" align="left" nowrap=""> library, native, ocaml, profile</td><td valign="top" align="left" nowrap="">%.p.cmx %.p.o</td><td valign="top" align="left">%.p.cmxa %.p.a</td></tr>
<tr><td valign="top" align="left" nowrap=""> library, native, ocaml</td><td valign="top" align="left" nowrap="">%.cmx %.o</td><td valign="top" align="left">%.cmxa %.a</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.ml</td><td valign="top" align="left">%.ml.depends</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.mli</td><td valign="top" align="left">%.mli.depends</td></tr>
<tr><td valign="top" align="left" nowrap=""> ocaml</td><td valign="top" align="left" nowrap="">%.mll</td><td valign="top" align="left">%.ml</td></tr>
<tr><td valign="top" align="left" nowrap=""> doc, ocaml</td><td valign="top" align="left" nowrap="">%.mli %.mli.depends</td><td valign="top" align="left">%.odoc</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.odocl</td><td valign="top" align="left">%.docdir/index.html</td></tr>
<tr><td valign="top" align="left" nowrap=""> ocaml</td><td valign="top" align="left" nowrap="">%.mly</td><td valign="top" align="left">%.ml %.mli</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.c</td><td valign="top" align="left">%.o</td></tr>
<tr><td valign="top" align="left" nowrap="">&nbsp;</td><td valign="top" align="left" nowrap="">%.ml %.ml.depends</td><td valign="top" align="left">%.inferred.mli</td></tr>
</tbody></table>
</div><hr class="ffootnoterule"><dl class="thefootnotes"><dt class="dt-thefootnotes">
<a name="note3" href="#text3">1</a></dt><dd class="dd-thefootnotes">The command must not contain newlines or parentheses.
</dd><dt class="dt-thefootnotes"><a name="note4" href="#text4">2</a></dt><dd class="dd-thefootnotes">By the way, what’s the point of having a
declarative language if <tt>make</tt> can’t sort the dependencies in
topological order for giving them to <tt>gcc</tt> or whatever ?
</dd></dl>
<hr>





<i class="authors">(Chapter written by Berke Durak and Nicolas Pouillard)</i><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>