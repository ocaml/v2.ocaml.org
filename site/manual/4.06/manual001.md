<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.06<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 November&nbsp;3, 2017<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2013 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.06/ocaml-4.06-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual049.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



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
</li><li class="li-toc"><a href="polymorphism.html#sec50"><span>Chapter 5</span>&nbsp;&nbsp;Polymorphism and its limitations</a>
<ul class="ftoc3"><li class="li-toc">
<a href="polymorphism.html#sec51">1&nbsp;&nbsp;Weak polymorphism and mutation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="polymorphism.html#sec52">1.1&nbsp;&nbsp;Weakly polymorphic types</a>
</li><li class="li-toc"><a href="polymorphism.html#sec53">1.2&nbsp;&nbsp;The value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec54">1.3&nbsp;&nbsp;The relaxed value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec55">1.4&nbsp;&nbsp;Variance and value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec56">1.5&nbsp;&nbsp;Abstract data types</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec57">2&nbsp;&nbsp;Polymorphic recursion</a>
<ul class="ftoc4"><li class="li-toc">
<a href="polymorphism.html#sec58">2.1&nbsp;&nbsp;Explicitly polymorphic annotations</a>
</li><li class="li-toc"><a href="polymorphism.html#sec59">2.2&nbsp;&nbsp;More examples</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec60">3&nbsp;&nbsp;Higher-rank polymorphic functions</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec61"><span>Chapter 6</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
<ul class="ftoc3"><li class="li-toc">
<a href="advexamples.html#sec62">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li class="li-toc"><a href="advexamples.html#sec63">2&nbsp;&nbsp;Simple modules as classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="advexamples.html#sec64">2.1&nbsp;&nbsp;Strings</a>
</li><li class="li-toc"><a href="advexamples.html#sec66">2.2&nbsp;&nbsp;Hashtbl</a>
</li><li class="li-toc"><a href="advexamples.html#sec67">2.3&nbsp;&nbsp;Sets</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec68">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec69">Part&nbsp;II&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc2"><li class="li-toc">
<a href="language.html#sec70"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lex.html#sec73">1&nbsp;&nbsp;Lexical conventions</a>
</li><li class="li-toc"><a href="values.html#sec86">2&nbsp;&nbsp;Values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="values.html#sec87">2.1&nbsp;&nbsp;Base values</a>
</li><li class="li-toc"><a href="values.html#sec92">2.2&nbsp;&nbsp;Tuples</a>
</li><li class="li-toc"><a href="values.html#sec93">2.3&nbsp;&nbsp;Records</a>
</li><li class="li-toc"><a href="values.html#sec94">2.4&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="values.html#sec95">2.5&nbsp;&nbsp;Variant values</a>
</li><li class="li-toc"><a href="values.html#sec96">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li class="li-toc"><a href="values.html#sec97">2.7&nbsp;&nbsp;Functions</a>
</li><li class="li-toc"><a href="values.html#sec98">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
</li><li class="li-toc"><a href="names.html#sec99">3&nbsp;&nbsp;Names</a>
</li><li class="li-toc"><a href="types.html#sec102">4&nbsp;&nbsp;Type expressions</a>
</li><li class="li-toc"><a href="const.html#sec113">5&nbsp;&nbsp;Constants</a>
</li><li class="li-toc"><a href="patterns.html#sec114">6&nbsp;&nbsp;Patterns</a>
</li><li class="li-toc"><a href="expr.html#s%3Avalue-expr">7&nbsp;&nbsp;Expressions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="expr.html#sec128">7.1&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#sec137">7.2&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#sec144">7.3&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#sec151">7.4&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#sec152">7.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#sec158">7.6&nbsp;&nbsp;Coercions</a>
</li><li class="li-toc"><a href="expr.html#sec162">7.7&nbsp;&nbsp;Other</a>
</li></ul>
</li><li class="li-toc"><a href="typedecl.html#sec167">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="typedecl.html#sec168">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="typedecl.html#sec169">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="classes.html#sec170">9&nbsp;&nbsp;Classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="classes.html#sec171">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="classes.html#sec181">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="classes.html#sec196">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="classes.html#sec199">9.4&nbsp;&nbsp;Class specifications</a>
</li><li class="li-toc"><a href="classes.html#sec200">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="modtypes.html#sec201">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modtypes.html#sec202">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="modtypes.html#sec203">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="modtypes.html#sec213">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="modtypes.html#sec214">10.4&nbsp;&nbsp;The <span class="c003">with</span> operator</a>
</li></ul>
</li><li class="li-toc"><a href="modules.html#s%3Amodule-expr">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="modules.html#sec216">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="modules.html#sec217">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="modules.html#sec227">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="compunit.html#sec230">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec231"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</a>
<ul class="ftoc3"><li class="li-toc">
<a href="extn.html#sec232">1&nbsp;&nbsp;Integer literals for types <span class="c003">int32</span>, <span class="c003">int64</span>
and <span class="c003">nativeint</span></a>
</li><li class="li-toc"><a href="extn.html#sec233">2&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="extn.html#sec234">3&nbsp;&nbsp;Lazy patterns</a>
</li><li class="li-toc"><a href="extn.html#sec235">4&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="extn.html#sec236">5&nbsp;&nbsp;Private types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec237">5.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="extn.html#sec238">5.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="extn.html#sec239">5.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec240">6&nbsp;&nbsp;Local opens for patterns</a>
</li><li class="li-toc"><a href="extn.html#sec241">7&nbsp;&nbsp;Object copy short notations</a>
</li><li class="li-toc"><a href="extn.html#sec242">8&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="extn.html#sec244">9&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="extn.html#sec247">10&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="extn.html#sec248">11&nbsp;&nbsp;Substituting inside a signature</a>
</li><li class="li-toc"><a href="extn.html#sec249">12&nbsp;&nbsp;Type-level module aliases</a>
</li><li class="li-toc"><a href="extn.html#sec250">13&nbsp;&nbsp;Overriding in open statements</a>
</li><li class="li-toc"><a href="extn.html#sec251">14&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li class="li-toc"><a href="extn.html#sec258">15&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li class="li-toc"><a href="extn.html#sec259">16&nbsp;&nbsp;Attributes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec260">16.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec261">17&nbsp;&nbsp;Extension nodes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec262">17.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec263">18&nbsp;&nbsp;Quoted strings</a>
</li><li class="li-toc"><a href="extn.html#sec264">19&nbsp;&nbsp;Exception cases in pattern matching</a>
</li><li class="li-toc"><a href="extn.html#sec265">20&nbsp;&nbsp;Extensible variant types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec266">20.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec267">21&nbsp;&nbsp;Generative functors</a>
</li><li class="li-toc"><a href="extn.html#sec268">22&nbsp;&nbsp;Extension-only syntax</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec269">22.1&nbsp;&nbsp;Extension operators</a>
</li><li class="li-toc"><a href="extn.html#sec270">22.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec271">23&nbsp;&nbsp;Inline records</a>
</li><li class="li-toc"><a href="extn.html#sec272">24&nbsp;&nbsp;Local exceptions</a>
</li><li class="li-toc"><a href="extn.html#sec273">25&nbsp;&nbsp;Documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="extn.html#sec274">25.1&nbsp;&nbsp;Floating comments</a>
</li><li class="li-toc"><a href="extn.html#sec275">25.2&nbsp;&nbsp;Item comments</a>
</li><li class="li-toc"><a href="extn.html#sec276">25.3&nbsp;&nbsp;Label comments</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#s%3Aindex-operators">26&nbsp;&nbsp;Extended indexing operators  </a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec278">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="ftoc2"><li class="li-toc">
<a href="comp.html#sec279"><span>Chapter 9</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="comp.html#sec280">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="comp.html#sec281">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="comp.html#sec283">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="comp.html#sec284">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="comp.html#sec285">5&nbsp;&nbsp;Warning reference</a>
<ul class="ftoc4"><li class="li-toc">
<a href="comp.html#sec286">5.1&nbsp;&nbsp;Warning 9: missing fields in a record pattern</a>
</li><li class="li-toc"><a href="comp.html#sec287">5.2&nbsp;&nbsp;Warning 52: fragile constant pattern</a>
</li><li class="li-toc"><a href="comp.html#sec288">5.3&nbsp;&nbsp;Warning 57: Ambiguous or-pattern variables under guard</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec289"><span>Chapter 10</span>&nbsp;&nbsp;The toplevel system or REPL (ocaml)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="toplevel.html#sec290">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="toplevel.html#sec291">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="toplevel.html#sec292">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="toplevel.html#sec293">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="toplevel.html#sec294">5&nbsp;&nbsp;Building custom toplevel systems: <span class="c003">ocamlmktop</span></a>
<ul class="ftoc4"><li class="li-toc">
<a href="toplevel.html#sec295">5.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec296">6&nbsp;&nbsp;The native toplevel: <span class="c003">ocamlnat</span> (experimental)</a>
</li></ul>
</li><li class="li-toc"><a href="runtime.html#sec297"><span>Chapter 11</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="runtime.html#sec298">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="runtime.html#sec299">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="runtime.html#sec300">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="runtime.html#sec301">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="native.html#sec302"><span>Chapter 12</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="native.html#sec303">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="native.html#sec304">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="native.html#sec308">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="native.html#sec309">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="native.html#sec310">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec311"><span>Chapter 13</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lexyacc.html#sec312">1&nbsp;&nbsp;Overview of <span class="c003">ocamllex</span></a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec313">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec314">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec315">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec316">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec317">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="lexyacc.html#sec318">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec319">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec320">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec321">2.7&nbsp;&nbsp;Refill handlers</a>
</li><li class="li-toc"><a href="lexyacc.html#sec322">2.8&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec323">3&nbsp;&nbsp;Overview of <span class="c003">ocamlyacc</span></a>
</li><li class="li-toc"><a href="lexyacc.html#sec324">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="lexyacc.html#sec325">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec326">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="lexyacc.html#sec327">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="lexyacc.html#sec328">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec329">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="lexyacc.html#sec330">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="lexyacc.html#sec331">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="depend.html#sec332"><span>Chapter 14</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="depend.html#sec333">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="depend.html#sec334">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="browser.html#sec335"><span>Chapter 15</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec336"><span>Chapter 16</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="ocamldoc.html#sec337">1&nbsp;&nbsp;Usage</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec338">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec347">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec348">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec349">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec350">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec353">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec354">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec355">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec361">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec364">3&nbsp;&nbsp;Custom generators</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec365">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec366">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec369">4&nbsp;&nbsp;Adding command line options</a>
<ul class="ftoc4"><li class="li-toc">
<a href="ocamldoc.html#sec370">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec373"><span>Chapter 17</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="debugger.html#sec374">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="debugger.html#sec375">2&nbsp;&nbsp;Invocation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec376">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec377">2.2&nbsp;&nbsp;Initialization file</a>
</li><li class="li-toc"><a href="debugger.html#sec378">2.3&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec379">3&nbsp;&nbsp;Commands</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec380">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="debugger.html#sec381">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec382">4&nbsp;&nbsp;Executing a program</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec383">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="debugger.html#sec384">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="debugger.html#sec385">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="debugger.html#sec386">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="debugger.html#sec387">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec388">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="debugger.html#sec389">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="debugger.html#sec390">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="debugger.html#sec391">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="ftoc4"><li class="li-toc">
<a href="debugger.html#sec392">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="debugger.html#sec393">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="debugger.html#sec394">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="debugger.html#sec395">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="debugger.html#sec396">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="debugger.html#sec397">8.6&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="debugger.html#sec398">8.7&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec399">8.8&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec400">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="debugger.html#sec401">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="profil.html#sec402"><span>Chapter 18</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="profil.html#sec403">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="profil.html#sec407">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="profil.html#sec408">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="profil.html#sec409">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#sec411"><span>Chapter 19</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
</li><li class="li-toc"><a href="intfc.html#c%3Aintf-c"><span>Chapter 20</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="intfc.html#sec413">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec414">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec415">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec416">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec417">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec418">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="intfc.html#sec419">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec420">2&nbsp;&nbsp;The <span class="c003">value</span> type</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec421">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="intfc.html#sec422">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec423">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec424">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec425">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="intfc.html#sec426">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="intfc.html#sec427">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="intfc.html#sec428">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="intfc.html#sec429">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="intfc.html#sec430">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec431">4&nbsp;&nbsp;Operations on values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec432">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="intfc.html#sec433">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="intfc.html#sec434">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec435">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec438">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec439">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec440">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="intfc.html#sec446">5.2&nbsp;&nbsp;Low-level interface</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec447">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="intfc.html#sec448">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec449">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="intfc.html#sec451">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec452">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec453">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="intfc.html#sec454">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec458">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="intfc.html#sec459">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec460">9.1&nbsp;&nbsp;The <span class="c003">struct custom_operations</span></a>
</li><li class="li-toc"><a href="intfc.html#sec461">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec462">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec463">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="intfc.html#sec464">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="intfc.html#sec465">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec466">10&nbsp;&nbsp;Advanced topic: cheaper C call</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec467">10.1&nbsp;&nbsp;Passing unboxed values</a>
</li><li class="li-toc"><a href="intfc.html#sec468">10.2&nbsp;&nbsp;Direct C call</a>
</li><li class="li-toc"><a href="intfc.html#sec469">10.3&nbsp;&nbsp;Example: calling C library functions without indirection</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec470">11&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="ftoc4"><li class="li-toc">
<a href="intfc.html#sec471">11.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="intfc.html#sec472">11.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec473">12&nbsp;&nbsp;Advanced topic: interfacing with Windows Unicode APIs</a>
</li><li class="li-toc"><a href="intfc.html#sec475">13&nbsp;&nbsp;Building mixed C/OCaml libraries: <span class="c003">ocamlmklib</span></a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec477"><span>Chapter 21</span>&nbsp;&nbsp;Optimisation with Flambda</a>
<ul class="ftoc3"><li class="li-toc">
<a href="flambda.html#sec478">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="flambda.html#sec479">2&nbsp;&nbsp;Command-line flags</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec481">2.1&nbsp;&nbsp;Specification of optimisation parameters by round</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec482">3&nbsp;&nbsp;Inlining</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec484">3.1&nbsp;&nbsp;Classic inlining heuristic</a>
</li><li class="li-toc"><a href="flambda.html#sec485">3.2&nbsp;&nbsp;Overview of “Flambda” inlining heuristics</a>
</li><li class="li-toc"><a href="flambda.html#sec486">3.3&nbsp;&nbsp;Handling of specific language constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec490">3.4&nbsp;&nbsp;Inlining reports</a>
</li><li class="li-toc"><a href="flambda.html#sec491">3.5&nbsp;&nbsp;Assessment of inlining benefit</a>
</li><li class="li-toc"><a href="flambda.html#sec492">3.6&nbsp;&nbsp;Control of speculation</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec493">4&nbsp;&nbsp;Specialisation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec496">4.1&nbsp;&nbsp;Assessment of specialisation benefit</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec497">5&nbsp;&nbsp;Default settings of parameters</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec498">5.1&nbsp;&nbsp;Settings at -O2 optimisation level</a>
</li><li class="li-toc"><a href="flambda.html#sec499">5.2&nbsp;&nbsp;Settings at -O3 optimisation level</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec500">6&nbsp;&nbsp;Manual control of inlining and specialisation</a>
</li><li class="li-toc"><a href="flambda.html#sec502">7&nbsp;&nbsp;Simplification</a>
</li><li class="li-toc"><a href="flambda.html#sec503">8&nbsp;&nbsp;Other code motion transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec504">8.1&nbsp;&nbsp;Lifting of constants</a>
</li><li class="li-toc"><a href="flambda.html#sec506">8.2&nbsp;&nbsp;Lifting of toplevel let bindings</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec507">9&nbsp;&nbsp;Unboxing transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec508">9.1&nbsp;&nbsp;Unboxing of closure variables</a>
</li><li class="li-toc"><a href="flambda.html#sec510">9.2&nbsp;&nbsp;Unboxing of specialised arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec512">9.3&nbsp;&nbsp;Unboxing of closures</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec515">10&nbsp;&nbsp;Removal of unused code and values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec516">10.1&nbsp;&nbsp;Removal of redundant let expressions</a>
</li><li class="li-toc"><a href="flambda.html#sec517">10.2&nbsp;&nbsp;Removal of redundant program constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec518">10.3&nbsp;&nbsp;Removal of unused arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec519">10.4&nbsp;&nbsp;Removal of unused closure variables</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec520">11&nbsp;&nbsp;Other code transformations</a>
<ul class="ftoc4"><li class="li-toc">
<a href="flambda.html#sec521">11.1&nbsp;&nbsp;Transformation of non-escaping references into mutable variables</a>
</li><li class="li-toc"><a href="flambda.html#sec522">11.2&nbsp;&nbsp;Substitution of closure variables for specialised arguments</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec523">12&nbsp;&nbsp;Treatment of effects</a>
</li><li class="li-toc"><a href="flambda.html#sec524">13&nbsp;&nbsp;Compilation of statically-allocated modules</a>
</li><li class="li-toc"><a href="flambda.html#sec525">14&nbsp;&nbsp;Inhibition of optimisation</a>
</li><li class="li-toc"><a href="flambda.html#sec526">15&nbsp;&nbsp;Use of unsafe operations</a>
</li><li class="li-toc"><a href="flambda.html#sec527">16&nbsp;&nbsp;Glossary</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#sec528"><span>Chapter 22</span>&nbsp;&nbsp;Memory profiling with Spacetime</a>
<ul class="ftoc3"><li class="li-toc">
<a href="spacetime.html#sec529">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="spacetime.html#sec530">2&nbsp;&nbsp;How to use it</a>
<ul class="ftoc4"><li class="li-toc">
<a href="spacetime.html#sec531">2.1&nbsp;&nbsp;Building</a>
</li><li class="li-toc"><a href="spacetime.html#sec532">2.2&nbsp;&nbsp;Running</a>
</li><li class="li-toc"><a href="spacetime.html#sec533">2.3&nbsp;&nbsp;Analysis</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#sec534">3&nbsp;&nbsp;Runtime overhead</a>
</li><li class="li-toc"><a href="spacetime.html#sec535">4&nbsp;&nbsp;For developers</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#sec536"><span>Chapter 23</span>&nbsp;&nbsp;Fuzzing with afl-fuzz</a>
<ul class="ftoc3"><li class="li-toc">
<a href="afl-fuzz.html#sec537">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="afl-fuzz.html#sec538">2&nbsp;&nbsp;Generating instrumentation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="afl-fuzz.html#sec539">2.1&nbsp;&nbsp;Advanced options</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#sec540">3&nbsp;&nbsp;Example</a>
</li></ul>
</li><li class="li-toc"><a href="plugins.html#c%3Aplugins"><span>Chapter 24</span>&nbsp;&nbsp;Compiler plugins</a>
<ul class="ftoc3"><li class="li-toc">
<a href="plugins.html#sec542">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="plugins.html#sec543">2&nbsp;&nbsp;Basic example</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec544">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="ftoc2"><li class="li-toc">
<a href="core.html#sec545"><span>Chapter 25</span>&nbsp;&nbsp;The core library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="core.html#sec547">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
</li><li class="li-toc"><a href="core.html#sec550">2&nbsp;&nbsp;Module <span class="c003">Pervasives</span>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="stdlib.html#sec551"><span>Chapter 26</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="parsing.html#sec553"><span>Chapter 27</span>&nbsp;&nbsp;The compiler front-end</a>
</li><li class="li-toc"><a href="libunix.html#sec554"><span>Chapter 28</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="libnum.html#sec555"><span>Chapter 29</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="libstr.html#sec556"><span>Chapter 30</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="libthreads.html#sec557"><span>Chapter 31</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="libgraph.html#sec558"><span>Chapter 32</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="libdynlink.html#sec559"><span>Chapter 33</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="libbigarray.html#sec560"><span>Chapter 34</span>&nbsp;&nbsp;The bigarray library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="libbigarray.html#sec561">1&nbsp;&nbsp;Module <span class="c003">Bigarray</span>: large, multi-dimensional, numerical arrays</a>
</li><li class="li-toc"><a href="libbigarray.html#sec562">2&nbsp;&nbsp;Big arrays in the OCaml-C interface</a>
<ul class="ftoc4"><li class="li-toc">
<a href="libbigarray.html#sec563">2.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="libbigarray.html#sec564">2.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="libbigarray.html#sec565">2.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml big array</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec566">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>