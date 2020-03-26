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

<pre><div class="caml-input"> module M = struct let x = 0 let hidden = 1 end
 open (M:sig val x: int end)
 let y = <u>hidden</u>
</div>
<div class="caml-output error">Error: Unbound value hidden
</div></pre>


</div><p>Another possibility is to immediately open the result of a functor application</p><div class="caml-example verbatim">

<pre><div class="caml-input">   let sort (type x) (x:x list) =
     let open Set.Make(struct type t = x let compare=compare end) in
     elements (of_list x)
</div><div class="caml-output ok">val sort : 'a list -&gt; 'a list = &lt;fun&gt;
</div></pre>


</div><p>Going further, this construction can introduce local components inside a
structure,</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module M = struct
   let x = 0
   open! struct
     let x = 0
     let y = 1
   end
   let w = x + y
 end
</div><div class="caml-output ok">module M : sig val x : int val w : int end
</div></pre>


</div><p>One important restriction is that types introduced by <span class="c002"><span class="c003">open</span> <span class="c003">struct</span></span> ...
<span class="c004">end</span> cannot appear in the signature of the enclosing structure, unless they
are defined equal to some non-local type.
So:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module M = struct
   open struct type 'a t = 'a option = None | Some of 'a end
   let x : int t = Some 1
 end
</div><div class="caml-output ok">module M : sig val x : int option end
</div></pre>


</div><p>

is OK, but:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module M = struct
   <u>open struct type t = A end</u>
   let x = A
 end
</div><div class="caml-output error">Error: The type t/3742 introduced by this open appears in the signature
       File "exten.etex", line 3, characters 6-7:
         The value x has no valid type if t/3742 is hidden
</div></pre>


</div><p>

is not because <span class="c003">x</span> cannot be given any type other than <span class="c003">t</span>, which only exists
locally. Although the above would be OK if <span class="c003">x</span> too was local:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module M: sig end = struct
   open struct
   type t = A
   end
   …
   open struct let x = A end
   …
 end
</div><div class="caml-output ok">module M : sig  end
</div></pre>


</div><p>Inside signatures, extended opens are limited to extended module paths,


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type S = sig
   module F: sig end -&gt; sig type t end
   module X: sig end
   open F(X)
   val f: t
 end
</div><div class="caml-output ok">module type S =
  sig
    module F : sig  end -&gt; sig type t end
    module X : sig  end
    val f : F(X).t
  end
</div></pre>


</div><p>and not</p><pre>  open struct type t = int end
</pre><p>
In those situations, local substitutions(see <a href="manual030.html#ss%3Alocal-substitution">8.8.2</a>)
can be used instead.</p><p>Beware that this extension is not available inside class definitions:</p><pre>class c =
  let open Set.Make(Int) in
  ...
</pre>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>