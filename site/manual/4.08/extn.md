<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec238">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="#sec239">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="#sec240">3&nbsp;&nbsp;Private types</a>
</li><li><a href="#sec244">4&nbsp;&nbsp;Local opens for patterns</a>
</li><li><a href="#sec245">5&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="#sec247">6&nbsp;&nbsp;First-class modules</a>
</li><li><a href="#sec250">7&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="#sec251">8&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="#sec254">9&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="#sec255">10&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="#sec256">11&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="#sec263">12&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="#sec264">13&nbsp;&nbsp;Attributes</a>
</li><li><a href="#sec266">14&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="#sec268">15&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="#sec270">16&nbsp;&nbsp;Generative functors</a>
</li><li><a href="#sec271">17&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="#sec274">18&nbsp;&nbsp;Inline records</a>
</li><li><a href="#sec275">19&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="#s:index-operators">20&nbsp;&nbsp;Extended indexing operators  </a>
</li><li><a href="#s:empty-variants">21&nbsp;&nbsp;Empty variant types </a>
</li><li><a href="#s:alerts">22&nbsp;&nbsp;Alerts  </a>
</li><li><a href="#s:generalized-open">23&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="#s:binding-operators">24&nbsp;&nbsp;Binding operators </a>
</li></ul></nav></header>

<hr>









<h2 class="section" id="sec238">1&nbsp;&nbsp;Recursive definitions of values</h2>
<p> <a id="s:letrecvalues"></a></p><p>(Introduced in Objective Caml 1.00)</p><p>As mentioned in section&nbsp;<a href="expr.html#s%3Alocaldef">7.7.2</a>, the <span class="c002"><span class="c003">let</span> <span class="c003">rec</span></span> binding
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










<h2 class="section" id="sec239">2&nbsp;&nbsp;Recursive modules</h2>
<p> <a id="s-recursive-modules"></a>
<a id="hevea_manual.kwd205"></a>
<a id="hevea_manual.kwd206"></a></p><p>(Introduced in Objective Caml 3.07)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">rec</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;
&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">rec</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>
&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a><span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Recursive module definitions, introduced by the <span class="c004">module rec</span> …<span class="c004">and</span> … construction, generalize regular module definitions
<span class="c004">module</span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c004">=</span> &nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a> and module specifications
<span class="c004">module</span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a> by allowing the defining
<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a> and the <a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a> to refer recursively to the module
identifiers being defined. A typical example of a recursive module
definition is:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="kw2">A</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">Leaf</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> | </span><span class="kw2">Node</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">ASet</span><span class="text">.</span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">compare</span><span class="text">: </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">Leaf</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> | </span><span class="kw2">Node</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">ASet</span><span class="text">.</span><span class="id">t</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text"> </span><span class="id">t1</span><span class="text"> </span><span class="id">t2</span><span class="text"> =
     </span><span class="kw1">match</span><span class="text"> (</span><span class="id">t1</span><span class="text">, </span><span class="id">t2</span><span class="text">) </span><span class="kw1">with</span><span class="text">
     | (</span><span class="kw2">Leaf</span><span class="text"> </span><span class="id">s1</span><span class="text">, </span><span class="kw2">Leaf</span><span class="text"> </span><span class="id">s2</span><span class="text">) -&gt; </span><span class="kw2">Stdlib</span><span class="text">.</span><span class="id">compare</span><span class="text"> </span><span class="id">s1</span><span class="text"> </span><span class="id">s2</span><span class="text">
     | (</span><span class="kw2">Leaf</span><span class="text"> </span><span class="numeric">_</span><span class="text">, </span><span class="kw2">Node</span><span class="text"> </span><span class="numeric">_</span><span class="text">) -&gt; </span><span class="numeric">1</span><span class="text">
     | (</span><span class="kw2">Node</span><span class="text"> </span><span class="numeric">_</span><span class="text">, </span><span class="kw2">Leaf</span><span class="text"> </span><span class="numeric">_</span><span class="text">) -&gt; </span><span class="numeric">-1</span><span class="text">
     | (</span><span class="kw2">Node</span><span class="text"> </span><span class="id">n1</span><span class="text">, </span><span class="kw2">Node</span><span class="text"> </span><span class="id">n2</span><span class="text">) -&gt; </span><span class="kw2">ASet</span><span class="text">.</span><span class="id">compare</span><span class="text"> </span><span class="id">n1</span><span class="text"> </span><span class="id">n2</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">and</span><span class="text"> </span><span class="kw2">ASet</span><span class="text">
   : </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">S</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">elt</span><span class="text"> = </span><span class="kw2">A</span><span class="text">.</span><span class="id">t</span><span class="text">
   = </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">Make</span><span class="text">(</span><span class="kw2">A</span><span class="text">)
</span></code>
</pre>


</div><p>

It can be given the following specification:


</p><div class="caml-example signature">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="kw2">A</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">Leaf</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> | </span><span class="kw2">Node</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">ASet</span><span class="text">.</span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">compare</span><span class="text">: </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">and</span><span class="text"> </span><span class="kw2">ASet</span><span class="text"> : </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">S</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">elt</span><span class="text"> = </span><span class="kw2">A</span><span class="text">.</span><span class="id">t</span><span class="text">
</span></code>
</pre>


</div><p>This is an experimental extension of OCaml: the class of
recursive definitions accepted, as well as its dynamic semantics are
not final and subject to change in future releases.</p><p>Currently, the compiler requires that all dependency cycles between
the recursively-defined module identifiers go through at least one
“safe” module. A module is “safe” if all value definitions that
it contains have function types <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub> <span class="c004">-&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>2</sub>. Evaluation of a
recursive module definition proceeds by building initial values for
the safe modules involved, binding all (functional) values to
<span class="c002"><span class="c003">fun</span> <span class="c003">_</span> <span class="c003">-&gt;</span> <span class="c003">raise</span></span> <span class="c003">Undefined_recursive_module</span>. The defining
module expressions are then evaluated, and the initial values
for the safe modules are replaced by the values thus computed. If a
function component of a safe module is applied during this computation
(which corresponds to an ill-founded recursive definition), the
<span class="c003">Undefined_recursive_module</span> exception is raised at runtime:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="kw2">M</span><span class="text">: </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">val</span><span class="text"> </span><span class="id">f</span><span class="text">: </span><span class="kw3">unit</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> () = </span><span class="kw2">N</span><span class="text">.</span><span class="id">x</span><span class="text"> </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">and</span><span class="text"> </span><span class="kw2">N</span><span class="text">:</span><span class="kw1">sig</span><span class="text"> </span><span class="kw">val</span><span class="text"> </span><span class="id">x</span><span class="text">: </span><span class="kw3">int</span><span class="text"> </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw2">M</span><span class="text">.</span><span class="id">f</span><span class="text"> () </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">Exception: Undefined_recursive_module ("exten.etex", 1, 43).
</code></pre>


</div><p>If there are no safe modules along a dependency cycle, an error is raised</p><div class="caml-example verbatim">

<pre><code class="caml-input"> module rec M: sig val x: int end = <u>struct let x = N.y end</u>
 and N:sig val x: int val y:int end = struct let x = M.x let y = 0 end
</code><code class="caml-output error">Error: Cannot safely evaluate the definition of the following cycle
       of recursively-defined modules: M -&gt; N -&gt; M.
       There are no safe modules in this cycle (see manual section 8.2).
File "exten.etex", line 1, characters 18-28:
1 | module rec M: sig val x: int end = struct let x = N.y end
                      ^^^^^^^^^^
  Module M defines an unsafe value, x .
File "exten.etex", line 2, characters 10-20:
2 | and N:sig val x: int val y:int end = struct let x = M.x let y = 0 end
              ^^^^^^^^^^
  Module N defines an unsafe value, x .
</code></pre>


</div><p>Note that, in the <a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a> case, the <a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>s must be
parenthesized if they use the <span class="c004">with</span> <a class="syntax" href="modtypes.html#mod-constraint"><span class="c010">mod-constraint</span></a> construct.</p>











<h2 class="section" id="sec240">3&nbsp;&nbsp;Private types</h2>
<ul>
<li><a href="#sec241">3.1&nbsp;&nbsp;Private variant and record types</a>
</li><li><a href="#sec242">3.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li><a href="#sec243">3.3&nbsp;&nbsp;Private row types</a>
</li></ul>
<p><a id="s:private-types"></a>
<a id="hevea_manual.kwd207"></a></p><p>Private type declarations in module signatures, of the form
<span class="c003">type t = private ...</span>, enable libraries to
reveal some, but not all aspects of the implementation of a type to
clients of the library. In this respect, they strike a middle ground
between abstract type declarations, where no information is revealed
on the type implementation, and data type definitions and type
abbreviations, where all aspects of the type implementation are
publicized. Private type declarations come in three flavors: for
variant and record types (section&nbsp;<a href="#s-private-types-variant">8.3.1</a>),
for type abbreviations (section&nbsp;<a href="#s-private-types-abbrev">8.3.2</a>),
and for row types (section&nbsp;<a href="#s-private-rows">8.3.3</a>).</p>
<h3 class="subsection" id="sec241">3.1&nbsp;&nbsp;Private variant and record types</h3>
<p> <a id="s-private-types-variant"></a></p><p>(Introduced in Objective Caml 3.07)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-representation"><span class="c010">type-representation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">private</span>&nbsp;[&nbsp;<span class="c004">|</span>&nbsp;]&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">|</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">private</span>&nbsp;<a class="syntax" href="typedecl.html#record-decl"><span class="c010">record-decl</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Values of a variant or record type declared <span class="c004">private</span>
can be de-structured normally in pattern-matching or via
the <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> <span class="c004">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a> notation for record accesses. However, values of
these types cannot be constructed directly by constructor application
or record construction. Moreover, assignment on a mutable field of a
private record type is not allowed.</p><p>The typical use of private types is in the export signature of a
module, to ensure that construction of values of the private type always
go through the functions provided by the module, while still allowing
pattern-matching outside the defining module. For example:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw">private</span><span class="text"> </span><span class="kw2">A</span><span class="text"> | </span><span class="kw2">B</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">a</span><span class="text"> : </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">b</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">A</span><span class="text"> | </span><span class="kw2">B</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">a</span><span class="text"> = </span><span class="kw2">A</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">b</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw1">assert</span><span class="text"> (</span><span class="id">n</span><span class="text"> &gt; </span><span class="numeric">0</span><span class="text">); </span><span class="kw2">B</span><span class="text"> </span><span class="id">n</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>

Here, the <span class="c004">private</span> declaration ensures that in any value of type
<span class="c003">M.t</span>, the argument to the <span class="c003">B</span> constructor is always a positive integer.</p><p>With respect to the variance of their parameters, private types are
handled like abstract types. That is, if a private type has
parameters, their variance is the one explicitly given by prefixing
the parameter by a ‘<span class="c003">+</span>’ or a ‘<span class="c003">-</span>’, it is invariant otherwise.</p>
<h3 class="subsection" id="sec242">3.2&nbsp;&nbsp;Private type abbreviations</h3>
<p> <a id="s-private-types-abbrev"></a></p><p>(Introduced in Objective Caml 3.11)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-equation"><span class="c010">type-equation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">private</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Unlike a regular type abbreviation, a private type abbreviation
declares a type that is distinct from its implementation type <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>.
However, coercions from the type to <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> are permitted.
Moreover, the compiler “knows” the implementation type and can take
advantage of this knowledge to perform type-directed optimizations.</p><p>The following example uses a private type abbreviation to define a
module of nonnegative integers:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">N</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw">private</span><span class="text"> </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">of_int</span><span class="text">: </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">to_int</span><span class="text">: </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">of_int</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="kw1">assert</span><span class="text"> (</span><span class="id">n</span><span class="text"> &gt;= </span><span class="numeric">0</span><span class="text">); </span><span class="id">n</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">to_int</span><span class="text"> </span><span class="id">n</span><span class="text"> = </span><span class="id">n</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>

The type <span class="c003">N.t</span> is incompatible with <span class="c003">int</span>, ensuring that nonnegative
integers and regular integers are not confused. However, if <span class="c003">x</span> has
type <span class="c003">N.t</span>, the coercion <span class="c003">(x :&gt; int)</span> is legal and returns the
underlying integer, just like <span class="c003">N.to_int x</span>. Deep coercions are also
supported: if <span class="c003">l</span> has type <span class="c003">N.t list</span>, the coercion <span class="c003">(l :&gt; int list)</span>
returns the list of underlying integers, like <span class="c003">List.map N.to_int l</span>
but without copying the list <span class="c003">l</span>.</p><p>Note that the coercion <span class="c004">(</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> <span class="c004">:&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> <span class="c004">)</span> is actually an abbreviated
form,
and will only work in presence of private abbreviations if neither the
type of <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> nor <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> contain any type variables. If they do,
you must use the full form <span class="c004">(</span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub> <span class="c004">:&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>2</sub> <span class="c004">)</span> where
<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub> is the expected type of <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>. Concretely, this would be <span class="c003">(x : N.t :&gt; int)</span> and <span class="c003">(l : N.t list :&gt; int list)</span> for the above examples.</p>
<h3 class="subsection" id="sec243">3.3&nbsp;&nbsp;Private row types</h3>
<p> <a id="s-private-rows"></a>
<a id="hevea_manual.kwd208"></a></p><p>(Introduced in Objective Caml 3.09)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-equation"><span class="c010">type-equation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">private</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Private row types are type abbreviations where part of the
structure of the type is left abstract. Concretely <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> in the
above should denote either an object type or a polymorphic variant
type, with some possibility of refinement left. If the private
declaration is used in an interface, the corresponding implementation
may either provide a ground instance, or a refined private type.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw">private</span><span class="text"> &lt; </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">; .. &gt; </span><span class="kw">val</span><span class="text"> </span><span class="id">o</span><span class="text"> : </span><span class="id">c</span><span class="text"> </span><span class="kw1">end</span><span class="text"> =
 </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">class</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw1">object</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">3</span><span class="text"> </span><span class="kw">method</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="numeric">2</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">o</span><span class="text"> = </span><span class="kw1">new</span><span class="text"> </span><span class="id">c</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>

This declaration does more than hiding the <span class="c003">y</span> method, it also makes
the type <span class="c003">c</span> incompatible with any other closed object type, meaning
that only <span class="c003">o</span> will be of type <span class="c003">c</span>. In that respect it behaves
similarly to private record types. But private row types are
more flexible with respect to incremental refinement. This feature can
be used in combination with functors.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">F</span><span class="text">(</span><span class="kw2">X</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw">private</span><span class="text"> &lt; </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">; .. &gt; </span><span class="kw1">end</span><span class="text">) =
 </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">get_x</span><span class="text"> (</span><span class="id">o</span><span class="text"> : </span><span class="kw2">X</span><span class="text">.</span><span class="id">c</span><span class="text">) = </span><span class="id">o</span><span class="kw1">#</span><span class="id">x</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">module</span><span class="text"> </span><span class="kw2">G</span><span class="text">(</span><span class="kw2">X</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">c</span><span class="text"> = </span><span class="kw">private</span><span class="text"> &lt; </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text">; </span><span class="id">y</span><span class="text"> : </span><span class="kw3">int</span><span class="text">; .. &gt; </span><span class="kw1">end</span><span class="text">) =
 </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">F</span><span class="text">(</span><span class="kw2">X</span><span class="text">)
   </span><span class="kw">let</span><span class="text"> </span><span class="id">get_y</span><span class="text"> (</span><span class="id">o</span><span class="text"> : </span><span class="kw2">X</span><span class="text">.</span><span class="id">c</span><span class="text">) = </span><span class="id">o</span><span class="kw1">#</span><span class="id">y</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>A polymorphic variant type [t], for example


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = [ `</span><span class="kw2">A</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text"> | `</span><span class="kw2">B</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">bool</span><span class="text"> ]
</span></code>
</pre>


</div><p>

can be refined in two ways. A definition [u] may add new field to [t],
and the declaration


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">u</span><span class="text"> = </span><span class="kw">private</span><span class="text"> [&gt; </span><span class="id">t</span><span class="text">]
</span></code>
</pre>


</div><p>

will keep those new fields abstract. Construction of values of type
[u] is possible using the known variants of [t], but any
pattern-matching will require a default case to handle the potential
extra fields. Dually, a declaration [u] may restrict the fields of [t]
through abstraction: the declaration


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">v</span><span class="text"> = </span><span class="kw">private</span><span class="text"> [&lt; </span><span class="id">t</span><span class="text"> &gt; `</span><span class="kw2">A</span><span class="text">]
</span></code>
</pre>


</div><p>

corresponds to private variant types. One cannot create a value of the
private type [v], except using the constructors that are explicitly
listed as present, <span class="c003">(`A n)</span> in this example; yet, when
patter-matching on a [v], one should assume that any of the
constructors of [t] could be present.</p><p>Similarly to abstract types, the variance of type parameters
is not inferred, and must be given explicitly.</p>











<h2 class="section" id="sec244">4&nbsp;&nbsp;Local opens for patterns</h2>
<p>
<a id="hevea_manual.kwd209"></a>
<a id="hevea_manual.kwd210"></a> <a id="s:local-opens"></a></p><p>(Introduced in OCaml 4.04)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.(</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.[</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.[|</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">|]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">}</span></td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>For patterns, local opens are limited to the
<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a><span class="c004">.(</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a><span class="c004">)</span> construction. This
construction locally open the module referred to by the module path
<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a> in the scope of the pattern <a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>.</p><p>When the body of a local open pattern is delimited by
<span class="c002"><span class="c003">[</span> <span class="c003">]</span></span>, <span class="c002"><span class="c003">[|</span> <span class="c003">|]</span></span>, or <span class="c002"><span class="c003">{</span> <span class="c003">}</span></span>, the parentheses can be omitted.
For example, <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a><span class="c004">.[</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a><span class="c004">]</span> is equivalent to
<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a><span class="c004">.([</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a><span class="c004">])</span>, and <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a><span class="c004">.[|</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a> <span class="c004">|]</span> is
equivalent to <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a><span class="c004">.([|</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a> <span class="c004">|])</span>.</p>











<h2 class="section" id="sec245">5&nbsp;&nbsp;Locally abstract types</h2>
<p>
<a id="hevea_manual.kwd211"></a>
<a id="hevea_manual.kwd212"></a> <a id="s:locally-abstract"></a></p><p>(Introduced in OCaml 3.12, short syntax added in 4.03)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">) (</span><span class="id">foo</span><span class="text"> : </span><span class="id">t</span><span class="text"> </span><span class="kw3">list</span><span class="text">) -&gt; …
</span></code>
</pre>


</div><p>

and even use the alternative syntax for declaring functions:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">) (</span><span class="id">foo</span><span class="text"> : </span><span class="id">t</span><span class="text"> </span><span class="kw3">list</span><span class="text">) = …
</span></code>
</pre>


</div><p>

If several locally abstract types need to be introduced, it is possible to use
the syntax
<span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
as syntactic sugar for <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> … <span class="c002"><span class="c003">-&gt;</span>
<span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>. For instance,


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">u</span><span class="text"> </span><span class="id">v</span><span class="text">) -&gt; </span><span class="kw">fun</span><span class="text"> (</span><span class="id">foo</span><span class="text"> : (</span><span class="id">t</span><span class="text"> * </span><span class="id">u</span><span class="text"> * </span><span class="id">v</span><span class="text">) </span><span class="kw3">list</span><span class="text">) -&gt; …
 </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text">' (</span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">u</span><span class="text"> </span><span class="id">v</span><span class="text">) (</span><span class="id">foo</span><span class="text"> : (</span><span class="id">t</span><span class="text"> * </span><span class="id">u</span><span class="text"> * </span><span class="id">v</span><span class="text">) </span><span class="kw3">list</span><span class="text">) = …
</span></code>
</pre>


</div><p>This construction is useful because the type constructors it introduces
can be used in places where a type variable is not allowed. For
instance, one can use it to define an exception in a local module
within a polymorphic function.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">) () =
   </span><span class="kw">let</span><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> = </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">exception</span><span class="text"> </span><span class="kw2">E</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw1">end</span><span class="text"> </span><span class="kw">in</span><span class="text">
   (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="kw2">M</span><span class="text">.</span><span class="kw2">E</span><span class="text"> </span><span class="id">x</span><span class="text">), (</span><span class="kw">function</span><span class="text"> </span><span class="kw2">M</span><span class="text">.</span><span class="kw2">E</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text"> | </span><span class="numeric">_</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">)
</span></code>
</pre>


</div><p>Here is another example:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sort_uniq</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">s</span><span class="text">) (</span><span class="id">cmp</span><span class="text"> : </span><span class="id">s</span><span class="text"> -&gt; </span><span class="id">s</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">) =
   </span><span class="kw">let</span><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">Make</span><span class="text">(</span><span class="kw1">struct</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="id">s</span><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text"> = </span><span class="id">cmp</span><span class="text"> </span><span class="kw1">end</span><span class="text">) </span><span class="kw">in</span><span class="text">
   </span><span class="kw">fun</span><span class="text"> </span><span class="id">l</span><span class="text"> -&gt;
     </span><span class="kw2">S</span><span class="text">.</span><span class="id">elements</span><span class="text"> (</span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_right</span><span class="text"> </span><span class="kw2">S</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="id">l</span><span class="text"> </span><span class="kw2">S</span><span class="text">.</span><span class="id">empty</span><span class="text">)
</span></code>
</pre>


</div><p>It is also extremely useful for first-class modules (see
section&nbsp;<a href="manual028.html#s-first-class-modules">8.6</a>) and generalized algebraic datatypes
(GADTs: see section&nbsp;<a href="manual033.html#s%3Agadts">8.11</a>).</p>
<h5 class="paragraph" id="sec246">Polymorphic syntax</h5>
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">f</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">t1</span><span class="text"> </span><span class="id">t2</span><span class="text">. </span><span class="id">t1</span><span class="text"> * </span><span class="id">t2</span><span class="text"> </span><span class="kw3">list</span><span class="text"> -&gt; </span><span class="id">t1</span><span class="text"> = …
</span></code>
</pre>


</div><p>

is automatically expanded into


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">f</span><span class="text"> : '</span><span class="id">t1</span><span class="text"> '</span><span class="id">t2</span><span class="text">. '</span><span class="id">t1</span><span class="text"> * '</span><span class="id">t2</span><span class="text"> </span><span class="kw3">list</span><span class="text"> -&gt; '</span><span class="id">t1</span><span class="text"> =
   </span><span class="kw">fun</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">t1</span><span class="text">) (</span><span class="kw">type</span><span class="text"> </span><span class="id">t2</span><span class="text">) -&gt; ( … : </span><span class="id">t1</span><span class="text"> * </span><span class="id">t2</span><span class="text"> </span><span class="kw3">list</span><span class="text"> -&gt; </span><span class="id">t1</span><span class="text">)
</span></code>
</pre>


</div><p>

This syntax can be very useful when defining recursive functions involving
GADTs, see the section&nbsp;<a href="manual033.html#s%3Agadts">8.11</a> for a more detailed explanation.</p><p>The same feature is provided for method definitions.</p>











<h2 class="section" id="sec247">6&nbsp;&nbsp;First-class modules</h2>
<p><a id="s-first-class-modules"></a>
<a id="hevea_manual.kwd213"></a>
<a id="hevea_manual.kwd214"></a>
<a id="hevea_manual.kwd215"></a>
<a id="hevea_manual.kwd216"></a></p><p>(Introduced in OCaml 3.12; pattern syntax and package type inference
introduced in 4.00; structural comparison of package types introduced in 4.02.;
fewer parens required starting from 4.05)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(module</span>&nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a><span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(val</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;[<span class="c004">:</span>&nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a>]<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(module</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;&nbsp;[<span class="c004">:</span>&nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a>]<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;&nbsp;[<span class="c004">:</span>&nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a>]<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="package-type"><span class="c010">package-type</span></a></td><td class="c015">::=</td><td class="c017">
<a class="syntax" href="names.html#modtype-path"><span class="c010">modtype-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#modtype-path"><span class="c010">modtype-path</span></a>&nbsp;<span class="c004">with</span>&nbsp;&nbsp;<a class="syntax" href="#package-constraint"><span class="c010">package-constraint</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="#package-constraint"><span class="c010">package-constraint</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="package-constraint"><span class="c010">package-constraint</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">type</span>&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Modules are typically thought of as static components. This extension
makes it possible to pack a module as a first-class value, which can
later be dynamically unpacked into a module.</p><p>The expression <span class="c002"><span class="c003">(</span> <span class="c003">module</span></span> <a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c004">)</span> converts the
module (structure or functor) denoted by module expression <a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
to a value of the core language that encapsulates this module. The
type of this core language value is <span class="c002"><span class="c003">(</span> <span class="c003">module</span></span> <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c004">)</span>.
The <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> annotation can be omitted if it can be inferred
from the context.</p><p>Conversely, the module expression <span class="c002"><span class="c003">(</span> <span class="c003">val</span></span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c004">)</span>
evaluates the core language expression <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> to a value, which must
have type <span class="c004">module</span> <a class="syntax" href="#package-type"><span class="c010">package-type</span></a>, and extracts the module that was
encapsulated in this value. Again <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> can be omitted if the
type of <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> is known.
If the module expression is already parenthesized, like the arguments
of functors are, no additional parens are needed: <span class="c003">Map.Make(val key)</span>.</p><p>The pattern <span class="c002"><span class="c003">(</span> <span class="c003">module</span></span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c004">)</span> matches a
package with type <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> and binds it to <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>.
It is not allowed in toplevel let bindings.
Again <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> can be omitted if it can be inferred from the
enclosing pattern.</p><p>The <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> syntactic class appearing in the <span class="c002"><span class="c003">(</span> <span class="c003">module</span></span>
<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c004">)</span> type expression and in the annotated forms represents a
subset of module types.
This subset consists of named module types with optional constraints
of a limited form: only non-parametrized types can be specified.</p><p>For type-checking purposes (and starting from OCaml 4.02), package types
are compared using the structural comparison of module types.</p><p>In general, the module expression <span class="c002"><span class="c003">(</span> <span class="c003">val</span></span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a>
<span class="c004">)</span> cannot be used in the body of a functor, because this could cause
unsoundness in conjunction with applicative functors.
Since OCaml 4.02, this is relaxed in two ways:
if <a class="syntax" href="#package-type"><span class="c010">package-type</span></a> does not contain nominal type declarations (<em>i.e.</em> types that are created with a proper identity), then this
expression can be used anywhere, and even if it contains such types
it can be used inside the body of a generative
functor, described in section&nbsp;<a href="manual038.html#s%3Agenerative-functors">8.16</a>.
It can also be used anywhere in the context of a local module binding
<span class="c002"><span class="c003">let</span> <span class="c003">module</span></span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c002"><span class="c003">=</span> <span class="c003">(</span> <span class="c003">val</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c002"><span class="c003">)</span>
<span class="c003">in</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub>.</p>
<h5 class="paragraph" id="sec248">Basic example</h5>
<p> A typical use of first-class modules is to
select at run-time among several implementations of a signature.
Each implementation is a structure that we can encapsulate as a
first-class module, then store in a data structure such as a hash
table:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">picture</span><span class="text"> = …
 </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">DEVICE</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">draw</span><span class="text"> : </span><span class="id">picture</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
   …
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="id">devices</span><span class="text"> : (</span><span class="kw3">string</span><span class="text">, (</span><span class="kw">module</span><span class="text"> </span><span class="kw2">DEVICE</span><span class="text">)) </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">t</span><span class="text"> = </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">create</span><span class="text"> </span><span class="numeric">17</span><span class="text">

 </span><span class="kw">module</span><span class="text"> </span><span class="kw2">SVG</span><span class="text"> = </span><span class="kw1">struct</span><span class="text"> … </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="numeric">_</span><span class="text"> = </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="id">devices</span><span class="text"> </span><span class="string">"SVG"</span><span class="text"> (</span><span class="kw">module</span><span class="text"> </span><span class="kw2">SVG</span><span class="text"> : </span><span class="kw2">DEVICE</span><span class="text">)

 </span><span class="kw">module</span><span class="text"> </span><span class="kw2">PDF</span><span class="text"> = </span><span class="kw1">struct</span><span class="text"> … </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="numeric">_</span><span class="text"> = </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="id">devices</span><span class="text"> </span><span class="string">"PDF"</span><span class="text"> (</span><span class="kw">module</span><span class="text"> </span><span class="kw2">PDF</span><span class="text">: </span><span class="kw2">DEVICE</span><span class="text">)
</span></code>
</pre>


</div><p>We can then select one implementation based on command-line
arguments, for instance:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">parse_cmdline</span><span class="text"> () = …
 </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Device</span><span class="text"> =
   (</span><span class="kw">val</span><span class="text"> (</span><span class="kw">let</span><span class="text"> </span><span class="id">device_name</span><span class="text"> = </span><span class="id">parse_cmdline</span><span class="text"> () </span><span class="kw">in</span><span class="text">
         </span><span class="kw1">try</span><span class="text"> </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find</span><span class="text"> </span><span class="id">devices</span><span class="text"> </span><span class="id">device_name</span><span class="text">
         </span><span class="kw1">with</span><span class="text"> </span><span class="kw2">Not_found</span><span class="text"> -&gt;
           </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">eprintf</span><span class="text"> </span><span class="string">"Unknown device %s\n"</span><span class="text"> </span><span class="id">device_name</span><span class="text">;
           </span><span class="id">exit</span><span class="text"> </span><span class="numeric">2</span><span class="text">)
    : </span><span class="kw2">DEVICE</span><span class="text">)
</span></code>
</pre>


</div><p>

Alternatively, the selection can be performed within a function:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">draw_using_device</span><span class="text"> </span><span class="id">device_name</span><span class="text"> </span><span class="id">picture</span><span class="text"> =
   </span><span class="kw">let</span><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Device</span><span class="text"> =
     (</span><span class="kw">val</span><span class="text"> (</span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find</span><span class="text"> </span><span class="id">devices</span><span class="text"> </span><span class="id">device_name</span><span class="text">) : </span><span class="kw2">DEVICE</span><span class="text">)
   </span><span class="kw">in</span><span class="text">
   </span><span class="kw2">Device</span><span class="text">.</span><span class="id">draw</span><span class="text"> </span><span class="id">picture</span><span class="text">
</span></code>
</pre>


</div>
<h5 class="paragraph" id="sec249">Advanced examples</h5>
<p>
With first-class modules, it is possible to parametrize some code over the
implementation of a module without using a functor.</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">sort</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">s</span><span class="text">) (</span><span class="kw">module</span><span class="text"> </span><span class="kw2">Set</span><span class="text"> : </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">S</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">elt</span><span class="text"> = </span><span class="id">s</span><span class="text">) </span><span class="id">l</span><span class="text"> =
   </span><span class="kw2">Set</span><span class="text">.</span><span class="id">elements</span><span class="text"> (</span><span class="kw2">List</span><span class="text">.</span><span class="id">fold_right</span><span class="text"> </span><span class="kw2">Set</span><span class="text">.</span><span class="id">add</span><span class="text"> </span><span class="id">l</span><span class="text"> </span><span class="kw2">Set</span><span class="text">.</span><span class="id">empty</span><span class="text">)
</span></code><code class="caml-output ok">val sort : (module Set.S with type elt = 'a) -&gt; 'a list -&gt; 'a list = &lt;fun&gt;
</code></pre>


</div><p>To use this function, one can wrap the <span class="c003">Set.Make</span> functor:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">make_set</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">s</span><span class="text">) </span><span class="id">cmp</span><span class="text"> =
   </span><span class="kw">let</span><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">Make</span><span class="text">(</span><span class="kw1">struct</span><span class="text">
     </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="id">s</span><span class="text">
     </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text"> = </span><span class="id">cmp</span><span class="text">
   </span><span class="kw1">end</span><span class="text">) </span><span class="kw">in</span><span class="text">
   (</span><span class="kw">module</span><span class="text"> </span><span class="kw2">S</span><span class="text"> : </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">S</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">elt</span><span class="text"> = </span><span class="id">s</span><span class="text">)
</span></code><code class="caml-output ok">val make_set : ('a -&gt; 'a -&gt; int) -&gt; (module Set.S with type elt = 'a) = &lt;fun&gt;
</code></pre>


</div>











<h2 class="section" id="sec250">7&nbsp;&nbsp;Recovering the type of a module</h2>
<p> <a id="s:module-type-of"></a></p><p><a id="hevea_manual.kwd217"></a>
<a id="hevea_manual.kwd218"></a>
<a id="hevea_manual.kwd219"></a>
<a id="hevea_manual.kwd220"></a></p><p>(Introduced in OCaml 3.12)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">MYHASH</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Hashtbl</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">replace</span><span class="text">: ('</span><span class="id">a</span><span class="text">, '</span><span class="id">b</span><span class="text">) </span><span class="id">t</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>

The signature <span class="c003">MYHASH</span> then contains all the fields of the signature
of the module <span class="c003">Hashtbl</span> (with strengthened type definitions), plus the
new field <span class="c003">replace</span>. An implementation of this signature can be
obtained easily by using the <span class="c004">include</span> construct again, but this
time at the structure level:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">MyHash</span><span class="text"> : </span><span class="kw2">MYHASH</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Hashtbl</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">replace</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">k</span><span class="text"> </span><span class="id">v</span><span class="text"> = </span><span class="id">remove</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">k</span><span class="text">; </span><span class="id">add</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">k</span><span class="text"> </span><span class="id">v</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>Another application where the absence of strengthening comes handy, is
to provide an alternative implementation for an existing module.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">MySet</span><span class="text"> : </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">Set</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   …
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>

This idiom guarantees that <span class="c003">Myset</span> is compatible with Set, but allows
it to represent sets internally in a different way.</p>











<h2 class="section" id="sec251">8&nbsp;&nbsp;Substituting inside a signature</h2>
<ul>
<li><a href="#sec252">8.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li><a href="#sec253">8.2&nbsp;&nbsp;Local substitution declarations</a>
</li></ul>
<p>
<a id="hevea_manual.kwd221"></a>
<a id="hevea_manual.kwd222"></a>
<a id="hevea_manual.kwd223"></a>
<a id="s:signature-substitution"></a></p>
<h3 class="subsection" id="sec252">8.1&nbsp;&nbsp;Destructive substitutions</h3>
<p>
<a id="ss:destructive-substitution"></a></p><p>(Introduced in OCaml 3.12, generalized in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Printable</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">print</span><span class="text"> : </span><span class="kw2">Format</span><span class="text">.</span><span class="id">formatter</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Comparable</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="id">compare</span><span class="text"> : </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">PrintableComparable</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Printable</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Comparable</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> := </span><span class="id">t</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>One can also use this to completely remove a field:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw2">Comparable</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> := </span><span class="kw3">int</span><span class="text">
</span></code><code class="caml-output ok">module type S = sig val compare : int -&gt; int -&gt; int end
</code></pre>


</div><p>

or to rename one:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">u</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Comparable</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> := </span><span class="id">u</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module type S = sig type u val compare : u -&gt; u -&gt; int end
</code></pre>


</div><p>Note that you can also remove manifest types, by substituting with the
same type.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">ComparableInt</span><span class="text"> = </span><span class="kw2">Comparable</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">int</span><span class="text"> ;;
</span></code><code class="caml-output ok">module type ComparableInt = sig type t = int val compare : t -&gt; t -&gt; int end
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">CompareInt</span><span class="text"> = </span><span class="kw2">ComparableInt</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> := </span><span class="kw3">int</span><span class="text">
</span></code><code class="caml-output ok">module type CompareInt = sig val compare : int -&gt; int -&gt; int end
</code></pre>


</div>
<h3 class="subsection" id="sec253">8.2&nbsp;&nbsp;Local substitution declarations</h3>
<p>
<a id="ss:local-substitution"></a></p><p>(Introduced in OCaml 4.08)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Sub</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
     </span><span class="kw">type</span><span class="text"> </span><span class="id">outer</span><span class="text"> := </span><span class="id">t</span><span class="text">
     </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">
     </span><span class="kw">val</span><span class="text"> </span><span class="id">to_outer</span><span class="text"> : </span><span class="id">t</span><span class="text"> -&gt; </span><span class="id">outer</span><span class="text">
   </span><span class="kw1">end</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module type S =
  sig type t module Sub : sig type t val to_outer : t/1 -&gt; t/2 end end
</code></pre>


</div><p>Note that, unlike type declarations, type substitution declarations are not
recursive, so substitutions like the following are rejected:</p><div class="caml-example toplevel">

<pre><code class="caml-input"> module type S = sig
    type 'a poly_list := [ `Cons of 'a * 'a <u>poly_list</u> | `Nil ]
  end ;;
</code><code class="caml-output error">Error: Unbound type constructor poly_list
</code></pre>


</div>











<h2 class="section" id="sec254">9&nbsp;&nbsp;Type-level module aliases</h2>
<p>
<a id="hevea_manual.kwd224"></a>
<a id="s:module-alias"></a></p><p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The above specification, inside a signature, only matches a module
definition equal to <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>. Conversely, a type-level module
alias can be matched by itself, or by any supertype of the type of the
module it references.</p><p>There are several restrictions on <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
it should be of the form <span class="c009">M</span><sub>0</sub>.<span class="c009">M</span><sub>1</sub>...<span class="c009">M</span><sub><span class="c009">n</span></sub> (<em>i.e.</em> without
functor applications);
</li><li class="li-enumerate">inside the body of a functor, <span class="c009">M</span><sub>0</sub> should not be one of the
functor parameters;
</li><li class="li-enumerate">inside a recursive module definition, <span class="c009">M</span><sub>0</sub> should not be one of
the recursively defined modules.
</li></ol><p>Such specifications are also inferred. Namely, when <span class="c010">P</span> is a path
satisfying the above constraints,


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">N</span><span class="text"> = </span><span class="kw2">P</span><span class="text">
</span></code>
</pre>


</div><p>

has type
</p><pre>module N = P
</pre><p>Type-level module aliases are used when checking module path
equalities. That is, in a context where module name <span class="c010">N</span> is known to be
an alias for <span class="c010">P</span>, not only these two module paths check as equal, but
<span class="c010">F</span>&nbsp;(<span class="c010">N</span>) and <span class="c010">F</span>&nbsp;(<span class="c010">P</span>) are also recognized as equal. In the default
compilation mode, this is the only difference with the previous
approach of module aliases having just the same module type as the
module they reference.</p><p>When the compiler flag <span class="c004">-no-alias-deps</span> is enabled, type-level
module aliases are also exploited to avoid introducing dependencies
between compilation units. Namely, a module alias referring to a
module inside another compilation unit does not introduce a link-time
dependency on that compilation unit, as long as it is not
dereferenced; it still introduces a compile-time dependency if the
interface needs to be read, <em>i.e.</em> if the module is a submodule
of the compilation unit, or if some type components are referred to.
Additionally, accessing a module alias introduces a link-time
dependency on the compilation unit containing the module referenced by
the alias, rather than the compilation unit containing the alias.
Note that these differences in link-time behavior may be incompatible
with the previous behavior, as some compilation units might not be
extracted from libraries, and their side-effects ignored.</p><p>These weakened dependencies make possible to use module aliases in
place of the <span class="c004">-pack</span> mechanism. Suppose that you have a library
<span class="c004">Mylib</span> composed of modules <span class="c004">A</span> and <span class="c004">B</span>. Using <span class="c004">-pack</span>, one
would issue the command line
</p><pre>ocamlc -pack a.cmo b.cmo -o mylib.cmo
</pre><p>and as a result obtain a <span class="c004">Mylib</span> compilation unit, containing
physically <span class="c004">A</span> and <span class="c004">B</span> as submodules, and with no dependencies on
their respective compilation units.
Here is a concrete example of a possible alternative approach:
</p><ol class="enumerate" type="1"><li class="li-enumerate">
Rename the files containing <span class="c004">A</span> and <span class="c004">B</span> to <span class="c004">Mylib__A</span> and
<span class="c004">Mylib__B</span>.
</li><li class="li-enumerate">Create a packing interface <span class="c004">Mylib.ml</span>, containing the
following lines.
<pre>module A = Mylib__A
module B = Mylib__B
</pre></li><li class="li-enumerate">Compile <span class="c004">Mylib.ml</span> using <span class="c004">-no-alias-deps</span>, and the other
files using <span class="c004">-no-alias-deps</span> and <span class="c002"><span class="c003">-open</span> <span class="c003">Mylib</span></span> (the last one is
equivalent to adding the line <span class="c002"><span class="c003">open!</span> <span class="c003">Mylib</span></span> at the top of each
file).
<pre>ocamlc -c -no-alias-deps Mylib.ml
ocamlc -c -no-alias-deps -open Mylib Mylib__*.mli Mylib__*.ml
</pre></li><li class="li-enumerate">Finally, create a library containing all the compilation units,
and export all the compiled interfaces.
<pre>ocamlc -a Mylib*.cmo -o Mylib.cma
</pre></li></ol><p>
This approach lets you access <span class="c004">A</span> and <span class="c004">B</span> directly inside the
library, and as <span class="c004">Mylib.A</span> and <span class="c004">Mylib.B</span> from outside.
It also has the advantage that <span class="c004">Mylib</span> is no longer monolithic: if
you use <span class="c004">Mylib.A</span>, only <span class="c004">Mylib__A</span> will be linked in, not
<span class="c004">Mylib__B</span>.
</p><p>Note the use of double underscores in <span class="c004">Mylib__A</span> and
<span class="c004">Mylib__B</span>. These were chosen on purpose; the compiler uses the
following heuristic when printing paths: given a path <span class="c004">Lib__fooBar</span>,
if <span class="c004">Lib.FooBar</span> exists and is an alias for <span class="c004">Lib__fooBar</span>, then the
compiler will always display <span class="c004">Lib.FooBar</span> instead of
<span class="c004">Lib__fooBar</span>. This way the long <span class="c004">Mylib__</span> names stay hidden and
all the user sees is the nicer dot names. This is how the OCaml
standard library is compiled.</p>











<h2 class="section" id="sec255">10&nbsp;&nbsp;Overriding in open statements</h2>
<p><a id="s:explicit-overriding-open"></a>
<a id="hevea_manual.kwd225"></a></p><p>(Introduced in OCaml 4.01)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">let</span>&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">in</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-body-type</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">let</span>&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">in</span>&nbsp;&nbsp;<a class="syntax" href="classes.html#class-body-type"><span class="c010">class-body-type</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-expr</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">let</span>&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">in</span>&nbsp;&nbsp;<a class="syntax" href="classes.html#class-expr"><span class="c010">class-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Since OCaml 4.01, <span class="c004">open</span> statements shadowing an existing identifier
(which is later used) trigger the warning 44. Adding a <span class="c004">!</span>
character after the <span class="c004">open</span> keyword indicates that such a shadowing is
intentional and should not trigger the warning.</p><p>This is also available (since OCaml 4.06) for local opens in class
expressions and class type expressions.</p>











<h2 class="section" id="sec256">11&nbsp;&nbsp;Generalized algebraic datatypes</h2>
<p> <a id="hevea_manual.kwd226"></a>
<a id="hevea_manual.kwd227"></a> <a id="s:gadts"></a></p><p>(Introduced in OCaml 4.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c010">constr-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;[&nbsp;<a class="syntax" href="typedecl.html#constr-args"><span class="c010">constr-args</span></a>&nbsp;<span class="c004">-&gt;</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="typedecl.html#type-param"><span class="c010">type-param</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<a class="syntax" href="typedecl.html#variance"><span class="c010">variance</span></a>]&nbsp;<span class="c004">_</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Generalized algebraic datatypes, or GADTs, extend usual sum types in
two ways: constraints on type parameters may change depending on the
value constructor, and some type variables may be existentially
quantified.
Adding constraints is done by giving an explicit return type
(the rightmost <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> in the above syntax), where type parameters
are instantiated.
This return type must use the same type constructor as the type being
defined, and have the same number of parameters.
Variables are made existential when they appear inside a constructor’s
argument, but not in its return type.</p><p>Since the use of a return type often eliminates the need to name type
parameters in the left-hand side of a type definition, one can replace
them with anonymous types <span class="c004">_</span> in that case.</p><p>The constraints associated to each constructor can be recovered
through pattern-matching.
Namely, if the type of the scrutinee of a pattern-matching contains
a locally abstract type, this type can be refined according to the
constructor used.
These extra constraints are only valid inside the corresponding branch
of the pattern-matching.
If a constructor has some existential variables, fresh locally
abstract types are generated, and they must not escape the
scope of this branch.</p>
<h5 class="paragraph" id="sec257">Recursive functions</h5>
<p>Here is a concrete example:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="numeric">_</span><span class="text"> </span><span class="id">term</span><span class="text"> =
   | </span><span class="kw2">Int</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> </span><span class="id">term</span><span class="text">
   | </span><span class="kw2">Add</span><span class="text"> : (</span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text">) </span><span class="id">term</span><span class="text">
   | </span><span class="kw2">App</span><span class="text"> : ('</span><span class="id">b</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text">) </span><span class="id">term</span><span class="text"> * '</span><span class="id">b</span><span class="text"> </span><span class="id">term</span><span class="text"> -&gt; '</span><span class="id">a</span><span class="text"> </span><span class="id">term</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">eval</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">a</span><span class="text">. </span><span class="id">a</span><span class="text"> </span><span class="id">term</span><span class="text"> -&gt; </span><span class="id">a</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Int</span><span class="text"> </span><span class="id">n</span><span class="text">    -&gt; </span><span class="id">n</span><span class="text">                 </span><span class="comment">(* a = int *)</span><span class="text">
   | </span><span class="kw2">Add</span><span class="text">      -&gt; (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">+</span><span class="id">y</span><span class="text">)  </span><span class="comment">(* a = int -&gt; int -&gt; int *)</span><span class="text">
   | </span><span class="kw2">App</span><span class="text">(</span><span class="id">f</span><span class="text">,</span><span class="id">x</span><span class="text">) -&gt; (</span><span class="id">eval</span><span class="text"> </span><span class="id">f</span><span class="text">) (</span><span class="id">eval</span><span class="text"> </span><span class="id">x</span><span class="text">)
           </span><span class="comment">(* eval called at types (b-&gt;a) and b for fresh b *)</span><span class="text">
</span></code>
</pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">two</span><span class="text"> = </span><span class="id">eval</span><span class="text"> (</span><span class="kw2">App</span><span class="text"> (</span><span class="kw2">App</span><span class="text"> (</span><span class="kw2">Add</span><span class="text">, </span><span class="kw2">Int</span><span class="text"> </span><span class="numeric">1</span><span class="text">), </span><span class="kw2">Int</span><span class="text"> </span><span class="numeric">1</span><span class="text">))
</span></code><code class="caml-output ok">val two : int = 2
</code></pre>


</div><p>

It is important to remark that the function <span class="c003">eval</span> is using the
polymorphic syntax for locally abstract types. When defining a recursive
function that manipulates a GADT, explicit polymorphic recursion should
generally be used. For instance, the following definition fails with a
type error:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"> let rec eval (type a) : a term -&gt; a = function
   | Int n    -&gt; n
   | Add      -&gt; (fun x y -&gt; x+y)
   | App(f,x) -&gt; (eval <u>f</u>) (eval x)
</code><code class="caml-output error">Error: This expression has type ($App_'b -&gt; a) term
       but an expression was expected of type 'a
       The type constructor $App_'b would escape its scope
</code></pre>


</div><p>

In absence of an explicit polymorphic annotation, a monomorphic type
is inferred for the recursive function. If a recursive call occurs
inside the function definition at a type that involves an existential
GADT type variable, this variable flows to the type of the recursive
function, and thus escapes its scope. In the above example, this happens
in the branch <span class="c003">App(f,x)</span> when <span class="c003">eval</span> is called with <span class="c003">f</span> as an argument.
In this branch, the type of <span class="c003">f</span> is <span class="c003">($App_ 'b-&gt; a)</span>. The prefix <span class="c003">$</span> in
<span class="c003">$App_ 'b</span> denotes an existential type named by the compiler
(see&nbsp;<a href="#p%3Aexistential-names">8.11</a>). Since the type of <span class="c003">eval</span> is
<span class="c003">'a term -&gt; 'a</span>, the call <span class="c003">eval f</span> makes the existential type <span class="c003">$App_'b</span>
flow to the type variable <span class="c003">'a</span> and escape its scope. This triggers the
above error.</p>
<h5 class="paragraph" id="sec258">Type inference</h5>
<p>Type inference for GADTs is notoriously hard.
This is due to the fact some types may become ambiguous when escaping
from a branch.
For instance, in the <span class="c003">Int</span> case above, <span class="c003">n</span> could have either type <span class="c003">int</span>
or <span class="c003">a</span>, and they are not equivalent outside of that branch.
As a first approximation, type inference will always work if a
pattern-matching is annotated with types containing no free type
variables (both on the scrutinee and the return type).
This is the case in the above example, thanks to the type annotation
containing only locally abstract types.</p><p>In practice, type inference is a bit more clever than that: type
annotations do not need to be immediately on the pattern-matching, and
the types do not have to be always closed.
As a result, it is usually enough to only annotate functions, as in
the example above. Type annotations are
propagated in two ways: for the scrutinee, they follow the flow of
type inference, in a way similar to polymorphic methods; for the
return type, they follow the structure of the program, they are split
on functions, propagated to all branches of a pattern matching,
and go through tuples, records, and sum types.
Moreover, the notion of ambiguity used is stronger: a type is only
seen as ambiguous if it was mixed with incompatible types (equated by
constraints), without type annotations between them.
For instance, the following program types correctly.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">sum</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">a</span><span class="text">. </span><span class="id">a</span><span class="text"> </span><span class="id">term</span><span class="text"> -&gt; </span><span class="numeric">_</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt;
   </span><span class="kw">let</span><span class="text"> </span><span class="id">y</span><span class="text"> =
     </span><span class="kw1">match</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">with</span><span class="text">
     | </span><span class="kw2">Int</span><span class="text"> </span><span class="id">n</span><span class="text"> -&gt; </span><span class="id">n</span><span class="text">
     | </span><span class="kw2">Add</span><span class="text">   -&gt; </span><span class="numeric">0</span><span class="text">
     | </span><span class="kw2">App</span><span class="text">(</span><span class="id">f</span><span class="text">,</span><span class="id">x</span><span class="text">) -&gt; </span><span class="id">sum</span><span class="text"> </span><span class="id">f</span><span class="text"> + </span><span class="id">sum</span><span class="text"> </span><span class="id">x</span><span class="text">
   </span><span class="kw">in</span><span class="text"> </span><span class="id">y</span><span class="text"> + </span><span class="numeric">1</span><span class="text">
</span></code><code class="caml-output ok">val sum : 'a term -&gt; int = &lt;fun&gt;
</code></pre>


</div><p>

Here the return type <span class="c003">int</span> is never mixed with <span class="c003">a</span>, so it is seen as
non-ambiguous, and can be inferred.
When using such partial type annotations we strongly suggest
specifying the <span class="c003">-principal</span> mode, to check that inference is
principal.</p><p>The exhaustiveness check is aware of GADT constraints, and can
automatically infer that some cases cannot happen.
For instance, the following pattern matching is correctly seen as
exhaustive (the <span class="c003">Add</span> case cannot happen).


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">get_int</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="id">term</span><span class="text"> -&gt; </span><span class="kw3">int</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Int</span><span class="text"> </span><span class="id">n</span><span class="text">    -&gt; </span><span class="id">n</span><span class="text">
   | </span><span class="kw2">App</span><span class="text">(</span><span class="numeric">_</span><span class="text">,</span><span class="numeric">_</span><span class="text">) -&gt; </span><span class="numeric">0</span><span class="text">
</span></code>
</pre>


</div>
<h5 class="paragraph" id="sec259">Refutation cases</h5>
<p> (Introduced in OCaml 4.03)</p><p>Usually, the exhaustiveness check only tries to check whether the
cases omitted from the pattern matching are typable or not.
However, you can force it to try harder by adding <em>refutation cases</em>:
</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="matching-case"><span class="c010">matching-case</span></a></td><td class="c015">::=</td><td class="c017">
<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;[<span class="c004">when</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>]&nbsp;<span class="c004">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">-&gt;</span>&nbsp;<span class="c004">.</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>
In presence of a refutation case, the exhaustiveness check will first
compute the intersection of the pattern with the complement of the
cases preceding it. It then checks whether the resulting patterns can
really match any concrete values by trying to type-check them.
Wild cards in the generated patterns are handled in a special way: if
their type is a variant type with only GADT constructors, then the
pattern is split into the different constructors, in order to check whether
any of them is possible (this splitting is not done for arguments of these
constructors, to avoid non-termination). We also split tuples and
variant types with only one case, since they may contain GADTs inside.
For instance, the following code is deemed exhaustive:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="numeric">_</span><span class="text"> </span><span class="id">t</span><span class="text"> =
   | </span><span class="kw2">Int</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="id">t</span><span class="text">
   | </span><span class="kw2">Bool</span><span class="text"> : </span><span class="kw3">bool</span><span class="text"> </span><span class="id">t</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">deep</span><span class="text"> : (</span><span class="kw3">char</span><span class="text"> </span><span class="id">t</span><span class="text"> * </span><span class="kw3">int</span><span class="text">) </span><span class="id">option</span><span class="text"> -&gt; </span><span class="kw3">char</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">None</span><span class="text"> -&gt; </span><span class="string">'c'</span><span class="text">
   | </span><span class="numeric">_</span><span class="text"> -&gt; .
</span></code>
</pre>


</div><p>Namely, the inferred remaining case is <span class="c003">Some _</span>, which is split into
<span class="c003">Some (Int, _)</span> and <span class="c003">Some (Bool, _)</span>, which are both untypable because
<span class="c003">deep</span> expects a non-existing <span class="c003">char t</span> as the first element of the tuple.
Note that the refutation case could be omitted here, because it is
automatically added when there is only one case in the pattern
matching.</p><p>Another addition is that the redundancy check is now aware of GADTs: a
case will be detected as redundant if it could be replaced by a
refutation case using the same pattern.</p>
<h5 class="paragraph" id="sec260">Advanced examples</h5>
<p>
The <span class="c003">term</span> type we have defined above is an <em>indexed</em> type, where
a type parameter reflects a property of the value contents.
Another use of GADTs is <em>singleton</em> types, where a GADT value
represents exactly one type. This value can be used as runtime
representation for this type, and a function receiving it can have a
polytypic behavior.</p><p>Here is an example of a polymorphic function that takes the
runtime representation of some type <span class="c003">t</span> and a value of the same type,
then pretty-prints the value as a string:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="numeric">_</span><span class="text"> </span><span class="id">typ</span><span class="text"> =
   | </span><span class="kw2">Int</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="id">typ</span><span class="text">
   | </span><span class="kw2">String</span><span class="text"> : </span><span class="kw3">string</span><span class="text"> </span><span class="id">typ</span><span class="text">
   | </span><span class="kw2">Pair</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">typ</span><span class="text"> * '</span><span class="id">b</span><span class="text"> </span><span class="id">typ</span><span class="text"> -&gt; ('</span><span class="id">a</span><span class="text"> * '</span><span class="id">b</span><span class="text">) </span><span class="id">typ</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">to_string</span><span class="text">: </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text">. </span><span class="id">t</span><span class="text"> </span><span class="id">typ</span><span class="text"> -&gt; </span><span class="id">t</span><span class="text"> -&gt; </span><span class="kw3">string</span><span class="text"> =
   </span><span class="kw">fun</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt;
   </span><span class="kw1">match</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw1">with</span><span class="text">
   | </span><span class="kw2">Int</span><span class="text"> -&gt; </span><span class="kw2">Int</span><span class="text">.</span><span class="id">to_string</span><span class="text"> </span><span class="id">x</span><span class="text">
   | </span><span class="kw2">String</span><span class="text"> -&gt; </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">sprintf</span><span class="text"> </span><span class="string">"%S"</span><span class="text"> </span><span class="id">x</span><span class="text">
   | </span><span class="kw2">Pair</span><span class="text">(</span><span class="id">t1</span><span class="text">,</span><span class="id">t2</span><span class="text">) -&gt;
       </span><span class="kw">let</span><span class="text"> (</span><span class="id">x1</span><span class="text">, </span><span class="id">x2</span><span class="text">) = </span><span class="id">x</span><span class="text"> </span><span class="kw">in</span><span class="text">
       </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">sprintf</span><span class="text"> </span><span class="string">"(%s,%s)"</span><span class="text"> (</span><span class="id">to_string</span><span class="text"> </span><span class="id">t1</span><span class="text"> </span><span class="id">x1</span><span class="text">) (</span><span class="id">to_string</span><span class="text"> </span><span class="id">t2</span><span class="text"> </span><span class="id">x2</span><span class="text">)
</span></code>
</pre>


</div><p>Another frequent application of GADTs is equality witnesses.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> (</span><span class="numeric">_</span><span class="text">,</span><span class="numeric">_</span><span class="text">) </span><span class="id">eq</span><span class="text"> = </span><span class="kw2">Eq</span><span class="text"> : ('</span><span class="id">a</span><span class="text">,'</span><span class="id">a</span><span class="text">) </span><span class="id">eq</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">cast</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text">. (</span><span class="id">a</span><span class="text">,</span><span class="id">b</span><span class="text">) </span><span class="id">eq</span><span class="text"> -&gt; </span><span class="id">a</span><span class="text"> -&gt; </span><span class="id">b</span><span class="text"> = </span><span class="kw">fun</span><span class="text"> </span><span class="kw2">Eq</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">x</span><span class="text">
</span></code>
</pre>


</div><p>

Here type <span class="c003">eq</span> has only one constructor, and by matching on it one
adds a local constraint allowing the conversion between <span class="c003">a</span> and <span class="c003">b</span>.
By building such equality witnesses, one can make equal types which
are syntactically different.</p><p>Here is an example using both singleton types and equality witnesses
to implement dynamic types.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">eq_type</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text">. </span><span class="id">a</span><span class="text"> </span><span class="id">typ</span><span class="text"> -&gt; </span><span class="id">b</span><span class="text"> </span><span class="id">typ</span><span class="text"> -&gt; (</span><span class="id">a</span><span class="text">,</span><span class="id">b</span><span class="text">) </span><span class="id">eq</span><span class="text"> </span><span class="id">option</span><span class="text"> =
   </span><span class="kw">fun</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text"> -&gt;
   </span><span class="kw1">match</span><span class="text"> </span><span class="id">a</span><span class="text">, </span><span class="id">b</span><span class="text"> </span><span class="kw1">with</span><span class="text">
   | </span><span class="kw2">Int</span><span class="text">, </span><span class="kw2">Int</span><span class="text"> -&gt; </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text">
   | </span><span class="kw2">String</span><span class="text">, </span><span class="kw2">String</span><span class="text"> -&gt; </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text">
   | </span><span class="kw2">Pair</span><span class="text">(</span><span class="id">a1</span><span class="text">,</span><span class="id">a2</span><span class="text">), </span><span class="kw2">Pair</span><span class="text">(</span><span class="id">b1</span><span class="text">,</span><span class="id">b2</span><span class="text">) -&gt;
       </span><span class="kw1">begin</span><span class="text"> </span><span class="kw1">match</span><span class="text"> </span><span class="id">eq_type</span><span class="text"> </span><span class="id">a1</span><span class="text"> </span><span class="id">b1</span><span class="text">, </span><span class="id">eq_type</span><span class="text"> </span><span class="id">a2</span><span class="text"> </span><span class="id">b2</span><span class="text"> </span><span class="kw1">with</span><span class="text">
       | </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text">, </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text"> -&gt; </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text">
       | </span><span class="numeric">_</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">
       </span><span class="kw1">end</span><span class="text">
   | </span><span class="numeric">_</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">dyn</span><span class="text"> = </span><span class="kw2">Dyn</span><span class="text"> : '</span><span class="id">a</span><span class="text"> </span><span class="id">typ</span><span class="text"> * '</span><span class="id">a</span><span class="text"> -&gt; </span><span class="id">dyn</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">get_dyn</span><span class="text"> : </span><span class="kw">type</span><span class="text"> </span><span class="id">a</span><span class="text">. </span><span class="id">a</span><span class="text"> </span><span class="id">typ</span><span class="text"> -&gt; </span><span class="id">dyn</span><span class="text"> -&gt; </span><span class="id">a</span><span class="text"> </span><span class="id">option</span><span class="text"> =
   </span><span class="kw">fun</span><span class="text"> </span><span class="id">a</span><span class="text"> (</span><span class="kw2">Dyn</span><span class="text">(</span><span class="id">b</span><span class="text">,</span><span class="id">x</span><span class="text">)) -&gt;
   </span><span class="kw1">match</span><span class="text"> </span><span class="id">eq_type</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text"> </span><span class="kw1">with</span><span class="text">
   | </span><span class="kw2">None</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">
   | </span><span class="kw2">Some</span><span class="text"> </span><span class="kw2">Eq</span><span class="text"> -&gt; </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text">
</span></code>
</pre>


</div>
<h5 class="paragraph" id="sec261">Existential type names in error messages</h5>
<p><a id="p:existential-names"></a>
(Updated in OCaml 4.03.0)</p><p>The typing of pattern matching in presence of GADT can generate many
existential types. When necessary, error messages refer to these
existential types using compiler-generated names. Currently, the
compiler generates these names according to the following nomenclature:
</p><ul class="itemize"><li class="li-itemize">
First, types whose name starts with a <span class="c003">$</span> are existentials.
</li><li class="li-itemize"><span class="c003">$Constr_'a</span> denotes an existential type introduced for the type
variable <span class="c003">'a</span> of the GADT constructor <span class="c003">Constr</span>:


<div class="caml-example verbatim">

<pre><code class="caml-input"> type any = Any : 'name -&gt; any
 let escape (Any x) = <u>x</u>
</code><code class="caml-output error">Error: This expression has type $Any_'name
       but an expression was expected of type 'a
       The type constructor $Any_'name would escape its scope
</code></pre>


</div>

</li><li class="li-itemize"><span class="c003">$Constr</span> denotes an existential type introduced for an anonymous type variable in the GADT constructor <span class="c003">Constr</span>:


<div class="caml-example verbatim">

<pre><code class="caml-input"> type any = Any : _ -&gt; any
 let escape (Any x) = <u>x</u>
</code><code class="caml-output error">Error: This expression has type $Any but an expression was expected of type
         'a
       The type constructor $Any would escape its scope
</code></pre>


</div>

</li><li class="li-itemize"><span class="c003">$'a</span> if the existential variable was unified with the type variable <span class="c003">'a</span> during typing:


<div class="caml-example verbatim">

<pre><code class="caml-input"> type ('arg,'result,'aux) fn =
   | Fun: ('a -&gt;'b) -&gt; ('a,'b,unit) fn
   | Mem1: ('a -&gt;'b) * 'a * 'b -&gt; ('a, 'b, 'a * 'b) fn
  let apply: ('arg,'result, _ ) fn -&gt; 'arg -&gt; 'result = fun f x -&gt;
   match f with
   | Fun f -&gt; f x
   | <u>Mem1 (f,y,fy)</u> -&gt; if x = y then fy else f x
</code><code class="caml-output error">Error: This pattern matches values of type
         ($'arg, 'result, $'arg * 'result) fn
       but a pattern was expected which matches values of type
         ($'arg, 'result, unit) fn
       The type constructor $'arg would escape its scope
</code></pre>


</div>

</li><li class="li-itemize"><span class="c003">$n</span> (n a number) is an internally generated existential which could not be named using one of the previous schemes.
</li></ul><p>As shown by the last item, the current behavior is imperfect
and may be improved in future versions.</p>
<h5 class="paragraph" id="sec262">Equations on non-local abstract types</h5>
<p> (Introduced in OCaml
4.04)</p><p>GADT pattern-matching may also add type equations to non-local
abstract types. The behaviour is the same as with local abstract
types. Reusing the above <span class="c003">eq</span> type, one can write:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw">val</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="id">t</span><span class="text"> </span><span class="kw">val</span><span class="text"> </span><span class="id">e</span><span class="text"> : (</span><span class="id">t</span><span class="text">,</span><span class="kw3">int</span><span class="text">) </span><span class="id">eq</span><span class="text"> </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">33</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">e</span><span class="text"> = </span><span class="kw2">Eq</span><span class="text">
 </span><span class="kw1">end</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> = </span><span class="kw">let</span><span class="text"> </span><span class="kw2">Eq</span><span class="text"> = </span><span class="kw2">M</span><span class="text">.</span><span class="id">e</span><span class="text"> </span><span class="kw">in</span><span class="text"> </span><span class="kw2">M</span><span class="text">.</span><span class="id">x</span><span class="text">
</span></code>
</pre>


</div><p>Of course, not all abstract types can be refined, as this would
contradict the exhaustiveness check. Namely, builtin types (those
defined by the compiler itself, such as <span class="c003">int</span> or <span class="c003">array</span>), and
abstract types defined by the local module, are non-instantiable, and
as such cause a type error rather than introduce an equation.</p>











<h2 class="section" id="sec263">12&nbsp;&nbsp;Syntax for Bigarray access</h2>
<p><a id="s:bigarray-access"></a></p><p>(Introduced in Objective Caml 3.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>&nbsp;<span class="c004">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This extension provides syntactic sugar for getting and setting
elements in the arrays provided by the <a href="../../api/4.08/Bigarray.html"><span class="c003">Bigarray</span></a> module.</p><p>The short expressions are translated into calls to functions of the
<span class="c003">Bigarray</span> module as described in the following table.</p><div class="tableau">
<div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">expression</span></td><td class="c014"><span class="c013">translation</span> </td></tr>
<tr><td class="c016">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array1.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array1.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array2.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array2.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Array3.get </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub><span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Array3.set </span><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>3</sub> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> …<span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub><span class="c004">}</span></td><td class="c016"><span class="c003">Bigarray.Genarray.get </span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> <span class="c004">[|</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span>
&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> <span class="c004">|]</span> </td></tr>
<tr><td class="c016"><a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub><span class="c004">.{</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> …<span class="c004">,</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub><span class="c002"><span class="c003">}</span> <span class="c003">&lt;-</span></span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c016"><span class="c003">Bigarray.Genarray.set </span> <a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>0</sub> <span class="c004">[|</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub><span class="c004">,</span> … <span class="c004">,</span>
&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub><span class="c009">n</span></sub> <span class="c004">|]</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a> </td></tr>
</tbody></table></div></div><p>The last two entries are valid for any <span class="c009">n</span> &gt; 3.</p>











<h2 class="section" id="sec264">13&nbsp;&nbsp;Attributes</h2>
<ul>
<li><a href="#sec265">13.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
<p><a id="s:attributes"></a></p><p><a id="hevea_manual.kwd228"></a></p><p>(Introduced in OCaml 4.02,
infix notations for constructs other than expressions added in 4.03)</p><p>Attributes are “decorations” of the syntax tree which are mostly
ignored by the type-checker but can be used by external tools. An
attribute is made of an identifier and a payload, which can be a
structure, a type expression (prefixed with <span class="c003">:</span>), a signature
(prefixed with <span class="c003">:</span>) or a pattern (prefixed with <span class="c003">?</span>) optionally
followed by a <span class="c003">when</span> clause:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="attr-id"><span class="c010">attr-id</span></a></td><td class="c015">::=</td><td class="c017">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c010">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<a class="syntax" href="lex.html#capitalized-ident"><span class="c010">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<a class="syntax" href="#attr-id"><span class="c010">attr-id</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;<a class="syntax" href="#attr-id"><span class="c010">attr-id</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="attr-payload"><span class="c010">attr-payload</span></a></td><td class="c015">::=</td><td class="c017">
[&nbsp;<a class="syntax" href="modules.html#module-items"><span class="c010">module-items</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">:</span>&nbsp;[&nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">?</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;[<span class="c004">when</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The first form of attributes is attached with a postfix notation on
“algebraic” categories:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="attribute"><span class="c010">attribute</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[@</span>&nbsp;<a class="syntax" href="#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-expr</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-expr"><span class="c010">class-expr</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-type</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-type"><span class="c010">class-type</span></a>&nbsp;&nbsp;<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This form of attributes can also be inserted after the <span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a>
in polymorphic variant type expressions (<a class="syntax" href="types.html#tag-spec-first"><span class="c010">tag-spec-first</span></a>, <a class="syntax" href="types.html#tag-spec"><span class="c010">tag-spec</span></a>,
<a class="syntax" href="types.html#tag-spec-full"><span class="c010">tag-spec-full</span></a>) or after the <a class="syntax" href="names.html#method-name"><span class="c010">method-name</span></a> in <a class="syntax" href="types.html#method-type"><span class="c010">method-type</span></a>.</p><p>The same syntactic form is also used to attach attributes to labels and
constructors in type declarations:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<span class="c010">field-decl</span></td><td class="c015">::=</td><td class="c017">
[<span class="c004">mutable</span>]&nbsp;<a class="syntax" href="names.html#field-name"><span class="c010">field-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c010">poly-typexpr</span></a>&nbsp;&nbsp;{<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a></td><td class="c015">::=</td><td class="c017">
(<a class="syntax" href="names.html#constr-name"><span class="c010">constr-name</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">()</span>)&nbsp;[&nbsp;<span class="c004">of</span>&nbsp;<a class="syntax" href="typedecl.html#constr-args"><span class="c010">constr-args</span></a>&nbsp;]&nbsp;&nbsp;{<a class="syntax" href="#attribute"><span class="c010">attribute</span></a>}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Note: when a label declaration is followed by a semi-colon, attributes
can also be put after the semi-colon (in which case they are merged to
those specified before).</p><p>The second form of attributes are attached to “blocks” such as type
declarations, class fields, etc:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="item-attribute"><span class="c010">item-attribute</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[@@</span>&nbsp;<a class="syntax" href="#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">typedef</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="typedecl.html#typedef"><span class="c010">typedef</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">exception-definition</span></td><td class="c015">::=</td><td class="c017">
<span class="c004">exception</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">exception</span>&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c010">constr-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">module-items</span></td><td class="c015">::=</td><td class="c017">
[<span class="c004">;;</span>]&nbsp;(&nbsp;<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}&nbsp;)&nbsp;&nbsp;{&nbsp;[<span class="c004">;;</span>]&nbsp;<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">;;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}&nbsp;}&nbsp;&nbsp;[<span class="c004">;;</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-binding</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-binding"><span class="c010">class-binding</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-spec</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-spec"><span class="c010">class-spec</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">classtype-def</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#classtype-def"><span class="c010">classtype-def</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">let</span>&nbsp;[<span class="c004">rec</span>]&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c010">let-binding</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c010">let-binding</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c010">external-declaration</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c010">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="typedecl.html#exception-definition"><span class="c010">exception-definition</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-definition"><span class="c010">class-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c010">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">)</span>&nbsp;}
&nbsp;[&nbsp;<span class="c004">:</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;]&nbsp;&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c010">modtype-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">include</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">rec</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">=</span>&nbsp;
&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}&nbsp;
&nbsp;{&nbsp;<span class="c004">and</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;
&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">val</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c010">external-declaration</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c010">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">exception</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c010">constr-decl</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-specification"><span class="c010">class-specification</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c010">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">)</span>&nbsp;}
<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c010">modtype-name</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<span class="c004">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c010">modtype-name</span></a>&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">include</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-field-spec</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-field-spec"><span class="c010">class-field-spec</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a>&nbsp;&nbsp;<a class="syntax" href="#item-attribute"><span class="c010">item-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>A third form of attributes appears as stand-alone structure or
signature items in the module or class sub-languages. They are not
attached to any specific node in the syntax tree:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="floating-attribute"><span class="c010">floating-attribute</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[@@@</span>&nbsp;<a class="syntax" href="#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#floating-attribute"><span class="c010">floating-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#floating-attribute"><span class="c010">floating-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-field-spec</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#floating-attribute"><span class="c010">floating-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#floating-attribute"><span class="c010">floating-attribute</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>(Note: contrary to what the grammar above describes, <span class="c010">item-attributes</span>
cannot be attached to these floating attributes in <a class="syntax" href="classes.html#class-field-spec"><span class="c010">class-field-spec</span></a>
and <a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a>.)</p><p>It is also possible to specify attributes using an infix syntax. For instance:</p><pre>let[@foo] x = 2 in x + 1          === (let x = 2 [@@foo] in x + 1)
begin[@foo][@bar x] ... end       === (begin ... end)[@foo][@@bar x]
module[@foo] M = ...              === module M = ... [@@foo]
type[@foo] t = T                  === type t = T [@@foo]
method[@foo] m = ...              === method m = ... [@@foo]
</pre><p>
For <span class="c003">let</span>, the attributes are applied to each bindings:</p><pre>let[@foo] x = 2 and y = 3 in x + y === (let x = 2 [@@foo] and y = 3 in x + y)
let[@foo] x = 2
and[@bar] y = 3 in x + y           === (let x = 2 [@@foo] and y = 3 [@bar] in x + y)
</pre>
<h3 class="subsection" id="sec265">13.1&nbsp;&nbsp;Built-in attributes</h3>
<p>
<a id="ss:builtin-attributes"></a></p><p>Some attributes are understood by the type-checker:
</p><ul class="itemize"><li class="li-itemize">
“ocaml.warning” or “warning”, with a string literal payload.
This can be used as floating attributes in a
signature/structure/object/object type. The string is parsed and has
the same effect as the <span class="c003">-w</span> command-line option, in the scope between
the attribute and the end of the current
signature/structure/object/object type. The attribute can also be
attached to any kind of syntactic item which support attributes
(such as an expression, or a type expression)
in which case its scope is limited to that item.
Note that it is not well-defined which scope is used for a specific
warning. This is implementation dependent and can change between versions.
Some warnings are even completely outside the control of “ocaml.warning”
(for instance, warnings 1, 2, 14, 29 and 50).</li><li class="li-itemize">“ocaml.warnerror” or “warnerror”, with a string literal payload.
Same as “ocaml.warning”, for the <span class="c003">-warn-error</span> command-line option.</li><li class="li-itemize">“ocaml.alert” or “alert”: see section&nbsp;<a href="manual044.html#s%3Aalerts">8.22</a>.</li><li class="li-itemize">“ocaml.deprecated” or “deprecated”: alias for the
“deprecated” alert, see section&nbsp;<a href="manual044.html#s%3Aalerts">8.22</a>.
</li><li class="li-itemize">“ocaml.deprecated_mutable” or “deprecated_mutable”.
Can be applied to a mutable record label. If the label is later
used to modify the field (with “expr.l &lt;- expr”), the “deprecated” alert
will be triggered. If the payload of the attribute is a string literal,
the alert message includes this text.
</li><li class="li-itemize">“ocaml.ppwarning” or “ppwarning”, in any context, with
a string literal payload. The text is reported as warning (22)
by the compiler (currently, the warning location is the location
of the string payload). This is mostly useful for preprocessors which
need to communicate warnings to the user. This could also be used
to mark explicitly some code location for further inspection.
</li><li class="li-itemize">“ocaml.warn_on_literal_pattern” or “warn_on_literal_pattern” annotate
constructors in type definition. A warning (52) is then emitted when this
constructor is pattern matched with a constant literal as argument. This
attribute denotes constructors whose argument is purely informative and
may change in the future. Therefore, pattern matching on this argument
with a constant literal is unreliable. For instance, all built-in exception
constructors are marked as “warn_on_literal_pattern”.
Note that, due to an implementation limitation, this warning (52) is only
triggered for single argument constructor.
</li><li class="li-itemize">“ocaml.tailcall” or “tailcall” can be applied to function
application in order to check that the call is tailcall optimized.
If it it not the case, a warning (51) is emitted.
</li><li class="li-itemize">“ocaml.inline” or “inline” take either “never”, “always”
or nothing as payload on a function or functor definition. If no payload
is provided, the default value is “always”. This payload controls when
applications of the annotated functions should be inlined.
</li><li class="li-itemize">“ocaml.inlined” or “inlined” can be applied to any function or functor
application to check that the call is inlined by the compiler. If the call
is not inlined, a warning (55) is emitted.
</li><li class="li-itemize">“ocaml.noalloc”, “ocaml.unboxed”and “ocaml.untagged” or
“noalloc”, “unboxed” and “untagged” can be used on external
definitions to obtain finer control over the C-to-OCaml interface. See
<a href="intfc.html#s%3AC-cheaper-call">20.11</a> for more details.
</li><li class="li-itemize">“ocaml.immediate” or “immediate” applied on an abstract type mark the type as
having a non-pointer implementation (e.g. “int”, “bool”, “char” or
enumerated types). Mutation of these immediate types does not activate the
garbage collector’s write barrier, which can significantly boost performance in
programs relying heavily on mutable state.
</li><li class="li-itemize"><span class="c003">ocaml.unboxed</span> or <span class="c003">unboxed</span> can be used on a type definition if the
type is a single-field record or a concrete type with a single
constructor that has a single argument. It tells the compiler to
optimize the representation of the type by removing the block that
represents the record or the constructor (i.e. a value of this type
is physically equal to its argument). In the case of GADTs, an
additional restriction applies: the argument must not be an
existential variable, represented by an existential type variable,
or an abstract type constructor applied to an existential type
variable.
</li><li class="li-itemize"><span class="c003">ocaml.boxed</span> or <span class="c003">boxed</span> can be used on type definitions to mean
the opposite of <span class="c003">ocaml.unboxed</span>: keep the unoptimized
representation of the type. When there is no annotation, the
default is currently <span class="c003">boxed</span> but it may change in the future.
</li><li class="li-itemize"><span class="c003">ocaml.local</span> or <span class="c003">local</span> take either <span class="c003">never</span>, <span class="c003">always</span>, <span class="c003">maybe</span> or
nothing as payload on a function definition. If no payload is
provided, the default is <span class="c003">always</span>. The attribute controls an
optimization which consists in compiling a function into a static
continuation. Contrary to inlining, this optimization does not
duplicate the function’s body. This is possible when all
references to the function are full applications, all sharing the
same continuation (for instance, the returned value of several
branches of a pattern matching). <span class="c003">never</span> disables the optimization,
<span class="c003">always</span> asserts that the optimization applies (otherwise a warning
55 is emitted) and <span class="c003">maybe</span> lets the optimization apply when
possible (this is the default behavior when the attribute is not
specified). The optimization is implicitly disabled when using the
bytecode compiler in debug mode (-g), and for functions marked with
an <span class="c003">ocaml.inline always</span> or <span class="c003">ocaml.unrolled</span> attribute which
supersede <span class="c003">ocaml.local</span>.
</li></ul><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">X</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   [@@@</span><span class="id">warning</span><span class="text"> </span><span class="string">"+9"</span><span class="text">]  </span><span class="comment">(* locally enable warning 9 in this structure *)</span><span class="text">
   …
 </span><span class="kw1">end</span><span class="text">
 [@@</span><span class="id">deprecated</span><span class="text"> </span><span class="string">"Please use module 'Y' instead."</span><span class="text">]

 </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">begin</span><span class="text">[@</span><span class="id">warning</span><span class="text"> </span><span class="string">"+9"</span><span class="text">] […] </span><span class="kw1">end</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">A</span><span class="text"> | </span><span class="kw2">B</span><span class="text">
   [@@</span><span class="id">deprecated</span><span class="text"> </span><span class="string">"Please use type 's' instead."</span><span class="text">]
</span></code>
</pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"> let fires_warning_22 x =
   assert (x &gt;= 0) [@ppwarning <u>"TODO: remove this later"</u>]
</code>
<code class="caml-output warn">Warning 22: TODO: remove this later
</code></pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"> let rec is_a_tail_call = function
   | [] -&gt; ()
   | _ :: q -&gt; (is_a_tail_call[@tailcall]) q

 let rec not_a_tail_call = function
   | [] -&gt; []
   | x :: q -&gt; x :: <u>(not_a_tail_call[@tailcall]) q</u>
</code>
<code class="caml-output warn">Warning 51: expected tailcall
</code></pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">x</span><span class="text"> [@@</span><span class="id">inline</span><span class="text">]

 </span><span class="kw">let</span><span class="text"> () = (</span><span class="id">f</span><span class="text">[@</span><span class="id">inlined</span><span class="text">]) ()
</span></code>
</pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">fragile</span><span class="text"> =
   | </span><span class="kw2">Int</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text"> [@</span><span class="id">warn_on_literal_pattern</span><span class="text">]
   | </span><span class="kw2">String</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> [@</span><span class="id">warn_on_literal_pattern</span><span class="text">]
</span></code>
</pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"> let fragile_match_1 = function
 | Int <u>0</u> -&gt; ()
 | _ -&gt; ()
</code><code class="caml-output warn">Warning 52: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 9.5)
val fragile_match_1 : fragile -&gt; unit = &lt;fun&gt;
</code></pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"> let fragile_match_2 = function
 | String <u>"constant"</u> -&gt; ()
 | _ -&gt; ()
</code><code class="caml-output warn">Warning 52: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 9.5)
val fragile_match_2 : fragile -&gt; unit = &lt;fun&gt;
</code></pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Immediate</span><span class="text">: </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> [@@</span><span class="id">immediate</span><span class="text">]
   </span><span class="kw">val</span><span class="text"> </span><span class="id">x</span><span class="text">: </span><span class="id">t</span><span class="text"> </span><span class="kw1">ref</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">A</span><span class="text"> | </span><span class="kw2">B</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw1">ref</span><span class="text"> </span><span class="kw2">A</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div>











<h2 class="section" id="sec266">14&nbsp;&nbsp;Extension nodes</h2>
<ul>
<li><a href="#sec267">14.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
<p><a id="s:extension-nodes"></a></p><p>(Introduced in OCaml 4.02,
infix notations for constructs other than expressions added in 4.03,
infix notation (e1 ;%ext e2) added in 4.04.
)</p><p>Extension nodes are generic placeholders in the syntax tree. They are
rejected by the type-checker and are intended to be “expanded” by external
tools such as <span class="c003">-ppx</span> rewriters.</p><p>Extension nodes share the same notion of identifier and payload as
attributes&nbsp;<a href="manual035.html#s%3Aattributes">8.13</a>.</p><p>The first form of extension node is used for “algebraic” categories:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="extension"><span class="c010">extension</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[%</span>&nbsp;<a class="syntax" href="manual035.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="manual035.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="patterns.html#pattern"><span class="c010">pattern</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-expr</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-type</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#extension"><span class="c010">extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>A second form of extension node can be used in structures and
signatures, both in the module and object languages:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="item-extension"><span class="c010">item-extension</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[%%</span>&nbsp;<a class="syntax" href="manual035.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="manual035.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#item-extension"><span class="c010">item-extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#item-extension"><span class="c010">item-extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">class-field-spec</span></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#item-extension"><span class="c010">item-extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="classes.html#class-field"><span class="c010">class-field</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#item-extension"><span class="c010">item-extension</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>An infix form is available for extension nodes when
the payload is of the same kind
(expression with expression, pattern with pattern ...).</p><p>Examples:</p><pre>let%foo x = 2 in x + 1     === [%foo let x = 2 in x + 1]
begin%foo ... end          === [%foo begin ... end]
x ;%foo 2                  === [%foo x; 2]
module%foo M = ..          === [%%foo module M = ... ]
val%foo x : t              === [%%foo: val x : t]
</pre><p>
When this form is used together with the infix syntax for attributes,
the attributes are considered to apply to the payload:</p><pre>fun%foo[@bar] x -&gt; x + 1 === [%foo (fun x -&gt; x + 1)[@bar ] ];
</pre><p>
Quoted strings <span class="c003">{|...|}</span> are particularly interesting for payloads
that embed foreign syntax fragments. Those fragments can be interpreted
by a preprocessor and turned into OCaml code without requiring escaping
quotes. For instance, you can use <span class="c003">[%sql {|...|}]</span> to
represent arbitrary SQL statements – assuming you have a ppx-rewriter
that recognizes the <span class="c003">%sql</span> extension.</p><p>Note that the word-delimited form, for example <span class="c003">{sql|...|sql}</span>, should
not be used for signaling that an extension is in use.
Indeed, the user cannot see from the code whether this string literal has
different semantics than they expect. Moreover, giving semantics to a
specific delimiter limits the freedom to change the delimiter to avoid
escaping issues.</p>
<h3 class="subsection" id="sec267">14.1&nbsp;&nbsp;Built-in extension nodes</h3>
<p>(Introduced in OCaml 4.03)</p><p>Some extension nodes are understood by the compiler itself:
</p><ul class="itemize"><li class="li-itemize">
“ocaml.extension_constructor” or “extension_constructor”
take as payload a constructor from an extensible variant type
(see <a href="manual037.html#s%3Aextensible-variants">8.15</a>) and return its extension
constructor slot.
</li></ul><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = ..
 </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> += </span><span class="kw2">X</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text"> | </span><span class="kw2">Y</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = [</span><span class="kw5">%extension_constructor</span><span class="text"> </span><span class="kw2">X</span><span class="text">]
 </span><span class="kw">let</span><span class="text"> </span><span class="id">y</span><span class="text"> = [</span><span class="kw5">%extension_constructor</span><span class="text"> </span><span class="kw2">Y</span><span class="text">]
</span></code>
</pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text">  </span><span class="id">x</span><span class="text"> &lt;&gt; </span><span class="id">y</span><span class="text">;;
</span></code><code class="caml-output ok">- : bool = true
</code></pre>


</div>











<h2 class="section" id="sec268">15&nbsp;&nbsp;Extensible variant types</h2>
<ul>
<li><a href="#sec269">15.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
<p><a id="s:extensible-variants"></a></p><p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Expr</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">attr</span><span class="text"> = ..

   </span><span class="kw">type</span><span class="text"> </span><span class="id">attr</span><span class="text"> += </span><span class="kw2">Str</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">

   </span><span class="kw">type</span><span class="text"> </span><span class="id">attr</span><span class="text"> +=
     | </span><span class="kw2">Int</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
     | </span><span class="kw2">Float</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">float</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>Pattern matching on an extensible variant type requires a default case
to handle unknown variant constructors:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">to_string</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Expr</span><span class="text">.</span><span class="kw2">Str</span><span class="text"> </span><span class="id">s</span><span class="text"> -&gt; </span><span class="id">s</span><span class="text">
   | </span><span class="kw2">Expr</span><span class="text">.</span><span class="kw2">Int</span><span class="text"> </span><span class="id">i</span><span class="text"> -&gt; </span><span class="kw2">Int</span><span class="text">.</span><span class="id">to_string</span><span class="text"> </span><span class="id">i</span><span class="text">
   | </span><span class="kw2">Expr</span><span class="text">.</span><span class="kw2">Float</span><span class="text"> </span><span class="id">f</span><span class="text"> -&gt; </span><span class="id">string_of_float</span><span class="text"> </span><span class="id">f</span><span class="text">
   | </span><span class="numeric">_</span><span class="text"> -&gt; </span><span class="string">"?"</span><span class="text">
</span></code>
</pre>


</div><p>A preexisting example of an extensible variant type is the built-in
<span class="c003">exn</span> type used for exceptions. Indeed, exception constructors can be
declared using the type extension syntax:


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">exn</span><span class="text"> += </span><span class="kw2">Exc</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
</span></code>
</pre>


</div><p>Extensible variant constructors can be rebound to a different name. This
allows exporting variants from another module.


</p><div class="caml-example toplevel">

<pre><code class="caml-input"> let not_in_scope = <u>Str</u> "Foo";;
</code><code class="caml-output error">Error: Unbound constructor Str
</code></pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Expr</span><span class="text">.</span><span class="id">attr</span><span class="text"> += </span><span class="kw2">Str</span><span class="text"> = </span><span class="kw2">Expr</span><span class="text">.</span><span class="kw2">Str</span><span class="text">
</span></code>
</pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">now_works</span><span class="text"> = </span><span class="kw2">Str</span><span class="text"> </span><span class="string">"foo"</span><span class="text">;;
</span></code><code class="caml-output ok">val now_works : Expr.attr = Expr.Str "foo"
</code></pre>


</div><p>Extensible variant constructors can be declared <span class="c003">private</span>. As with
regular variants, this prevents them from being constructed directly by
constructor application while still allowing them to be de-structured in
pattern-matching.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">B</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Expr</span><span class="text">.</span><span class="id">attr</span><span class="text"> += </span><span class="kw">private</span><span class="text"> </span><span class="kw2">Bool</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">val</span><span class="text"> </span><span class="kw3">bool</span><span class="text"> : </span><span class="kw3">bool</span><span class="text"> -&gt; </span><span class="kw2">Expr</span><span class="text">.</span><span class="id">attr</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Expr</span><span class="text">.</span><span class="id">attr</span><span class="text"> += </span><span class="kw2">Bool</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">int</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="kw3">bool</span><span class="text"> </span><span class="id">p</span><span class="text"> = </span><span class="kw1">if</span><span class="text"> </span><span class="id">p</span><span class="text"> </span><span class="kw1">then</span><span class="text"> </span><span class="kw2">Bool</span><span class="text"> </span><span class="numeric">1</span><span class="text"> </span><span class="kw1">else</span><span class="text"> </span><span class="kw2">Bool</span><span class="text"> </span><span class="numeric">0</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">inspection_works</span><span class="text"> = </span><span class="kw">function</span><span class="text">
    | </span><span class="kw2">B</span><span class="text">.</span><span class="kw2">Bool</span><span class="text"> </span><span class="id">p</span><span class="text"> -&gt; (</span><span class="id">p</span><span class="text"> = </span><span class="numeric">1</span><span class="text">)
    | </span><span class="numeric">_</span><span class="text"> -&gt; </span><span class="constant">true</span><span class="text">;;
</span></code><code class="caml-output ok">val inspection_works : Expr.attr -&gt; bool = &lt;fun&gt;
</code></pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"> let construction_is_forbidden = <u>B.Bool 1</u>;;
</code><code class="caml-output error">Error: Cannot create values of the private type Expr.attr
</code></pre>


</div>
<h3 class="subsection" id="sec269">15.1&nbsp;&nbsp;Private extensible variant types</h3>
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Msg</span><span class="text"> : </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw">private</span><span class="text"> ..
   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">MkConstr</span><span class="text"> (</span><span class="kw2">X</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw1">end</span><span class="text">) : </span><span class="kw1">sig</span><span class="text">
     </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> += </span><span class="kw2">C</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">X</span><span class="text">.</span><span class="id">t</span><span class="text">
   </span><span class="kw1">end</span><span class="text">
 </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = ..
   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">MkConstr</span><span class="text"> (</span><span class="kw2">X</span><span class="text"> : </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw1">end</span><span class="text">) = </span><span class="kw1">struct</span><span class="text">
     </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> += </span><span class="kw2">C</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw2">X</span><span class="text">.</span><span class="id">t</span><span class="text">
   </span><span class="kw1">end</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div>











<h2 class="section" id="sec270">16&nbsp;&nbsp;Generative functors</h2>
<p><a id="s:generative-functors"></a></p><p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">functor</span>&nbsp;<span class="c004">()</span>&nbsp;<span class="c004">-&gt;</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;<span class="c004">()</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">)</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">()</span>&nbsp;}
[&nbsp;<span class="c004">:</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;]&nbsp;&nbsp;<span class="c004">=</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">functor</span>&nbsp;<span class="c004">()</span>&nbsp;<span class="c004">-&gt;</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>&nbsp;<span class="c004">)</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">()</span>&nbsp;}
<span class="c004">:</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>A generative functor takes a unit <span class="c003">()</span> argument.
In order to use it, one must necessarily apply it to this unit argument,
ensuring that all type components in the result of the functor behave
in a generative way, <em>i.e.</em> they are different from types obtained
by other applications of the same functor.
This is equivalent to taking an argument of signature <span class="c003">sig end</span>, and always
applying to <span class="c003">struct end</span>, but not to some defined module (in the
latter case, applying twice to the same module would return identical
types).</p><p>As a side-effect of this generativity, one is allowed to unpack
first-class modules in the body of generative functors.</p>











<h2 class="section" id="sec271">17&nbsp;&nbsp;Extension-only syntax</h2>
<ul>
<li><a href="#sec272">17.1&nbsp;&nbsp;Extension operators</a>
</li><li><a href="#sec273">17.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
<p>
(Introduced in OCaml 4.02.2, extended in 4.03)</p><p>Some syntactic constructions are accepted during parsing and rejected
during type checking. These syntactic constructions can therefore not
be used directly in vanilla OCaml. However, <span class="c003">-ppx</span> rewriters and other
external tools can exploit this parser leniency to extend the language
with these new syntactic constructions by rewriting them to
vanilla constructions.
</p>
<h3 class="subsection" id="sec272">17.1&nbsp;&nbsp;Extension operators</h3>
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
<h3 class="subsection" id="sec273">17.2&nbsp;&nbsp;Extension literals</h3>
<p> <a id="s:extension-literals"></a>
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











<h2 class="section" id="sec274">18&nbsp;&nbsp;Inline records</h2>
<p> <a id="s:inline-records"></a>
(Introduced in OCaml 4.03)
</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<span class="c010">constr-args</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="typedecl.html#record-decl"><span class="c010">record-decl</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>The arguments of sum-type constructors can now be defined using the
same syntax as records. Mutable and polymorphic fields are allowed.
GADT syntax is supported. Attributes can be specified on individual
fields.</p><p>Syntactically, building or matching constructors with such an inline
record argument is similar to working with a unary constructor whose
unique argument is a declared record type. A pattern can bind
the inline record as a pseudo-value, but the record cannot escape the
scope of the binding and can only be used with the dot-notation to
extract or modify fields or to build new constructor values.</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> =
   | </span><span class="kw2">Point</span><span class="text"> </span><span class="kw">of</span><span class="text"> {</span><span class="id">width</span><span class="text">: </span><span class="kw3">int</span><span class="text">; </span><span class="kw">mutable</span><span class="text"> </span><span class="id">x</span><span class="text">: </span><span class="kw3">float</span><span class="text">; </span><span class="kw">mutable</span><span class="text"> </span><span class="id">y</span><span class="text">: </span><span class="kw3">float</span><span class="text">}
   | </span><span class="kw2">Other</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">v</span><span class="text"> = </span><span class="kw2">Point</span><span class="text"> {</span><span class="id">width</span><span class="text"> = </span><span class="numeric">10</span><span class="text">; </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0</span><span class="text">.; </span><span class="id">y</span><span class="text"> = </span><span class="numeric">0</span><span class="text">.}

 </span><span class="kw">let</span><span class="text"> </span><span class="id">scale</span><span class="text"> </span><span class="id">l</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Point</span><span class="text"> </span><span class="id">p</span><span class="text"> -&gt; </span><span class="kw2">Point</span><span class="text"> {</span><span class="id">p</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="id">l</span><span class="text"> *. </span><span class="id">p</span><span class="text">.</span><span class="id">x</span><span class="text">; </span><span class="id">y</span><span class="text"> = </span><span class="id">l</span><span class="text"> *. </span><span class="id">p</span><span class="text">.</span><span class="id">y</span><span class="text">}
   | </span><span class="kw2">Other</span><span class="text"> -&gt; </span><span class="kw2">Other</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">print</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Point</span><span class="text"> {</span><span class="id">x</span><span class="text">; </span><span class="id">y</span><span class="text">; </span><span class="numeric">_</span><span class="text">} -&gt; </span><span class="kw2">Printf</span><span class="text">.</span><span class="id">printf</span><span class="text"> </span><span class="string">"%f/%f"</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="id">y</span><span class="text">
   | </span><span class="kw2">Other</span><span class="text"> -&gt; ()

 </span><span class="kw">let</span><span class="text"> </span><span class="id">reset</span><span class="text"> = </span><span class="kw">function</span><span class="text">
   | </span><span class="kw2">Point</span><span class="text"> </span><span class="id">p</span><span class="text"> -&gt; </span><span class="id">p</span><span class="text">.</span><span class="id">x</span><span class="text"> &lt;- </span><span class="numeric">0</span><span class="text">.; </span><span class="id">p</span><span class="text">.</span><span class="id">y</span><span class="text"> &lt;- </span><span class="numeric">0</span><span class="text">.
   | </span><span class="kw2">Other</span><span class="text"> -&gt; ()
</span></code>
</pre>


</div><div class="caml-example verbatim">

<pre><code class="caml-input"> let invalid = function
   | Point p -&gt; <u>p</u>
</code><code class="caml-output error">Error: This form is not allowed as the type of the inlined record could escape.
</code></pre>


</div>











<h2 class="section" id="sec275">19&nbsp;&nbsp;Documentation comments</h2>
<ul>
<li><a href="#sec276">19.1&nbsp;&nbsp;Floating comments</a>
</li><li><a href="#sec277">19.2&nbsp;&nbsp;Item comments</a>
</li><li><a href="#sec278">19.3&nbsp;&nbsp;Label comments</a>
</li></ul>
<p>
(Introduced in OCaml 4.03)</p><p>Comments which start with <span class="c003">**</span> are treated specially by the
compiler. They are automatically converted during parsing into
attributes (see <a href="manual035.html#s%3Aattributes">8.13</a>) to allow tools to process them as
documentation.</p><p>Such comments can take three forms: <em>floating comments</em>, <em>item
comments</em> and <em>label comments</em>. Any comment starting with <span class="c003">**</span> which
does not match one of these forms will cause the compiler to emit
warning 50.</p><p>Comments which start with <span class="c003">**</span> are also used by the ocamldoc
documentation generator (see <a href="ocamldoc.html#c%3Aocamldoc">16</a>). The three comment forms
recognised by the compiler are a subset of the forms accepted by
ocamldoc (see <a href="ocamldoc.html#s%3Aocamldoc-comments">16.2</a>).</p>
<h3 class="subsection" id="sec276">19.1&nbsp;&nbsp;Floating comments</h3>
<p>Comments surrounded by blank lines that appear within structures,
signatures, classes or class types are converted into
<a class="syntax" href="manual035.html#floating-attribute"><span class="c010">floating-attribute</span></a>s. For example:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">

 </span><span class="comment">(** Now some definitions for [t] *)</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">mkT</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
</span></code>
</pre>


</div><p>will be converted to:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">

 [@@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">text</span><span class="text"> </span><span class="string">" Now some definitions for [t] "</span><span class="text">]

 </span><span class="kw">let</span><span class="text"> </span><span class="id">mkT</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
</span></code>
</pre>


</div>
<h3 class="subsection" id="sec277">19.2&nbsp;&nbsp;Item comments</h3>
<p>Comments which appear <em>immediately before</em> or <em>immediately
after</em> a structure item, signature item, class item or class type item
are converted into <a class="syntax" href="manual035.html#item-attribute"><span class="c010">item-attribute</span></a>s. Immediately before or immediately
after means that there must be no blank lines, <span class="c003">;;</span>, or other
documentation comments between them. For example:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
 </span><span class="comment">(** A description of [t] *)</span><span class="text">

</span></code>
</pre>


</div><p>or</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="comment">(** A description of [t] *)</span><span class="text">
 </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
</span></code>
</pre>


</div><p>will be converted to:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
 [@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" A description of [t] "</span><span class="text">]
</span></code>
</pre>


</div><p>Note that, if a comment appears immediately next to multiple items,
as in:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
 </span><span class="comment">(** An ambiguous comment *)</span><span class="text">
 </span><span class="kw">type</span><span class="text"> </span><span class="id">s</span><span class="text"> = </span><span class="kw2">S</span><span class="text">
</span></code>
</pre>


</div><p>then it will be attached to both items:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text">
 [@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" An ambiguous comment "</span><span class="text">]
 </span><span class="kw">type</span><span class="text"> </span><span class="id">s</span><span class="text"> = </span><span class="kw2">S</span><span class="text">
 [@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" An ambiguous comment "</span><span class="text">]
</span></code>
</pre>


</div><p>and the compiler will emit warning 50.</p>
<h3 class="subsection" id="sec278">19.3&nbsp;&nbsp;Label comments</h3>
<p>Comments which appear <em>immediately after</em> a labelled argument,
record field, variant constructor, object method or polymorphic variant
constructor are are converted into <a class="syntax" href="manual035.html#attribute"><span class="c010">attribute</span></a>s. Immediately
after means that there must be no blank lines or other documentation
comments between them. For example:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t1</span><span class="text"> = </span><span class="id">lbl</span><span class="text">:</span><span class="kw3">int</span><span class="text"> </span><span class="comment">(** Labelled argument *)</span><span class="text"> -&gt; </span><span class="kw3">unit</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t2</span><span class="text"> = {
   </span><span class="id">fld</span><span class="text">: </span><span class="kw3">int</span><span class="text">; </span><span class="comment">(** Record field *)</span><span class="text">
   </span><span class="id">fld2</span><span class="text">: </span><span class="kw3">float</span><span class="text">;
 }

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t3</span><span class="text"> =
   | </span><span class="kw2">Cstr</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> </span><span class="comment">(** Variant constructor *)</span><span class="text">
   | </span><span class="kw2">Cstr2</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t4</span><span class="text"> = &lt; </span><span class="id">meth</span><span class="text">: </span><span class="kw3">int</span><span class="text"> * </span><span class="kw3">int</span><span class="text">; </span><span class="comment">(** Object method *)</span><span class="text"> &gt;

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t5</span><span class="text"> = [
   `</span><span class="kw2">PCstr</span><span class="text"> </span><span class="comment">(** Polymorphic variant constructor *)</span><span class="text">
 ]
</span></code>
</pre>


</div><p>will be converted to:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t1</span><span class="text"> = </span><span class="id">lbl</span><span class="text">:(</span><span class="kw3">int</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Labelled argument "</span><span class="text">]) -&gt; </span><span class="kw3">unit</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t2</span><span class="text"> = {
   </span><span class="id">fld</span><span class="text">: </span><span class="kw3">int</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Record field "</span><span class="text">];
   </span><span class="id">fld2</span><span class="text">: </span><span class="kw3">float</span><span class="text">;
 }

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t3</span><span class="text"> =
   | </span><span class="kw2">Cstr</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Variant constructor "</span><span class="text">]
   | </span><span class="kw2">Cstr2</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t4</span><span class="text"> = &lt; </span><span class="id">meth</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> * </span><span class="kw3">int</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Object method "</span><span class="text">] &gt;

 </span><span class="kw">type</span><span class="text"> </span><span class="id">t5</span><span class="text"> = [
   `</span><span class="kw2">PCstr</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Polymorphic variant constructor "</span><span class="text">]
 ]
</span></code>
</pre>


</div><p>Note that label comments take precedence over item comments, so:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
 </span><span class="comment">(** Attaches to T not t *)</span><span class="text">
</span></code>
</pre>


</div><p>will be converted to:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> =  </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Attaches to T not t "</span><span class="text">]
</span></code>
</pre>


</div><p>whilst:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
 </span><span class="comment">(** Attaches to T not t *)</span><span class="text">
 </span><span class="comment">(** Attaches to t *)</span><span class="text">
</span></code>
</pre>


</div><p>will be converted to:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> =  </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text"> [@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Attaches to T not t "</span><span class="text">]
 [@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Attaches to t "</span><span class="text">]
</span></code>
</pre>


</div><p>In the absence of meaningful comment on the last constructor of
a type, an empty comment&nbsp;<span class="c003">(**)</span> can be used instead:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
 </span><span class="comment">(**)</span><span class="text">
 </span><span class="comment">(** Attaches to t *)</span><span class="text">
</span></code>
</pre>


</div><p>will be converted directly to</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> =  </span><span class="kw2">T</span><span class="text"> </span><span class="kw">of</span><span class="text"> </span><span class="kw3">string</span><span class="text">
 [@@</span><span class="id">ocaml</span><span class="text">.</span><span class="id">doc</span><span class="text"> </span><span class="string">" Attaches to t "</span><span class="text">]
</span></code>
</pre>


</div>











<h2 class="section" id="s:index-operators">20&nbsp;&nbsp;Extended indexing operators  </h2>
<p>
(Introduced in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018"><a class="syntax" id="dot-ext"><span class="c010">dot-ext</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;(<span class="c004">!</span>∣&nbsp;<span class="c004">$</span>∣&nbsp;<span class="c004">%</span>∣&nbsp;<span class="c004">&amp;</span>∣&nbsp;<span class="c004">*</span>∣&nbsp;<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>∣&nbsp;<span class="c004">/</span>∣&nbsp;<span class="c004">:</span>∣&nbsp;<span class="c004">=</span>∣&nbsp;<span class="c004">&gt;</span>∣&nbsp;<span class="c004">?</span>∣&nbsp;<span class="c004">@</span>∣&nbsp;<span class="c004">^</span>∣&nbsp;<span class="c004">|</span>∣&nbsp;<span class="c004">~</span>)&nbsp;{&nbsp;<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
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

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">Dict</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
 </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Hashtbl</span><span class="text">
 </span><span class="kw">let</span><span class="text"> ( .%{} ) </span><span class="id">tabl</span><span class="text"> </span><span class="id">index</span><span class="text"> = </span><span class="id">find</span><span class="text"> </span><span class="id">tabl</span><span class="text"> </span><span class="id">index</span><span class="text">
 </span><span class="kw">let</span><span class="text"> ( .%{}&lt;- ) </span><span class="id">tabl</span><span class="text"> </span><span class="id">index</span><span class="text"> </span><span class="id">value</span><span class="text"> = </span><span class="id">add</span><span class="text"> </span><span class="id">tabl</span><span class="text"> </span><span class="id">index</span><span class="text"> </span><span class="id">value</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="id">dict</span><span class="text"> =
   </span><span class="kw">let</span><span class="text"> </span><span class="id">dict</span><span class="text"> = </span><span class="kw2">Dict</span><span class="text">.</span><span class="id">create</span><span class="text"> </span><span class="numeric">10</span><span class="text"> </span><span class="kw">in</span><span class="text">
   </span><span class="kw">let</span><span class="text"> () =
     </span><span class="id">dict</span><span class="text">.</span><span class="kw2">Dict</span><span class="text">.%{</span><span class="string">"one"</span><span class="text">} &lt;- </span><span class="numeric">1</span><span class="text">;
     </span><span class="kw">let</span><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">Dict</span><span class="text"> </span><span class="kw">in</span><span class="text">
     </span><span class="id">dict</span><span class="text">.%{</span><span class="string">"two"</span><span class="text">} &lt;- </span><span class="numeric">2</span><span class="text"> </span><span class="kw">in</span><span class="text">
   </span><span class="id">dict</span><span class="text">
</span></code>
</pre>


</div><div class="caml-example toplevel">

<pre><code class="caml-input"><span class="text"> </span><span class="id">dict</span><span class="text">.</span><span class="kw2">Dict</span><span class="text">.%{</span><span class="string">"one"</span><span class="text">};;
</span></code><code class="caml-output ok">- : int = 1
</code></pre>

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">Dict</span><span class="text"> </span><span class="kw">in</span><span class="text"> </span><span class="id">dict</span><span class="text">.%{</span><span class="string">"two"</span><span class="text">};;
</span></code><code class="caml-output ok">- : int = 2
</code></pre>


</div>











<h2 class="section" id="s:empty-variants">21&nbsp;&nbsp;Empty variant types </h2>
<p>
(Introduced in 4.07.0)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="typedecl.html#type-representation"><span class="c010">type-representation</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">=</span>&nbsp;<span class="c004">|</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>
This extension allows user to define empty variants.
Empty variant type can be eliminated by refutation case of pattern matching.


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = |
 </span><span class="kw">let</span><span class="text"> </span><span class="id">f</span><span class="text"> (</span><span class="id">x</span><span class="text">: </span><span class="id">t</span><span class="text">) = </span><span class="kw1">match</span><span class="text"> </span><span class="id">x</span><span class="text"> </span><span class="kw1">with</span><span class="text"> </span><span class="numeric">_</span><span class="text"> -&gt; .
</span></code>
</pre>


</div>











<h2 class="section" id="s:alerts">22&nbsp;&nbsp;Alerts  </h2>
<p>
(Introduced in 4.08)</p><p>Since OCaml 4.08, it is possible to mark components (such as value or
type declarations) in signatures with “alerts” that will be reported
when those components are referenced. This generalizes the notion of
“deprecated” components which were previously reported as warning 3.
Those alerts can be used for instance to report usage of unsafe
features, or of features which are only available on some platforms,
etc.</p><p>Alert categories are identified by a symbolic identifier (a lowercase
identifier, following the usual lexical rules) and an optional
message. The identifier is used to control which alerts are enabled,
and which ones are turned into fatal errors. The message is reported
to the user when the alert is triggered (i.e. when the marked
component is referenced).</p><p>The <span class="c003">ocaml.alert</span> or <span class="c003">alert</span> attribute serves two purposes: (i) to
mark component with an alert to be triggered when the component is
referenced, and (ii) to control which alert names are enabled. In the
first form, the attribute takes an identifier possibly
followed by a message. Here is an example of a value declaration marked
with an alert:</p><pre>module U: sig
  val fork: unit -&gt; bool
    [@@alert unix "This function is only available under Unix."]
end
</pre><p>
Here <span class="c003">unix</span> is the identifier for the alert. If this alert category
is enabled, any reference to <span class="c003">U.fork</span> will produce a message at
compile time, which can be turned or not into a fatal error.</p><p>And here is another example as a floating attribute on top
of an “.mli” file (i.e. before any other non-attribute item)
or on top of an “.ml” file without a corresponding interface file,
so that any reference to that unit will trigger the alert:</p><pre>[@@@alert unsafe "This module is unsafe!"]
</pre><p>Controlling which alerts are enabled and whether they are turned into
fatal errors is done either through the compiler’s command-line option
<span class="c003">-alert &lt;spec&gt;</span> or locally in the code through the <span class="c003">alert</span> or
<span class="c003">ocaml.alert</span> attribute taking a single string payload <span class="c003">&lt;spec&gt;</span>. In
both cases, the syntax for <span class="c003">&lt;spec&gt;</span> is a concatenation of items of the
form:</p><ul class="itemize"><li class="li-itemize">
<span class="c003">+id</span> enables alert <span class="c003">id</span>.
</li><li class="li-itemize"><span class="c003">-id</span> disables alert <span class="c003">id</span>.
</li><li class="li-itemize"><span class="c003">++id</span> turns alert <span class="c003">id</span> into a fatal error.
</li><li class="li-itemize"><span class="c003">--id</span> turns alert <span class="c003">id</span> into non-fatal mode.
</li><li class="li-itemize"><span class="c003">@id</span> equivalent to <span class="c003">++id+id</span> (enables <span class="c003">id</span> and turns it into a fatal-error)
</li></ul><p>As a special case, if <span class="c003">id</span> is <span class="c003">all</span>, it stands for all alerts.</p><p>Here are some examples:</p><pre>(* Disable all alerts, reenables just unix (as a soft alert) and window
   (as a fatal-error), for the rest of the current structure *)

[@@@alert "-all--all+unix@window"]
 ...

let x =
  (* Locally disable the window alert *)
  begin[@alert "-window"]
      ...
  end
</pre><p>
Before OCaml 4.08, there was support for a single kind of deprecation
alert. It is now known as the <span class="c003">deprecated</span> alert, but legacy
attributes to trigger it and the legacy ways to control it as warning
3 are still supported. For instance, passing <span class="c003">-w +3</span> on the
command-line is equivant to <span class="c003">-alert +deprecated</span>, and:</p><pre>val x: int
  [@@@ocaml.deprecated "Please do something else"]
</pre><p>
is equivalent to:</p><pre>val x: int
  [@@@ocaml.alert deprecated "Please do something else"]
</pre>











<h2 class="section" id="s:generalized-open">23&nbsp;&nbsp;Generalized open statements</h2>
<p>(Introduced in 4.08)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="modules.html#definition"><span class="c010">definition</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open</span>&nbsp;&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c010">extended-module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c010">extended-module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">let</span>&nbsp;<span class="c004">open</span>&nbsp;&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;<span class="c004">in</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">let</span>&nbsp;<span class="c004">open!</span>&nbsp;<a class="syntax" href="modules.html#module-expr"><span class="c010">module-expr</span></a>&nbsp;<span class="c004">in</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This extension makes it possible to open any module expression in
module structures and expressions. A similar mechanism is also available
inside module types, but only for extended module paths (e.g. <span class="c003">F(X).G(Y)</span>).</p><p>For instance, a module can be constrained when opened with</p><div class="caml-example verbatim">

<pre><code class="caml-input"> module M = struct let x = 0 let hidden = 1 end
 open (M:sig val x: int end)
 let y = <u>hidden</u>
</code>
<code class="caml-output error">Error: Unbound value hidden
</code></pre>


</div><p>Another possibility is to immediately open the result of a functor application</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text">   </span><span class="kw">let</span><span class="text"> </span><span class="id">sort</span><span class="text"> (</span><span class="kw">type</span><span class="text"> </span><span class="id">x</span><span class="text">) (</span><span class="id">x</span><span class="text">:</span><span class="id">x</span><span class="text"> </span><span class="kw3">list</span><span class="text">) =
     </span><span class="kw">let</span><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">Set</span><span class="text">.</span><span class="kw2">Make</span><span class="text">(</span><span class="kw1">struct</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="id">x</span><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">compare</span><span class="text">=</span><span class="id">compare</span><span class="text"> </span><span class="kw1">end</span><span class="text">) </span><span class="kw">in</span><span class="text">
     </span><span class="id">elements</span><span class="text"> (</span><span class="id">of_list</span><span class="text"> </span><span class="id">x</span><span class="text">)
</span></code><code class="caml-output ok">val sort : 'a list -&gt; 'a list = &lt;fun&gt;
</code></pre>


</div><p>Going further, this construction can introduce local components inside a
structure,</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0</span><span class="text">
   </span><span class="kw">open</span><span class="text">! </span><span class="kw1">struct</span><span class="text">
     </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="numeric">0</span><span class="text">
     </span><span class="kw">let</span><span class="text"> </span><span class="id">y</span><span class="text"> = </span><span class="numeric">1</span><span class="text">
   </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">w</span><span class="text"> = </span><span class="id">x</span><span class="text"> + </span><span class="id">y</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module M : sig val x : int val w : int end
</code></pre>


</div><p>One important restriction is that types introduced by <span class="c002"><span class="c003">open</span> <span class="c003">struct</span></span> ...
<span class="c004">end</span> cannot appear in the signature of the enclosing structure, unless they
are defined equal to some non-local type.
So:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">open</span><span class="text"> </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> = '</span><span class="id">a</span><span class="text"> </span><span class="id">option</span><span class="text"> = </span><span class="kw2">None</span><span class="text"> | </span><span class="kw2">Some</span><span class="text"> </span><span class="kw">of</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> : </span><span class="kw3">int</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">Some</span><span class="text"> </span><span class="numeric">1</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module M : sig val x : int option end
</code></pre>


</div><p>

is OK, but:</p><div class="caml-example verbatim">

<pre><code class="caml-input"> module M = struct
   <u>open struct type t = A end</u>
   let x = A
 end
</code><code class="caml-output error">Error: The type t/3742 introduced by this open appears in the signature
       File "exten.etex", line 3, characters 6-7:
         The value x has no valid type if t/3742 is hidden
</code></pre>


</div><p>

is not because <span class="c003">x</span> cannot be given any type other than <span class="c003">t</span>, which only exists
locally. Although the above would be OK if <span class="c003">x</span> too was local:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">M</span><span class="text">: </span><span class="kw1">sig</span><span class="text"> </span><span class="kw1">end</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">open</span><span class="text"> </span><span class="kw1">struct</span><span class="text">
   </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> = </span><span class="kw2">A</span><span class="text">
   </span><span class="kw1">end</span><span class="text">
   …
   </span><span class="kw">open</span><span class="text"> </span><span class="kw1">struct</span><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw2">A</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   …
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module M : sig  end
</code></pre>


</div><p>Inside signatures, extended opens are limited to extended module paths,


</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">S</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">F</span><span class="text">: </span><span class="kw1">sig</span><span class="text"> </span><span class="kw1">end</span><span class="text"> -&gt; </span><span class="kw1">sig</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="id">t</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">module</span><span class="text"> </span><span class="kw2">X</span><span class="text">: </span><span class="kw1">sig</span><span class="text"> </span><span class="kw1">end</span><span class="text">
   </span><span class="kw">open</span><span class="text"> </span><span class="kw2">F</span><span class="text">(</span><span class="kw2">X</span><span class="text">)
   </span><span class="kw">val</span><span class="text"> </span><span class="id">f</span><span class="text">: </span><span class="id">t</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module type S =
  sig
    module F : sig  end -&gt; sig type t end
    module X : sig  end
    val f : F(X).t
  end
</code></pre>


</div><p>and not</p><pre>  open struct type t = int end
</pre><p>
In those situations, local substitutions(see <a href="manual030.html#ss%3Alocal-substitution">8.8.2</a>)
can be used instead.</p><p>Beware that this extension is not available inside class definitions:</p><pre>class c =
  let open Set.Make(Int) in
  ...
</pre>










<h2 class="section" id="s:binding-operators">24&nbsp;&nbsp;Binding operators </h2>
<ul>
<li><a href="#sec284">24.1&nbsp;&nbsp;Rationale</a>
</li></ul>
<p>
(Introduced in 4.08.0)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="let-operator"><span class="c010">let-operator</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">let</span>&nbsp;(<span class="c004">$</span>∣&nbsp;<span class="c004">&amp;</span>∣&nbsp;<span class="c004">*</span>∣&nbsp;<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>∣&nbsp;<span class="c004">/</span>∣&nbsp;<span class="c004">&lt;</span>∣&nbsp;<span class="c004">=</span>∣&nbsp;<span class="c004">&gt;</span>∣&nbsp;<span class="c004">@</span>∣&nbsp;<span class="c004">^</span>∣&nbsp;<span class="c004">|</span>)&nbsp;{&nbsp;<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="and-operator"><span class="c010">and-operator</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">and</span>&nbsp;(<span class="c004">$</span>∣&nbsp;<span class="c004">&amp;</span>∣&nbsp;<span class="c004">*</span>∣&nbsp;<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>∣&nbsp;<span class="c004">/</span>∣&nbsp;<span class="c004">&lt;</span>∣&nbsp;<span class="c004">=</span>∣&nbsp;<span class="c004">&gt;</span>∣&nbsp;<span class="c004">@</span>∣&nbsp;<span class="c004">^</span>∣&nbsp;<span class="c004">|</span>)&nbsp;{&nbsp;<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">operator-name</span>&nbsp;</td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#let-operator"><span class="c010">let-operator</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#and-operator"><span class="c010">and-operator</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#let-operator"><span class="c010">let-operator</span></a>&nbsp;&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c010">let-binding</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#and-operator"><span class="c010">and-operator</span></a>&nbsp;&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c010">let-binding</span></a>&nbsp;}&nbsp;&nbsp;<span class="c010">in</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Users can define <em>let operators</em>:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> ( </span><span class="kw">let</span><span class="text">* ) </span><span class="id">o</span><span class="text"> </span><span class="id">f</span><span class="text"> =
   </span><span class="kw1">match</span><span class="text"> </span><span class="id">o</span><span class="text"> </span><span class="kw1">with</span><span class="text">
   | </span><span class="kw2">None</span><span class="text"> -&gt; </span><span class="kw2">None</span><span class="text">
   | </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text"> -&gt; </span><span class="id">f</span><span class="text"> </span><span class="id">x</span><span class="text">

 </span><span class="kw">let</span><span class="text"> </span><span class="id">return</span><span class="text"> </span><span class="id">x</span><span class="text"> = </span><span class="kw2">Some</span><span class="text"> </span><span class="id">x</span><span class="text">
</span></code><code class="caml-output ok">val ( let* ) : 'a option -&gt; ('a -&gt; 'b option) -&gt; 'b option = &lt;fun&gt;
val return : 'a -&gt; 'a option = &lt;fun&gt;
</code></pre>


</div><p>and then apply them using this convenient syntax:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">find_and_sum</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k1</span><span class="text"> </span><span class="id">k2</span><span class="text"> =
   </span><span class="kw">let</span><span class="text">* </span><span class="id">x1</span><span class="text"> = </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find_opt</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k1</span><span class="text"> </span><span class="kw">in</span><span class="text">
   </span><span class="kw">let</span><span class="text">* </span><span class="id">x2</span><span class="text"> = </span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find_opt</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k2</span><span class="text"> </span><span class="kw">in</span><span class="text">
     </span><span class="id">return</span><span class="text"> (</span><span class="id">x1</span><span class="text"> + </span><span class="id">x2</span><span class="text">)
</span></code><code class="caml-output ok">val find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;fun&gt;
</code></pre>


</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">let</span><span class="text"> </span><span class="id">find_and_sum</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k1</span><span class="text"> </span><span class="id">k2</span><span class="text"> =
   ( </span><span class="kw">let</span><span class="text">* ) (</span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find_opt</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k1</span><span class="text">)
     (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x1</span><span class="text"> -&gt;
        ( </span><span class="kw">let</span><span class="text">* ) (</span><span class="kw2">Hashtbl</span><span class="text">.</span><span class="id">find_opt</span><span class="text"> </span><span class="id">tbl</span><span class="text"> </span><span class="id">k2</span><span class="text">)
          (</span><span class="kw">fun</span><span class="text"> </span><span class="id">x2</span><span class="text"> -&gt; </span><span class="id">return</span><span class="text"> (</span><span class="id">x1</span><span class="text"> + </span><span class="id">x2</span><span class="text">)))
</span></code><code class="caml-output ok">val find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;fun&gt;
</code></pre>


</div><p>Users can also define <em>and operators</em>:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw2">ZipSeq</span><span class="text"> = </span><span class="kw1">struct</span><span class="text">

   </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> = '</span><span class="id">a</span><span class="text"> </span><span class="kw2">Seq</span><span class="text">.</span><span class="id">t</span><span class="text">

   </span><span class="kw">open</span><span class="text"> </span><span class="kw2">Seq</span><span class="text">

   </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">return</span><span class="text"> </span><span class="id">x</span><span class="text"> =
     </span><span class="kw">fun</span><span class="text"> () -&gt; </span><span class="kw2">Cons</span><span class="text">(</span><span class="id">x</span><span class="text">, </span><span class="id">return</span><span class="text"> </span><span class="id">x</span><span class="text">)

   </span><span class="kw">let</span><span class="text"> </span><span class="kw">rec</span><span class="text"> </span><span class="id">prod</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text"> =
     </span><span class="kw">fun</span><span class="text"> () -&gt;
       </span><span class="kw1">match</span><span class="text"> </span><span class="id">a</span><span class="text"> (), </span><span class="id">b</span><span class="text"> () </span><span class="kw1">with</span><span class="text">
       | </span><span class="kw2">Nil</span><span class="text">, </span><span class="numeric">_</span><span class="text"> | </span><span class="numeric">_</span><span class="text">, </span><span class="kw2">Nil</span><span class="text"> -&gt; </span><span class="kw2">Nil</span><span class="text">
       | </span><span class="kw2">Cons</span><span class="text">(</span><span class="id">x</span><span class="text">, </span><span class="id">a</span><span class="text">), </span><span class="kw2">Cons</span><span class="text">(</span><span class="id">y</span><span class="text">, </span><span class="id">b</span><span class="text">) -&gt; </span><span class="kw2">Cons</span><span class="text">((</span><span class="id">x</span><span class="text">, </span><span class="id">y</span><span class="text">), </span><span class="id">prod</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text">)

   </span><span class="kw">let</span><span class="text"> ( </span><span class="kw">let</span><span class="text">+ ) </span><span class="id">f</span><span class="text"> </span><span class="id">s</span><span class="text"> = </span><span class="id">map</span><span class="text"> </span><span class="id">s</span><span class="text"> </span><span class="id">f</span><span class="text">
   </span><span class="kw">let</span><span class="text"> ( </span><span class="kw">and</span><span class="text">+ ) </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text"> = </span><span class="id">prod</span><span class="text"> </span><span class="id">a</span><span class="text"> </span><span class="id">b</span><span class="text">

 </span><span class="kw1">end</span><span class="text">
</span></code><code class="caml-output ok">module ZipSeq :
  sig
    type 'a t = 'a Seq.t
    val return : 'a -&gt; 'a Seq.t
    val prod : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
    val ( let+ ) : 'a Seq.t -&gt; ('a -&gt; 'b) -&gt; 'b Seq.t
    val ( and+ ) : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
  end
</code></pre>


</div><p>to support the syntax:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">ZipSeq</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="id">sum3</span><span class="text"> </span><span class="id">z1</span><span class="text"> </span><span class="id">z2</span><span class="text"> </span><span class="id">z3</span><span class="text"> =
   </span><span class="kw">let</span><span class="text">+ </span><span class="id">x1</span><span class="text"> = </span><span class="id">z1</span><span class="text">
   </span><span class="kw">and</span><span class="text">+ </span><span class="id">x2</span><span class="text"> = </span><span class="id">z2</span><span class="text">
   </span><span class="kw">and</span><span class="text">+ </span><span class="id">x3</span><span class="text"> = </span><span class="id">z3</span><span class="text"> </span><span class="kw">in</span><span class="text">
     </span><span class="id">x1</span><span class="text"> + </span><span class="id">x2</span><span class="text"> + </span><span class="id">x3</span><span class="text">
</span></code><code class="caml-output ok">val sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;fun&gt;
</code></pre>


</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">open</span><span class="text"> </span><span class="kw2">ZipSeq</span><span class="text">
 </span><span class="kw">let</span><span class="text"> </span><span class="id">sum3</span><span class="text"> </span><span class="id">z1</span><span class="text"> </span><span class="id">z2</span><span class="text"> </span><span class="id">z3</span><span class="text"> =
   ( </span><span class="kw">let</span><span class="text">+ ) (( </span><span class="kw">and</span><span class="text">+ ) (( </span><span class="kw">and</span><span class="text">+ ) </span><span class="id">z1</span><span class="text"> </span><span class="id">z2</span><span class="text">) </span><span class="id">z3</span><span class="text">)
     (</span><span class="kw">fun</span><span class="text"> ((</span><span class="id">x1</span><span class="text">, </span><span class="id">x2</span><span class="text">), </span><span class="id">x3</span><span class="text">) -&gt; </span><span class="id">x1</span><span class="text"> + </span><span class="id">x2</span><span class="text"> + </span><span class="id">x3</span><span class="text">)
</span></code><code class="caml-output ok">val sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;fun&gt;
</code></pre>


</div>
<h3 class="subsection" id="sec284">24.1&nbsp;&nbsp;Rationale</h3>
<p>This extension is intended to provide a convenient syntax for working
with monads and applicatives.</p><p>An applicative should provide a module implementing the following
interface:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Applicative_syntax</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">type</span><span class="text"> '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> ( </span><span class="kw">let</span><span class="text">+ ) : '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; ('</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text">) -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> ( </span><span class="kw">and</span><span class="text">+ ): '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; ('</span><span class="id">a</span><span class="text"> * '</span><span class="id">b</span><span class="text">) </span><span class="id">t</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>where <span class="c003">(let+)</span> is bound to the <span class="c003">map</span> operation and <span class="c003">(and+)</span> is bound to
the monoidal product operation.</p><p>A monad should provide a module implementing the following interface:</p><div class="caml-example verbatim">

<pre><code class="caml-input"><span class="text"> </span><span class="kw">module</span><span class="text"> </span><span class="kw">type</span><span class="text"> </span><span class="kw2">Monad_syntax</span><span class="text"> = </span><span class="kw1">sig</span><span class="text">
   </span><span class="kw">include</span><span class="text"> </span><span class="kw2">Applicative_syntax</span><span class="text">
   </span><span class="kw">val</span><span class="text"> ( </span><span class="kw">let</span><span class="text">* ) : '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; ('</span><span class="id">a</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="id">t</span><span class="text">) -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="id">t</span><span class="text">
   </span><span class="kw">val</span><span class="text"> ( </span><span class="kw">and</span><span class="text">* ): '</span><span class="id">a</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; '</span><span class="id">b</span><span class="text"> </span><span class="id">t</span><span class="text"> -&gt; ('</span><span class="id">a</span><span class="text"> * '</span><span class="id">b</span><span class="text">) </span><span class="id">t</span><span class="text">
 </span><span class="kw1">end</span><span class="text">
</span></code>
</pre>


</div><p>where <span class="c003">(let*)</span> is bound to the <span class="c003">bind</span> operation, and <span class="c003">(and*)</span> is also
bound to the monoidal product operation.</p>




<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>