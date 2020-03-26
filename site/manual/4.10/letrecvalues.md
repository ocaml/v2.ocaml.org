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



<h2 class="section" id="s:letrecvalues"><a class="section-anchor" href="#s:letrecvalues" aria-hidden="true"></a>1&nbsp;&nbsp;Recursive definitions of values</h2>
<p>(Introduced in Objective Caml 1.00)</p><p>As mentioned in section&nbsp;<a href="expr.html#sss%3Aexpr-localdef">7.7.2</a>, the <span class="c002"><span class="c003">let</span> <span class="c003">rec</span></span> binding
construct, in addition to the definition of recursive functions,
also supports a certain class of recursive definitions of
non-functional values, such as
</p><div class="center">
<span class="c002"><span class="c003">let</span> <span class="c003">rec</span></span> <span class="c010">name</span><sub>1</sub> <span class="c002"><span class="c003">=</span> <span class="c003">1</span> <span class="c003">::</span></span> &nbsp;<span class="c010">name</span><sub>2</sub>
<span class="c004">and</span> &nbsp;<span class="c010">name</span><sub>2</sub> <span class="c002"><span class="c003">=</span> <span class="c003">2</span> <span class="c003">::</span></span> &nbsp;<span class="c010">name</span><sub>1</sub>
<span class="c004">in</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</div><p>
which binds <span class="c010">name</span><sub>1</sub> to the cyclic list <span class="c003">1::2::1::2::</span>…, and
<span class="c010">name</span><sub>2</sub> to the cyclic list <span class="c003">2::1::2::1::</span>…Informally, the class of accepted definitions consists of those
definitions where the defined names occur only inside function
bodies or as argument to a data constructor.</p><p>More precisely, consider the expression:
</p><div class="center">
<span class="c002"><span class="c003">let</span> <span class="c003">rec</span></span> <span class="c010">name</span><sub>1</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">and</span> … <span class="c004">and</span> &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> <span class="c004">in</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</div><p>
It will be accepted if each one of <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> is
statically constructive with respect to <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>,
is not immediately linked to any of <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>,
and is not an array constructor whose arguments have abstract type.</p><p>An expression <span class="c010">e</span> is said to be <em>statically constructive
with respect to</em> the variables <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub> if at least
one of the following conditions is true:
</p><ul class="itemize"><li class="li-itemize">
<span class="c010">e</span> has no free occurrence of any of <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>
</li><li class="li-itemize"><span class="c010">e</span> is a variable
</li><li class="li-itemize"><span class="c010">e</span> has the form <span class="c004">fun</span> … <span class="c004">-&gt;</span> …
</li><li class="li-itemize"><span class="c010">e</span> has the form <span class="c004">function</span> … <span class="c004">-&gt;</span> …
</li><li class="li-itemize"><span class="c010">e</span> has the form <span class="c002"><span class="c003">lazy</span> <span class="c003">(</span></span> … <span class="c004">)</span>
</li><li class="li-itemize"><span class="c010">e</span> has one of the following forms, where each one of
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> is statically constructive with respect to
<span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>, and <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> is statically constructive with
respect to <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>, &nbsp;<span class="c010">xname</span><sub>1</sub> … &nbsp;<span class="c010">xname</span><sub><span class="c009">m</span></sub>:
<ul class="itemize"><li class="li-itemize">
<span class="c004">let</span> [<span class="c004">rec</span>] <span class="c010">xname</span><sub>1</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">and</span> …
<span class="c004">and</span> &nbsp;<span class="c010">xname</span><sub><span class="c009">m</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">in</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub>
</li><li class="li-itemize"><span class="c002"><span class="c003">let</span> <span class="c003">module</span></span> … <span class="c004">in</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub>
</li><li class="li-itemize"><a class="syntax" href="names.html#constr"><span class="c010">constr</span></a> <span class="c004">(</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub><span class="c004">)</span>
</li><li class="li-itemize"><span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a> <span class="c004">(</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub><span class="c004">)</span>
</li><li class="li-itemize"><span class="c004">[|</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">|]</span>
</li><li class="li-itemize"><span class="c004">{</span> <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">m</span></sub> = &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">}</span>
</li><li class="li-itemize"><span class="c004">{</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">with</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>2</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">;</span> … <span class="c004">;</span>
&nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">m</span></sub> = &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">}</span> where <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> is not immediately
linked to <span class="c010">name</span><sub>1</sub> … &nbsp;<span class="c010">name</span><sub><span class="c009">n</span></sub>
</li><li class="li-itemize"><span class="c004">(</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">)</span>
</li><li class="li-itemize"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub>
</li></ul>
</li></ul><p>An expression <span class="c010">e</span> is said to be <em>immediately linked to</em> the variable
<span class="c010">name</span> in the following cases:
</p><ul class="itemize"><li class="li-itemize">
<span class="c010">e</span> is <span class="c010">name</span>
</li><li class="li-itemize"><span class="c010">e</span> has the form <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> where <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub>
is immediately linked to <span class="c010">name</span>
</li><li class="li-itemize"><span class="c010">e</span> has the form <span class="c004">let</span> [<span class="c004">rec</span>] <span class="c010">xname</span><sub>1</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">and</span> …
<span class="c004">and</span> &nbsp;<span class="c010">xname</span><sub><span class="c009">m</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">m</span></sub> <span class="c004">in</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> where <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> is immediately
linked to <span class="c010">name</span> or to one of the <span class="c010">xname</span><sub><span class="c009">i</span></sub> such that <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">i</span></sub>
is immediately linked to <span class="c010">name</span>.
</li></ul>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>