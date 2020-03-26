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




<h2 class="section" id="s:signature-substitution"><a class="section-anchor" href="#s:signature-substitution" aria-hidden="true"></a>7&nbsp;&nbsp;Substituting inside a signature</h2>
<ul>
<li><a href="signaturesubstitution.html#ss%3Adestructive-substitution">7.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li><a href="signaturesubstitution.html#ss%3Alocal-substitution">7.2&nbsp;&nbsp;Local substitution declarations</a>
</li></ul>
<p>
<a id="hevea_manual.kwd220"></a>
<a id="hevea_manual.kwd221"></a>
<a id="hevea_manual.kwd222"></a>
</p>
<h3 class="subsection" id="ss:destructive-substitution"><a class="section-anchor" href="#ss:destructive-substitution" aria-hidden="true">﻿</a>7.1&nbsp;&nbsp;Destructive substitutions</h3>
<p>(Introduced in OCaml 3.12, generalized in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modtypes.html#mod-constraint"><span class="c010">mod-constraint</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">type</span>&nbsp;[<a class="syntax" href="typedecl.html#type-params"><span class="c010">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>&nbsp;<span class="c004">:=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">:=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c010">extended-module-path</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>A “destructive” substitution (<span class="c004">with</span> ... <span class="c004">:=</span> ...) behaves essentially like
normal signature constraints (<span class="c004">with</span> ... <span class="c004">=</span> ...), but it additionally removes
the redefined type or module from the signature.</p><p>Prior to OCaml 4.06, there were a number of restrictions: one could only remove
types and modules at the outermost level (not inside submodules), and in the
case of <span class="c004">with type</span> the definition had to be another type constructor with the
same type parameters.</p><p>A natural application of destructive substitution is merging two
signatures sharing a type name.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Printable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">val</span> print : Format.formatter -&gt; t -&gt; unit
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Comparable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">val</span> compare : t -&gt; t -&gt; int
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> PrintableComparable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">include</span> Printable
   <span class="ocamlkeyword">include</span> Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := t
 <span class="ocamlkeyword">end</span></div></div>

</div><p>One can also use this to completely remove a field:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := int</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> compare : int -&gt; int -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div><p>


or to rename one:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> u
   <span class="ocamlkeyword">include</span> Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := u
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> u <span class="ocamlkeyword">val</span> compare : u -&gt; u -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div><p>Note that you can also remove manifest types, by substituting with the
same type.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> ComparableInt = Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t = int ;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> ComparableInt = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t = int <span class="ocamlkeyword">val</span> compare : t -&gt; t -&gt; int <span class="ocamlkeyword">end</span></div></div>
<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> CompareInt = ComparableInt <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := int</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> CompareInt = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> compare : int -&gt; int -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div>
<h3 class="subsection" id="ss:local-substitution"><a class="section-anchor" href="#ss:local-substitution" aria-hidden="true">﻿</a>7.2&nbsp;&nbsp;Local substitution declarations</h3>
<p>(Introduced in OCaml 4.08)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">type</span>&nbsp;<a class="syntax" href="#type-subst"><span class="c010">type-subst</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="#type-subst"><span class="c010">type-subst</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c010">extended-module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018"><a class="syntax" id="type-subst"><span class="c010">type-subst</span></a></td><td class="c015">::=</td><td class="c017">
[<a class="syntax" href="typedecl.html#type-params"><span class="c010">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>&nbsp;<span class="c004">:=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="typedecl.html#type-constraint"><span class="c010">type-constraint</span></a>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Local substitutions behave like destructive substitutions (<span class="c004">with</span> ... <span class="c004">:=</span> ...)
but instead of being applied to a whole signature after the fact, they are
introduced during the specification of the signature, and will apply to all the
items that follow.</p><p>This provides a convenient way to introduce local names for types and modules
when defining a signature:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">module</span> Sub : <span class="ocamlkeyword">sig</span>
     <span class="ocamlkeyword">type</span> outer := t
     <span class="ocamlkeyword">type</span> t
     <span class="ocamlkeyword">val</span> to_outer : t -&gt; outer
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S =
  <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">module</span> Sub : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">val</span> to_outer : t/1 -&gt; t/2 <span class="ocamlkeyword">end</span> <span class="ocamlkeyword">end</span></div></div>

</div><p>Note that, unlike type declarations, type substitution declarations are not
recursive, so substitutions like the following are rejected:</p><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> 'a poly_list := [ `Cons <span class="ocamlkeyword">of</span> 'a * 'a <span class="ocamlhighlight">poly_list</span> | `Nil ]
 <span class="ocamlkeyword">end</span> ;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Unbound type constructor poly_list</div></div>

</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>