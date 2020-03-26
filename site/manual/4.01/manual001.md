<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.01<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 September&nbsp;12, 2013<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.01/ocaml-4.01-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual044.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



<h1 class="chapter" id="sec1">Contents</h1>
<ul class="ftoc1"><li class="li-toc">
<a href="index.html#sec6">Part&nbsp;I&nbsp;&nbsp;An introduction to OCaml</a>
<ul class="ftoc2"><li class="li-toc">
<a href="coreexamples.html#sec7"><span>Chapter 1</span>&nbsp;&nbsp;The core language</a>
<ul class="ftoc3"><li class="li-toc">
<a href="coreexamples.html#sec8">1&nbsp;&nbsp;Basics</a>
</li><li class="li-toc"><a href="coreexamples.html#sec9">2&nbsp;&nbsp;Data types</a>
</li><li class="li-toc"><a href="coreexamples.html#sec10">3&nbsp;&nbsp;Functions as values</a>
</li><li class="li-toc"><a href="coreexamples.html#sec11">4&nbsp;&nbsp;Records and variants</a>
</li><li class="li-toc"><a href="coreexamples.html#sec12">5&nbsp;&nbsp;Imperative features</a>
</li><li class="li-toc"><a href="coreexamples.html#sec13">6&nbsp;&nbsp;Exceptions</a>
</li><li class="li-toc"><a href="coreexamples.html#sec14">7&nbsp;&nbsp;Symbolic processing of expressions</a>
</li><li class="li-toc"><a href="coreexamples.html#sec15">8&nbsp;&nbsp;Pretty-printing and parsing</a>
</li><li class="li-toc"><a href="coreexamples.html#sec16">9&nbsp;&nbsp;Standalone OCaml programs</a>
</li></ul>
</li><li class="li-toc"><a href="moduleexamples.html#sec17"><span>Chapter 2</span>&nbsp;&nbsp;The module system</a>
<ul class="ftoc3"><li class="li-toc">
<a href="moduleexamples.html#sec18">1&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec19">2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec20">3&nbsp;&nbsp;Functors</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec21">4&nbsp;&nbsp;Functors and type abstraction</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec22">5&nbsp;&nbsp;Modules and separate compilation</a>
</li></ul>
</li><li class="li-toc"><a href="objectexamples.html#sec23"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="objectexamples.html#sec24">1&nbsp;&nbsp;Classes and objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec25">2&nbsp;&nbsp;Immediate objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec26">3&nbsp;&nbsp;Reference to self</a>
</li><li class="li-toc"><a href="objectexamples.html#sec27">4&nbsp;&nbsp;Initializers</a>
</li><li class="li-toc"><a href="objectexamples.html#sec28">5&nbsp;&nbsp;Virtual methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec29">6&nbsp;&nbsp;Private methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec30">7&nbsp;&nbsp;Class interfaces</a>
</li><li class="li-toc"><a href="objectexamples.html#sec31">8&nbsp;&nbsp;Inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#sec32">9&nbsp;&nbsp;Multiple inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#sec33">10&nbsp;&nbsp;Parameterized classes</a>
</li><li class="li-toc"><a href="objectexamples.html#sec34">11&nbsp;&nbsp;Polymorphic methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec35">12&nbsp;&nbsp;Using coercions</a>
</li><li class="li-toc"><a href="objectexamples.html#sec36">13&nbsp;&nbsp;Functional objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec37">14&nbsp;&nbsp;Cloning objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec38">15&nbsp;&nbsp;Recursive classes</a>
</li><li class="li-toc"><a href="objectexamples.html#sec39">16&nbsp;&nbsp;Binary methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec40">17&nbsp;&nbsp;Friends</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#sec41"><span>Chapter 4</span>&nbsp;&nbsp;Labels and variants</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lablexamples.html#sec42">1&nbsp;&nbsp;Labels</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lablexamples.html#sec43">1.1&nbsp;&nbsp;Optional arguments</a>
</li><li class="li-toc"><a href="lablexamples.html#sec44">1.2&nbsp;&nbsp;Labels and type inference</a>
</li><li class="li-toc"><a href="lablexamples.html#sec45">1.3&nbsp;&nbsp;Suggestions for labeling</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#sec46">2&nbsp;&nbsp;Polymorphic variants</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lablexamples.html#sec49">2.1&nbsp;&nbsp;Weaknesses of polymorphic variants</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec50"><span>Chapter 5</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
<ul class="ftoc3"><li class="li-toc">
<a href="advexamples.html#sec51">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li class="li-toc"><a href="advexamples.html#sec52">2&nbsp;&nbsp;Simple modules as classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="advexamples.html#sec53">2.1&nbsp;&nbsp;Strings</a>
</li><li class="li-toc"><a href="advexamples.html#sec55">2.2&nbsp;&nbsp;Hashtbl</a>
</li><li class="li-toc"><a href="advexamples.html#sec56">2.3&nbsp;&nbsp;Sets</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec57">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec58">Part&nbsp;II&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc2"><li class="li-toc">
<a href="language.html#sec59"><span>Chapter 6</span>&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lex.html#sec62">1&nbsp;&nbsp;Lexical conventions</a>
</li><li class="li-toc"><a href="values.html#sec75">2&nbsp;&nbsp;Values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="values.html#sec76">2.1&nbsp;&nbsp;Base values</a>
</li><li class="li-toc"><a href="values.html#sec81">2.2&nbsp;&nbsp;Tuples</a>
</li><li class="li-toc"><a href="values.html#sec82">2.3&nbsp;&nbsp;Records</a>
</li><li class="li-toc"><a href="values.html#sec83">2.4&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="values.html#sec84">2.5&nbsp;&nbsp;Variant values</a>
</li><li class="li-toc"><a href="values.html#sec85">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li class="li-toc"><a href="values.html#sec86">2.7&nbsp;&nbsp;Functions</a>
</li><li class="li-toc"><a href="values.html#sec87">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
</li><li class="li-toc"><a href="names.html#sec88">3&nbsp;&nbsp;Names</a>
</li><li class="li-toc"><a href="types.html#sec91">4&nbsp;&nbsp;Type expressions</a>
</li><li class="li-toc"><a href="const.html#sec102">5&nbsp;&nbsp;Constants</a>
</li><li class="li-toc"><a href="patterns.html#sec103">6&nbsp;&nbsp;Patterns</a>
</li><li class="li-toc"><a href="expr.html#s%3Avalue-expr">7&nbsp;&nbsp;Expressions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="expr.html#sec116">7.1&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#sec124">7.2&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#sec131">7.3&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#sec138">7.4&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#sec139">7.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#sec145">7.6&nbsp;&nbsp;Coercions</a>
</li></ul>
</li><li class="li-toc"><a href="typedecl.html#sec149">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="typedecl.html#sec150">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="typedecl.html#sec151">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="classes.html#sec152">9&nbsp;&nbsp;Classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="classes.html#sec153">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="classes.html#sec162">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="classes.html#sec175">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="classes.html#sec178">9.4&nbsp;&nbsp;Class specifications</a>
</li><li class="li-toc"><a href="classes.html#sec179">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="modtypes.html#sec180">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modtypes.html#sec181">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="modtypes.html#sec182">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="modtypes.html#sec192">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="modtypes.html#sec193">10.4&nbsp;&nbsp;The <span class="c007">with</span> operator</a>
</li></ul>
</li><li class="li-toc"><a href="modules.html#s%3Amodule-expr">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modules.html#sec195">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="modules.html#sec196">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="modules.html#sec206">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="compunit.html#sec209">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec210"><span>Chapter 7</span>&nbsp;&nbsp;Language extensions</a>
<ul class="ftoc3"><li class="li-toc">
<a href="extn.html#sec211">1&nbsp;&nbsp;Integer literals for types <span class="c007">int32</span>, <span class="c007">int64</span>
and <span class="c007">nativeint</span></a>
</li><li class="li-toc"><a href="extn.html#sec212">2&nbsp;&nbsp;Streams and stream parsers</a>
</li><li class="li-toc"><a href="extn.html#sec213">3&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="extn.html#sec214">4&nbsp;&nbsp;Range patterns</a>
</li><li class="li-toc"><a href="extn.html#sec215">5&nbsp;&nbsp;Assertion checking</a>
</li><li class="li-toc"><a href="extn.html#sec216">6&nbsp;&nbsp;Lazy evaluation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec217">6.1&nbsp;&nbsp;Lazy expressions</a>
</li><li class="li-toc"><a href="extn.html#sec218">6.2&nbsp;&nbsp;Lazy patterns</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec219">7&nbsp;&nbsp;Local modules</a>
</li><li class="li-toc"><a href="extn.html#sec220">8&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="extn.html#sec221">9&nbsp;&nbsp;Private types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec222">9.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="extn.html#sec223">9.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="extn.html#sec224">9.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec225">10&nbsp;&nbsp;Local opens</a>
</li><li class="li-toc"><a href="extn.html#sec226">11&nbsp;&nbsp;Record notations</a>
</li><li class="li-toc"><a href="extn.html#sec227">12&nbsp;&nbsp;Explicit polymorphic type annotations</a>
</li><li class="li-toc"><a href="extn.html#sec228">13&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="extn.html#sec230">14&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="extn.html#sec233">15&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="extn.html#sec234">16&nbsp;&nbsp;Substituting inside a signature</a>
</li><li class="li-toc"><a href="extn.html#sec235">17&nbsp;&nbsp;Explicit overriding in class definitions</a>
</li><li class="li-toc"><a href="extn.html#sec236">18&nbsp;&nbsp;Overriding in open statements</a>
</li><li class="li-toc"><a href="extn.html#sec237">19&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li class="li-toc"><a href="extn.html#sec239">20&nbsp;&nbsp;Syntax for Bigarray access</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec240">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="ftoc2"><li class="li-toc">
<a href="comp.html#sec241"><span>Chapter 8</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="comp.html#sec242">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="comp.html#sec243">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="comp.html#sec244">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="comp.html#sec245">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec246"><span>Chapter 9</span>&nbsp;&nbsp;The toplevel system (ocaml)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="toplevel.html#sec247">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="toplevel.html#sec248">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="toplevel.html#sec249">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="toplevel.html#sec250">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="toplevel.html#sec251">5&nbsp;&nbsp;Building custom toplevel systems: <span class="c007">ocamlmktop</span></a>
</li><li class="li-toc"><a href="toplevel.html#sec252">6&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="runtime.html#sec253"><span>Chapter 10</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="runtime.html#sec254">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="runtime.html#sec255">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="runtime.html#sec256">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="runtime.html#sec257">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="native.html#sec258"><span>Chapter 11</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="native.html#sec259">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="native.html#sec260">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="native.html#sec264">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="native.html#sec265">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="native.html#sec266">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec267"><span>Chapter 12</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lexyacc.html#sec268">1&nbsp;&nbsp;Overview of <span class="c007">ocamllex</span></a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec269">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec270">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec271">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec272">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec273">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="lexyacc.html#sec274">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec275">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec276">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec277">2.7&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec278">3&nbsp;&nbsp;Overview of <span class="c007">ocamlyacc</span></a>
</li><li class="li-toc"><a href="lexyacc.html#sec279">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec280">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec281">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="lexyacc.html#sec282">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="lexyacc.html#sec283">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec284">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="lexyacc.html#sec285">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="lexyacc.html#sec286">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="depend.html#sec287"><span>Chapter 13</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="depend.html#sec288">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="depend.html#sec289">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="browser.html#sec290"><span>Chapter 14</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="browser.html#sec291">1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="browser.html#sec292">2&nbsp;&nbsp;Viewer</a>
</li><li class="li-toc"><a href="browser.html#sec293">3&nbsp;&nbsp;Module browsing</a>
</li><li class="li-toc"><a href="browser.html#sec294">4&nbsp;&nbsp;File editor</a>
</li><li class="li-toc"><a href="browser.html#sec295">5&nbsp;&nbsp;Shell</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec296"><span>Chapter 15</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="ocamldoc.html#sec297">1&nbsp;&nbsp;Usage</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec298">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec307">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec308">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec309">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec310">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec313">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec314">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec315">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec321">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec324">3&nbsp;&nbsp;Custom generators</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec325">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec326">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec329">4&nbsp;&nbsp;Adding command line options</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec330">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec333"><span>Chapter 16</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="debugger.html#sec334">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="debugger.html#sec335">2&nbsp;&nbsp;Invocation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec336">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec337">2.2&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec338">3&nbsp;&nbsp;Commands</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec339">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="debugger.html#sec340">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec341">4&nbsp;&nbsp;Executing a program</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec342">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="debugger.html#sec343">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="debugger.html#sec344">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="debugger.html#sec345">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="debugger.html#sec346">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec347">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="debugger.html#sec348">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="debugger.html#sec349">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="debugger.html#sec350">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec351">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="debugger.html#sec352">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="debugger.html#sec353">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="debugger.html#sec354">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="debugger.html#sec355">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="debugger.html#sec356">8.6&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="debugger.html#sec357">8.7&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec358">8.8&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec359">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="debugger.html#sec360">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="profil.html#sec361"><span>Chapter 17</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="profil.html#sec362">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="profil.html#sec366">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="profil.html#sec367">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="profil.html#sec368">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="ocamlbuild.html#sec370"><span>Chapter 18</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
<ul class="ftoc3"><li class="li-toc">
<a href="ocamlbuild.html#sec371">1&nbsp;&nbsp;Features of <span class="c007">ocamlbuild</span></a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec372">2&nbsp;&nbsp;Limitations</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec373">3&nbsp;&nbsp;Using <span class="c007">ocamlbuild</span></a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamlbuild.html#sec374">3.1&nbsp;&nbsp;Hygiene &amp; where is my code ?</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec375">3.2&nbsp;&nbsp;Hello, world !</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec376">3.3&nbsp;&nbsp;Executing my code</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec377">3.4&nbsp;&nbsp;The log file, verbosity and debugging</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec378">3.5&nbsp;&nbsp;Cleaning</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec379">3.6&nbsp;&nbsp;Where and how to run <span class="c007">ocamlbuild</span>?</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec380">3.7&nbsp;&nbsp;Dependencies</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec381">3.8&nbsp;&nbsp;Native and byte-code</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec382">3.9&nbsp;&nbsp;Compile flags</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec383">3.10&nbsp;&nbsp;Link flags</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec384">3.11&nbsp;&nbsp;Linking with external libraries</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec385">3.12&nbsp;&nbsp;The <span class="c007">_tags</span> files</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec387">3.13&nbsp;&nbsp;Glob patterns and expressions</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec388">3.14&nbsp;&nbsp;Subdirectories</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec390">3.15&nbsp;&nbsp;Grouping targets with <span class="c007">.itarget</span></a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec391">3.16&nbsp;&nbsp;Packing subdirectories into modules</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec392">3.17&nbsp;&nbsp;Making an OCaml library</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec393">3.18&nbsp;&nbsp;Making an OCaml toplevel</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec394">3.19&nbsp;&nbsp;Preprocessor options and tags</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec395">3.20&nbsp;&nbsp;Debugging byte code and profiling native code</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec396">3.21&nbsp;&nbsp;Generating documentation using <span class="c007">ocamldoc</span></a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec397">3.22&nbsp;&nbsp;The display line</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec398">3.23&nbsp;&nbsp;<span class="c007">ocamllex</span>, <span class="c007">ocamlyacc</span> and <span class="c007">menhir</span></a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec399">3.24&nbsp;&nbsp;Changing the compilers or tools</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec400">3.25&nbsp;&nbsp;Interaction with version control systems</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec401">3.26&nbsp;&nbsp;A shell script for driving it all?</a>
</li></ul>
</li><li class="li-toc"><a href="ocamlbuild.html#sec402">4&nbsp;&nbsp;Appendix: Motivations</a>
</li><li class="li-toc"><a href="ocamlbuild.html#sec403">5&nbsp;&nbsp;Appendix: Summary of default rules</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#c%3Aintf-c"><span>Chapter 19</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="intfc.html#sec405">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec406">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec407">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec408">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec409">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec410">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="intfc.html#sec411">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec412">2&nbsp;&nbsp;The <span class="c007">value</span> type</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec413">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="intfc.html#sec414">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec415">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec416">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec417">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="intfc.html#sec418">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="intfc.html#sec419">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="intfc.html#sec420">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="intfc.html#sec421">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="intfc.html#sec422">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec423">4&nbsp;&nbsp;Operations on values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec424">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="intfc.html#sec425">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="intfc.html#sec426">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec427">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec430">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec431">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec432">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="intfc.html#sec437">5.2&nbsp;&nbsp;Low-level interface</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec438">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="intfc.html#sec439">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec440">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="intfc.html#sec442">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec443">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec444">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="intfc.html#sec445">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec448">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="intfc.html#sec449">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec450">9.1&nbsp;&nbsp;The <span class="c007">struct custom_operations</span></a>
</li><li class="li-toc"><a href="intfc.html#sec451">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec452">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec453">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="intfc.html#sec454">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="intfc.html#sec455">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec456">10&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec457">10.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="intfc.html#sec458">10.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec459">11&nbsp;&nbsp;Building mixed C/OCaml libraries: <span class="c007">ocamlmklib</span></a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec461">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="ftoc2"><li class="li-toc">
<a href="core.html#sec462"><span>Chapter 20</span>&nbsp;&nbsp;The core library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="core.html#sec464">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
</li><li class="li-toc"><a href="core.html#sec467">2&nbsp;&nbsp;Module <span class="c007">Pervasives</span>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="stdlib.html#sec468"><span>Chapter 21</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="libunix.html#sec470"><span>Chapter 22</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="libnum.html#sec471"><span>Chapter 23</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="libstr.html#sec472"><span>Chapter 24</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="libthreads.html#sec473"><span>Chapter 25</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="libgraph.html#sec474"><span>Chapter 26</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="libdynlink.html#sec475"><span>Chapter 27</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="liblabltk.html#sec476"><span>Chapter 28</span>&nbsp;&nbsp;The LablTk library: Tcl/Tk GUI interface</a>
</li><li class="li-toc"><a href="libbigarray.html#sec477"><span>Chapter 29</span>&nbsp;&nbsp;The bigarray library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="libbigarray.html#sec478">1&nbsp;&nbsp;Module <span class="c007">Bigarray</span>: large, multi-dimensional, numerical arrays</a>
</li><li class="li-toc"><a href="libbigarray.html#sec479">2&nbsp;&nbsp;Big arrays in the OCaml-C interface</a>
<ul class="ftoc4"><li class="li-toc">
<a href="libbigarray.html#sec480">2.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="libbigarray.html#sec481">2.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="libbigarray.html#sec482">2.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml big array</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec483">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>