<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.09</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual023.html#start-section">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="manual024.html#start-section">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="manual025.html#start-section">3&nbsp;&nbsp;Private types</a>
</li><li><a href="manual026.html#start-section">4&nbsp;&nbsp;Local opens for patterns</a>
</li><li><a href="manual027.html#start-section">5&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="manual028.html#start-section">6&nbsp;&nbsp;First-class modules</a>
</li><li><a href="manual029.html#start-section">7&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="manual030.html#start-section">8&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="manual031.html#start-section">9&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="manual032.html#start-section">10&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="manual033.html#start-section">11&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="manual034.html#start-section">12&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="manual035.html#start-section">13&nbsp;&nbsp;Attributes</a>
</li><li><a href="manual036.html#start-section">14&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="manual037.html#start-section">15&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="manual038.html#start-section">16&nbsp;&nbsp;Generative functors</a>
</li><li><a href="manual039.html#start-section">17&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="manual040.html#start-section">18&nbsp;&nbsp;Inline records</a>
</li><li><a href="manual041.html#start-section">19&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="manual042.html#start-section">20&nbsp;&nbsp;Extended indexing operators  </a>
</li><li><a href="manual043.html#start-section">21&nbsp;&nbsp;Empty variant types </a>
</li><li><a href="manual044.html#start-section">22&nbsp;&nbsp;Alerts  </a>
</li><li><a href="manual045.html#start-section">23&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="manual046.html#start-section">24&nbsp;&nbsp;Binding operators </a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




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

<pre><div class="caml-input"> module Dict = struct
 include Hashtbl
 let ( .%{} ) tabl index = find tabl index
 let ( .%{}&lt;- ) tabl index value = add tabl index value
 end
 let dict =
   let dict = Dict.create 10 in
   let () =
     dict.Dict.%{"one"} &lt;- 1;
     let open Dict in
     dict.%{"two"} &lt;- 2 in
   dict
</div>
</pre>


</div><div class="caml-example toplevel">

<pre><div class="caml-input"> dict.Dict.%{"one"};;
</div><div class="caml-output ok">- : int = 1
</div></pre>

<pre><div class="caml-input"> let open Dict in dict.%{"two"};;
</div><div class="caml-output ok">- : int = 2
</div></pre>


</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>