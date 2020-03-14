<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="comp.html">Batch compilation (ocamlc)</a></li><li><a href="toplevel.html">The toplevel system (ocaml)</a></li><li><a href="runtime.html">The runtime system (ocamlrun)</a></li><li><a href="native.html">Native-code compilation (ocamlopt)</a></li><li><a href="lexyacc.html">Lexer and parser generators (ocamllex, ocamlyacc)</a></li><li><a href="depend.html">Dependency generator (ocamldep)</a></li><li class="active"><a href="browser.html">The browser/editor (ocamlbrowser)</a></li><li><a href="ocamldoc.html">The documentation generator (ocamldoc)</a></li><li><a href="debugger.html">The debugger (ocamldebug)</a></li><li><a href="profil.html">Profiling (ocamlprof)</a></li><li><a href="ocamlbuild.html">The ocamlbuild compilation manager</a></li><li><a href="intfc.html">Interfacing C with OCaml</a></li></ul>




<h1 class="chapter" id="sec290"><span>Chapter 14</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</h1>
<header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The browser/editor (ocamlbrowser)</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec291">Invocation</a>
</li><li><a href="#sec292">Viewer</a>
</li><li><a href="#sec293">Module browsing</a>
</li><li><a href="#sec294">File editor</a>
</li><li><a href="#sec295">Shell</a>
</li></ul></nav></header>
<p> <a id="c:browser"></a>

</p><p>This chapter describes OCamlBrowser, a source and compiled interface
browser, written using LablTk. This is a useful companion to the
programmer.</p><p>Its functions are:
</p><ul class="itemize"><li class="li-itemize">
navigation through OCaml’s modules (using compiled interfaces).
</li><li class="li-itemize">source editing, type-checking, and browsing.
</li><li class="li-itemize">integrated OCaml shell, running as a subprocess.
</li></ul>
<h2 class="section" id="sec291">1&nbsp;&nbsp;Invocation</h2>
<p> <a id="s:browser-options"></a></p><p>The browser is started by the command <span class="c007">ocamlbrowser</span>, as follows:
</p><pre>        ocamlbrowser <span class="c013">options</span>
</pre><p>The following command-line options are recognized by <span class="c007">ocamlbrowser</span>.</p><dl class="description"><dt class="dt-description"><span class="c019"><span class="c007">-I</span> <span class="c013">directory</span></span></dt><dd class="dd-description">
Add the given directory to the list of directories searched for
source and compiled files. By default, only the standard library
directory is searched. The standard library can also be changed by
setting the <span class="c007">OCAMLLIB</span> environment variable.</dd><dt class="dt-description"><span class="c010">-nolabels</span></dt><dd class="dd-description">
Ignore non-optional labels in types. Labels cannot be used in
applications, and parameter order becomes strict.</dd><dt class="dt-description"><span class="c010">-oldui</span></dt><dd class="dd-description">
Old multi-window interface. The default is now more like Smalltalk’s
class browser.</dd><dt class="dt-description"><span class="c010">-rectypes</span></dt><dd class="dd-description">
Allow arbitrary recursive types during type-checking. By default,
only recursive types where the recursion goes through an object type
are supported.</dd><dt class="dt-description"><span class="c010">-version</span></dt><dd class="dd-description">
Print version string and exit.</dd><dt class="dt-description"><span class="c010">-vnum</span></dt><dd class="dd-description">
Print short version number and exit.</dd><dt class="dt-description"><span class="c019"><span class="c007">-w</span> <span class="c013">warning-list</span></span></dt><dd class="dd-description">
Enable or disable warnings according to the argument <span class="c013">warning-list</span>.</dd></dl><p>Most options can also be modified inside the application by the <span class="c019">Modules - Path editor</span> and <span class="c019">Compiler - Preferences</span> commands.
They are inherited when you start a toplevel shell.</p>
<h2 class="section" id="sec292">2&nbsp;&nbsp;Viewer</h2>
<p>
This is the first window you get when you start OCamlBrowser.
It displays a search window, and the list of modules in the load path.
At the top a row of menus.</p><ul class="itemize"><li class="li-itemize">
<span class="c019">File - Open</span> and <span class="c019">File - Editor</span> give access to the
editor.</li><li class="li-itemize"><span class="c019">File - Shell</span> creates an OCaml subprocess in a shell.</li><li class="li-itemize"><span class="c019">View - Show all defs</span> displays the signature of the currently
selected module.</li><li class="li-itemize"><span class="c019">View - Search entry</span> shows/hides the search entry just
below the menu bar.</li><li class="li-itemize"><span class="c019">Modules - Path editor</span> changes the load path. <span class="c019">Modules
- Reset cache</span> rescans the load path and resets the module cache.
Do it if you recompile some interface, or get confused about what is
in the cache.</li><li class="li-itemize"><span class="c019">Modules - Search symbol</span> allows searching a symbol either
by its name, like the bottom line of the viewer, or more
interestingly, by its type. <span class="c019">Exact type</span> searches for a type
with exactly the same information as the pattern (variables match
only variables). <span class="c019">Included type</span> allows giving only partial
information: the actual type may take more arguments and return more
results, and variables in the pattern match anything. In both cases,
argument and tuple order is irrelevant<sup><a id="text2" href="#note2">1</a></sup>,
and unlabeled arguments in the pattern match any label.</li><li class="li-itemize">The <span class="c019">Search entry</span> just below the menu bar allows one to
search for an identifier in all modules (wildcards “?” and “*”
allowed). If you choose the <span class="c007">type</span> option, the search is done by type
inclusion (<em>cf.</em> Search Symbol - Included type).</li><li class="li-itemize">The <span class="c019">Close all</span> button is there to dismiss the windows
created by the Detach button.
By double-clicking on it you will quit the browser.</li></ul>
<h2 class="section" id="sec293">3&nbsp;&nbsp;Module browsing</h2>
<p>You select a module in the leftmost box by either cliking on it or
pressing return when it is selected. Fast access is available in all
boxes pressing the first few letter of the desired name.
Double-clicking / double-return displays the whole signature for the
module.</p><p>Defined identifiers inside the module are displayed in a box to the
right of the previous one. If you click on one, this will either
display its contents in another box (if this is a sub-module) or
display the signature for this identifier below.</p><p>Signatures are clickable. Double clicking with the left mouse
button on an identifier in a signature brings you to its signature.
A single click on the right button pops up a menu displaying the
type declaration for the selected identifier. Its title, when
selectable, also brings you to its signature.</p><p>At the bottom, a series of buttons, depending on the context.
</p><ul class="itemize"><li class="li-itemize">
<span class="c019">Detach</span> copies the currently displayed signature in a new window,
to keep it.
</li><li class="li-itemize"><span class="c019">Impl</span> and <span class="c019">Intf</span> bring you to the implementation or
interface of the currently displayed signature, if it is available.
</li></ul><p>Control-S lets you search a string in the signature.</p>
<h2 class="section" id="sec294">4&nbsp;&nbsp;File editor</h2>
<p>
You can edit files with it, if you’re not yet used to emacs. Otherwise
you can use it as a browser, making occasional corrections.</p><p>The <span class="c019">Edit</span> menu contains commands for jump (C-g), search (C-s),
and sending the current phrase (or selection if some text is selected)
to a sub-shell (M-x). For this last option, you may choose the shell
via a dialog.</p><p>Essential functions are in the <span class="c019">Compiler</span> menu.</p><ul class="itemize"><li class="li-itemize">
<span class="c019">Preferences</span> opens a dialog to set internals of the editor
and type-checker.</li><li class="li-itemize"><span class="c019">Lex</span> adds colors according to lexical categories.</li><li class="li-itemize"><span class="c019">Typecheck</span> verifies typing, and memorizes to let one see an
expression’s type by double-clicking on it. This is also valid for
interfaces. If an error occurs, the part of the interface preceding
the error is computed.<p>After typechecking, pressing the right button pops up a menu that gives
the type of the pointed expression and, where applicable, provides
some links that can be followed.</p></li><li class="li-itemize"><span class="c019">Clear errors</span> dismisses type-checker error messages and warnings.</li><li class="li-itemize"><span class="c019">Signature</span> shows the signature of the current file
(after type checking).
</li></ul>
<h2 class="section" id="sec295">5&nbsp;&nbsp;Shell</h2>
<p>
When you create a shell, a dialog is presented to you, letting you
choose which command you want to run, and the title of the shell (to
choose it in the Editor).</p><p>The executed subshell is given the current load path.</p><ul class="itemize"><li class="li-itemize">
<span class="c019">File</span> use a source file or load a bytecode file. You may
also import the browser’s path into the subprocess.
</li><li class="li-itemize"><span class="c019">History</span> M-p and M-n browse up and down.
</li><li class="li-itemize"><span class="c019">Signal</span> C-c interrupts, and you can also kill the subprocess.
</li></ul>
<hr class="ffootnoterule"><dl class="thefootnotes"><dt class="dt-thefootnotes">
<a id="note2" href="#text2">1</a></dt><dd class="dd-thefootnotes"><div class="footnotetext">To avoid
combinatorial explosion of the search space, optional arguments in
the actual type are ignored in the actual if (1) there are too many
of them, and (2) they do not appear explicitly in the pattern.</div>
</dd></dl>
<hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>