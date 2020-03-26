<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="manual022.html">Batch compilation (ocamlc)</a></li><li><a href="manual023.html">The toplevel system (ocaml)</a></li><li><a href="manual024.html">The runtime system (ocamlrun)</a></li><li><a href="manual025.html">Native-code compilation (ocamlopt)</a></li><li><a href="manual026.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="manual027.html">Dependency generator (ocamldep)</a></li><li><a href="manual028.html">The browser/editor (ocamlbrowser)</a></li><li class="active"><a href="manual029.html">The documentation generator (ocamldoc)</a></li><li><a href="manual030.html">The debugger (ocamldebug)</a></li><li><a href="manual031.html">Profiling (ocamlprof)</a></li><li><a href="manual032.html">The ocamlbuild compilation manager</a></li><li><a href="manual033.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter"><a name="htoc167"><span>Chapter 15</span></a>&nbsp;&nbsp;The documentation generator (ocamldoc)</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The documentation generator (ocamldoc)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual029.html#toc119">Usage</a>
</li><li><a href="manual029.html#toc120">Syntax of documentation comments</a>
</li><li><a href="manual029.html#toc121">Custom generators</a>
</li><li><a href="manual029.html#toc122">Adding command line options</a>
</li></ul></nav></header>
<p> <a name="c:ocamldoc"></a>
</p><p>This chapter describes OCamldoc, a tool that generates documentation from
special comments embedded in source files. The comments used by OCamldoc
are of the form <tt>(**</tt>…<tt>*)</tt> and follow the format described
in section <a href="#s:ocamldoc-comments">15.2</a>.</p><p>OCamldoc can produce documentation in various formats: HTML, L<sup>A</sup>T<sub>E</sub>X,
TeXinfo, Unix man pages, and <tt>dot</tt> dependency graphs. Moreover,
users can add their own custom generators, as explained in
section <a href="#s:ocamldoc-custom-generators">15.3</a>.</p><p>In this chapter, we use the word <em>element</em> to refer to any of the
following parts of an OCaml source file: a type declaration, a value,
a module, an exception, a module type, a type constructor, a record
field, a class, a class type, a class method, a class value or a class
inheritance clause.</p><h2 class="section"><a name="toc119"></a><a name="htoc168">1</a>&nbsp;&nbsp;Usage</h2><p> <a name="s:ocamldoc-usage"></a></p><h3 class="subsection"><a name="htoc169">15.1.1</a>&nbsp;&nbsp;Invocation</h3><p>OCamldoc is invoked via the command <tt>ocamldoc</tt>, as follows:
</p><pre>        ocamldoc <i>options sourcefiles</i>
</pre><h4 class="subsubsection">Options for choosing the output format</h4><p>The following options determine the format for the generated
documentation.</p><dl class="description"><dt class="dt-description">
<tt><b>-html</b></tt></dt><dd class="dd-description">
Generate documentation in HTML default format. The generated HTML pages
are stored in the current directory, or in the directory specified
with the <tt><b>-d</b></tt> option. You can customize the style of the
generated pages by editing the generated <tt>style.css</tt> file, or by providing
your own style sheet using option <tt>-css-style</tt>.
The file <tt>style.css</tt> is not generated if it already exists.</dd><dt class="dt-description"><tt><b>-latex</b></tt></dt><dd class="dd-description">
Generate documentation in L<sup>A</sup>T<sub>E</sub>X default format. The generated
L<sup>A</sup>T<sub>E</sub>X document is saved in file <tt>ocamldoc.out</tt>, or in the file
specified with the <tt><b>-o</b></tt> option. The document uses the style file
<tt>ocamldoc.sty</tt>. This file is generated when using the <tt>-latex</tt> option,
if it does not already exist.
You can change this file to customize the style of your L<sup>A</sup>T<sub>E</sub>X documentation.</dd><dt class="dt-description"><tt><b>-texi</b></tt></dt><dd class="dd-description">
Generate documentation in TeXinfo default format. The generated
L<sup>A</sup>T<sub>E</sub>X document is saved in file <tt>ocamldoc.out</tt>, or in the file
specified with the <tt><b>-o</b></tt> option.</dd><dt class="dt-description"><tt><b>-man</b></tt></dt><dd class="dd-description">
Generate documentation as a set of Unix <tt>man</tt> pages. The generated pages
are stored in the current directory, or in the directory specified
with the <tt><b>-d</b></tt> option.</dd><dt class="dt-description"><tt><b>-dot</b></tt></dt><dd class="dd-description">
Generate a dependency graph for the toplevel modules, in a format suitable
for displaying and processing by <tt>dot</tt>. The <tt>dot</tt> tool is available from
<tt><a href="http://www.research.att.com/sw/tools/graphviz/">http://www.research.att.com/sw/tools/graphviz/</a></tt>.
The textual representation of the graph is written to the file
<tt>ocamldoc.out</tt>, or to the file specified with the <tt><b>-o</b></tt> option.
Use <tt>dot ocamldoc.out</tt> to display it.</dd><dt class="dt-description"><b><tt>-g</tt> <i>file.cm[o,a,xs]</i></b></dt><dd class="dd-description">
Dynamically load the given file, which defines a custom documentation
generator. See section <a href="#s:ocamldoc-compilation-and-usage">15.4.1</a>. This
option is supported by the <tt>ocamldoc</tt> command (to load <tt>.cmo</tt> and <tt>.cma</tt> files)
and by its native-code version <tt>ocamldoc.opt</tt> (to load <tt>.cmxs</tt> files).
If the given file is a simple one and does not exist in
the current directory, then ocamldoc looks for it in the custom
generators default directory, and in the directories specified with
optional <tt>-i</tt> options.</dd><dt class="dt-description"><tt><b>-customdir</b></tt></dt><dd class="dd-description">
Display the custom generators default directory.</dd><dt class="dt-description"><b><tt>-i</tt> <i>directory</i></b></dt><dd class="dd-description">
Add the given directory to the path where to look for custom generators.</dd></dl><h4 class="subsubsection">General options</h4><dl class="description"><dt class="dt-description"><b><tt>-d</tt> <i>dir</i></b></dt><dd class="dd-description">
Generate files in directory <i>dir</i>, rather than the current directory.</dd><dt class="dt-description"><b><tt>-dump</tt> <i>file</i></b></dt><dd class="dd-description">
Dump collected information into <i>file</i>. This information can be
read with the <tt>-load</tt> option in a subsequent invocation of <tt>ocamldoc</tt>.</dd><dt class="dt-description"><b><tt>-hide</tt> <i>modules</i></b></dt><dd class="dd-description">
Hide the given complete module names in the generated documentation.
<i>modules</i> is a list of complete module names separated
by ’<tt>,</tt>’, without blanks. For instance: <tt>Pervasives,M2.M3</tt>.</dd><dt class="dt-description"><tt><b>-inv-merge-ml-mli</b></tt></dt><dd class="dd-description">
Reverse the precedence of implementations and interfaces when merging.
All elements
in implementation files are kept, and the <tt><b>-m</b></tt> option
indicates which parts of the comments in interface files are merged
with the comments in implementation files.</dd><dt class="dt-description"><tt><b>-keep-code</b></tt></dt><dd class="dd-description">
Always keep the source code for values, methods and instance variables,
when available.
The source code is always kept when a <tt>.ml</tt>
file is given, but is by default discarded when a <tt>.mli</tt> is given.
This option keeps the source code in all cases.</dd><dt class="dt-description"><b><tt>-load</tt> <i>file</i></b></dt><dd class="dd-description">
Load information from <i>file</i>, which has been produced by
<tt>ocamldoc -dump</tt>. Several <tt>-load</tt> options can be given.</dd><dt class="dt-description"><b><tt>-m</tt> <i>flags</i></b></dt><dd class="dd-description">
Specify merge options between interfaces and implementations.
(see section <a href="#s:ocamldoc-merge">15.1.2</a> for details).
<i>flags</i> can be one or several of the following characters:
<dl class="description"><dt class="dt-description">
<tt><b>d</b></tt></dt><dd class="dd-description"> merge description
</dd><dt class="dt-description"><tt><b>a</b></tt></dt><dd class="dd-description"> merge <tt>@author</tt>
</dd><dt class="dt-description"><tt><b>v</b></tt></dt><dd class="dd-description"> merge <tt>@version</tt>
</dd><dt class="dt-description"><tt><b>l</b></tt></dt><dd class="dd-description"> merge <tt>@see</tt>
</dd><dt class="dt-description"><tt><b>s</b></tt></dt><dd class="dd-description"> merge <tt>@since</tt>
</dd><dt class="dt-description"><tt><b>b</b></tt></dt><dd class="dd-description"> merge <tt>@before</tt>
</dd><dt class="dt-description"><tt><b>o</b></tt></dt><dd class="dd-description"> merge <tt>@deprecated</tt>
</dd><dt class="dt-description"><tt><b>p</b></tt></dt><dd class="dd-description"> merge <tt>@param</tt>
</dd><dt class="dt-description"><tt><b>e</b></tt></dt><dd class="dd-description"> merge <tt>@raise</tt>
</dd><dt class="dt-description"><tt><b>r</b></tt></dt><dd class="dd-description"> merge <tt>@return</tt>
</dd><dt class="dt-description"><tt><b>A</b></tt></dt><dd class="dd-description"> merge everything
</dd></dl></dd><dt class="dt-description"><tt><b>-no-custom-tags</b></tt></dt><dd class="dd-description">
Do not allow custom @-tags (see section <a href="#s:ocamldoc-tags">15.2.5</a>).</dd><dt class="dt-description"><tt><b>-no-stop</b></tt></dt><dd class="dd-description">
Keep elements placed after/between the <tt>(**/**)</tt> special comment(s)
(see section <a href="#s:ocamldoc-comments">15.2</a>).</dd><dt class="dt-description"><b><tt>-o</tt> <i>file</i></b></dt><dd class="dd-description">
Output the generated documentation to <i>file</i> instead of <tt>ocamldoc.out</tt>.
This option is meaningful only in conjunction with the
<tt><b>-latex</b></tt>, <tt><b>-texi</b></tt>, or <tt><b>-dot</b></tt> options.</dd><dt class="dt-description"><b><tt>-pp</tt> <i>command</i></b></dt><dd class="dd-description">
Pipe sources through preprocessor <i>command</i>.</dd><dt class="dt-description"><b><tt>-impl</tt> <i>filename</i></b></dt><dd class="dd-description">
Process the file <i>filename</i> as an implementation file, even if its
extension is not <tt>.ml</tt>.</dd><dt class="dt-description"><b><tt>-intf</tt> <i>filename</i></b></dt><dd class="dd-description">
Process the file <i>filename</i> as an interface file, even if its
extension is not <tt>.mli</tt>.</dd><dt class="dt-description"><b><tt>-text</tt> <i>filename</i></b></dt><dd class="dd-description">
Process the file <i>filename</i> as a text file, even if its
extension is not <tt>.txt</tt>.</dd><dt class="dt-description"><tt><b>-sort</b></tt></dt><dd class="dd-description">
Sort the list of top-level modules before generating the documentation.</dd><dt class="dt-description"><tt><b>-stars</b></tt></dt><dd class="dd-description">
Remove blank characters until the first asterisk (’<tt>*</tt>’) in each
line of comments.</dd><dt class="dt-description"><b><tt>-t</tt> <i>title</i></b></dt><dd class="dd-description">
Use <i>title</i> as the title for the generated documentation.</dd><dt class="dt-description"><b><tt>-intro</tt> <i>file</i></b></dt><dd class="dd-description">
Use content of <i>file</i> as ocamldoc text to use as introduction (HTML,
L<sup>A</sup>T<sub>E</sub>X and TeXinfo only).
For HTML, the file is used to create the whole <tt>index.html</tt> file.</dd><dt class="dt-description"><tt><b>-v</b></tt></dt><dd class="dd-description">
Verbose mode. Display progress information.</dd><dt class="dt-description"><tt><b>-version</b></tt></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><tt><b>-vnum</b></tt></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><tt><b>-warn-error</b></tt></dt><dd class="dd-description">
Treat Ocamldoc warnings as errors.</dd><dt class="dt-description"><tt><b>-hide-warnings</b></tt></dt><dd class="dd-description">
Do not print OCamldoc warnings.</dd><dt class="dt-description"><b><tt>-help</tt> or <tt>--help</tt></b></dt><dd class="dd-description">
Display a short usage summary and exit.
</dd></dl><h4 class="subsubsection">Type-checking options</h4><p>OCamldoc calls the OCaml type-checker to obtain type
information. The following options impact the type-checking phase.
They have the same meaning as for the <tt>ocamlc</tt> and <tt>ocamlopt</tt> commands.</p><dl class="description"><dt class="dt-description"><b><tt>-I</tt> <i>directory</i></b></dt><dd class="dd-description">
Add <i>directory</i> to the list of directories search for compiled
interface files (<tt>.cmi</tt> files).</dd><dt class="dt-description"><tt><b>-nolabels</b></tt></dt><dd class="dd-description">
Ignore non-optional labels in types.</dd><dt class="dt-description"><tt><b>-rectypes</b></tt></dt><dd class="dd-description">
Allow arbitrary recursive types. (See the <tt>-rectypes</tt> option to <tt>ocamlc</tt>.)</dd></dl><h4 class="subsubsection">Options for generating HTML pages</h4><p>The following options apply in conjunction with the <tt>-html</tt> option:</p><dl class="description"><dt class="dt-description">
<tt><b>-all-params</b></tt></dt><dd class="dd-description">
Display the complete list of parameters for functions and methods.</dd><dt class="dt-description"><b><tt>-charset</tt> <i>charset</i></b></dt><dd class="dd-description">
Add information about character encoding being <i>charset</i>
(default is iso-8859-1).</dd><dt class="dt-description"><tt><b>-colorize-code</b></tt></dt><dd class="dd-description">
Colorize the OCaml code enclosed in <tt>[ ]</tt> and <tt>{[ ]}</tt>, using colors
to emphasize keywords, etc. If the code fragments are not
syntactically correct, no color is added.</dd><dt class="dt-description"><b><tt>-css-style</tt> <i>filename</i></b></dt><dd class="dd-description">
Use <i>filename</i> as the Cascading Style Sheet file.</dd><dt class="dt-description"><tt><b>-index-only</b></tt></dt><dd class="dd-description">
Generate only index files.</dd><dt class="dt-description"><tt><b>-short-functors</b></tt></dt><dd class="dd-description">
Use a short form to display functors:
<pre>module M : functor (A:Module) -&gt; functor (B:Module2) -&gt; sig .. end
</pre>
is displayed as:
<pre>module M (A:Module) (B:Module2) : sig .. end
</pre></dd></dl><h4 class="subsubsection">Options for generating L<sup>A</sup>T<sub>E</sub>X files</h4><p>The following options apply in conjunction with the <tt>-latex</tt> option:</p><dl class="description"><dt class="dt-description">
<b><tt>-latex-value-prefix</tt> <i>prefix</i></b></dt><dd class="dd-description">
Give a prefix to use for the labels of the values in the generated
L<sup>A</sup>T<sub>E</sub>X document.
The default prefix is the empty string. You can also use the options
<tt>-latex-type-prefix</tt>, <tt>-latex-exception-prefix</tt>,
<tt>-latex-module-prefix</tt>,
<tt>-latex-module-type-prefix</tt>, <tt>-latex-class-prefix</tt>,
<tt>-latex-class-type-prefix</tt>,
<tt>-latex-attribute-prefix</tt> and <tt>-latex-method-prefix</tt>.<p>These options are useful when you have, for example, a type and a value with
the same name. If you do not specify prefixes, L<sup>A</sup>T<sub>E</sub>X will complain about
multiply defined labels.</p></dd><dt class="dt-description"><b><tt>-latextitle</tt> <i>n,style</i></b></dt><dd class="dd-description">
Associate style number <i>n</i> to the given L<sup>A</sup>T<sub>E</sub>X sectioning command
<i>style</i>, e.g. <tt>section</tt> or <tt>subsection</tt>. (L<sup>A</sup>T<sub>E</sub>X only.) This is
useful when including the generated document in another L<sup>A</sup>T<sub>E</sub>X document,
at a given sectioning level. The default association is 1 for <tt>section</tt>,
2 for <tt>subsection</tt>, 3 for <tt>subsubsection</tt>, 4 for <tt>paragraph</tt> and 5 for
<tt>subparagraph</tt>.</dd><dt class="dt-description"><tt><b>-noheader</b></tt></dt><dd class="dd-description">
Suppress header in generated documentation.</dd><dt class="dt-description"><tt><b>-notoc</b></tt></dt><dd class="dd-description">
Do not generate a table of contents.</dd><dt class="dt-description"><tt><b>-notrailer</b></tt></dt><dd class="dd-description">
Suppress trailer in generated documentation.</dd><dt class="dt-description"><tt><b>-sepfiles</b></tt></dt><dd class="dd-description">
Generate one <tt>.tex</tt> file per toplevel module, instead of the global
<tt>ocamldoc.out</tt> file.
</dd></dl><h4 class="subsubsection">Options for generating TeXinfo files</h4><p>The following options apply in conjunction with the <tt>-texi</tt> option:</p><dl class="description"><dt class="dt-description">
<tt><b>-esc8</b></tt></dt><dd class="dd-description">
Escape accented characters in Info files.</dd><dt class="dt-description"><tt><b>-info-entry</b></tt></dt><dd class="dd-description">
Specify Info directory entry.</dd><dt class="dt-description"><tt><b>-info-section</b></tt></dt><dd class="dd-description">
Specify section of Info directory.</dd><dt class="dt-description"><tt><b>-noheader</b></tt></dt><dd class="dd-description">
Suppress header in generated documentation.</dd><dt class="dt-description"><tt><b>-noindex</b></tt></dt><dd class="dd-description">
Do not build index for Info files.</dd><dt class="dt-description"><tt><b>-notrailer</b></tt></dt><dd class="dd-description">
Suppress trailer in generated documentation.
</dd></dl><h4 class="subsubsection">Options for generating <tt>dot</tt> graphs</h4><p>The following options apply in conjunction with the <tt>-dot</tt> option:</p><dl class="description"><dt class="dt-description">
<b><tt>-dot-colors</tt> <i>colors</i></b></dt><dd class="dd-description">
Specify the colors to use in the generated <tt>dot</tt> code.
When generating module dependencies, <tt>ocamldoc</tt> uses different colors
for modules, depending on the directories in which they reside.
When generating types dependencies, <tt>ocamldoc</tt> uses different colors
for types, depending on the modules in which they are defined.
<i>colors</i> is a list of color names separated by ’<tt>,</tt>’, as
in <tt>Red,Blue,Green</tt>. The available colors are the ones supported by
the <tt>dot</tt> tool.</dd><dt class="dt-description"><tt><b>-dot-include-all</b></tt></dt><dd class="dd-description">
Include all modules in the <tt>dot</tt> output, not only modules given
on the command line or loaded with the <tt><b>-load</b></tt> option.</dd><dt class="dt-description"><tt><b>-dot-reduce</b></tt></dt><dd class="dd-description">
Perform a transitive reduction of the dependency graph before
outputting the <tt>dot</tt> code. This can be useful if there are
a lot of transitive dependencies that clutter the graph.</dd><dt class="dt-description"><tt><b>-dot-types</b></tt></dt><dd class="dd-description">
Output <tt>dot</tt> code describing the type dependency graph instead of
the module dependency graph.
</dd></dl><h4 class="subsubsection">Options for generating man files</h4><p>The following options apply in conjunction with the <tt>-man</tt> option:</p><dl class="description"><dt class="dt-description">
<tt><b>-man-mini</b></tt></dt><dd class="dd-description">
Generate man pages only for modules, module types, clases and class
types, instead of pages for all elements.</dd><dt class="dt-description"><b><tt>-man-suffix</tt> <i>suffix</i></b></dt><dd class="dd-description">
Set the suffix used for generated man filenames. Default is ’<tt>3o</tt>’,
as in <tt>List.3o</tt>.</dd><dt class="dt-description"><b><tt>-man-section</tt> <i>section</i></b></dt><dd class="dd-description">
Set the section number used for generated man filenames. Default is ’<tt>3</tt>’.</dd></dl><h3 class="subsection"><a name="htoc170">15.1.2</a>&nbsp;&nbsp;Merging of module information</h3><p>
<a name="s:ocamldoc-merge"></a></p><p>Information on a module can be extracted either from the <tt>.mli</tt> or <tt>.ml</tt>
file, or both, depending on the files given on the command line.
When both <tt>.mli</tt> and <tt>.ml</tt> files are given for the same module,
information extracted from these files is merged according to the
following rules:
</p><ul class="itemize"><li class="li-itemize">
Only elements (values, types, classes, ...) declared in the <tt>.mli</tt>
file are kept. In other terms, definitions from the <tt>.ml</tt> file that are
not exported in the <tt>.mli</tt> file are not documented.
</li><li class="li-itemize">Descriptions of elements and descriptions in @-tags are handled
as follows. If a description for the same element or in the same
@-tag of the same element is present in both files, then the
description of the <tt>.ml</tt> file is concatenated to the one in the <tt>.mli</tt> file,
if the corresponding <tt>-m</tt> flag is given on the command line.
If a description is present in the <tt>.ml</tt> file and not in the
<tt>.mli</tt> file, the <tt>.ml</tt> description is kept.
In either case, all the information given in the <tt>.mli</tt> file is kept.
</li></ul><h3 class="subsection"><a name="htoc171">15.1.3</a>&nbsp;&nbsp;Coding rules</h3><p>
<a name="s:ocamldoc-rules"></a>
The following rules must be respected in order to avoid name clashes
resulting in cross-reference errors:
</p><ul class="itemize"><li class="li-itemize">
In a module, there must not be two modules, two module types or
a module and a module type with the same name.
In the default HTML generator, modules <tt>ab</tt> and <tt>AB</tt> will be printed
to the same file on case insensitive file systems.
</li><li class="li-itemize">In a module, there must not be two classes, two class types or
a class and a class type with the same name.
</li><li class="li-itemize">In a module, there must not be two values, two types, or two
exceptions with the same name.
</li><li class="li-itemize">Values defined in tuple, as in <tt>let (x,y,z) = (1,2,3)</tt>
are not kept by OCamldoc.
</li><li class="li-itemize">Avoid the following construction:
<pre>open Foo (* which has a module Bar with a value x *)
module Foo =
  struct
    module Bar =
      struct
        let x = 1
      end
  end
  let dummy = Bar.x
</pre>In this case, OCamldoc will associate <tt>Bar.x</tt> to the <tt>x</tt> of module
<tt>Foo</tt> defined just above, instead of to the <tt>Bar.x</tt> defined in the
opened module <tt>Foo</tt>.
</li></ul><h2 class="section"><a name="toc120"></a><a name="htoc172">2</a>&nbsp;&nbsp;Syntax of documentation comments</h2><p>
<a name="s:ocamldoc-comments"></a></p><p>Comments containing documentation material are called <em>special
comments</em> and are written between <tt>(**</tt> and <tt>*)</tt>. Special comments
must start exactly with <tt>(**</tt>. Comments beginning with <tt>(</tt> and more
than two <tt>*</tt> are ignored.</p><h3 class="subsection"><a name="htoc173">15.2.1</a>&nbsp;&nbsp;Placement of documentation comments</h3><p>
OCamldoc can associate comments to some elements of the language
encountered in the source files. The association is made according to
the locations of comments with respect to the language elements. The
locations of comments in <tt>.mli</tt> and <tt>.ml</tt> files are different.</p><h4 class="subsubsection">Comments in <tt>.mli</tt> files</h4><p>
A special comment is associated to an element if it is placed before or
after the element.<br>
A special comment before an element is associated to this element if&nbsp;:
</p><ul class="itemize"><li class="li-itemize">
There is no blank line or another special comment between the special
comment and the element. However, a regular comment can occur between
the special comment and the element.
</li><li class="li-itemize">The special comment is not already associated to the previous element.
</li><li class="li-itemize">The special comment is not the first one of a toplevel module.
</li></ul><p>A special comment after an element is associated to this element if
there is no blank line or comment between the special comment and the
element.</p><p>There are two exceptions: for constructors and record fields in
type definitions, the associated comment can only be placed after the
constructor or field definition, without blank lines or other comments
between them. The special comment for a constructor
with another constructor following must be placed before the ’<tt>|</tt>’
character separating the two constructors.</p><p>The following sample interface file <tt>foo.mli</tt> illustrates the
placement rules for comments in <tt>.mli</tt> files.</p><pre>(** The first special comment of the file is the comment associated
    with the whole module.*)


(** Special comments can be placed between elements and are kept
    by the OCamldoc tool, but are not associated to any element.
    @-tags in these comments are ignored.*)

(*******************************************************************)
(** Comments like the one above, with more than two asterisks,
    are ignored. *)

(** The comment for function f. *)
val f : int -&gt; int -&gt; int
(** The continuation of the comment for function f. *)

(** Comment for exception My_exception, even with a simple comment
    between the special comment and the exception.*)
(* Hello, I'm a simple comment :-) *)
exception My_exception of (int -&gt; int) * int

(** Comment for type weather  *)
type weather =
| Rain of int (** The comment for construtor Rain *)
| Sun (** The comment for constructor Sun *)

(** Comment for type weather2  *)
type weather2 =
| Rain of int (** The comment for construtor Rain *)
| Sun (** The comment for constructor Sun *)
(** I can continue the comment for type weather2 here
  because there is already a comment associated to the last constructor.*)

(** The comment for type my_record *)
type my_record = {
    val foo : int ;    (** Comment for field foo *)
    val bar : string ; (** Comment for field bar *)
  }
  (** Continuation of comment for type my_record *)

(** Comment for foo *)
val foo : string
(** This comment is associated to foo and not to bar. *)
val bar : string
(** This comment is assciated to bar. *)

(** The comment for class my_class *)
class my_class :
  object
    (** A comment to describe inheritance from cl *)
    inherit cl

    (** The comment for attribute tutu *)
    val mutable tutu : string

    (** The comment for attribute toto. *)
    val toto : int

    (** This comment is not attached to titi since
        there is a blank line before titi, but is kept
        as a comment in the class. *)

    val titi : string

    (** Comment for method toto *)
    method toto : string

    (** Comment for method m *)
    method m : float -&gt; int
  end

(** The comment for the class type my_class_type *)
class type my_class_type =
  object
    (** The comment for variable x. *)
    val mutable x : int

    (** The commend for method m. *)
    method m : int -&gt; int
end

(** The comment for module Foo *)
module Foo =
  struct
    (** The comment for x *)
    val x : int

    (** A special comment that is kept but not associated to any element *)
  end

(** The comment for module type my_module_type. *)
module type my_module_type =
  sig
    (** The comment for value x. *)
    val x : int

    (** The comment for module M. *)
    module M =
      struct
        (** The comment for value y. *)
        val y : int

        (* ... *)
      end

  end

</pre><h4 class="subsubsection">Comments in <tt>.ml</tt> files</h4><p>A special comment is associated to an element if it is placed before
the element and there is no blank line between the comment and the
element. Meanwhile, there can be a simple comment between the special
comment and the element. There are two exceptions, for
constructors and record fields in type definitions, whose associated
comment must be placed after the constructor or field definition,
without blank line between them. The special comment for a constructor
with another constructor following must be placed before the ’<tt>|</tt>’
character separating the two constructors.</p><p>The following example of file <tt>toto.ml</tt> shows where to place comments
in a <tt>.ml</tt> file.</p><pre>(** The first special comment of the file is the comment associated
    to the whole module. *)

(** The comment for function f *)
let f x y = x + y

(** This comment is not attached to any element since there is another
    special comment just before the next element. *)

(** Comment for exception My_exception, even with a simple comment
    between the special comment and the exception.*)
(* A simple comment. *)
exception My_exception of (int -&gt; int) * int

(** Comment for type weather  *)
type weather =
| Rain of int (** The comment for constructor Rain *)
| Sun (** The comment for constructor Sun *)

(** The comment for type my_record *)
type my_record = {
    val foo : int ;    (** Comment for field foo *)
    val bar : string ; (** Comment for field bar *)
  }

(** The comment for class my_class *)
class my_class =
    object
      (** A comment to describe inheritance from cl *)
      inherit cl

      (** The comment for the instance variable tutu *)
      val mutable tutu = "tutu"
      (** The comment for toto *)
      val toto = 1
      val titi = "titi"
      (** Comment for method toto *)
      method toto = tutu ^ "!"
      (** Comment for method m *)
      method m (f : float) = 1
    end

(** The comment for class type my_class_type *)
class type my_class_type =
  object
    (** The comment for the instance variable x. *)
    val mutable x : int
    (** The commend for method m. *)
    method m : int -&gt; int
  end

(** The comment for module Foo *)
module Foo =
  struct
    (** The comment for x *)
    val x : int
    (** A special comment in the class, but not associated to any element. *)
  end

(** The comment for module type my_module_type. *)
module type my_module_type =
  sig
    (* Comment for value x. *)
    val x : int
    (* ... *)
  end
</pre><h3 class="subsection"><a name="htoc174">15.2.2</a>&nbsp;&nbsp;The Stop special comment</h3><p>
The special comment <tt>(**/**)</tt> tells OCamldoc to discard
elements placed after this comment, up to the end of the current
class, class type, module or module type, or up to the next stop comment.
For instance:
</p><pre>class type foo =
  object
    (** comment for method m *)
    method m : string

    (**/**)

    (** This method won't appear in the documentation *)
    method bar : int
  end

(** This value appears in the documentation, since the Stop special comment
    in the class does not affect the parent module of the class.*)
val foo : string

(**/**)
(** The value bar does not appear in the documentation.*)
val bar : string
(**/**)

(** The type t appears since in the documentation since the previous stop comment
toggled off the "no documentation mode". *)
type t = string
</pre><p>
The <tt><b>-no-stop</b></tt> option to <tt>ocamldoc</tt> causes the Stop special
comments to be ignored.</p><h3 class="subsection"><a name="htoc175">15.2.3</a>&nbsp;&nbsp;Syntax of documentation comments</h3><p>The inside of documentation comments <tt>(**</tt>…<tt>*)</tt> consists of
free-form text with optional formatting annotations, followed by
optional <em>tags</em> giving more specific information about parameters,
version, authors, … The tags are distinguished by a leading <tt>@</tt>
character. Thus, a documentation comment has the following shape:
</p><pre>(** The comment begins with a description, which is text formatted
   according to the rules described in the next section.
   The description continues until the first non-escaped '@' character.
   @author Mr Smith
   @param x description for parameter x
*)
</pre><p>Some elements support only a subset of all @-tags. Tags that are not
relevant to the documented element are simply ignored. For instance,
all tags are ignored when documenting type constructors, record
fields, and class inheritance clauses. Similarly, a <tt>@param</tt> tag on a
class instance variable is ignored.</p><p>At last, <tt>(**)</tt> is the empty documentation comment.</p><h3 class="subsection"><a name="htoc176">15.2.4</a>&nbsp;&nbsp;Text formatting</h3><p>Here is the BNF grammar for the simple markup language used to format
text descriptions.</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="text" class="syntax"><font color="maroon">text</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;{<i><a href="#text-element" class="syntax"><font color="maroon">text-element</font></a></i>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="text-element" class="syntax"><font color="maroon">text-element</font></a></i></td><td align="center" nowrap="">::=</td></tr>
</tbody></table><table cellspacing="6" cellpadding="0"><tbody><tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{</tt></font> { <font color="blue"><tt>0</tt></font> … <font color="blue"><tt>9</tt></font> }<sup>+</sup> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">format <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> as a section header;
the integer following <tt>{</tt> indicates the sectioning level.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{</tt></font> { <font color="blue"><tt>0</tt></font> … <font color="blue"><tt>9</tt></font> }<sup>+</sup> <font color="blue"><tt>:</tt></font>  <i><font color="maroon">label</font>  <a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left"> same, but also associate the name <font color="maroon"><i>label</i></font> to the current point.
This point can be referenced by its fully-qualified label in a
<tt>{!</tt> command, just like any other element.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{b</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">set <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> in bold.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{i</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">set <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> in italic.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{e</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">emphasize <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{C</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">center <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{L</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">left align <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{R</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">right align <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{ul</tt></font> <i><a href="#list" class="syntax"><font color="maroon">list</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">build a list.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{ol</tt></font> <i><a href="#list" class="syntax"><font color="maroon">list</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">build an enumerated list.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{{:</tt> <font color="maroon"><i>string</i></font> <tt>}</tt></font> &nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">put a link to the given address
(given as <font color="maroon"><i>string</i></font>) on the given <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>[</tt> <font color="maroon"><i>string</i></font> <tt>]</tt></font> </td><td valign="top" align="left">set the given <font color="maroon"><i>string</i></font> in source code style.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{[</tt> <font color="maroon"><i>string</i></font> <tt>]}</tt></font> </td><td valign="top" align="left">set the given <font color="maroon"><i>string</i></font> in preformatted
				source code style.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{v</tt> <font color="maroon"><i>string</i></font> <tt>v}</tt></font> </td><td valign="top" align="left">set the given <font color="maroon"><i>string</i></font> in verbatim style.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{%</tt> <font color="maroon"><i>string</i></font> <tt>%}</tt></font> </td><td valign="top" align="left">take the given <font color="maroon"><i>string</i></font> as raw L<sup>A</sup>T<sub>E</sub>X code.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{!</tt> <font color="maroon"><i>string</i></font> <tt>}</tt></font> </td><td valign="top" align="left">insert a reference to the element named
<font color="maroon"><i>string</i></font>. <font color="maroon"><i>string</i></font> must be a fully qualified element name,
for example <tt>Foo.Bar.t</tt>. The kind of the referenced element can be forced
(useful when various elements have the same qualified name) with the following
syntax:  <font color="blue"><tt>{!</tt>  <font color="maroon"><i>kind</i></font>  <tt>:</tt> <font color="maroon"><i>string</i></font> <tt>}</tt></font>  where <font color="maroon"><i>kind</i></font> can be
<tt>module</tt>, <tt>modtype</tt>, <tt>class</tt>, <tt>classtype</tt>, <tt>val</tt>,
<tt>type</tt>, <tt>exception</tt>, <tt>attribute</tt>, <tt>method</tt> or <tt>section</tt>.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{!modules:</tt></font> <font color="maroon"><i>string</i></font> &nbsp;<font color="maroon"><i>string</i></font> ... <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">insert an index table
for the given module names. Used in HTML only.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{!indexlist}</tt></font> </td><td valign="top" align="left">insert a table of links to the various indexes
(types, values, modules, ...). Used in HTML only.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{^</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">set text in superscript.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""> <font color="blue"><tt>{_</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> </td><td valign="top" align="left">set text in subscript.</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""><font color="maroon"><i>escaped-string</i></font></td><td valign="top" align="left">typeset the given string as is;
special characters (’<tt>{</tt>’, ’<tt>}</tt>’, ’<tt>[</tt>’, ’<tt>]</tt>’ and ’<tt>@</tt>’)
must be	escaped by a ’<tt>\</tt>’</td></tr>
<tr><td valign="top" align="right" nowrap="">∣ </td><td valign="top" align="left" nowrap=""><font color="maroon"><i>blank-line</i></font></td><td valign="top" align="left">force a new line.</td></tr>
</tbody></table><p><br>

</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="list" class="syntax"><font color="maroon">list</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;{&nbsp;<font color="blue"><tt>{-</tt></font>&nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>&nbsp;<font color="blue"><tt>}</tt></font>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;{&nbsp;<font color="blue"><tt>{li</tt></font>&nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>&nbsp;<font color="blue"><tt>}</tt></font>&nbsp;}<sup>+</sup></td></tr>
</tbody></table></td></tr>
</tbody></table><p>A shortcut syntax exists for lists and enumerated lists:
</p><pre>(** Here is a {b list}
- item 1
- item 2
- item 3

The list is ended by the blank line.*)
</pre><p>is equivalent to:
</p><pre>(** Here is a {b list}
{ul {- item 1}
{- item 2}
{- item 3}}
The list is ended by the blank line.*)
</pre><p>
The same shortcut is available for enumerated lists, using ’<tt>+</tt>’
instead of ’<tt>-</tt>’.
Note that only one list can be defined by this shortcut in nested lists.</p><p>In the description of a value, type, exception, module, module type, class
or class type, the <em>first sentence</em> is sometimes used in indexes, or
when just a part of the description is needed. The first sentence
is composed of the first characters of the description, until
</p><ul class="itemize"><li class="li-itemize">
the first dot followed by a blank, or
</li><li class="li-itemize">the first blank line
</li></ul><p>
outside of the following text formatting :
 <font color="blue"><tt>{ul</tt></font> <i><a href="#list" class="syntax"><font color="maroon">list</font></a></i> <font color="blue"><tt>}</tt></font> ,
 <font color="blue"><tt>{ol</tt></font> <i><a href="#list" class="syntax"><font color="maroon">list</font></a></i> <font color="blue"><tt>}</tt></font> ,
 <font color="blue"><tt>[</tt> <font color="maroon"><i>string</i></font> <tt>]</tt></font> ,
 <font color="blue"><tt>{[</tt> <font color="maroon"><i>string</i></font> <tt>]}</tt></font> ,
 <font color="blue"><tt>{v</tt> <font color="maroon"><i>string</i></font> <tt>v}</tt></font> ,
 <font color="blue"><tt>{%</tt> <font color="maroon"><i>string</i></font> <tt>%}</tt></font> ,
 <font color="blue"><tt>{!</tt> <font color="maroon"><i>string</i></font> <tt>}</tt></font> ,
 <font color="blue"><tt>{^</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> ,
 <font color="blue"><tt>{_</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> <font color="blue"><tt>}</tt></font> .</p><h3 class="subsection"><a name="htoc177">15.2.5</a>&nbsp;&nbsp;Documentation tags (@-tags)</h3><p>
<a name="s:ocamldoc-tags"></a></p><h4 class="subsubsection">Predefined tags</h4><p>
The following table gives the list of predefined @-tags, with their
syntax and meaning.<br>

</p><table border="1" cellspacing="0" cellpadding="1"><tbody><tr><td valign="top" align="left"> <font color="blue"><tt>@author</tt></font> <font color="maroon"><i>string</i></font> </td><td valign="top" align="left">The author of the element. One author per
<tt>@author</tt> tag.
There may be several <tt>@author</tt> tags for the same element.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@deprecated</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">The <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> should describe when the element was
deprecated, what to use as a replacement, and possibly the reason
for deprecation.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@param</tt></font> <font color="maroon"><i>id</i></font> &nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Associate the given description (<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>) to the
given parameter name <font color="maroon"><i>id</i></font>. This tag is used for functions,
methods, classes and functors.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@raise</tt></font> <font color="maroon"><i>Exc</i></font> &nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Explain that the element may raise
the exception <font color="maroon"><i>Exc</i></font>.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@return</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Describe the return value and
its possible values. This tag is used for functions
and methods.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@see</tt> <tt>&lt;</tt> <font color="maroon"><i>URL</i></font> <tt>&gt;</tt></font> &nbsp;<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Add a reference to the <font color="maroon"><i>URL</i></font>
with the given <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> as comment.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@see</tt> <tt>'</tt><font color="maroon"><i>filename</i></font><tt>'</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Add a reference to the given file name
(written between single quotes), with the given <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> as comment.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@see</tt> <tt>"</tt><font color="maroon"><i>document-name</i></font><tt>"</tt></font> <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Add a reference to the given
document name (written between double quotes), with the given <i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>
as comment.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@since</tt></font> <font color="maroon"><i>string</i></font> </td><td valign="top" align="left">Indicate when the element was introduced.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@before</tt></font>  <i><font color="maroon">version</font>  <a href="#text" class="syntax"><font color="maroon">text</font></a></i> </td><td valign="top" align="left">Associate the given description (<i><a href="#text" class="syntax"><font color="maroon">text</font></a></i>)
to the given <font color="maroon"><i>version</i></font> in order to document compatibility issues.</td></tr>
<tr><td valign="top" align="left">
 <font color="blue"><tt>@version</tt></font> <font color="maroon"><i>string</i></font> </td><td valign="top" align="left">The version number for the element.</td></tr>
</tbody></table><h4 class="subsubsection">Custom tags</h4><p>
<a name="s:ocamldoc-custom-tags"></a>
You can use custom tags in the documentation comments, but they will
have no effect if the generator used does not handle them. To use a
custom tag, for example <tt>foo</tt>, just put <tt>@foo</tt> with some text in your
comment, as in:
</p><pre>(** My comment to show you a custom tag.
@foo this is the text argument to the [foo] custom tag.
*)
</pre><p>
To handle custom tags, you need to define a custom generator,
as explained in section <a href="#s:ocamldoc-handling-custom-tags">15.3.2</a>.</p><h2 class="section"><a name="toc121"></a><a name="htoc178">3</a>&nbsp;&nbsp;Custom generators</h2><p>
<a name="s:ocamldoc-custom-generators"></a></p><p>OCamldoc operates in two steps:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
analysis of the source files;
</li><li class="li-enumerate">generation of documentation, through a documentation generator,
	which is an object of class <tt>Odoc_args.class_generator</tt>.
</li></ol><p>
Users can provide their own documentation generator to be used during
step 2 instead of the default generators.
All the information retrieved during the analysis step is available through
the <tt>Odoc_info</tt> module, which gives access to all the types and functions
representing the elements found in the given modules, with their associated
description.</p><p>The files you can use to define custom generators are installed in the
<tt>ocamldoc</tt> sub-directory of the OCaml standard library.</p><h3 class="subsection"><a name="htoc179">15.3.1</a>&nbsp;&nbsp;The generator modules</h3><p>
The type of a generator module depends on the kind of generated documentation.
Here is the list of generator module types, with the name of the generator
class in the module&nbsp;:
</p><ul class="itemize"><li class="li-itemize">
for HTML&nbsp;: <tt>Odoc_html.Html_generator</tt> (class <tt>html</tt>),
</li><li class="li-itemize">for L<sup>A</sup>T<sub>E</sub>X&nbsp;: <tt>Odoc_latex.Latex_generator</tt> (class <tt>latex</tt>),
</li><li class="li-itemize">for TeXinfo&nbsp;: <tt>Odoc_texi.Texi_generator</tt> (class <tt>texi</tt>),
</li><li class="li-itemize">for man pages&nbsp;: <tt>Odoc_man.Man_generator</tt> (class <tt>man</tt>),
</li><li class="li-itemize">for graphviz (dot)&nbsp;: <tt>Odoc_dot.Dot_generator</tt> (class <tt>dot</tt>),
</li><li class="li-itemize">for other kinds&nbsp;: <tt>Odoc_gen.Base</tt> (class <tt>doc_generator</tt>).
</li></ul><p>
That is, to define a new generator, one must implement a module with
the expected signature, and with the given generator class, providing
the <tt>generate</tt> method as entry point to make the generator generates
documentation for a given list of modules&nbsp;:</p><pre>        method generate : Odoc_info.Module.t_module list -&gt; unit
</pre><p>
This method will be called with the list of analysed and possibly
merged <tt>Odoc_info.t_module</tt> structures.</p><p>It is recommanded to inherit from the current generator of the same
kind as the one you want to define. Doing so, it is possible to
load various custom generators to combine improvments brought by each one.</p><p>This is done using first class modules (see chapter <a href="manual021.html#s-first-class-modules">7.14</a>).</p><p>The easiest way to define a custom generator is the following this example,
here extending the current HTML generator. We don’t have to know if this is
the original HTML generator defined in ocamldoc or if it has been extended
already by a previously loaded custom generator&nbsp;:</p><pre>module Generator (G : Odoc_html.Html_generator) =
struct
  class html =
    object(self)
      inherit G.html as html
      (* ... *)

      method generate module_list =
        (* ... *)
        ()

      (* ... *)
  end
end;;

let _ = Odoc_args.extend_html_generator (module Generator : Odoc_gen.Html_functor);;
</pre><p>
To know which methods to override and/or which methods are available,
have a look at the different base implementations, depending on the
kind of generator you are extending&nbsp;:
</p><ul class="itemize"><li class="li-itemize">
for HTML&nbsp;: <tt><a href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_html.ml?view=markup">http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_html.ml?view=markup</a>odoc_html.ml</tt>,
</li><li class="li-itemize">for L<sup>A</sup>T<sub>E</sub>X&nbsp;: <tt><a href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_latex.ml?view=markup">http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_latex.ml?view=markup</a>odoc_latex.ml</tt>,
</li><li class="li-itemize">for TeXinfo&nbsp;: <tt><a href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_texi.ml?view=markup">http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_texi.ml?view=markup</a>odoc_texi.ml</tt>,
</li><li class="li-itemize">for man pages&nbsp;: <tt><a href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_man.ml?view=markup">http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_man.ml?view=markup</a>odoc_man.ml</tt>,
</li><li class="li-itemize">for graphviz (dot)&nbsp;: <tt><a href="http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_dot.ml?view=markup">http://caml.inria.fr/cgi-bin/viewvc.cgi/ocaml/version/4.00/ocamldoc/odoc_dot.ml?view=markup</a>odoc_dot.ml</tt>.
</li></ul><h3 class="subsection"><a name="htoc180">15.3.2</a>&nbsp;&nbsp;Handling custom tags</h3><p>
<a name="s:ocamldoc-handling-custom-tags"></a></p><p>Making a custom generator handle custom tags (see
<a href="#s:ocamldoc-custom-tags">15.2.5</a>) is very simple.</p><h4 class="subsubsection">For HTML</h4><p>
Here is how to develop a HTML generator handling your custom tags.</p><p>The class <tt>Odoc_html.Generator.html</tt> inherits
from the class <tt>Odoc_html.info</tt>, containing a field <tt>tag_functions</tt> which is a
list pairs composed of a custom tag (e.g. <tt>"foo"</tt>) and a function taking
a <tt>text</tt> and returning HTML code (of type <tt>string</tt>).
To handle a new tag <tt>bar</tt>, extend the current HTML generator
and complete the <tt>tag_functions</tt> field:
</p><pre>module Generator (G : Odoc_html.Html_generator) =
struct
  class html =
    object(self)
      inherit G.html

      (** Return HTML code for the given text of a bar tag. *)
      method html_of_bar t = (* your code here *)

      initializer
        tag_functions &lt;- ("bar", self#html_of_bar) :: tag_functions
  end
end
let _ = Odoc_args.extend_html_generator (module Generator : Odoc_gen.Html_functor);;
</pre><p>
Another method of the class <tt>Odoc_html.info</tt> will look for the
function associated to a custom tag and apply it to the text given to
the tag. If no function is associated to a custom tag, then the method
prints a warning message on <tt>stderr</tt>.</p><h4 class="subsubsection">For other generators</h4><p>
You can act the same way for other kinds of generators.</p><h2 class="section"><a name="toc122"></a><a name="htoc181">4</a>&nbsp;&nbsp;Adding command line options</h2><p>
The command line analysis is performed after loading the module containing the
documentation generator, thus allowing command line options to be added to the
list of existing ones. Adding an option can be done with the function
</p><pre>        Odoc_args.add_option : string * Arg.spec * string -&gt; unit
</pre><p>Note: Existing command line options can be redefined using
this function.</p><h3 class="subsection"><a name="htoc182">15.4.1</a>&nbsp;&nbsp;Compilation and usage</h3><p>
<a name="s:ocamldoc-compilation-and-usage"></a></p><h4 class="subsubsection">Defining a custom generator class in one file</h4><p>
Let <tt>custom.ml</tt> be the file defining a new generator class.
Compilation of <tt>custom.ml</tt> can be performed by the following command&nbsp;:
</p><pre>        ocamlc -I +ocamldoc -c custom.ml
</pre><p>
The file <tt>custom.cmo</tt> is created and can be used this way&nbsp;:
</p><pre>        ocamldoc -g custom.cmo <i>other-options source-files</i>
</pre><p>
It is important not to give the <tt>-html</tt> or any other option
selecting a built-in generator to <tt>ocamldoc</tt>,
which would result in using this generator instead of the one you just loaded.</p><h4 class="subsubsection">Defining a custom generator class in several files</h4><p>
It is possible to define a generator class in several modules, which
are defined in several files <i>file<sub>1</sub></i><tt>.ml</tt>[<tt>i</tt>],
<i>file<sub>2</sub></i><tt>.ml</tt>[<tt>i</tt>], ..., <i>file<sub>n</sub></i><tt>.ml</tt>[<tt>i</tt>]. A <tt>.cma</tt>
library file must be created, including all these files.</p><p>The following commands create the <tt>custom.cma</tt> file from files
<i>file<sub>1</sub></i><tt>.ml</tt>[<tt>i</tt>], ..., <i>file<sub>n</sub></i><tt>.ml</tt>[<tt>i</tt>]&nbsp;:
</p><pre>ocamlc -I +ocamldoc -c <i>file<sub>1</sub></i>.ml[i]
ocamlc -I +ocamldoc -c <i>file<sub>2</sub></i>.ml[i]
...
ocamlc -I +ocamldoc -c <i>file<sub>n</sub></i>.ml[i]
ocamlc -o custom.cma -a <i>file<sub>1</sub></i>.cmo <i>file<sub>2</sub></i>.cmo ... <i>file<sub>n</sub></i>.cmo
</pre><p>
Then, the following command uses <tt>custom.cma</tt> as custom generator:
</p><pre>        ocamldoc -g custom.cma <i>other-options source-files</i>
</pre><p>
Again, it is important not to give the <tt>-html</tt> or any other
option selecting a built-in generator to <tt>ocamldoc</tt>,
which would result in using this generator instead of the one you just loaded.

</p><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>