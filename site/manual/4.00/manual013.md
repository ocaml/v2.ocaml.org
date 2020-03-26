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




<h2 class="section"><a name="htoc64">6.5</a>&nbsp;&nbsp;Constants</h2><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="constant" class="syntax"><font color="maroon">constant</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#float-literal" class="syntax"><font color="maroon">float-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#char-literal" class="syntax"><font color="maroon">char-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#string-literal" class="syntax"><font color="maroon">string-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>false</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>true</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>()</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[||]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The syntactic class of constants comprises literals from the four
base types (integers, floating-point numbers, characters, character
strings), and constant constructors from both normal and polymorphic
variants, as well as the special constants <tt>false</tt>, <tt>true</tt>, <tt>()</tt>,
<tt>[]</tt>, and <tt>[||]</tt>, which behave like constant constructors.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>