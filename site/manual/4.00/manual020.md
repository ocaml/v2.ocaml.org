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



<h2 class="section"><a name="htoc91">6.12</a>&nbsp;&nbsp;Compilation units</h2><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="unit-interface" class="syntax"><font color="maroon">unit-interface</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;{&nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="unit-implementation" class="syntax"><font color="maroon">unit-implementation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;{&nbsp;<i><a href="manual019.html#definition" class="syntax"><font color="maroon">definition</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;}</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Compilation units bridge the module system and the separate
compilation system. A compilation unit is composed of two parts: an
interface and an implementation. The interface contains a sequence of
specifications, just as the inside of a <font color="blue"><tt>sig</tt></font> … <font color="blue"><tt>end</tt></font>
signature expression. The implementation contains a sequence of
definitions, just as the inside of a <font color="blue"><tt>struct</tt></font> … <font color="blue"><tt>end</tt></font> module
expression. A compilation unit also has a name <font color="maroon"><i>unit-name</i></font>, derived
from the names of the files containing the interface and the
implementation (see chapter&nbsp;<a href="manual022.html#c:camlc">8</a> for more details). A
compilation unit behaves roughly as the module definition
</p><div class="center">
<font color="blue"><tt>module</tt> <font color="maroon"><i>unit-name</i></font> <tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="#unit-interface" class="syntax"><font color="maroon">unit-interface</font></a></i> <font color="blue"><tt>end</tt> <tt>=</tt>
<tt>struct</tt></font> &nbsp;<i><a href="#unit-implementation" class="syntax"><font color="maroon">unit-implementation</font></a></i> <font color="blue"><tt>end</tt></font>
</div><p>A compilation unit can refer to other compilation units by their
names, as if they were regular modules. For instance, if <tt>U</tt> is a
compilation unit that defines a type <tt>t</tt>, other compilation units can
refer to that type under the name <tt>U.t</tt>; they can also refer to <tt>U</tt> as
a whole structure. Except for names of other compilation units, a unit
interface or unit implementation must not have any other free variables.
In other terms, the type-checking and compilation of an interface or
implementation proceeds in the initial environment
</p><div class="center">
<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i><sub>1</sub> <font color="blue"><tt>end</tt></font> …
&nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a><sub>n</sub></i> <font color="blue"><tt>end</tt></font>
</div><p>
where <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> are the names of the other
compilation units available in the search path (see
chapter&nbsp;<a href="manual022.html#c:camlc">8</a> for more details) and <i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i><sub>1</sub> …
&nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a><sub>n</sub></i> are their respective interfaces.

</p>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>