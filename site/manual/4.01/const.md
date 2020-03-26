<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec59"><span>Chapter 6</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>

</p><h3 class="subsection" id="sec60">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec61">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c005"><span class="c007">like</span> <span class="c007">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c014">like</span> &nbsp;<span class="c014">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">Lexical conventions</a>
</li><li><a href="values.html#start-section">Values</a>
</li><li><a href="names.html#start-section">Names</a>
</li><li><a href="types.html#start-section">Type expressions</a>
</li><li><a href="const.html#start-section">Constants</a>
</li><li><a href="patterns.html#start-section">Patterns</a>
</li><li><a href="expr.html#start-section">Expressions</a>
</li><li><a href="typedecl.html#start-section">Type and exception definitions</a>
</li><li><a href="classes.html#start-section">Classes</a>
</li><li><a href="modtypes.html#start-section">Module types (module specifications)</a>
</li><li><a href="modules.html#start-section">Module expressions (module implementations)</a>
</li><li><a href="compunit.html#start-section">Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="sec102">5&nbsp;&nbsp;Constants</h2>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="constant"><span class="c014">constant</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#integer-literal"><span class="c014">integer-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#float-literal"><span class="c014">float-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#char-literal"><span class="c014">char-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#string-literal"><span class="c014">string-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">false</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">true</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">()</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">begin</span>&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[||]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The syntactic class of constants comprises literals from the four
base types (integers, floating-point numbers, characters, character
strings), and constant constructors from both normal and polymorphic
variants, as well as the special constants <span class="c008">false</span>, <span class="c008">true</span>, <span class="c008">()</span>,
<span class="c008">[]</span>, and <span class="c008">[||]</span>, which behave like constant constructors, and
<span class="c005"><span class="c007">begin</span> <span class="c007">end</span></span>, which is equivalent to <span class="c008">()</span>.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>