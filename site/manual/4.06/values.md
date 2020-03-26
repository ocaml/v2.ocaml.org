<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec70"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>

</p><h3 class="subsection" id="sec71">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec72">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c002"><span class="c003">like</span> <span class="c003">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c010">like</span> &nbsp;<span class="c010">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">1&nbsp;&nbsp;Lexical conventions</a>
</li><li><a href="values.html#start-section">2&nbsp;&nbsp;Values</a>
</li><li><a href="names.html#start-section">3&nbsp;&nbsp;Names</a>
</li><li><a href="types.html#start-section">4&nbsp;&nbsp;Type expressions</a>
</li><li><a href="const.html#start-section">5&nbsp;&nbsp;Constants</a>
</li><li><a href="patterns.html#start-section">6&nbsp;&nbsp;Patterns</a>
</li><li><a href="expr.html#start-section">7&nbsp;&nbsp;Expressions</a>
</li><li><a href="typedecl.html#start-section">8&nbsp;&nbsp;Type and exception definitions</a>
</li><li><a href="classes.html#start-section">9&nbsp;&nbsp;Classes</a>
</li><li><a href="modtypes.html#start-section">10&nbsp;&nbsp;Module types (module specifications)</a>
</li><li><a href="modules.html#start-section">11&nbsp;&nbsp;Module expressions (module implementations)</a>
</li><li><a href="compunit.html#start-section">12&nbsp;&nbsp;Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="sec86">2&nbsp;&nbsp;Values</h2>
<ul>
<li><a href="values.html#sec87">2.1&nbsp;&nbsp;Base values</a>
</li><li><a href="values.html#sec92">2.2&nbsp;&nbsp;Tuples</a>
</li><li><a href="values.html#sec93">2.3&nbsp;&nbsp;Records</a>
</li><li><a href="values.html#sec94">2.4&nbsp;&nbsp;Arrays</a>
</li><li><a href="values.html#sec95">2.5&nbsp;&nbsp;Variant values</a>
</li><li><a href="values.html#sec96">2.6&nbsp;&nbsp;Polymorphic variants</a>
</li><li><a href="values.html#sec97">2.7&nbsp;&nbsp;Functions</a>
</li><li><a href="values.html#sec98">2.8&nbsp;&nbsp;Objects</a>
</li></ul>
<p>This section describes the kinds of values that are manipulated by
OCaml programs.</p>
<h3 class="subsection" id="sec87">2.1&nbsp;&nbsp;Base values</h3>
<h4 class="subsubsection" id="sec88">Integer numbers</h4>
<p>Integer values are integer numbers from −2<sup>30</sup> to 2<sup>30</sup>−1, that
is −1073741824 to 1073741823. The implementation may support a
wider range of integer values: on 64-bit platforms, the current
implementation supports integers ranging from −2<sup>62</sup> to 2<sup>62</sup>−1.</p><h4 class="subsubsection" id="sec89">Floating-point numbers</h4>
<p>Floating-point values are numbers in floating-point representation.
The current implementation uses double-precision floating-point
numbers conforming to the IEEE 754 standard, with 53 bits of mantissa
and an exponent ranging from −1022 to 1023.</p><h4 class="subsubsection" id="sec90">Characters</h4>
<p>Character values are represented as 8-bit integers between 0 and 255.
Character codes between 0 and 127 are interpreted following the ASCII
standard. The current implementation interprets character codes
between 128 and 255 following the ISO 8859-1 standard.</p><h4 class="subsubsection" id="sec91">Character strings</h4>
<p> <a id="s:string-val"></a></p><p>String values are finite sequences of characters. The current
implementation supports strings containing up to 2<sup>24</sup> − 5
characters (16777211 characters); on 64-bit platforms, the limit is
2<sup>57</sup> − 9.</p>
<h3 class="subsection" id="sec92">2.2&nbsp;&nbsp;Tuples</h3>
<p>Tuples of values are written <span class="c004">(</span><span class="c010">v</span><sub>1</sub><span class="c004">,</span> …<span class="c004">,</span> <span class="c010">v</span><sub><span class="c009">n</span></sub><span class="c004">)</span>, standing for the
<span class="c009">n</span>-tuple of values <span class="c010">v</span><sub>1</sub> to <span class="c010">v</span><sub><span class="c009">n</span></sub>. The current implementation
supports tuple of up to 2<sup>22</sup> − 1 elements (4194303 elements).</p>
<h3 class="subsection" id="sec93">2.3&nbsp;&nbsp;Records</h3>
<p>Record values are labeled tuples of values. The record value written
<span class="c004">{</span> <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> <span class="c004">=</span> <span class="c010">v</span><sub>1</sub><span class="c004">;</span> …<span class="c004">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">n</span></sub> <span class="c004">=</span> <span class="c010">v</span><sub><span class="c009">n</span></sub> <span class="c004">}</span> associates the value
<span class="c010">v</span><sub><span class="c009">i</span></sub> to the record field <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">i</span></sub>, for <span class="c009">i</span> = 1 … <span class="c009">n</span>. The current
implementation supports records with up to 2<sup>22</sup> − 1 fields
(4194303 fields).</p>
<h3 class="subsection" id="sec94">2.4&nbsp;&nbsp;Arrays</h3>
<p>Arrays are finite, variable-sized sequences of values of the same
type. The current implementation supports arrays containing up to
2<sup>22</sup> − 1 elements (4194303 elements) unless the elements are
floating-point numbers (2097151 elements in this case); on 64-bit
platforms, the limit is 2<sup>54</sup> − 1 for all arrays.</p>
<h3 class="subsection" id="sec95">2.5&nbsp;&nbsp;Variant values</h3>
<p>Variant values are either a constant constructor, or a non-constant
constructor applied to a number of values. The former case is written
<a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>; the latter case is written <a class="syntax" href="names.html#constr"><span class="c010">constr</span></a> <span class="c004">(</span><span class="c010">v</span><sub>1</sub><span class="c004">,</span> ... <span class="c004">,</span> <span class="c010">v</span><sub><span class="c009">n</span></sub>
<span class="c004">)</span>, where the <span class="c010">v</span><sub><span class="c009">i</span></sub> are said to be the arguments of the non-constant
constructor <a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>. The parentheses may be omitted if there is only
one argument.</p><p>The following constants are treated like built-in constant
constructors:
</p><div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">Constant</span></td><td class="c014"><span class="c013">Constructor</span> </td></tr>
<tr><td class="c016">
<span class="c003">false</span></td><td class="c016">the boolean false </td></tr>
<tr><td class="c016"><span class="c003">true</span></td><td class="c016">the boolean true </td></tr>
<tr><td class="c016"><span class="c003">()</span></td><td class="c016">the “unit” value </td></tr>
<tr><td class="c016"><span class="c003">[]</span></td><td class="c016">the empty list </td></tr>
</tbody></table></div><p>The current implementation limits each variant type to have at most
246 non-constant constructors and 2<sup>30</sup>−1 constant constructors.</p>
<h3 class="subsection" id="sec96">2.6&nbsp;&nbsp;Polymorphic variants</h3>
<p>Polymorphic variants are an alternate form of variant values, not
belonging explicitly to a predefined variant type, and following
specific typing rules. They can be either constant, written
<span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a>, or non-constant, written <span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a><span class="c002"><span class="c003">(</span><span class="c010">v</span><span class="c003">)</span></span>.</p>
<h3 class="subsection" id="sec97">2.7&nbsp;&nbsp;Functions</h3>
<p>Functional values are mappings from values to values.</p>
<h3 class="subsection" id="sec98">2.8&nbsp;&nbsp;Objects</h3>
<p>Objects are composed of a hidden internal state which is a
record of instance variables, and a set of methods for accessing and
modifying these variables. The structure of an object is described by
the toplevel class that created it.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>