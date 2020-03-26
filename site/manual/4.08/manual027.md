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

<pre><div class="caml-input"> let f = fun (type t) (foo : t list) -&gt; …
</div>
</pre>


</div><p>

and even use the alternative syntax for declaring functions:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let f (type t) (foo : t list) = …
</div>
</pre>


</div><p>

If several locally abstract types need to be introduced, it is possible to use
the syntax
<span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
as syntactic sugar for <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> … <span class="c002"><span class="c003">-&gt;</span>
<span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>. For instance,


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let f = fun (type t u v) -&gt; fun (foo : (t * u * v) list) -&gt; …
 let f' (type t u v) (foo : (t * u * v) list) = …
</div>
</pre>


</div><p>This construction is useful because the type constructors it introduces
can be used in places where a type variable is not allowed. For
instance, one can use it to define an exception in a local module
within a polymorphic function.


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let f (type t) () =
   let module M = struct exception E of t end in
   (fun x -&gt; M.E x), (function M.E x -&gt; Some x | _ -&gt; None)
</div>
</pre>


</div><p>Here is another example:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let sort_uniq (type s) (cmp : s -&gt; s -&gt; int) =
   let module S = Set.Make(struct type t = s let compare = cmp end) in
   fun l -&gt;
     S.elements (List.fold_right S.add l S.empty)
</div>
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

<pre><div class="caml-input"> let rec f : type t1 t2. t1 * t2 list -&gt; t1 = …
</div>
</pre>


</div><p>

is automatically expanded into


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let rec f : 't1 't2. 't1 * 't2 list -&gt; 't1 =
   fun (type t1) (type t2) -&gt; ( … : t1 * t2 list -&gt; t1)
</div>
</pre>


</div><p>

This syntax can be very useful when defining recursive functions involving
GADTs, see the section&nbsp;<a href="manual033.html#s%3Agadts">8.11</a> for a more detailed explanation.</p><p>The same feature is provided for method definitions.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>