<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec237"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.08</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
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

<pre><div class="caml-input"> type t =
   | Point of {width: int; mutable x: float; mutable y: float}
   | Other

 let v = Point {width = 10; x = 0.; y = 0.}

 let scale l = function
   | Point p -&gt; Point {p with x = l *. p.x; y = l *. p.y}
   | Other -&gt; Other

 let print = function
   | Point {x; y; _} -&gt; Printf.printf "%f/%f" x y
   | Other -&gt; ()

 let reset = function
   | Point p -&gt; p.x &lt;- 0.; p.y &lt;- 0.
   | Other -&gt; ()
</div>
</pre>


</div><div class="caml-example verbatim">

<pre><div class="caml-input"> let invalid = function
   | Point p -&gt; <u>p</u>
</div><div class="caml-output error">Error: This form is not allowed as the type of the inlined record could escape.
</div></pre>


</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>