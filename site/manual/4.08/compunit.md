<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec73"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>
</p><h3 class="subsection" id="sec74">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec75">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c002"><span class="c003">like</span> <span class="c003">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c010">like</span> &nbsp;<span class="c010">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
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



<h2 class="section" id="sec236">12&nbsp;&nbsp;Compilation units</h2>
<div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="unit-interface"><span class="c010">unit-interface</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;{&nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a>&nbsp;&nbsp;[<span class="c004">;;</span>]&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="unit-implementation"><span class="c010">unit-implementation</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;[&nbsp;<a class="syntax" href="modules.html#module-items"><span class="c010">module-items</span></a>&nbsp;]
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Compilation units bridge the module system and the separate
compilation system. A compilation unit is composed of two parts: an
interface and an implementation. The interface contains a sequence of
specifications, just as the inside of a <span class="c004">sig</span> … <span class="c004">end</span>
signature expression. The implementation contains a sequence of
definitions and expressions, just as the inside of a
<span class="c004">struct</span> … <span class="c004">end</span> module
expression. A compilation unit also has a name <span class="c010">unit-name</span>, derived
from the names of the files containing the interface and the
implementation (see chapter&nbsp;<a href="comp.html#c%3Acamlc">9</a> for more details). A
compilation unit behaves roughly as the module definition
</p><div class="center">
<span class="c002"><span class="c003">module</span> <span class="c010">unit-name</span> <span class="c003">:</span> <span class="c003">sig</span></span> &nbsp;<a class="syntax" href="#unit-interface"><span class="c010">unit-interface</span></a> <span class="c002"><span class="c003">end</span> <span class="c003">=</span>
<span class="c003">struct</span></span> &nbsp;<a class="syntax" href="#unit-implementation"><span class="c010">unit-implementation</span></a> <span class="c004">end</span>
</div><p>A compilation unit can refer to other compilation units by their
names, as if they were regular modules. For instance, if <span class="c003">U</span> is a
compilation unit that defines a type <span class="c003">t</span>, other compilation units can
refer to that type under the name <span class="c003">U.t</span>; they can also refer to <span class="c003">U</span> as
a whole structure. Except for names of other compilation units, a unit
interface or unit implementation must not have any other free variables.
In other terms, the type-checking and compilation of an interface or
implementation proceeds in the initial environment
</p><div class="center">
<span class="c010">name</span><sub>1</sub> <span class="c002"><span class="c003">:</span> <span class="c003">sig</span></span> &nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a><sub>1</sub> <span class="c004">end</span> …
&nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">:</span> <span class="c003">sig</span></span> &nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a><sub><span class="c009">n</span></sub> <span class="c004">end</span>
</div><p>
where <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub> are the names of the other
compilation units available in the search path (see
chapter&nbsp;<a href="comp.html#c%3Acamlc">9</a> for more details) and <a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a><sub>1</sub> …
&nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a><sub><span class="c009">n</span></sub> are their respective interfaces.

</p>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>