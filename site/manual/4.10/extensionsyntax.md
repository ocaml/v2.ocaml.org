<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec238"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="letrecvalues.html#start-section">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="manual024.html#start-section">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="privatetypes.html#start-section">3&nbsp;&nbsp;Private types</a>
</li><li><a href="locallyabstract.html#start-section">4&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="firstclassmodules.html#start-section">5&nbsp;&nbsp;First-class modules</a>
</li><li><a href="moduletypeof.html#start-section">6&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="signaturesubstitution.html#start-section">7&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="modulealias.html#start-section">8&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="overridingopen.html#start-section">9&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="gadts.html#start-section">10&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="bigarray.html#start-section">11&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="attributes.html#start-section">12&nbsp;&nbsp;Attributes</a>
</li><li><a href="extensionnodes.html#start-section">13&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="extensiblevariants.html#start-section">14&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="generativefunctors.html#start-section">15&nbsp;&nbsp;Generative functors</a>
</li><li><a href="extensionsyntax.html#start-section">16&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="inlinerecords.html#start-section">17&nbsp;&nbsp;Inline records</a>
</li><li><a href="doccomments.html#start-section">18&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="indexops.html#start-section">19&nbsp;&nbsp;Extended indexing operators </a>
</li><li><a href="emptyvariants.html#start-section">20&nbsp;&nbsp;Empty variant types</a>
</li><li><a href="alerts.html#start-section">21&nbsp;&nbsp;Alerts</a>
</li><li><a href="generalizedopens.html#start-section">22&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="bindingops.html#start-section">23&nbsp;&nbsp;Binding operators</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="s:extension-syntax"><a class="section-anchor" href="#s:extension-syntax" aria-hidden="true"></a>16&nbsp;&nbsp;Extension-only syntax</h2>
<ul>
<li><a href="extensionsyntax.html#ss%3Aextension-operators">16.1&nbsp;&nbsp;Extension operators</a>
</li><li><a href="extensionsyntax.html#ss%3Aextension-literals">16.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
<p>
(Introduced in OCaml 4.02.2, extended in 4.03)</p><p>Some syntactic constructions are accepted during parsing and rejected
during type checking. These syntactic constructions can therefore not
be used directly in vanilla OCaml. However, <span class="c003">-ppx</span> rewriters and other
external tools can exploit this parser leniency to extend the language
with these new syntactic constructions by rewriting them to
vanilla constructions.
</p>
<h3 class="subsection" id="ss:extension-operators"><a class="section-anchor" href="#ss:extension-operators" aria-hidden="true">﻿</a>16.1&nbsp;&nbsp;Extension operators</h3>
<p> <a id="s:ext-ops"></a>
(Introduced in OCaml 4.02.2)
</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<span class="c010">infix-symbol</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">#</span>&nbsp;{<span class="c010">operator-chars</span>}&nbsp;<span class="c004">#</span>&nbsp;&nbsp;&nbsp;{<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;<span class="c004">|</span>&nbsp;<span class="c004">#</span>}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Operator names starting with a <span class="c003">#</span> character and containing more than
one <span class="c003">#</span> character are reserved for extensions.</p>
<h3 class="subsection" id="ss:extension-literals"><a class="section-anchor" href="#ss:extension-literals" aria-hidden="true">﻿</a>16.2&nbsp;&nbsp;Extension literals</h3>
<p>
(Introduced in OCaml 4.03)
</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<span class="c010">float-literal</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}&nbsp;[<span class="c004">.</span>&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[(<span class="c004">e</span>∣&nbsp;<span class="c004">E</span>)&nbsp;[<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0x</span>∣&nbsp;<span class="c004">0X</span>)
(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
[<span class="c004">.</span>&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[(<span class="c004">p</span>∣&nbsp;<span class="c004">P</span>)&nbsp;[<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="int-literal"><span class="c010">int-literal</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;}[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0x</span>∣&nbsp;<span class="c004">0X</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0o</span>∣&nbsp;<span class="c004">0O</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">7</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">7</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0b</span>∣&nbsp;<span class="c004">0B</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">1</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">1</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
[<span class="c004">g</span>…<span class="c004">z</span>∣&nbsp;<span class="c004">G</span>…<span class="c004">Z</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>
Int and float literals followed by an one-letter identifier in the
range [<span class="c004">g</span>..<span class="c004">z</span>∣ <span class="c004">G</span>..<span class="c004">Z</span>] are extension-only literals.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>