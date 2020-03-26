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




<h2 class="section" id="s:locally-abstract"><a class="section-anchor" href="#s:locally-abstract" aria-hidden="true"></a>4&nbsp;&nbsp;Locally abstract types</h2>
<p>
<a id="hevea_manual.kwd210"></a>
<a id="hevea_manual.kwd211"></a>
</p><p>(Introduced in OCaml 3.12, short syntax added in 4.03)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#parameter"><span class="c010">parameter</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(</span>&nbsp;<span class="c004">type</span>&nbsp;{<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>}<sup>+</sup>&nbsp;<span class="c004">)</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The expression <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> introduces a
type constructor named <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a> which is considered abstract
in the scope of the sub-expression, but then replaced by a fresh type
variable. Note that contrary to what the syntax could suggest, the
expression <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> itself does not
suspend the evaluation of <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> as a regular abstraction would. The
syntax has been chosen to fit nicely in the context of function
declarations, where it is generally used. It is possible to freely mix
regular function parameters with pseudo type parameters, as in:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f = <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t) (foo : t list) -&gt; …</div></div>

</div><p>


and even use the alternative syntax for declaring functions:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f (<span class="ocamlkeyword">type</span> t) (foo : t list) = …</div></div>

</div><p>


If several locally abstract types need to be introduced, it is possible to use
the syntax
<span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
as syntactic sugar for <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> … <span class="c002"><span class="c003">-&gt;</span>
<span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>. For instance,


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f = <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t u v) -&gt; <span class="ocamlkeyword">fun</span> (foo : (t * u * v) list) -&gt; …
 <span class="ocamlkeyword">let</span> f' (<span class="ocamlkeyword">type</span> t u v) (foo : (t * u * v) list) = …</div></div>

</div><p>This construction is useful because the type constructors it introduces
can be used in places where a type variable is not allowed. For
instance, one can use it to define an exception in a local module
within a polymorphic function.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f (<span class="ocamlkeyword">type</span> t) () =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">exception</span> E <span class="ocamlkeyword">of</span> t <span class="ocamlkeyword">end</span> <span class="ocamlkeyword">in</span>
   (<span class="ocamlkeyword">fun</span> x -&gt; M.E x), (<span class="ocamlkeyword">function</span> M.E x -&gt; Some x | _ -&gt; None)</div></div>

</div><p>Here is another example:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> sort_uniq (<span class="ocamlkeyword">type</span> s) (cmp : s -&gt; s -&gt; int) =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> S = Set.Make(<span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">type</span> t = s <span class="ocamlkeyword">let</span> compare = cmp <span class="ocamlkeyword">end</span>) <span class="ocamlkeyword">in</span>
   <span class="ocamlkeyword">fun</span> l -&gt;
     S.elements (List.fold_right S.add l S.empty)</div></div>

</div><p>It is also extremely useful for first-class modules (see
section&nbsp;<a href="firstclassmodules.html#s%3Afirst-class-modules">8.5</a>) and generalized algebraic datatypes
(GADTs: see section&nbsp;<a href="gadts.html#s%3Agadts">8.10</a>).</p>
<h5 class="paragraph" id="p:polymorpic-locally-abstract"><a class="section-anchor" href="#p:polymorpic-locally-abstract" aria-hidden="true">﻿</a>Polymorphic syntax</h5>
<p> (Introduced in OCaml 4.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#let-binding"><span class="c010">let-binding</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;<span class="c004">type</span>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">method</span>&nbsp;[<span class="c004">private</span>]&nbsp;<a class="syntax" href="names.html#method-name"><span class="c010">method-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;<span class="c004">type</span>
&nbsp;{&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">method!</span>&nbsp;[<span class="c004">private</span>]&nbsp;<a class="syntax" href="names.html#method-name"><span class="c010">method-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;<span class="c004">type</span>
&nbsp;{&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The <span class="c004">(type</span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><span class="c004">)</span> syntax construction by itself does not make
polymorphic the type variable it introduces, but it can be combined
with explicit polymorphic annotations where needed.
The above rule is provided as syntactic sugar to make this easier:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> f : <span class="ocamlkeyword">type</span> t1 t2. t1 * t2 list -&gt; t1 = …</div></div>

</div><p>


is automatically expanded into


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> f : 't1 't2. 't1 * 't2 list -&gt; 't1 =
   <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t1) (<span class="ocamlkeyword">type</span> t2) -&gt; ( … : t1 * t2 list -&gt; t1)</div></div>

</div><p>


This syntax can be very useful when defining recursive functions involving
GADTs, see the section&nbsp;<a href="gadts.html#s%3Agadts">8.10</a> for a more detailed explanation.</p><p>The same feature is provided for method definitions.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>