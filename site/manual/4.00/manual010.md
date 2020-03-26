<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="manual021.html">Language extensions</a></li></ul>




<h1 class="chapter"><a name="htoc51"><span>Chapter 6</span></a>&nbsp;&nbsp;The OCaml language</h1><p> <a name="c:refman"></a>

</p><h3 class="subsection">Foreword</h3><p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection">Notations</h3><p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<font color="blue"><tt>like</tt> <tt>this</tt></font>).
Non-terminal symbols are set in italic font (<font color="maroon"><i>like</i></font> &nbsp;<font color="maroon"><i>that</i></font>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly bracket with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">Lexical conventions</a>
</li><li><a href="manual010.html#start-section">Values</a>
</li><li><a href="manual011.html#start-section">Names</a>
</li><li><a href="types.html#start-section">Type expressions</a>
</li><li><a href="manual013.html#start-section">Constants</a>
</li><li><a href="patterns.html#start-section">Patterns</a>
</li><li><a href="expr.html#start-section">Expressions</a>
</li><li><a href="manual016.html#start-section">Type and exception definitions</a>
</li><li><a href="manual017.html#start-section">Classes</a>
</li><li><a href="manual018.html#start-section">Module types (module specifications)</a>
</li><li><a href="manual019.html#start-section">Module expressions (module implementations)</a>
</li><li><a href="manual020.html#start-section">Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section"><a name="htoc53">6.2</a>&nbsp;&nbsp;Values</h2><ul>
<li><a href="manual010.html#toc40">Base values</a>
</li><li><a href="manual010.html#toc41">Tuples</a>
</li><li><a href="manual010.html#toc42">Records</a>
</li><li><a href="manual010.html#toc43">Arrays</a>
</li><li><a href="manual010.html#toc44">Variant values</a>
</li><li><a href="manual010.html#toc45">Polymorphic variants</a>
</li><li><a href="manual010.html#toc46">Functions</a>
</li><li><a href="manual010.html#toc47">Objects</a>
</li></ul>
<p>This section describes the kinds of values that are manipulated by
OCaml programs.</p><h3 class="subsection"><a name="toc40"></a><a name="htoc54">6.2.1</a>&nbsp;&nbsp;Base values</h3><h4 class="subsubsection">Integer numbers</h4><p>Integer values are integer numbers from −2<sup>30</sup> to 2<sup>30</sup>−1, that
is −1073741824 to 1073741823. The implementation may support a
wider range of integer values: on 64-bit platforms, the current
implementation supports integers ranging from −2<sup>62</sup> to 2<sup>62</sup>−1.</p><h4 class="subsubsection">Floating-point numbers</h4><p>Floating-point values are numbers in floating-point representation.
The current implementation uses double-precision floating-point
numbers conforming to the IEEE 754 standard, with 53 bits of mantissa
and an exponent ranging from −1022 to 1023.</p><h4 class="subsubsection">Characters</h4><p>Character values are represented as 8-bit integers between 0 and 255.
Character codes between 0 and 127 are interpreted following the ASCII
standard. The current implementation interprets character codes
between 128 and 255 following the ISO 8859-1 standard.</p><h4 class="subsubsection">Character strings</h4><p> <a name="s:string-val"></a></p><p>String values are finite sequences of characters. The current
implementation supports strings containing up to 2<sup>24</sup> − 5
characters (16777211 characters); on 64-bit platforms, the limit is
2<sup>57</sup> − 9.</p><h3 class="subsection"><a name="toc41"></a><a name="htoc55">6.2.2</a>&nbsp;&nbsp;Tuples</h3><p>Tuples of values are written (<i>v</i><sub>1</sub>, …, <i>v<sub>n</sub></i>), standing for the
<i>n</i>-tuple of values <i>v</i><sub>1</sub> to <i>v<sub>n</sub></i>. The current implementation
supports tuple of up to 2<sup>22</sup> − 1 elements (4194303 elements).</p><h3 class="subsection"><a name="toc42"></a><a name="htoc56">6.2.3</a>&nbsp;&nbsp;Records</h3><p>Record values are labeled tuples of values. The record value written
<font color="blue"><tt>{</tt></font> <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> <font color="maroon"><i>v</i></font><sub>1</sub><font color="blue"><tt>;</tt></font> …<font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font> <i><font color="maroon">v</font><sub>n</sub></i> <font color="blue"><tt>}</tt></font> associates the value
<i>v<sub>i</sub></i> to the record field <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>i</sub></i>, for <i>i</i> = 1 … <i>n</i>. The current
implementation supports records with up to 2<sup>22</sup> − 1 fields
(4194303 fields).</p><h3 class="subsection"><a name="toc43"></a><a name="htoc57">6.2.4</a>&nbsp;&nbsp;Arrays</h3><p>Arrays are finite, variable-sized sequences of values of the same
type. The current implementation supports arrays containing up to
2<sup>22</sup> − 1 elements (4194303 elements) unless the elements are
floating-point numbers (2097151 elements in this case); on 64-bit
platforms, the limit is 2<sup>54</sup> − 1 for all arrays.</p><h3 class="subsection"><a name="toc44"></a><a name="htoc58">6.2.5</a>&nbsp;&nbsp;Variant values</h3><p>Variant values are either a constant constructor, or a non-constant
constructor applied to a number of values. The former case is written
<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>; the latter case is written <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> <font color="blue"><tt>(</tt></font><font color="maroon"><i>v</i></font><sub>1</sub><font color="blue"><tt>,</tt></font> ... <font color="blue"><tt>,</tt></font> <i><font color="maroon">v</font><sub>n</sub></i>
<font color="blue"><tt>)</tt></font>, where the <i><font color="maroon">v</font><sub>i</sub></i> are said to be the arguments of the non-constant
constructor <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>. The parentheses may be omitted if there is only
one argument.</p><p>The following constants are treated like built-in constant
constructors:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Constant</b></td><td align="center" nowrap=""><b>Constructor</b></td></tr>
<tr><td align="left" nowrap="">
<tt>false</tt></td><td align="left" nowrap="">the boolean false</td></tr>
<tr><td align="left" nowrap=""><tt>true</tt></td><td align="left" nowrap="">the boolean true</td></tr>
<tr><td align="left" nowrap=""><tt>()</tt></td><td align="left" nowrap="">the “unit” value</td></tr>
<tr><td align="left" nowrap=""><tt>[]</tt></td><td align="left" nowrap="">the empty list</td></tr>
</tbody></table></div><p>The current implementation limits each variant type to have at most
246 non-constant constructors and 2<sup>30</sup>−1 constant constructors.</p><h3 class="subsection"><a name="toc45"></a><a name="htoc59">6.2.6</a>&nbsp;&nbsp;Polymorphic variants</h3><p>Polymorphic variants are an alternate form of variant values, not
belonging explicitly to a predefined variant type, and following
specific typing rules. They can be either constant, written
<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>, or non-constant, written <font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>(<i>v</i>).</p><h3 class="subsection"><a name="toc46"></a><a name="htoc60">6.2.7</a>&nbsp;&nbsp;Functions</h3><p>Functional values are mappings from values to values.</p><h3 class="subsection"><a name="toc47"></a><a name="htoc61">6.2.8</a>&nbsp;&nbsp;Objects</h3><p>Objects are composed of a hidden internal state which is a
record of instance variables, and a set of methods for accessing and
modifying these variables. The structure of an object is described by
the toplevel class that created it.</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>