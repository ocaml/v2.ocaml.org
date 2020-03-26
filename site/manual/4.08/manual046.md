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



<h2 class="section" id="s:binding-operators">24&nbsp;&nbsp;Binding operators </h2>
<ul>
<li><a href="manual046.html#sec284">24.1&nbsp;&nbsp;Rationale</a>
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

<pre><div class="caml-input"> let ( let* ) o f =
   match o with
   | None -&gt; None
   | Some x -&gt; f x

 let return x = Some x
</div><div class="caml-output ok">val ( let* ) : 'a option -&gt; ('a -&gt; 'b option) -&gt; 'b option = &lt;fun&gt;
val return : 'a -&gt; 'a option = &lt;fun&gt;
</div></pre>


</div><p>and then apply them using this convenient syntax:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let find_and_sum tbl k1 k2 =
   let* x1 = Hashtbl.find_opt tbl k1 in
   let* x2 = Hashtbl.find_opt tbl k2 in
     return (x1 + x2)
</div><div class="caml-output ok">val find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;fun&gt;
</div></pre>


</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let find_and_sum tbl k1 k2 =
   ( let* ) (Hashtbl.find_opt tbl k1)
     (fun x1 -&gt;
        ( let* ) (Hashtbl.find_opt tbl k2)
          (fun x2 -&gt; return (x1 + x2)))
</div><div class="caml-output ok">val find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;fun&gt;
</div></pre>


</div><p>Users can also define <em>and operators</em>:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module ZipSeq = struct

   type 'a t = 'a Seq.t

   open Seq

   let rec return x =
     fun () -&gt; Cons(x, return x)

   let rec prod a b =
     fun () -&gt;
       match a (), b () with
       | Nil, _ | _, Nil -&gt; Nil
       | Cons(x, a), Cons(y, b) -&gt; Cons((x, y), prod a b)

   let ( let+ ) f s = map s f
   let ( and+ ) a b = prod a b

 end
</div><div class="caml-output ok">module ZipSeq :
  sig
    type 'a t = 'a Seq.t
    val return : 'a -&gt; 'a Seq.t
    val prod : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
    val ( let+ ) : 'a Seq.t -&gt; ('a -&gt; 'b) -&gt; 'b Seq.t
    val ( and+ ) : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
  end
</div></pre>


</div><p>to support the syntax:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> open ZipSeq
 let sum3 z1 z2 z3 =
   let+ x1 = z1
   and+ x2 = z2
   and+ x3 = z3 in
     x1 + x2 + x3
</div><div class="caml-output ok">val sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;fun&gt;
</div></pre>


</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> open ZipSeq
 let sum3 z1 z2 z3 =
   ( let+ ) (( and+ ) (( and+ ) z1 z2) z3)
     (fun ((x1, x2), x3) -&gt; x1 + x2 + x3)
</div><div class="caml-output ok">val sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;fun&gt;
</div></pre>


</div>
<h3 class="subsection" id="sec284">24.1&nbsp;&nbsp;Rationale</h3>
<p>This extension is intended to provide a convenient syntax for working
with monads and applicatives.</p><p>An applicative should provide a module implementing the following
interface:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type Applicative_syntax = sig
   type 'a t
   val ( let+ ) : 'a t -&gt; ('a -&gt; 'b) -&gt; 'b t
   val ( and+ ): 'a t -&gt; 'b t -&gt; ('a * 'b) t
 end
</div>
</pre>


</div><p>where <span class="c003">(let+)</span> is bound to the <span class="c003">map</span> operation and <span class="c003">(and+)</span> is bound to
the monoidal product operation.</p><p>A monad should provide a module implementing the following interface:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type Monad_syntax = sig
   include Applicative_syntax
   val ( let* ) : 'a t -&gt; ('a -&gt; 'b t) -&gt; 'b t
   val ( and* ): 'a t -&gt; 'b t -&gt; ('a * 'b) t
 end
</div>
</pre>


</div><p>where <span class="c003">(let*)</span> is bound to the <span class="c003">bind</span> operation, and <span class="c003">(and*)</span> is also
bound to the monoidal product operation.</p>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>