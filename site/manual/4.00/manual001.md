<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"></ul>


<div class="center">
&nbsp;<font size="7">The OCaml system<br>
 release 4.00<br>
</font><font size="5">Documentation and user’s manual<br>
</font><font size="4">Xavier Leroy,<br>
 Damien Doligez, Alain Frisch, Jacques Garrigue, Didier Rémy and Jérôme Vouillon<br>
 July&nbsp;26, 2012<br>
 &nbsp;
</font><font size="3">Copyright © 2012 Institut National de
Recherche en Informatique et en Automatique
</font></div><blockquote class="quote">

This manual is also available in
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.pdf">PDF</a>.
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.ps.gz">Postscript</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.dvi.gz">DVI</a>,
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.txt">plain text</a>,
as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.html.tar.gz">bundle of HTML files</a>,
and as a
<a href="http://caml.inria.fr/distrib/ocaml-4.00/ocaml-4.00-refman.info.tar.gz">bundle of Emacs Info files</a>.
<hr size="2">
</blockquote><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The OCaml Manual</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual001.html#start-section">Contents</a>
</li><li><a href="manual002.html#start-section">Foreword</a>
</li><li class="top"><a href="manual044.html#start-section">Index of keywords</a></li></ul></nav></header><a id="start-section"></a><section id="section">



<h1 class="chapter">Contents</h1><ul class="ftoc1"><li class="li-toc">
<a href="index.html#htoc1">Part&nbsp;I&nbsp;&nbsp;An introduction to OCaml</a>
<ul class="ftoc2"><li class="li-toc">
<a href="manual003.html#htoc2"><span>Chapter 1</span>&nbsp;&nbsp;The core language</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual003.html#htoc3">1&nbsp;&nbsp;Basics</a>
</li><li class="li-toc"><a href="manual003.html#htoc4">2&nbsp;&nbsp;Data types</a>
</li><li class="li-toc"><a href="manual003.html#htoc5">3&nbsp;&nbsp;Functions as values</a>
</li><li class="li-toc"><a href="manual003.html#htoc6">4&nbsp;&nbsp;Records and variants</a>
</li><li class="li-toc"><a href="manual003.html#htoc7">5&nbsp;&nbsp;Imperative features</a>
</li><li class="li-toc"><a href="manual003.html#htoc8">6&nbsp;&nbsp;Exceptions</a>
</li><li class="li-toc"><a href="manual003.html#htoc9">7&nbsp;&nbsp;Symbolic processing of expressions</a>
</li><li class="li-toc"><a href="manual003.html#htoc10">8&nbsp;&nbsp;Pretty-printing and parsing</a>
</li><li class="li-toc"><a href="manual003.html#htoc11">9&nbsp;&nbsp;Standalone OCaml programs</a>
</li></ul>
</li><li class="li-toc"><a href="manual004.html#htoc12"><span>Chapter 2</span>&nbsp;&nbsp;The module system</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual004.html#htoc13">1&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="manual004.html#htoc14">2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="manual004.html#htoc15">3&nbsp;&nbsp;Functors</a>
</li><li class="li-toc"><a href="manual004.html#htoc16">4&nbsp;&nbsp;Functors and type abstraction</a>
</li><li class="li-toc"><a href="manual004.html#htoc17">5&nbsp;&nbsp;Modules and separate compilation</a>
</li></ul>
</li><li class="li-toc"><a href="manual005.html#htoc18"><span>Chapter 3</span>&nbsp;&nbsp;Objects in OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual005.html#htoc19">1&nbsp;&nbsp;Classes and objects</a>
</li><li class="li-toc"><a href="manual005.html#htoc20">2&nbsp;&nbsp;Immediate objects</a>
</li><li class="li-toc"><a href="manual005.html#htoc21">3&nbsp;&nbsp;Reference to self</a>
</li><li class="li-toc"><a href="manual005.html#htoc22">4&nbsp;&nbsp;Initializers</a>
</li><li class="li-toc"><a href="manual005.html#htoc23">5&nbsp;&nbsp;Virtual methods</a>
</li><li class="li-toc"><a href="manual005.html#htoc24">6&nbsp;&nbsp;Private methods</a>
</li><li class="li-toc"><a href="manual005.html#htoc25">7&nbsp;&nbsp;Class interfaces</a>
</li><li class="li-toc"><a href="manual005.html#htoc26">8&nbsp;&nbsp;Inheritance</a>
</li><li class="li-toc"><a href="manual005.html#htoc27">9&nbsp;&nbsp;Multiple inheritance</a>
</li><li class="li-toc"><a href="manual005.html#htoc28">10&nbsp;&nbsp;Parameterized classes</a>
</li><li class="li-toc"><a href="manual005.html#htoc29">11&nbsp;&nbsp;Polymorphic methods</a>
</li><li class="li-toc"><a href="manual005.html#htoc30">12&nbsp;&nbsp;Using coercions</a>
</li><li class="li-toc"><a href="manual005.html#htoc31">13&nbsp;&nbsp;Functional objects</a>
</li><li class="li-toc"><a href="manual005.html#htoc32">14&nbsp;&nbsp;Cloning objects</a>
</li><li class="li-toc"><a href="manual005.html#htoc33">15&nbsp;&nbsp;Recursive classes</a>
</li><li class="li-toc"><a href="manual005.html#htoc34">16&nbsp;&nbsp;Binary methods</a>
</li><li class="li-toc"><a href="manual005.html#htoc35">17&nbsp;&nbsp;Friends</a>
</li></ul>
</li><li class="li-toc"><a href="manual006.html#htoc36"><span>Chapter 4</span>&nbsp;&nbsp;Labels and variants</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual006.html#htoc37">1&nbsp;&nbsp;Labels</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual006.html#htoc38">1.1&nbsp;&nbsp;Optional arguments</a>
</li><li class="li-toc"><a href="manual006.html#htoc39">1.2&nbsp;&nbsp;Labels and type inference</a>
</li><li class="li-toc"><a href="manual006.html#htoc40">1.3&nbsp;&nbsp;Suggestions for labeling</a>
</li></ul>
</li><li class="li-toc"><a href="manual006.html#htoc41">2&nbsp;&nbsp;Polymorphic variants</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual006.html#htoc42">2.1&nbsp;&nbsp;Weaknesses of polymorphic variants</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="manual007.html#htoc43"><span>Chapter 5</span>&nbsp;&nbsp;Advanced examples with classes and modules</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual007.html#htoc44">1&nbsp;&nbsp;Extended example: bank accounts</a>
</li><li class="li-toc"><a href="manual007.html#htoc45">2&nbsp;&nbsp;Simple modules as classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual007.html#htoc46">2.1&nbsp;&nbsp;Strings</a>
</li><li class="li-toc"><a href="manual007.html#htoc47">2.2&nbsp;&nbsp;Hashtbl</a>
</li><li class="li-toc"><a href="manual007.html#htoc48">2.3&nbsp;&nbsp;Sets</a>
</li></ul>
</li><li class="li-toc"><a href="manual007.html#htoc49">3&nbsp;&nbsp;The subject/observer pattern</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#htoc50">Part&nbsp;II&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc2"><li class="li-toc">
<a href="language.html#htoc51"><span>Chapter 6</span>&nbsp;&nbsp;The OCaml language</a>
<ul class="ftoc3"><li class="li-toc">
<a href="lex.html#htoc52">1&nbsp;&nbsp;Lexical conventions</a>
</li><li class="li-toc"><a href="manual010.html#htoc53">2&nbsp;&nbsp;Values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual010.html#htoc54">2.1&nbsp;&nbsp;Base values</a>
</li><li class="li-toc"><a href="manual010.html#htoc55">2.2&nbsp;&nbsp;Tuples</a>
</li><li class="li-toc"><a href="manual010.html#htoc56">2.3&nbsp;&nbsp;Records</a>
</li><li class="li-toc"><a href="manual010.html#htoc57">2.4&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="manual010.html#htoc58">2.5&nbsp;&nbsp;Variant values</a>
</li><li class="li-toc"><a href="manual010.html#htoc59">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li class="li-toc"><a href="manual010.html#htoc60">2.7&nbsp;&nbsp;Functions</a>
</li><li class="li-toc"><a href="manual010.html#htoc61">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
</li><li class="li-toc"><a href="manual011.html#htoc62">3&nbsp;&nbsp;Names</a>
</li><li class="li-toc"><a href="types.html#htoc63">4&nbsp;&nbsp;Type expressions</a>
</li><li class="li-toc"><a href="manual013.html#htoc64">5&nbsp;&nbsp;Constants</a>
</li><li class="li-toc"><a href="patterns.html#htoc65">6&nbsp;&nbsp;Patterns</a>
</li><li class="li-toc"><a href="expr.html#htoc66">7&nbsp;&nbsp;Expressions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="expr.html#htoc67">7.1&nbsp;&nbsp;Basic expressions</a>
</li><li class="li-toc"><a href="expr.html#htoc68">7.2&nbsp;&nbsp;Control structures</a>
</li><li class="li-toc"><a href="expr.html#htoc69">7.3&nbsp;&nbsp;Operations on data structures</a>
</li><li class="li-toc"><a href="expr.html#htoc70">7.4&nbsp;&nbsp;Operators</a>
</li><li class="li-toc"><a href="expr.html#htoc71">7.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="expr.html#htoc72">7.6&nbsp;&nbsp;Coercions</a>
</li></ul>
</li><li class="li-toc"><a href="manual016.html#htoc73">8&nbsp;&nbsp;Type and exception definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual016.html#htoc74">8.1&nbsp;&nbsp;Type definitions</a>
</li><li class="li-toc"><a href="manual016.html#htoc75">8.2&nbsp;&nbsp;Exception definitions</a>
</li></ul>
</li><li class="li-toc"><a href="manual017.html#htoc76">9&nbsp;&nbsp;Classes</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual017.html#htoc77">9.1&nbsp;&nbsp;Class types</a>
</li><li class="li-toc"><a href="manual017.html#htoc78">9.2&nbsp;&nbsp;Class expressions</a>
</li><li class="li-toc"><a href="manual017.html#htoc79">9.3&nbsp;&nbsp;Class definitions</a>
</li><li class="li-toc"><a href="manual017.html#htoc80">9.4&nbsp;&nbsp;Class specification</a>
</li><li class="li-toc"><a href="manual017.html#htoc81">9.5&nbsp;&nbsp;Class type definitions</a>
</li></ul>
</li><li class="li-toc"><a href="manual018.html#htoc82">10&nbsp;&nbsp;Module types (module specifications)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual018.html#htoc83">10.1&nbsp;&nbsp;Simple module types</a>
</li><li class="li-toc"><a href="manual018.html#htoc84">10.2&nbsp;&nbsp;Signatures</a>
</li><li class="li-toc"><a href="manual018.html#htoc85">10.3&nbsp;&nbsp;Functor types</a>
</li><li class="li-toc"><a href="manual018.html#htoc86">10.4&nbsp;&nbsp;The <tt>with</tt> operator</a>
</li></ul>
</li><li class="li-toc"><a href="manual019.html#htoc87">11&nbsp;&nbsp;Module expressions (module implementations)</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual019.html#htoc88">11.1&nbsp;&nbsp;Simple module expressions</a>
</li><li class="li-toc"><a href="manual019.html#htoc89">11.2&nbsp;&nbsp;Structures</a>
</li><li class="li-toc"><a href="manual019.html#htoc90">11.3&nbsp;&nbsp;Functors</a>
</li></ul>
</li><li class="li-toc"><a href="manual020.html#htoc91">12&nbsp;&nbsp;Compilation units</a>
</li></ul>
</li><li class="li-toc"><a href="manual021.html#htoc92"><span>Chapter 7</span>&nbsp;&nbsp;Language extensions</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual021.html#htoc93">1&nbsp;&nbsp;Integer literals for types <tt>int32</tt>, <tt>int64</tt>
and <tt>nativeint</tt></a>
</li><li class="li-toc"><a href="manual021.html#htoc94">2&nbsp;&nbsp;Streams and stream parsers</a>
</li><li class="li-toc"><a href="manual021.html#htoc95">3&nbsp;&nbsp;Recursive definitions of values</a>
</li><li class="li-toc"><a href="manual021.html#htoc96">4&nbsp;&nbsp;Range patterns</a>
</li><li class="li-toc"><a href="manual021.html#htoc97">5&nbsp;&nbsp;Assertion checking</a>
</li><li class="li-toc"><a href="manual021.html#htoc98">6&nbsp;&nbsp;Lazy evaluation</a>
</li><li class="li-toc"><a href="manual021.html#htoc99">7&nbsp;&nbsp;Local modules</a>
</li><li class="li-toc"><a href="manual021.html#htoc100">8&nbsp;&nbsp;Recursive modules</a>
</li><li class="li-toc"><a href="manual021.html#htoc101">9&nbsp;&nbsp;Private types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual021.html#htoc102">9.1&nbsp;&nbsp;Private variant and record types</a>
</li><li class="li-toc"><a href="manual021.html#htoc103">9.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li class="li-toc"><a href="manual021.html#htoc104">9.3&nbsp;&nbsp;Private row types</a>
</li></ul>
</li><li class="li-toc"><a href="manual021.html#htoc105">10&nbsp;&nbsp;Local opens</a>
</li><li class="li-toc"><a href="manual021.html#htoc106">11&nbsp;&nbsp;Record notations</a>
</li><li class="li-toc"><a href="manual021.html#htoc107">12&nbsp;&nbsp;Explicit polymorphic type annotations</a>
</li><li class="li-toc"><a href="manual021.html#htoc108">13&nbsp;&nbsp;Locally abstract types</a>
</li><li class="li-toc"><a href="manual021.html#htoc109">14&nbsp;&nbsp;First-class modules</a>
</li><li class="li-toc"><a href="manual021.html#htoc110">15&nbsp;&nbsp;Recovering the type of a module</a>
</li><li class="li-toc"><a href="manual021.html#htoc111">16&nbsp;&nbsp;Substituting inside a signature</a>
</li><li class="li-toc"><a href="manual021.html#htoc112">17&nbsp;&nbsp;Explicit overriding in class definitions</a>
</li><li class="li-toc"><a href="manual021.html#htoc113">18&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#htoc114">Part&nbsp;III&nbsp;&nbsp;The OCaml tools</a>
<ul class="ftoc2"><li class="li-toc">
<a href="manual022.html#htoc115"><span>Chapter 8</span>&nbsp;&nbsp;Batch compilation (ocamlc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual022.html#htoc116">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="manual022.html#htoc117">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual022.html#htoc118">3&nbsp;&nbsp;Modules and the file system</a>
</li><li class="li-toc"><a href="manual022.html#htoc119">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="manual023.html#htoc120"><span>Chapter 9</span>&nbsp;&nbsp;The toplevel system (ocaml)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual023.html#htoc121">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual023.html#htoc122">2&nbsp;&nbsp;Toplevel directives</a>
</li><li class="li-toc"><a href="manual023.html#htoc123">3&nbsp;&nbsp;The toplevel and the module system</a>
</li><li class="li-toc"><a href="manual023.html#htoc124">4&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="manual023.html#htoc125">5&nbsp;&nbsp;Building custom toplevel systems: <tt>ocamlmktop</tt></a>
</li><li class="li-toc"><a href="manual023.html#htoc126">6&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="manual024.html#htoc127"><span>Chapter 10</span>&nbsp;&nbsp;The runtime system (ocamlrun)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual024.html#htoc128">1&nbsp;&nbsp;Overview</a>
</li><li class="li-toc"><a href="manual024.html#htoc129">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual024.html#htoc130">3&nbsp;&nbsp;Dynamic loading of shared libraries</a>
</li><li class="li-toc"><a href="manual024.html#htoc131">4&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="manual025.html#htoc132"><span>Chapter 11</span>&nbsp;&nbsp;Native-code compilation (ocamlopt)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual025.html#htoc133">1&nbsp;&nbsp;Overview of the compiler</a>
</li><li class="li-toc"><a href="manual025.html#htoc134">2&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual025.html#htoc135">3&nbsp;&nbsp;Common errors</a>
</li><li class="li-toc"><a href="manual025.html#htoc136">4&nbsp;&nbsp;Running executables produced by ocamlopt</a>
</li><li class="li-toc"><a href="manual025.html#htoc137">5&nbsp;&nbsp;Compatibility with the bytecode compiler</a>
</li></ul>
</li><li class="li-toc"><a href="manual026.html#htoc138"><span>Chapter 12</span>&nbsp;&nbsp;Lexer and parser generators (ocamllex, ocamlyacc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual026.html#htoc139">1&nbsp;&nbsp;Overview of <tt>ocamllex</tt></a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual026.html#htoc140">1.1&nbsp;&nbsp;Options</a>
</li></ul>
</li><li class="li-toc"><a href="manual026.html#htoc141">2&nbsp;&nbsp;Syntax of lexer definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual026.html#htoc142">2.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="manual026.html#htoc143">2.2&nbsp;&nbsp;Naming regular expressions</a>
</li><li class="li-toc"><a href="manual026.html#htoc144">2.3&nbsp;&nbsp;Entry points</a>
</li><li class="li-toc"><a href="manual026.html#htoc145">2.4&nbsp;&nbsp;Regular expressions</a>
</li><li class="li-toc"><a href="manual026.html#htoc146">2.5&nbsp;&nbsp;Actions</a>
</li><li class="li-toc"><a href="manual026.html#htoc147">2.6&nbsp;&nbsp;Variables in regular expressions</a>
</li><li class="li-toc"><a href="manual026.html#htoc148">2.7&nbsp;&nbsp;Reserved identifiers</a>
</li></ul>
</li><li class="li-toc"><a href="manual026.html#htoc149">3&nbsp;&nbsp;Overview of <tt>ocamlyacc</tt></a>
</li><li class="li-toc"><a href="manual026.html#htoc150">4&nbsp;&nbsp;Syntax of grammar definitions</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual026.html#htoc151">4.1&nbsp;&nbsp;Header and trailer</a>
</li><li class="li-toc"><a href="manual026.html#htoc152">4.2&nbsp;&nbsp;Declarations</a>
</li><li class="li-toc"><a href="manual026.html#htoc153">4.3&nbsp;&nbsp;Rules</a>
</li><li class="li-toc"><a href="manual026.html#htoc154">4.4&nbsp;&nbsp;Error handling</a>
</li></ul>
</li><li class="li-toc"><a href="manual026.html#htoc155">5&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual026.html#htoc156">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="manual026.html#htoc157">7&nbsp;&nbsp;Common errors</a>
</li></ul>
</li><li class="li-toc"><a href="manual027.html#htoc158"><span>Chapter 13</span>&nbsp;&nbsp;Dependency generator (ocamldep)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual027.html#htoc159">1&nbsp;&nbsp;Options</a>
</li><li class="li-toc"><a href="manual027.html#htoc160">2&nbsp;&nbsp;A typical Makefile</a>
</li></ul>
</li><li class="li-toc"><a href="manual028.html#htoc161"><span>Chapter 14</span>&nbsp;&nbsp;The browser/editor (ocamlbrowser)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual028.html#htoc162">1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="manual028.html#htoc163">2&nbsp;&nbsp;Viewer</a>
</li><li class="li-toc"><a href="manual028.html#htoc164">3&nbsp;&nbsp;Module browsing</a>
</li><li class="li-toc"><a href="manual028.html#htoc165">4&nbsp;&nbsp;File editor</a>
</li><li class="li-toc"><a href="manual028.html#htoc166">5&nbsp;&nbsp;Shell</a>
</li></ul>
</li><li class="li-toc"><a href="manual029.html#htoc167"><span>Chapter 15</span>&nbsp;&nbsp;The documentation generator (ocamldoc)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual029.html#htoc168">1&nbsp;&nbsp;Usage</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual029.html#htoc169">1.1&nbsp;&nbsp;Invocation</a>
</li><li class="li-toc"><a href="manual029.html#htoc170">1.2&nbsp;&nbsp;Merging of module information</a>
</li><li class="li-toc"><a href="manual029.html#htoc171">1.3&nbsp;&nbsp;Coding rules</a>
</li></ul>
</li><li class="li-toc"><a href="manual029.html#htoc172">2&nbsp;&nbsp;Syntax of documentation comments</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual029.html#htoc173">2.1&nbsp;&nbsp;Placement of documentation comments</a>
</li><li class="li-toc"><a href="manual029.html#htoc174">2.2&nbsp;&nbsp;The Stop special comment</a>
</li><li class="li-toc"><a href="manual029.html#htoc175">2.3&nbsp;&nbsp;Syntax of documentation comments</a>
</li><li class="li-toc"><a href="manual029.html#htoc176">2.4&nbsp;&nbsp;Text formatting</a>
</li><li class="li-toc"><a href="manual029.html#htoc177">2.5&nbsp;&nbsp;Documentation tags (@-tags)</a>
</li></ul>
</li><li class="li-toc"><a href="manual029.html#htoc178">3&nbsp;&nbsp;Custom generators</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual029.html#htoc179">3.1&nbsp;&nbsp;The generator modules</a>
</li><li class="li-toc"><a href="manual029.html#htoc180">3.2&nbsp;&nbsp;Handling custom tags</a>
</li></ul>
</li><li class="li-toc"><a href="manual029.html#htoc181">4&nbsp;&nbsp;Adding command line options</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual029.html#htoc182">4.1&nbsp;&nbsp;Compilation and usage</a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="manual030.html#htoc183"><span>Chapter 16</span>&nbsp;&nbsp;The debugger (ocamldebug)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual030.html#htoc184">1&nbsp;&nbsp;Compiling for debugging</a>
</li><li class="li-toc"><a href="manual030.html#htoc185">2&nbsp;&nbsp;Invocation</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual030.html#htoc186">2.1&nbsp;&nbsp;Starting the debugger</a>
</li><li class="li-toc"><a href="manual030.html#htoc187">2.2&nbsp;&nbsp;Exiting the debugger</a>
</li></ul>
</li><li class="li-toc"><a href="manual030.html#htoc188">3&nbsp;&nbsp;Commands</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual030.html#htoc189">3.1&nbsp;&nbsp;Getting help</a>
</li><li class="li-toc"><a href="manual030.html#htoc190">3.2&nbsp;&nbsp;Accessing the debugger state</a>
</li></ul>
</li><li class="li-toc"><a href="manual030.html#htoc191">4&nbsp;&nbsp;Executing a program</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual030.html#htoc192">4.1&nbsp;&nbsp;Events</a>
</li><li class="li-toc"><a href="manual030.html#htoc193">4.2&nbsp;&nbsp;Starting the debugged program</a>
</li><li class="li-toc"><a href="manual030.html#htoc194">4.3&nbsp;&nbsp;Running the program</a>
</li><li class="li-toc"><a href="manual030.html#htoc195">4.4&nbsp;&nbsp;Time travel</a>
</li><li class="li-toc"><a href="manual030.html#htoc196">4.5&nbsp;&nbsp;Killing the program</a>
</li></ul>
</li><li class="li-toc"><a href="manual030.html#htoc197">5&nbsp;&nbsp;Breakpoints</a>
</li><li class="li-toc"><a href="manual030.html#htoc198">6&nbsp;&nbsp;The call stack</a>
</li><li class="li-toc"><a href="manual030.html#htoc199">7&nbsp;&nbsp;Examining variable values</a>
</li><li class="li-toc"><a href="manual030.html#htoc200">8&nbsp;&nbsp;Controlling the debugger</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual030.html#htoc201">8.1&nbsp;&nbsp;Setting the program name and arguments</a>
</li><li class="li-toc"><a href="manual030.html#htoc202">8.2&nbsp;&nbsp;How programs are loaded</a>
</li><li class="li-toc"><a href="manual030.html#htoc203">8.3&nbsp;&nbsp;Search path for files</a>
</li><li class="li-toc"><a href="manual030.html#htoc204">8.4&nbsp;&nbsp;Working directory</a>
</li><li class="li-toc"><a href="manual030.html#htoc205">8.5&nbsp;&nbsp;Turning reverse execution on and off</a>
</li><li class="li-toc"><a href="manual030.html#htoc206">8.6&nbsp;&nbsp;Communication between the debugger and the program</a>
</li><li class="li-toc"><a href="manual030.html#htoc207">8.7&nbsp;&nbsp;Fine-tuning the debugger</a>
</li><li class="li-toc"><a href="manual030.html#htoc208">8.8&nbsp;&nbsp;User-defined printers</a>
</li></ul>
</li><li class="li-toc"><a href="manual030.html#htoc209">9&nbsp;&nbsp;Miscellaneous commands</a>
</li><li class="li-toc"><a href="manual030.html#htoc210">10&nbsp;&nbsp;Running the debugger under Emacs</a>
</li></ul>
</li><li class="li-toc"><a href="manual031.html#htoc211"><span>Chapter 17</span>&nbsp;&nbsp;Profiling (ocamlprof)</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual031.html#htoc212">1&nbsp;&nbsp;Compiling for profiling</a>
</li><li class="li-toc"><a href="manual031.html#htoc213">2&nbsp;&nbsp;Profiling an execution</a>
</li><li class="li-toc"><a href="manual031.html#htoc214">3&nbsp;&nbsp;Printing profiling information</a>
</li><li class="li-toc"><a href="manual031.html#htoc215">4&nbsp;&nbsp;Time profiling</a>
</li></ul>
</li><li class="li-toc"><a href="manual032.html#htoc216"><span>Chapter 18</span>&nbsp;&nbsp;The ocamlbuild compilation manager</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual032.html#htoc217">1&nbsp;&nbsp;Features of <tt>ocamlbuild</tt></a>
</li><li class="li-toc"><a href="manual032.html#htoc218">2&nbsp;&nbsp;Limitations</a>
</li><li class="li-toc"><a href="manual032.html#htoc219">3&nbsp;&nbsp;Using <tt>ocamlbuild</tt></a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual032.html#htoc220">3.1&nbsp;&nbsp;Hygiene &amp; where is my code ?</a>
</li><li class="li-toc"><a href="manual032.html#htoc221">3.2&nbsp;&nbsp;Hello, world !</a>
</li><li class="li-toc"><a href="manual032.html#htoc222">3.3&nbsp;&nbsp;Executing my code</a>
</li><li class="li-toc"><a href="manual032.html#htoc223">3.4&nbsp;&nbsp;The log file, verbosity and debugging</a>
</li><li class="li-toc"><a href="manual032.html#htoc224">3.5&nbsp;&nbsp;Cleaning</a>
</li><li class="li-toc"><a href="manual032.html#htoc225">3.6&nbsp;&nbsp;Where and how to run <tt>ocamlbuild</tt>?</a>
</li><li class="li-toc"><a href="manual032.html#htoc226">3.7&nbsp;&nbsp;Dependencies</a>
</li><li class="li-toc"><a href="manual032.html#htoc227">3.8&nbsp;&nbsp;Native and byte-code</a>
</li><li class="li-toc"><a href="manual032.html#htoc228">3.9&nbsp;&nbsp;Compile flags</a>
</li><li class="li-toc"><a href="manual032.html#htoc229">3.10&nbsp;&nbsp;Link flags</a>
</li><li class="li-toc"><a href="manual032.html#htoc230">3.11&nbsp;&nbsp;Linking with external libraries</a>
</li><li class="li-toc"><a href="manual032.html#htoc231">3.12&nbsp;&nbsp;The <tt>_tags</tt> files</a>
</li><li class="li-toc"><a href="manual032.html#htoc232">3.13&nbsp;&nbsp;Glob patterns and expressions</a>
</li><li class="li-toc"><a href="manual032.html#htoc233">3.14&nbsp;&nbsp;Subdirectories</a>
</li><li class="li-toc"><a href="manual032.html#htoc234">3.15&nbsp;&nbsp;Grouping targets with <tt>.itarget</tt></a>
</li><li class="li-toc"><a href="manual032.html#htoc235">3.16&nbsp;&nbsp;Packing subdirectories into modules</a>
</li><li class="li-toc"><a href="manual032.html#htoc236">3.17&nbsp;&nbsp;Making an OCaml library</a>
</li><li class="li-toc"><a href="manual032.html#htoc237">3.18&nbsp;&nbsp;Making an OCaml toplevel</a>
</li><li class="li-toc"><a href="manual032.html#htoc238">3.19&nbsp;&nbsp;Preprocessor options and tags</a>
</li><li class="li-toc"><a href="manual032.html#htoc239">3.20&nbsp;&nbsp;Debugging byte code and profiling native code</a>
</li><li class="li-toc"><a href="manual032.html#htoc240">3.21&nbsp;&nbsp;Generating documentation using <tt>ocamldoc</tt></a>
</li><li class="li-toc"><a href="manual032.html#htoc241">3.22&nbsp;&nbsp;The display line</a>
</li><li class="li-toc"><a href="manual032.html#htoc242">3.23&nbsp;&nbsp;<tt>ocamllex</tt>, <tt>ocamlyacc</tt> and <tt>menhir</tt></a>
</li><li class="li-toc"><a href="manual032.html#htoc243">3.24&nbsp;&nbsp;Changing the compilers or tools</a>
</li><li class="li-toc"><a href="manual032.html#htoc244">3.25&nbsp;&nbsp;Interaction with version control systems</a>
</li><li class="li-toc"><a href="manual032.html#htoc245">3.26&nbsp;&nbsp;A shell script for driving it all?</a>
</li></ul>
</li><li class="li-toc"><a href="manual032.html#htoc246">4&nbsp;&nbsp;Appendix: Motivations</a>
</li><li class="li-toc"><a href="manual032.html#htoc247">5&nbsp;&nbsp;Appendix: Summary of default rules</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc248"><span>Chapter 19</span>&nbsp;&nbsp;Interfacing C with OCaml</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual033.html#htoc249">1&nbsp;&nbsp;Overview and compilation information</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc250">1.1&nbsp;&nbsp;Declaring primitives</a>
</li><li class="li-toc"><a href="manual033.html#htoc251">1.2&nbsp;&nbsp;Implementing primitives</a>
</li><li class="li-toc"><a href="manual033.html#htoc252">1.3&nbsp;&nbsp;Statically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="manual033.html#htoc253">1.4&nbsp;&nbsp;Dynamically linking C code with OCaml code</a>
</li><li class="li-toc"><a href="manual033.html#htoc254">1.5&nbsp;&nbsp;Choosing between static linking and dynamic linking</a>
</li><li class="li-toc"><a href="manual033.html#htoc255">1.6&nbsp;&nbsp;Building standalone custom runtime systems</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc256">2&nbsp;&nbsp;The <tt>value</tt> type</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc257">2.1&nbsp;&nbsp;Integer values</a>
</li><li class="li-toc"><a href="manual033.html#htoc258">2.2&nbsp;&nbsp;Blocks</a>
</li><li class="li-toc"><a href="manual033.html#htoc259">2.3&nbsp;&nbsp;Pointers outside the heap</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc260">3&nbsp;&nbsp;Representation of OCaml data types</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc261">3.1&nbsp;&nbsp;Atomic types</a>
</li><li class="li-toc"><a href="manual033.html#htoc262">3.2&nbsp;&nbsp;Tuples and records</a>
</li><li class="li-toc"><a href="manual033.html#htoc263">3.3&nbsp;&nbsp;Arrays</a>
</li><li class="li-toc"><a href="manual033.html#htoc264">3.4&nbsp;&nbsp;Concrete data types</a>
</li><li class="li-toc"><a href="manual033.html#htoc265">3.5&nbsp;&nbsp;Objects</a>
</li><li class="li-toc"><a href="manual033.html#htoc266">3.6&nbsp;&nbsp;Polymorphic variants</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc267">4&nbsp;&nbsp;Operations on values</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc268">4.1&nbsp;&nbsp;Kind tests</a>
</li><li class="li-toc"><a href="manual033.html#htoc269">4.2&nbsp;&nbsp;Operations on integers</a>
</li><li class="li-toc"><a href="manual033.html#htoc270">4.3&nbsp;&nbsp;Accessing blocks</a>
</li><li class="li-toc"><a href="manual033.html#htoc271">4.4&nbsp;&nbsp;Allocating blocks</a>
</li><li class="li-toc"><a href="manual033.html#htoc272">4.5&nbsp;&nbsp;Raising exceptions</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc273">5&nbsp;&nbsp;Living in harmony with the garbage collector</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc274">5.1&nbsp;&nbsp;Simple interface</a>
</li><li class="li-toc"><a href="manual033.html#htoc275">5.2&nbsp;&nbsp;Low-level interface</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc276">6&nbsp;&nbsp;A complete example</a>
</li><li class="li-toc"><a href="manual033.html#htoc277">7&nbsp;&nbsp;Advanced topic: callbacks from C to OCaml</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc278">7.1&nbsp;&nbsp;Applying OCaml closures from C</a>
</li><li class="li-toc"><a href="manual033.html#htoc279">7.2&nbsp;&nbsp;Obtaining or registering OCaml closures for use in C functions</a>
</li><li class="li-toc"><a href="manual033.html#htoc280">7.3&nbsp;&nbsp;Registering OCaml exceptions for use in C functions</a>
</li><li class="li-toc"><a href="manual033.html#htoc281">7.4&nbsp;&nbsp;Main program in C</a>
</li><li class="li-toc"><a href="manual033.html#htoc282">7.5&nbsp;&nbsp;Embedding the OCaml code in the C code</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc283">8&nbsp;&nbsp;Advanced example with callbacks</a>
</li><li class="li-toc"><a href="manual033.html#htoc284">9&nbsp;&nbsp;Advanced topic: custom blocks</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc285">9.1&nbsp;&nbsp;The <tt>struct custom_operations</tt></a>
</li><li class="li-toc"><a href="manual033.html#htoc286">9.2&nbsp;&nbsp;Allocating custom blocks</a>
</li><li class="li-toc"><a href="manual033.html#htoc287">9.3&nbsp;&nbsp;Accessing custom blocks</a>
</li><li class="li-toc"><a href="manual033.html#htoc288">9.4&nbsp;&nbsp;Writing custom serialization and deserialization functions</a>
</li><li class="li-toc"><a href="manual033.html#htoc289">9.5&nbsp;&nbsp;Choosing identifiers</a>
</li><li class="li-toc"><a href="manual033.html#htoc290">9.6&nbsp;&nbsp;Finalized blocks</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc291">10&nbsp;&nbsp;Advanced topic: multithreading</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual033.html#htoc292">10.1&nbsp;&nbsp;Registering threads created from C</a>
</li><li class="li-toc"><a href="manual033.html#htoc293">10.2&nbsp;&nbsp;Parallel execution of long-running C code</a>
</li></ul>
</li><li class="li-toc"><a href="manual033.html#htoc294">11&nbsp;&nbsp;Building mixed C/OCaml libraries: <tt>ocamlmklib</tt></a>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#htoc295">Part&nbsp;IV&nbsp;&nbsp;The OCaml library</a>
<ul class="ftoc2"><li class="li-toc">
<a href="manual034.html#htoc296"><span>Chapter 20</span>&nbsp;&nbsp;The core library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual034.html#htoc297">1&nbsp;&nbsp;Built-in types and predefined exceptions</a>
</li><li class="li-toc"><a href="manual034.html#htoc298">2&nbsp;&nbsp;Module <tt>Pervasives</tt>: the initially opened module</a>
</li></ul>
</li><li class="li-toc"><a href="manual035.html#htoc299"><span>Chapter 21</span>&nbsp;&nbsp;The standard library</a>
</li><li class="li-toc"><a href="manual036.html#htoc300"><span>Chapter 22</span>&nbsp;&nbsp;The unix library: Unix system calls</a>
</li><li class="li-toc"><a href="manual037.html#htoc301"><span>Chapter 23</span>&nbsp;&nbsp;The num library: arbitrary-precision rational arithmetic</a>
</li><li class="li-toc"><a href="manual038.html#htoc302"><span>Chapter 24</span>&nbsp;&nbsp;The str library: regular expressions and string processing</a>
</li><li class="li-toc"><a href="manual039.html#htoc303"><span>Chapter 25</span>&nbsp;&nbsp;The threads library</a>
</li><li class="li-toc"><a href="manual040.html#htoc304"><span>Chapter 26</span>&nbsp;&nbsp;The graphics library</a>
</li><li class="li-toc"><a href="manual041.html#htoc305"><span>Chapter 27</span>&nbsp;&nbsp;The dynlink library: dynamic loading and linking of object files</a>
</li><li class="li-toc"><a href="manual042.html#htoc306"><span>Chapter 28</span>&nbsp;&nbsp;The LablTk library: Tcl/Tk GUI interface</a>
</li><li class="li-toc"><a href="manual043.html#htoc307"><span>Chapter 29</span>&nbsp;&nbsp;The bigarray library</a>
<ul class="ftoc3"><li class="li-toc">
<a href="manual043.html#htoc308">1&nbsp;&nbsp;Module <tt>Bigarray</tt>: large, multi-dimensional, numerical arrays</a>
</li><li class="li-toc"><a href="manual043.html#htoc309">2&nbsp;&nbsp;Big arrays in the OCaml-C interface</a>
<ul class="ftoc4"><li class="li-toc">
<a href="manual043.html#htoc310">2.1&nbsp;&nbsp;Include file</a>
</li><li class="li-toc"><a href="manual043.html#htoc311">2.2&nbsp;&nbsp;Accessing an OCaml bigarray from C or Fortran</a>
</li><li class="li-toc"><a href="manual043.html#htoc312">2.3&nbsp;&nbsp;Wrapping a C or Fortran array as an OCaml big array</a>
</li></ul>
</li></ul>
</li></ul>
</li><li class="li-toc"><a href="index.html#htoc313">Part&nbsp;V&nbsp;&nbsp;Appendix</a>
</li></ul>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>