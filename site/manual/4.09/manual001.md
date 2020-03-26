<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="maintitle">
&nbsp;<span style="font-size:xx-large"><span style="font-size:150%">The OCaml system <br>
 release 4.09<br>
<span style="font-size:x-large">Documentation and user’s manual <br>
<span style="font-size:large">Xavier Leroy, <br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon <br>
 September&nbsp;11, 2019<br>
 &nbsp;
<span style="font-size:medium">Copyright © 2019 Institut National de
Recherche en Informatique et en Automatique
</span></span></span></span></span></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.09/ocaml-4.09-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.09/ocaml-4.09-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.09/ocaml-4.09-refman-html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.09/ocaml-4.09-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr style="height:2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="foreword.html#start-section">Foreword</a>
</li><li class="top"><a href="manual072.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



<h1 class="chapter" id="sec1">Contents</h1>
<ul class="toc"><li class="li-toc">
<a href="index.html#sec6">Part&nbsp;I&nbsp;&nbsp;An introduction to OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#sec7"><span>Chapter 1</span>&nbsp;&nbsp;The core language</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#sec8">1&nbsp;&nbsp;Basics</a>
</li><li class="li-toc"><a href="coreexamples.html#sec9">2&nbsp;&nbsp;Data types</a>
</li><li class="li-toc"><a href="coreexamples.html#sec10">3&nbsp;&nbsp;Functions as values</a>
</li><li class="li-toc"><a href="coreexamples.html#sec11">4&nbsp;&nbsp;Records and variants</a>
<ul class="toc"><li class="li-toc">
<a href="coreexamples.html#sec12">4.1&nbsp;&nbsp;Record and variant disambiguation</a>
</li></ul>
</li><li class="li-toc"><a href="coreexamples.html#sec13">5&nbsp;&nbsp;Imperative features</a>
</li><li class="li-toc"><a href="coreexamples.html#sec14">6&nbsp;&nbsp;Exceptions</a>
</li><li class="li-toc"><a href="coreexamples.html#sec15">7&nbsp;&nbsp;Lazy expressions</a>
</li><li class="li-toc"><a href="coreexamples.html#sec16">8&nbsp;&nbsp;Symbolic processing of expressions</a>
</li><li class="li-toc"><a href="coreexamples.html#sec17">9&nbsp;&nbsp;Pretty-printing</a>
</li><li class="li-toc"><a href="coreexamples.html#sec18">10&nbsp;&nbsp;Printf formats</a>
</li><li class="li-toc"><a href="coreexamples.html#sec19">11&nbsp;&nbsp;Standalone OCaml programs</a>
</li></ul>
</li><li class="li-toc"><a href="moduleexamples.html#sec20"><span>Chapter 2</span>&nbsp;&nbsp;The module system</a>
<ul class="toc"><li class="li-toc">
<a href="moduleexamples.html#sec21">1&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec22">2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec23">3&nbsp;&nbsp;Functors</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec24">4&nbsp;&nbsp;Functors and type abstraction</a>
</li><li class="li-toc"><a href="moduleexamples.html#sec25">5&nbsp;&nbsp;Modules and separate compilation</a>
</li></ul>
</li><li class="li-toc"><a href="objectexamples.html#sec26"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="objectexamples.html#sec27">1&nbsp;&nbsp;Classes and objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec28">2&nbsp;&nbsp;Immediate objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec29">3&nbsp;&nbsp;Reference to self</a>
</li><li class="li-toc"><a href="objectexamples.html#sec30">4&nbsp;&nbsp;Initializers</a>
</li><li class="li-toc"><a href="objectexamples.html#sec31">5&nbsp;&nbsp;Virtual methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec32">6&nbsp;&nbsp;Private methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec33">7&nbsp;&nbsp;Class interfaces</a>
</li><li class="li-toc"><a href="objectexamples.html#sec34">8&nbsp;&nbsp;Inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#sec35">9&nbsp;&nbsp;Multiple inheritance</a>
</li><li class="li-toc"><a href="objectexamples.html#sec36">10&nbsp;&nbsp;Parameterized classes</a>
</li><li class="li-toc"><a href="objectexamples.html#sec37">11&nbsp;&nbsp;Polymorphic methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec38">12&nbsp;&nbsp;Using coercions</a>
</li><li class="li-toc"><a href="objectexamples.html#sec39">13&nbsp;&nbsp;Functional objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec40">14&nbsp;&nbsp;Cloning objects</a>
</li><li class="li-toc"><a href="objectexamples.html#sec41">15&nbsp;&nbsp;Recursive classes</a>
</li><li class="li-toc"><a href="objectexamples.html#sec42">16&nbsp;&nbsp;Binary methods</a>
</li><li class="li-toc"><a href="objectexamples.html#sec43">17&nbsp;&nbsp;Friends</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#sec44"><span>Chapter 4</span>&nbsp;&nbsp;Labels and variants</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#sec45">1&nbsp;&nbsp;Labels</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#sec46">1.1&nbsp;&nbsp;Optional arguments</a>
</li><li class="li-toc"><a href="lablexamples.html#sec47">1.2&nbsp;&nbsp;Labels and type inference</a>
</li><li class="li-toc"><a href="lablexamples.html#sec48">1.3&nbsp;&nbsp;Suggestions for labeling</a>
</li></ul>
</li><li class="li-toc"><a href="lablexamples.html#sec49">2&nbsp;&nbsp;Polymorphic variants</a>
<ul class="toc"><li class="li-toc">
<a href="lablexamples.html#sec52">2.1&nbsp;&nbsp;Weaknesses of polymorphic variants</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec53"><span>Chapter 5</span>&nbsp;&nbsp;Polymorphism and its limitations</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#sec54">1&nbsp;&nbsp;Weak polymorphism and mutation</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#sec55">1.1&nbsp;&nbsp;Weakly polymorphic types</a>
</li><li class="li-toc"><a href="polymorphism.html#sec56">1.2&nbsp;&nbsp;The value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec57">1.3&nbsp;&nbsp;The relaxed value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec58">1.4&nbsp;&nbsp;Variance and value restriction</a>
</li><li class="li-toc"><a href="polymorphism.html#sec59">1.5&nbsp;&nbsp;Abstract data types</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec60">2&nbsp;&nbsp;Polymorphic recursion</a>
<ul class="toc"><li class="li-toc">
<a href="polymorphism.html#sec61">2.1&nbsp;&nbsp;Explicitly polymorphic annotations</a>
</li><li class="li-toc"><a href="polymorphism.html#sec62">2.2&nbsp;&nbsp;More examples</a>
</li></ul>
</li><li class="li-toc"><a href="polymorphism.html#sec63">3&nbsp;&nbsp;Higher-rank polymorphic functions</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec64"><span>Chapter 6</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
<ul class="toc"><li class="li-toc">
<a href="advexamples.html#sec65">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li class="li-toc"><a href="advexamples.html#sec66">2&nbsp;&nbsp;Simple modules as classes</a>
<ul class="toc"><li class="li-toc">
<a href="advexamples.html#sec67">2.1&nbsp;&nbsp;Strings</a>
</li><li class="li-toc"><a href="advexamples.html#sec69">2.2&nbsp;&nbsp;Hashtbl</a>
</li><li class="li-toc"><a href="advexamples.html#sec70">2.3&nbsp;&nbsp;Sets</a>
</li></ul>
</li><li class="li-toc"><a href="advexamples.html#sec71">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec72">Part&nbsp;II&nbsp;&nbsp;The OCaml language</a>
<ul class="toc"><li class="li-toc">
<a href="language.html#sec73"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</a>
<ul class="toc"><li class="li-toc">
<a href="lex.html#sec76">1&nbsp;&nbsp;Lexical conventions</a>
</li><li class="li-toc"><a href="values.html#sec89">2&nbsp;&nbsp;Values</a>
<ul class="toc"><li class="li-toc">
<a href="values.html#sec90">2.1&nbsp;&nbsp;Base values</a>
</li><li class="li-toc"><a href="values.html#sec95">2.2&nbsp;&nbsp;Tuples</a>
</li><li class="li-toc"><a href="values.html#sec96">2.3&nbsp;&nbsp;Records</a>
</li><li class="li-toc"><a href="values.html#sec97">2.4&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="values.html#sec98">2.5&nbsp;&nbsp;Variant values</a>
</li><li class="li-toc"><a href="values.html#sec99">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li class="li-toc"><a href="values.html#sec100">2.7&nbsp;&nbsp;Functions</a>
</li><li class="li-toc"><a href="values.html#sec101">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
</li><li class="li-toc"><a href="names.html#sec102">3&nbsp;&nbsp;Names</a>
</li><li class="li-toc"><a href="types.html#sec105">4&nbsp;&nbsp;Type expressions</a>
</li><li class="li-toc"><a href="const.html#sec116">5&nbsp;&nbsp;Constants</a>
</li><li class="li-toc"><a href="patterns.html#sec117">6&nbsp;&nbsp;Patterns</a>
</li><li class="li-toc"><a href="expr.html#s%3Avalue-expr">7&nbsp;&nbsp;Expressions</a>
<ul class="toc"><li class="li-toc">
<a href="expr.html#sec133">7.1&nbsp;&nbsp;Precedence and associativity</a>
</li><li class="li-toc"><a href="expr.html#sec134">7.2&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#sec143">7.3&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#sec150">7.4&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#sec157">7.5&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#sec158">7.6&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#sec164">7.7&nbsp;&nbsp;Coercions</a>
</li><li class="li-toc"><a href="expr.html#sec168">7.8&nbsp;&nbsp;Other</a>
</li></ul>
</li><li class="li-toc"><a href="typedecl.html#sec173">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="toc"><li class="li-toc">
<a href="typedecl.html#sec174">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="typedecl.html#sec175">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="classes.html#sec176">9&nbsp;&nbsp;Classes</a>
<ul class="toc"><li class="li-toc">
<a href="classes.html#sec177">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="classes.html#sec187">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="classes.html#sec202">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="classes.html#sec205">9.4&nbsp;&nbsp;Class specifications</a>
</li><li class="li-toc"><a href="classes.html#sec206">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="modtypes.html#sec207">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="toc"><li class="li-toc">
<a href="modtypes.html#sec208">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="modtypes.html#sec209">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="modtypes.html#sec219">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="modtypes.html#sec220">10.4&nbsp;&nbsp;The <span class="c003">with</span> operator</a>
</li></ul>
</li><li class="li-toc"><a href="modules.html#s%3Amodule-expr">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="toc"><li class="li-toc">
<a href="modules.html#sec222">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="modules.html#sec223">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="modules.html#sec233">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="compunit.html#sec236">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="extn.html#sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</a>
<ul class="toc"><li class="li-toc">
<a href="manual023.html#sec238">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="manual024.html#sec239">2&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="manual025.html#sec240">3&nbsp;&nbsp;Private types</a>
<ul class="toc"><li class="li-toc">
<a href="manual025.html#sec241">3.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="manual025.html#sec242">3.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="manual025.html#sec243">3.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="manual026.html#sec244">4&nbsp;&nbsp;Local opens for patterns</a>
</li><li class="li-toc"><a href="manual027.html#sec245">5&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="manual028.html#sec247">6&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="manual029.html#sec250">7&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="manual030.html#sec251">8&nbsp;&nbsp;Substituting inside a signature</a>
<ul class="toc"><li class="li-toc">
<a href="manual030.html#sec252">8.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li class="li-toc"><a href="manual030.html#sec253">8.2&nbsp;&nbsp;Local substitution declarations</a>
</li></ul>
</li><li class="li-toc"><a href="manual031.html#sec254">9&nbsp;&nbsp;Type-level module aliases</a>
</li><li class="li-toc"><a href="manual032.html#sec255">10&nbsp;&nbsp;Overriding in open statements</a>
</li><li class="li-toc"><a href="manual033.html#sec256">11&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li class="li-toc"><a href="manual034.html#sec263">12&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li class="li-toc"><a href="manual035.html#sec264">13&nbsp;&nbsp;Attributes</a>
<ul class="toc"><li class="li-toc">
<a href="manual035.html#sec265">13.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
</li><li class="li-toc"><a href="manual036.html#sec266">14&nbsp;&nbsp;Extension nodes</a>
<ul class="toc"><li class="li-toc">
<a href="manual036.html#sec267">14.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
</li><li class="li-toc"><a href="manual037.html#sec268">15&nbsp;&nbsp;Extensible variant types</a>
<ul class="toc"><li class="li-toc">
<a href="manual037.html#sec269">15.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
</li><li class="li-toc"><a href="manual038.html#sec270">16&nbsp;&nbsp;Generative functors</a>
</li><li class="li-toc"><a href="manual039.html#sec271">17&nbsp;&nbsp;Extension-only syntax</a>
<ul class="toc"><li class="li-toc">
<a href="manual039.html#sec272">17.1&nbsp;&nbsp;Extension operators</a>
</li><li class="li-toc"><a href="manual039.html#sec273">17.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
</li><li class="li-toc"><a href="manual040.html#sec274">18&nbsp;&nbsp;Inline records</a>
</li><li class="li-toc"><a href="manual041.html#sec275">19&nbsp;&nbsp;Documentation comments</a>
<ul class="toc"><li class="li-toc">
<a href="manual041.html#sec276">19.1&nbsp;&nbsp;Floating comments</a>
</li><li class="li-toc"><a href="manual041.html#sec277">19.2&nbsp;&nbsp;Item comments</a>
</li><li class="li-toc"><a href="manual041.html#sec278">19.3&nbsp;&nbsp;Label comments</a>
</li></ul>
</li><li class="li-toc"><a href="manual042.html#s%3Aindex-operators">20&nbsp;&nbsp;Extended indexing operators  </a>
</li><li class="li-toc"><a href="manual043.html#s%3Aempty-variants">21&nbsp;&nbsp;Empty variant types </a>
</li><li class="li-toc"><a href="manual044.html#s%3Aalerts">22&nbsp;&nbsp;Alerts  </a>
</li><li class="li-toc"><a href="manual045.html#s%3Ageneralized-open">23&nbsp;&nbsp;Generalized open statements</a>
</li><li class="li-toc"><a href="manual046.html#s%3Abinding-operators">24&nbsp;&nbsp;Binding operators </a>
<ul class="toc"><li class="li-toc">
<a href="manual046.html#sec284">24.1&nbsp;&nbsp;Rationale</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec285">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#sec286"><span>Chapter 9</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#sec287">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="comp.html#sec288">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="comp.html#sec290">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="comp.html#sec291">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="comp.html#sec292">5&nbsp;&nbsp;Warning reference</a>
<ul class="toc"><li class="li-toc">
<a href="comp.html#sec293">5.1&nbsp;&nbsp;Warning 9: missing fields in a record pattern</a>
</li><li class="li-toc"><a href="comp.html#sec294">5.2&nbsp;&nbsp;Warning 52: fragile constant pattern</a>
</li><li class="li-toc"><a href="comp.html#sec295">5.3&nbsp;&nbsp;Warning 57: Ambiguous or-pattern variables under guard</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec296"><span>Chapter 10</span>&nbsp;&nbsp;The toplevel system or REPL (ocaml)</a>
<ul class="toc"><li class="li-toc">
<a href="toplevel.html#sec297">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="toplevel.html#sec298">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="toplevel.html#sec299">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="toplevel.html#sec300">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="toplevel.html#sec301">5&nbsp;&nbsp;Building custom toplevel systems: <span class="c003">ocamlmktop</span></a>
<ul class="toc"><li class="li-toc">
<a href="toplevel.html#sec302">5.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="toplevel.html#sec303">6&nbsp;&nbsp;The native toplevel: <span class="c003">ocamlnat</span> (experimental)</a>
</li></ul>
</li><li class="li-toc"><a href="runtime.html#sec304"><span>Chapter 11</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="toc"><li class="li-toc">
<a href="runtime.html#sec305">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="runtime.html#sec306">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="runtime.html#sec307">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="runtime.html#sec308">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="native.html#sec309"><span>Chapter 12</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="toc"><li class="li-toc">
<a href="native.html#sec310">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="native.html#sec311">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="native.html#sec315">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="native.html#sec316">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="native.html#sec317">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec318"><span>Chapter 13</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#sec319">1&nbsp;&nbsp;Overview of <span class="c003">ocamllex</span></a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#sec320">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec321">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#sec322">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec323">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec324">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="lexyacc.html#sec325">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec326">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec327">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="lexyacc.html#sec328">2.7&nbsp;&nbsp;Refill handlers</a>
</li><li class="li-toc"><a href="lexyacc.html#sec329">2.8&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec330">3&nbsp;&nbsp;Overview of <span class="c003">ocamlyacc</span></a>
</li><li class="li-toc"><a href="lexyacc.html#sec331">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="toc"><li class="li-toc">
<a href="lexyacc.html#sec332">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="lexyacc.html#sec333">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="lexyacc.html#sec334">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="lexyacc.html#sec335">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="lexyacc.html#sec336">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="lexyacc.html#sec337">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="lexyacc.html#sec338">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="depend.html#sec339"><span>Chapter 14</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="toc"><li class="li-toc">
<a href="depend.html#sec340">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="depend.html#sec341">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="browser.html#sec342"><span>Chapter 15</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec343"><span>Chapter 16</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#sec344">1&nbsp;&nbsp;Usage</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#sec345">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec354">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec355">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec356">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#sec357">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec360">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec361">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec362">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec368">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec371">3&nbsp;&nbsp;Custom generators</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#sec372">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="ocamldoc.html#sec373">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="ocamldoc.html#sec376">4&nbsp;&nbsp;Adding command line options</a>
<ul class="toc"><li class="li-toc">
<a href="ocamldoc.html#sec377">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec380"><span>Chapter 17</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#sec381">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="debugger.html#sec382">2&nbsp;&nbsp;Invocation</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#sec383">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec384">2.2&nbsp;&nbsp;Initialization file</a>
</li><li class="li-toc"><a href="debugger.html#sec385">2.3&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec386">3&nbsp;&nbsp;Commands</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#sec387">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="debugger.html#sec388">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec389">4&nbsp;&nbsp;Executing a program</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#sec390">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="debugger.html#sec391">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="debugger.html#sec392">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="debugger.html#sec393">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="debugger.html#sec394">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec395">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="debugger.html#sec396">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="debugger.html#sec397">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="debugger.html#sec398">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="toc"><li class="li-toc">
<a href="debugger.html#sec399">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="debugger.html#sec400">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="debugger.html#sec401">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="debugger.html#sec402">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="debugger.html#sec403">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="debugger.html#sec404">8.6&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="debugger.html#sec405">8.7&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="debugger.html#sec406">8.8&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="debugger.html#sec407">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="debugger.html#sec408">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="profil.html#sec409"><span>Chapter 18</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="toc"><li class="li-toc">
<a href="profil.html#sec410">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="profil.html#sec414">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="profil.html#sec415">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="profil.html#sec416">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="manual057.html#sec417"><span>Chapter 19</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
</li><li class="li-toc"><a href="intfc.html#c%3Aintf-c"><span>Chapter 20</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec419">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec420">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec421">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="intfc.html#sec422">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec423">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="intfc.html#sec424">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="intfc.html#sec425">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec426">2&nbsp;&nbsp;The <span class="c003">value</span> type</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec427">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="intfc.html#sec428">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec429">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec430">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec431">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="intfc.html#sec432">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="intfc.html#sec433">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="intfc.html#sec434">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="intfc.html#sec435">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="intfc.html#sec436">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec437">4&nbsp;&nbsp;Operations on values</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec438">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="intfc.html#sec439">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="intfc.html#sec440">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec441">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec444">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec445">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec446">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="intfc.html#sec452">5.2&nbsp;&nbsp;Low-level interface</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec453">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="intfc.html#sec454">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec455">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="intfc.html#sec457">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec458">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="intfc.html#sec459">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="intfc.html#sec460">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec464">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="intfc.html#sec465">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec466">9.1&nbsp;&nbsp;The <span class="c003">struct custom_operations</span></a>
</li><li class="li-toc"><a href="intfc.html#sec467">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec468">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="intfc.html#sec469">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="intfc.html#sec470">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="intfc.html#sec471">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec472">10&nbsp;&nbsp;Advanced topic: Bigarrays and the OCaml-C interface</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec473">10.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="intfc.html#sec474">10.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="intfc.html#sec475">10.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml Bigarray</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec476">11&nbsp;&nbsp;Advanced topic: cheaper C call</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec477">11.1&nbsp;&nbsp;Passing unboxed values</a>
</li><li class="li-toc"><a href="intfc.html#sec478">11.2&nbsp;&nbsp;Direct C call</a>
</li><li class="li-toc"><a href="intfc.html#sec479">11.3&nbsp;&nbsp;Example: calling C library functions without indirection</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec480">12&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="toc"><li class="li-toc">
<a href="intfc.html#sec481">12.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="intfc.html#sec482">12.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="intfc.html#sec483">13&nbsp;&nbsp;Advanced topic: interfacing with Windows Unicode APIs</a>
</li><li class="li-toc"><a href="intfc.html#sec485">14&nbsp;&nbsp;Building mixed C/OCaml libraries: <span class="c003">ocamlmklib</span></a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec487"><span>Chapter 21</span>&nbsp;&nbsp;Optimisation with Flambda</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec488">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="flambda.html#sec489">2&nbsp;&nbsp;Command-line flags</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec491">2.1&nbsp;&nbsp;Specification of optimisation parameters by round</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec492">3&nbsp;&nbsp;Inlining</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec494">3.1&nbsp;&nbsp;Classic inlining heuristic</a>
</li><li class="li-toc"><a href="flambda.html#sec495">3.2&nbsp;&nbsp;Overview of “Flambda” inlining heuristics</a>
</li><li class="li-toc"><a href="flambda.html#sec496">3.3&nbsp;&nbsp;Handling of specific language constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec500">3.4&nbsp;&nbsp;Inlining reports</a>
</li><li class="li-toc"><a href="flambda.html#sec501">3.5&nbsp;&nbsp;Assessment of inlining benefit</a>
</li><li class="li-toc"><a href="flambda.html#sec502">3.6&nbsp;&nbsp;Control of speculation</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec503">4&nbsp;&nbsp;Specialisation</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec506">4.1&nbsp;&nbsp;Assessment of specialisation benefit</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec507">5&nbsp;&nbsp;Default settings of parameters</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec508">5.1&nbsp;&nbsp;Settings at -O2 optimisation level</a>
</li><li class="li-toc"><a href="flambda.html#sec509">5.2&nbsp;&nbsp;Settings at -O3 optimisation level</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec510">6&nbsp;&nbsp;Manual control of inlining and specialisation</a>
</li><li class="li-toc"><a href="flambda.html#sec512">7&nbsp;&nbsp;Simplification</a>
</li><li class="li-toc"><a href="flambda.html#sec513">8&nbsp;&nbsp;Other code motion transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec514">8.1&nbsp;&nbsp;Lifting of constants</a>
</li><li class="li-toc"><a href="flambda.html#sec516">8.2&nbsp;&nbsp;Lifting of toplevel let bindings</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec517">9&nbsp;&nbsp;Unboxing transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec518">9.1&nbsp;&nbsp;Unboxing of closure variables</a>
</li><li class="li-toc"><a href="flambda.html#sec520">9.2&nbsp;&nbsp;Unboxing of specialised arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec522">9.3&nbsp;&nbsp;Unboxing of closures</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec525">10&nbsp;&nbsp;Removal of unused code and values</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec526">10.1&nbsp;&nbsp;Removal of redundant let expressions</a>
</li><li class="li-toc"><a href="flambda.html#sec527">10.2&nbsp;&nbsp;Removal of redundant program constructs</a>
</li><li class="li-toc"><a href="flambda.html#sec528">10.3&nbsp;&nbsp;Removal of unused arguments</a>
</li><li class="li-toc"><a href="flambda.html#sec529">10.4&nbsp;&nbsp;Removal of unused closure variables</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec530">11&nbsp;&nbsp;Other code transformations</a>
<ul class="toc"><li class="li-toc">
<a href="flambda.html#sec531">11.1&nbsp;&nbsp;Transformation of non-escaping references into mutable variables</a>
</li><li class="li-toc"><a href="flambda.html#sec532">11.2&nbsp;&nbsp;Substitution of closure variables for specialised arguments</a>
</li></ul>
</li><li class="li-toc"><a href="flambda.html#sec533">12&nbsp;&nbsp;Treatment of effects</a>
</li><li class="li-toc"><a href="flambda.html#sec534">13&nbsp;&nbsp;Compilation of statically-allocated modules</a>
</li><li class="li-toc"><a href="flambda.html#sec535">14&nbsp;&nbsp;Inhibition of optimisation</a>
</li><li class="li-toc"><a href="flambda.html#sec536">15&nbsp;&nbsp;Use of unsafe operations</a>
</li><li class="li-toc"><a href="flambda.html#sec537">16&nbsp;&nbsp;Glossary</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#sec538"><span>Chapter 22</span>&nbsp;&nbsp;Memory profiling with Spacetime</a>
<ul class="toc"><li class="li-toc">
<a href="spacetime.html#sec539">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="spacetime.html#sec540">2&nbsp;&nbsp;How to use it</a>
<ul class="toc"><li class="li-toc">
<a href="spacetime.html#sec541">2.1&nbsp;&nbsp;Building</a>
</li><li class="li-toc"><a href="spacetime.html#sec542">2.2&nbsp;&nbsp;Running</a>
</li><li class="li-toc"><a href="spacetime.html#sec543">2.3&nbsp;&nbsp;Analysis</a>
</li></ul>
</li><li class="li-toc"><a href="spacetime.html#sec544">3&nbsp;&nbsp;Runtime overhead</a>
</li><li class="li-toc"><a href="spacetime.html#sec545">4&nbsp;&nbsp;For developers</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#sec546"><span>Chapter 23</span>&nbsp;&nbsp;Fuzzing with afl-fuzz</a>
<ul class="toc"><li class="li-toc">
<a href="afl-fuzz.html#sec547">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="afl-fuzz.html#sec548">2&nbsp;&nbsp;Generating instrumentation</a>
<ul class="toc"><li class="li-toc">
<a href="afl-fuzz.html#sec549">2.1&nbsp;&nbsp;Advanced options</a>
</li></ul>
</li><li class="li-toc"><a href="afl-fuzz.html#sec550">3&nbsp;&nbsp;Example</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec551">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="toc"><li class="li-toc">
<a href="core.html#sec552"><span>Chapter 24</span>&nbsp;&nbsp;The core library</a>
<ul class="toc"><li class="li-toc">
<a href="core.html#sec554">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
</li><li class="li-toc"><a href="core.html#sec557">2&nbsp;&nbsp;Module <span class="c003">Stdlib</span>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="stdlib.html#sec558"><span>Chapter 25</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="parsing.html#sec560"><span>Chapter 26</span>&nbsp;&nbsp;The compiler front-end</a>
</li><li class="li-toc"><a href="libunix.html#sec561"><span>Chapter 27</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="libnum.html#sec562"><span>Chapter 28</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="libstr.html#sec563"><span>Chapter 29</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="libthreads.html#sec564"><span>Chapter 30</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="libgraph.html#sec565"><span>Chapter 31</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="libdynlink.html#sec566"><span>Chapter 32</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="libbigarray.html#sec567"><span>Chapter 33</span>&nbsp;&nbsp;The bigarray library</a>
</li></ul>
</li><li class="li-toc"><a href="index.html#sec568">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>