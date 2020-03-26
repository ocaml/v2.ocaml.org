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




<h2 class="section" id="s:module-type-of"><a class="section-anchor" href="#s:module-type-of" aria-hidden="true"></a>6&nbsp;&nbsp;Recovering the type of a module</h2>
<p><a id="hevea_manual.kwd216"></a>
<a id="hevea_manual.kwd217"></a>
<a id="hevea_manual.kwd218"></a>
<a id="hevea_manual.kwd219"></a></p><p>(Introduced in OCaml 3.12)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">type</span>&nbsp;<span class="c004">of</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The construction <span class="c002"><span class="c003">module</span> <span class="c003">type</span> <span class="c003">of</span></span> <a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a> expands to the module type
(signature or functor type) inferred for the module expression <a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>.
To make this module type reusable in many situations, it is
intentionally not strengthened: abstract types and datatypes are not
explicitly related with the types of the original module.
For the same reason, module aliases in the inferred type are expanded.</p><p>A typical use, in conjunction with the signature-level <span class="c004">include</span>
construct, is to extend the signature of an existing structure.
In that case, one wants to keep the types equal to types in the
original module. This can done using the following idiom.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> MYHASH = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">include</span> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> <span class="ocamlkeyword">of</span> <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">include</span> Hashtbl <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">val</span> replace: ('a, 'b) t -&gt; 'a -&gt; 'b -&gt; unit
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


The signature <span class="c003">MYHASH</span> then contains all the fields of the signature
of the module <span class="c003">Hashtbl</span> (with strengthened type definitions), plus the
new field <span class="c003">replace</span>. An implementation of this signature can be
obtained easily by using the <span class="c004">include</span> construct again, but this
time at the structure level:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> MyHash : MYHASH = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">include</span> Hashtbl
   <span class="ocamlkeyword">let</span> replace t k v = remove t k; add t k v
 <span class="ocamlkeyword">end</span></div></div>

</div><p>Another application where the absence of strengthening comes handy, is
to provide an alternative implementation for an existing module.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> MySet : <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> <span class="ocamlkeyword">of</span> Set = <span class="ocamlkeyword">struct</span>
   …
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


This idiom guarantees that <span class="c003">Myset</span> is compatible with Set, but allows
it to represent sets internally in a different way.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>