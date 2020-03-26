<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.03<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 April&nbsp;25, 2016<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.03/ocaml-4.03-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.03</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual045.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



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
</li><li class="li-toc"><a href="coreexamples.html#sec15">8&nbsp;&nbsp;Pretty-printing</a>
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
<a href="expr.html#sec117">7.1&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#sec125">7.2&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#sec132">7.3&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#sec139">7.4&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#sec140">7.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#sec146">7.6&nbsp;&nbsp;Coercions</a>
</li><li class="li-toc"><a href="expr.html#sec150">7.7&nbsp;&nbsp;Other</a>
</li></ul>
</li><li class="li-toc"><a href="typedecl.html#sec154">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="typedecl.html#sec155">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="typedecl.html#sec156">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="classes.html#sec157">9&nbsp;&nbsp;Classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="classes.html#sec158">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="classes.html#sec167">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="classes.html#sec180">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="classes.html#sec183">9.4&nbsp;&nbsp;Class specifications</a>
</li><li class="li-toc"><a href="classes.html#sec184">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="modtypes.html#sec185">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modtypes.html#sec186">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="modtypes.html#sec187">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="modtypes.html#sec197">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="modtypes.html#sec198">10.4&nbsp;&nbsp;The <span class="c006">with</span> operator</a>
</li></ul>
</li><li class="li-toc"><a href="modules.html#s%3Amodule-expr">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modules.html#sec200">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="modules.html#sec201">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="modules.html#sec211">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="compunit.html#sec214">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec215"><span>Chapter 7</span>&nbsp;&nbsp;Language extensions</a>
<ul class="ftoc3"><li class="li-toc">
<a href="extn.html#sec216">1&nbsp;&nbsp;Integer literals for types <span class="c006">int32</span>, <span class="c006">int64</span>
and <span class="c006">nativeint</span></a>
</li><li class="li-toc"><a href="extn.html#sec217">2&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="extn.html#sec218">3&nbsp;&nbsp;Lazy patterns</a>
</li><li class="li-toc"><a href="extn.html#sec219">4&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="extn.html#sec220">5&nbsp;&nbsp;Private types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec221">5.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="extn.html#sec222">5.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="extn.html#sec223">5.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec224">6&nbsp;&nbsp;Local opens</a>
</li><li class="li-toc"><a href="extn.html#sec226">7&nbsp;&nbsp;Record and object notations</a>
</li><li class="li-toc"><a href="extn.html#sec227">8&nbsp;&nbsp;Explicit polymorphic type annotations</a>
</li><li class="li-toc"><a href="extn.html#sec228">9&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="extn.html#sec230">10&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="extn.html#sec233">11&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="extn.html#sec234">12&nbsp;&nbsp;Substituting inside a signature</a>
</li><li class="li-toc"><a href="extn.html#sec235">13&nbsp;&nbsp;Type-level module aliases</a>
</li><li class="li-toc"><a href="extn.html#sec236">14&nbsp;&nbsp;Explicit overriding in class definitions</a>
</li><li class="li-toc"><a href="extn.html#sec237">15&nbsp;&nbsp;Overriding in open statements</a>
</li><li class="li-toc"><a href="extn.html#sec238">16&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li class="li-toc"><a href="extn.html#sec244">17&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li class="li-toc"><a href="extn.html#sec245">18&nbsp;&nbsp;Attributes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec246">18.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec247">19&nbsp;&nbsp;Extension nodes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec248">19.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec249">20&nbsp;&nbsp;Quoted strings</a>
</li><li class="li-toc"><a href="extn.html#sec250">21&nbsp;&nbsp;Exception cases in pattern matching</a>
</li><li class="li-toc"><a href="extn.html#sec251">22&nbsp;&nbsp;Extensible variant types</a>
</li><li class="li-toc"><a href="extn.html#sec252">23&nbsp;&nbsp;Generative functors</a>
</li><li class="li-toc"><a href="extn.html#sec253">24&nbsp;&nbsp;Extension-only syntax</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec254">24.1&nbsp;&nbsp;Extension operators</a>
</li><li class="li-toc"><a href="extn.html#sec255">24.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec256">25&nbsp;&nbsp;Inline records</a>
</li><li class="li-toc"><a href="extn.html#sec257">26&nbsp;&nbsp;Documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec258">26.1&nbsp;&nbsp;Floating comments</a>
</li><li class="li-toc"><a href="extn.html#sec259">26.2&nbsp;&nbsp;Item comments</a>
</li><li class="li-toc"><a href="extn.html#sec260">26.3&nbsp;&nbsp;Label comments</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec261">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="ftoc2"><li class="li-toc">
<a href="comp.html#sec262"><span>Chapter 8</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="comp.html#sec263">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="comp.html#sec264">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="comp.html#sec265">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="comp.html#sec266">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="comp.html#sec267">5&nbsp;&nbsp;Warning reference</a>
<ul class="ftoc4"><li class="li-toc">
<a href="comp.html#sec268">5.1&nbsp;&nbsp;Warning 52: fragile constant pattern</a>
</li><li class="li-toc"><a href="comp.html#sec269">5.2&nbsp;&nbsp;Warning 57: Ambiguous or-pattern variables under guard</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec270"><span>Chapter 9</span>&nbsp;&nbsp;The toplevel system (ocaml)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="toplevel.html#sec271">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="toplevel.html#sec272">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="toplevel.html#sec273">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="toplevel.html#sec274">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="toplevel.html#sec275">5&nbsp;&nbsp;Building custom toplevel systems: <span class="c006">ocamlmktop</span></a>
</li><li class="li-toc"><a href="toplevel.html#sec276">6&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="runtime.html#sec277"><span>Chapter 10</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="runtime.html#sec278">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="runtime.html#sec279">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="runtime.html#sec280">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="runtime.html#sec281">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="native.html#sec282"><span>Chapter 11</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="native.html#sec283">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="native.html#sec284">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="native.html#sec288">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="native.html#sec289">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="native.html#sec290">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec291"><span>Chapter 12</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lexyacc.html#sec292">1&nbsp;&nbsp;Overview of <span class="c006">ocamllex</span></a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec293">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec294">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec295">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec296">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec297">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="lexyacc.html#sec298">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec299">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec300">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec301">2.7&nbsp;&nbsp;Refill handlers</a>
</li><li class="li-toc"><a href="lexyacc.html#sec302">2.8&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec303">3&nbsp;&nbsp;Overview of <span class="c006">ocamlyacc</span></a>
</li><li class="li-toc"><a href="lexyacc.html#sec304">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec305">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec306">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="lexyacc.html#sec307">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="lexyacc.html#sec308">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec309">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="lexyacc.html#sec310">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="lexyacc.html#sec311">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="depend.html#sec312"><span>Chapter 13</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="depend.html#sec313">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="depend.html#sec314">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="browser.html#sec315"><span>Chapter 14</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="browser.html#sec316">1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="browser.html#sec317">2&nbsp;&nbsp;Viewer</a>
</li><li class="li-toc"><a href="browser.html#sec318">3&nbsp;&nbsp;Module browsing</a>
</li><li class="li-toc"><a href="browser.html#sec319">4&nbsp;&nbsp;File editor</a>
</li><li class="li-toc"><a href="browser.html#sec320">5&nbsp;&nbsp;Shell</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec321"><span>Chapter 15</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="ocamldoc.html#sec322">1&nbsp;&nbsp;Usage</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec323">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec332">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec333">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec334">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec335">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec338">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec339">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec340">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec346">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec349">3&nbsp;&nbsp;Custom generators</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec350">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec351">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec354">4&nbsp;&nbsp;Adding command line options</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec355">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec358"><span>Chapter 16</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="debugger.html#sec359">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="debugger.html#sec360">2&nbsp;&nbsp;Invocation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec361">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec362">2.2&nbsp;&nbsp;Initialization file</a>
</li><li class="li-toc"><a href="debugger.html#sec363">2.3&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec364">3&nbsp;&nbsp;Commands</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec365">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="debugger.html#sec366">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec367">4&nbsp;&nbsp;Executing a program</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec368">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="debugger.html#sec369">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="debugger.html#sec370">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="debugger.html#sec371">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="debugger.html#sec372">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec373">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="debugger.html#sec374">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="debugger.html#sec375">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="debugger.html#sec376">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec377">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="debugger.html#sec378">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="debugger.html#sec379">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="debugger.html#sec380">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="debugger.html#sec381">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="debugger.html#sec382">8.6&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="debugger.html#sec383">8.7&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec384">8.8&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec385">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="debugger.html#sec386">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="profil.html#sec387"><span>Chapter 17</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="profil.html#sec388">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="profil.html#sec392">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="profil.html#sec393">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="profil.html#sec394">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="manual032.html#sec396"><span>Chapter 18</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
</li><li class="li-toc"><a href="intfc.html#c%3Aintf-c"><span>Chapter 19</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="intfc.html#sec398">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec399">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec400">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec401">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec402">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec403">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="intfc.html#sec404">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec405">2&nbsp;&nbsp;The <span class="c006">value</span> type</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec406">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="intfc.html#sec407">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec408">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec409">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec410">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="intfc.html#sec411">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="intfc.html#sec412">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="intfc.html#sec413">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="intfc.html#sec414">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="intfc.html#sec415">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec416">4&nbsp;&nbsp;Operations on values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec417">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="intfc.html#sec418">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="intfc.html#sec419">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec420">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec423">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec424">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec425">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="intfc.html#sec430">5.2&nbsp;&nbsp;Low-level interface</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec431">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="intfc.html#sec432">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec433">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="intfc.html#sec435">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec436">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec437">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="intfc.html#sec438">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec441">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="intfc.html#sec442">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec443">9.1&nbsp;&nbsp;The <span class="c006">struct custom_operations</span></a>
</li><li class="li-toc"><a href="intfc.html#sec444">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec445">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec446">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="intfc.html#sec447">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="intfc.html#sec448">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec449">10&nbsp;&nbsp;Advanced topic: cheaper C call</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec450">10.1&nbsp;&nbsp;Passing unboxed values</a>
</li><li class="li-toc"><a href="intfc.html#sec451">10.2&nbsp;&nbsp;Direct C call</a>
</li><li class="li-toc"><a href="intfc.html#sec452">10.3&nbsp;&nbsp;Example: calling C library functions without indirection</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec453">11&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec454">11.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="intfc.html#sec455">11.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec456">12&nbsp;&nbsp;Building mixed C/OCaml libraries: <span class="c006">ocamlmklib</span></a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec458"><span>Chapter 20</span>&nbsp;&nbsp;Optimisation with Flambda</a>
<ul class="ftoc3"><li class="li-toc">
<a href="flambda.html#sec459">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="flambda.html#sec460">2&nbsp;&nbsp;Command-line flags</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec462">2.1&nbsp;&nbsp;Specification of optimisation parameters by round</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec463">3&nbsp;&nbsp;Inlining</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec465">3.1&nbsp;&nbsp;Classic inlining heuristic</a>
</li><li class="li-toc"><a href="flambda.html#sec466">3.2&nbsp;&nbsp;Overview of “Flambda” inlining heuristics</a>
</li><li class="li-toc"><a href="flambda.html#sec467">3.3&nbsp;&nbsp;Handling of specific language constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec471">3.4&nbsp;&nbsp;Inlining reports</a>
</li><li class="li-toc"><a href="flambda.html#sec472">3.5&nbsp;&nbsp;Assessment of inlining benefit</a>
</li><li class="li-toc"><a href="flambda.html#sec473">3.6&nbsp;&nbsp;Control of speculation</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec474">4&nbsp;&nbsp;Specialisation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec477">4.1&nbsp;&nbsp;Assessment of specialisation benefit</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec478">5&nbsp;&nbsp;Default settings of parameters</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec479">5.1&nbsp;&nbsp;Settings at -O2 optimisation level</a>
</li><li class="li-toc"><a href="flambda.html#sec480">5.2&nbsp;&nbsp;Settings at -O3 optimisation level</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec481">6&nbsp;&nbsp;Manual control of inlining and specialisation</a>
</li><li class="li-toc"><a href="flambda.html#sec483">7&nbsp;&nbsp;Simplification</a>
</li><li class="li-toc"><a href="flambda.html#sec484">8&nbsp;&nbsp;Other code motion transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec485">8.1&nbsp;&nbsp;Lifting of constants</a>
</li><li class="li-toc"><a href="flambda.html#sec487">8.2&nbsp;&nbsp;Lifting of toplevel let bindings</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec488">9&nbsp;&nbsp;Unboxing transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec489">9.1&nbsp;&nbsp;Unboxing of closure variables</a>
</li><li class="li-toc"><a href="flambda.html#sec491">9.2&nbsp;&nbsp;Unboxing of specialised arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec493">9.3&nbsp;&nbsp;Unboxing of closures</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec496">10&nbsp;&nbsp;Removal of unused code and values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec497">10.1&nbsp;&nbsp;Removal of redundant let expressions</a>
</li><li class="li-toc"><a href="flambda.html#sec498">10.2&nbsp;&nbsp;Removal of redundant program constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec499">10.3&nbsp;&nbsp;Removal of unused arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec500">10.4&nbsp;&nbsp;Removal of unused closure variables</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec501">11&nbsp;&nbsp;Other code transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec502">11.1&nbsp;&nbsp;Transformation of non-escaping references into mutable variables</a>
</li><li class="li-toc"><a href="flambda.html#sec503">11.2&nbsp;&nbsp;Substitution of closure variables for specialised arguments</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec504">12&nbsp;&nbsp;Treatment of effects</a>
</li><li class="li-toc"><a href="flambda.html#sec505">13&nbsp;&nbsp;Compilation of statically-allocated modules</a>
</li><li class="li-toc"><a href="flambda.html#sec506">14&nbsp;&nbsp;Inhibition of optimisation</a>
</li><li class="li-toc"><a href="flambda.html#sec507">15&nbsp;&nbsp;Use of unsafe operations</a>
</li><li class="li-toc"><a href="flambda.html#sec508">16&nbsp;&nbsp;Glossary</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec509">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="ftoc2"><li class="li-toc">
<a href="core.html#sec510"><span>Chapter 21</span>&nbsp;&nbsp;The core library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="core.html#sec512">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
</li><li class="li-toc"><a href="core.html#sec515">2&nbsp;&nbsp;Module <span class="c006">Pervasives</span>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="stdlib.html#sec516"><span>Chapter 22</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="parsing.html#sec518"><span>Chapter 23</span>&nbsp;&nbsp;The compiler front-end</a>
</li><li class="li-toc"><a href="libunix.html#sec519"><span>Chapter 24</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="libnum.html#sec520"><span>Chapter 25</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="libstr.html#sec521"><span>Chapter 26</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="libthreads.html#sec522"><span>Chapter 27</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="libgraph.html#sec523"><span>Chapter 28</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="libdynlink.html#sec524"><span>Chapter 29</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="libbigarray.html#sec525"><span>Chapter 30</span>&nbsp;&nbsp;The bigarray library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="libbigarray.html#sec526">1&nbsp;&nbsp;Module <span class="c006">Bigarray</span>: large, multi-dimensional, numerical arrays</a>
</li><li class="li-toc"><a href="libbigarray.html#sec527">2&nbsp;&nbsp;Big arrays in the OCaml-C interface</a>
<ul class="ftoc4"><li class="li-toc">
<a href="libbigarray.html#sec528">2.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="libbigarray.html#sec529">2.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="libbigarray.html#sec530">2.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml big array</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec531">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>