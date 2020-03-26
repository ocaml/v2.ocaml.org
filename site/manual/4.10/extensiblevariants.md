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




<h2 class="section" id="s:extensible-variants"><a class="section-anchor" href="#s:extensible-variants" aria-hidden="true"></a>14&nbsp;&nbsp;Extensible variant types</h2>
<ul>
<li><a href="extensiblevariants.html#ss%3Aprivate-extensible">14.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
<p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-representation"><span class="c010">type-representation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">..</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">type</span>&nbsp;[<a class="syntax" href="typedecl.html#type-params"><span class="c010">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a>&nbsp;&nbsp;<a class="syntax" href="#type-extension-spec"><span class="c010">type-extension-spec</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">type</span>&nbsp;[<a class="syntax" href="typedecl.html#type-params"><span class="c010">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a>&nbsp;&nbsp;<a class="syntax" href="#type-extension-def"><span class="c010">type-extension-def</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="type-extension-spec"><span class="c010">type-extension-spec</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<span class="c004">+=</span>&nbsp;[<span class="c004">private</span>]&nbsp;[<span class="c004">|</span>]&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">|</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="type-extension-def"><span class="c010">type-extension-def</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<span class="c004">+=</span>&nbsp;[<span class="c004">private</span>]&nbsp;[<span class="c004">|</span>]&nbsp;<a class="syntax" href="#constr-def"><span class="c010">constr-def</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">|</span>&nbsp;<a class="syntax" href="#constr-def"><span class="c010">constr-def</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="constr-def"><span class="c010">constr-def</span></a></td><td class="c015">::=</td><td class="c017">
<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c010">constr-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Extensible variant types are variant types which can be extended with
new variant constructors. Extensible variant types are defined using
<span class="c003">..</span>. New variant constructors are added using <span class="c003">+=</span>.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Expr = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> attr = ..

   <span class="ocamlkeyword">type</span> attr += Str <span class="ocamlkeyword">of</span> string

   <span class="ocamlkeyword">type</span> attr +=
     | Int <span class="ocamlkeyword">of</span> int
     | Float <span class="ocamlkeyword">of</span> float
 <span class="ocamlkeyword">end</span></div></div>

</div><p>Pattern matching on an extensible variant type requires a default case
to handle unknown variant constructors:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> to_string = <span class="ocamlkeyword">function</span>
   | Expr.Str s -&gt; s
   | Expr.Int i -&gt; Int.to_string i
   | Expr.Float f -&gt; string_of_float f
   | _ -&gt; <span class="ocamlstring">"?"</span></div></div>

</div><p>A preexisting example of an extensible variant type is the built-in
<span class="c003">exn</span> type used for exceptions. Indeed, exception constructors can be
declared using the type extension syntax:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> exn += Exc <span class="ocamlkeyword">of</span> int</div></div>

</div><p>Extensible variant constructors can be rebound to a different name. This
allows exporting variants from another module.


</p><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> not_in_scope = <span class="ocamlhighlight">Str</span> <span class="ocamlstring">"Foo"</span>;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Unbound constructor Str</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> Expr.attr += Str = Expr.Str</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> now_works = Str <span class="ocamlstring">"foo"</span>;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> now_works : Expr.attr = Expr.Str <span class="ocamlstring">"foo"</span></div></div>

</div><p>Extensible variant constructors can be declared <span class="c003">private</span>. As with
regular variants, this prevents them from being constructed directly by
constructor application while still allowing them to be de-structured in
pattern-matching.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> B : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> Expr.attr += <span class="ocamlkeyword">private</span> Bool <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">val</span> bool : bool -&gt; Expr.attr
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> Expr.attr += Bool <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">let</span> bool p = <span class="ocamlkeyword">if</span> p <span class="ocamlkeyword">then</span> Bool 1 <span class="ocamlkeyword">else</span> Bool 0
 <span class="ocamlkeyword">end</span></div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> inspection_works = <span class="ocamlkeyword">function</span>
   | B.Bool p -&gt; (p = 1)
   | _ -&gt; <span class="ocamlkeyword">true</span>;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> inspection_works : Expr.attr -&gt; bool = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> construction_is_forbidden = <span class="ocamlhighlight">B.Bool 1</span>;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Cannot use private constructor Bool to create values of type Expr.attr</div></div>

</div>
<h3 class="subsection" id="ss:private-extensible"><a class="section-anchor" href="#ss:private-extensible" aria-hidden="true">﻿</a>14.1&nbsp;&nbsp;Private extensible variant types</h3>
<p>(Introduced in OCaml 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-representation"><span class="c010">type-representation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">private</span>&nbsp;<span class="c004">..</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Extensible variant types can be declared <span class="c003">private</span>. This prevents new
constructors from being declared directly, but allows extension
constructors to be referred to in interfaces.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Msg : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = <span class="ocamlkeyword">private</span> ..
   <span class="ocamlkeyword">module</span> MkConstr (X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>) : <span class="ocamlkeyword">sig</span>
     <span class="ocamlkeyword">type</span> t += C <span class="ocamlkeyword">of</span> X.t
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = ..
   <span class="ocamlkeyword">module</span> MkConstr (X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>) = <span class="ocamlkeyword">struct</span>
     <span class="ocamlkeyword">type</span> t += C <span class="ocamlkeyword">of</span> X.t
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span></div></div>

</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>