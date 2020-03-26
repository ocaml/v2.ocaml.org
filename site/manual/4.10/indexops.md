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




<h2 class="section" id="s:index-operators"><a class="section-anchor" href="#s:index-operators" aria-hidden="true"></a>19&nbsp;&nbsp;Extended indexing operators </h2>
<ul>
<li><a href="indexops.html#ss%3Amultiindexing">19.1&nbsp;&nbsp;Multi-index notation</a>
</li></ul>
<p>
(Introduced in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018"><a class="syntax" id="dot-ext"><span class="c010">dot-ext</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#dot-operator-char"><span class="c010">dot-operator-char</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="dot-operator-char"><span class="c010">dot-operator-char</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">!</span>&nbsp;∣&nbsp;&nbsp;&nbsp;<span class="c004">?</span>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="lex.html#core-operator-char"><span class="c010">core-operator-char</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">%</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">:</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;&nbsp;(&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">)</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">[</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">]</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">}</span>&nbsp;)&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">operator-name</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">.</span>&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;&nbsp;(<span class="c004">()</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">[]</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">{}</span>)&nbsp;[<span class="c004">&lt;-</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This extension provides syntactic sugar for getting and setting elements
for user-defined indexed types. For instance, we can define python-like
dictionaries with


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Dict = <span class="ocamlkeyword">struct</span>
 <span class="ocamlkeyword">include</span> Hashtbl
 <span class="ocamlkeyword">let</span> ( .%{} ) tabl index = find tabl index
 <span class="ocamlkeyword">let</span> ( .%{}&lt;- ) tabl index value = add tabl index value
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">let</span> dict =
   <span class="ocamlkeyword">let</span> dict = Dict.create 10 <span class="ocamlkeyword">in</span>
   <span class="ocamlkeyword">let</span> () =
     dict.Dict.%{<span class="ocamlstring">"one"</span>} &lt;- 1;
     <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">open</span> Dict <span class="ocamlkeyword">in</span>
     dict.%{<span class="ocamlstring">"two"</span>} &lt;- 2 <span class="ocamlkeyword">in</span>
   dict</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> dict.Dict.%{<span class="ocamlstring">"one"</span>};;</div>



<div class="pre caml-output ok">- : int = 1</div></div>
<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">open</span> Dict <span class="ocamlkeyword">in</span> dict.%{<span class="ocamlstring">"two"</span>};;</div>



<div class="pre caml-output ok">- : int = 2</div></div>

</div>
<h3 class="subsection" id="ss:multiindexing"><a class="section-anchor" href="#ss:multiindexing" aria-hidden="true">﻿</a>19.1&nbsp;&nbsp;Multi-index notation</h3>
<div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">(</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">)</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">[</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">]</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">}</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">operator-name</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">.</span>&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;&nbsp;(<span class="c004">(;..)</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">[;..]</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">{;..}</span>)&nbsp;[<span class="c004">&lt;-</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Multi-index are also supported through a second variant of indexing operators</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> (.%[;..]) = Bigarray.Genarray.get
 <span class="ocamlkeyword">let</span> (.%{;..}) = Bigarray.Genarray.get
 <span class="ocamlkeyword">let</span> (.%(;..)) = Bigarray.Genarray.get</div></div>

</div><p>which is called when an index literals contain a semicolon separated list
of expressions with two and more elements:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> sum x y = x.%[1;2;3] + y.%[1;2]
 <span class="ocamlcomment">(* is equivalent to *)</span>
 <span class="ocamlkeyword">let</span> sum x y = (.%[;..]) x [|1;2;3|] + (.%[;..]) y [|1;2|]</div></div>

</div><p>In particular this multi-index notation makes it possible to uniformly handle
indexing Genarray and other implementations of multidimensional arrays.</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> A = Bigarray.Genarray
 <span class="ocamlkeyword">let</span> (.%{;..}) = A.get
 <span class="ocamlkeyword">let</span> (.%{;..}&lt;- ) = A.set
 <span class="ocamlkeyword">let</span> (.%{ }) a k = A.get a [|k|]
 <span class="ocamlkeyword">let</span> (.%{ }&lt;-) a k x = A.set a [|k|] x
 <span class="ocamlkeyword">let</span> syntax_compare vec mat t3 t4 =
           vec.%{0} = A.get vec [|0|]
    &amp;&amp;   mat.%{0;0} = A.get mat [|0;0|]
    &amp;&amp;   t3.%{0;0;0} = A.get t3 [|0;0;0|]
    &amp;&amp; t4.%{0;0;0;0} = t4.{0,0,0,0}</div></div>

</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>