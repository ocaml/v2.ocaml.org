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



<h2 class="section" id="s:binding-operators"><a class="section-anchor" href="#s:binding-operators" aria-hidden="true"></a>23&nbsp;&nbsp;Binding operators</h2>
<ul>
<li><a href="bindingops.html#ss%3Aletops-rationale">23.1&nbsp;&nbsp;Rationale</a>
</li></ul>
<p>
(Introduced in 4.08.0)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="let-operator"><span class="c010">let-operator</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">let</span>&nbsp;(<a class="syntax" href="lex.html#core-operator-char"><span class="c010">core-operator-char</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">&lt;</span>)&nbsp;{&nbsp;<a class="syntax" href="indexops.html#dot-operator-char"><span class="c010">dot-operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="and-operator"><span class="c010">and-operator</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">and</span>&nbsp;(<a class="syntax" href="lex.html#core-operator-char"><span class="c010">core-operator-char</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">&lt;</span>)&nbsp;{&nbsp;<a class="syntax" href="indexops.html#dot-operator-char"><span class="c010">dot-operator-char</span></a>&nbsp;}
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> ( <span class="ocamlkeyword">let</span>* ) o f =
   <span class="ocamlkeyword">match</span> o <span class="ocamlkeyword">with</span>
   | None -&gt; None
   | Some x -&gt; f x

 <span class="ocamlkeyword">let</span> return x = Some x</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">let</span>* ) : 'a option -&gt; ('a -&gt; 'b option) -&gt; 'b option = &lt;<span class="ocamlkeyword">fun</span>&gt;
<span class="ocamlkeyword">val</span> return : 'a -&gt; 'a option = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>and then apply them using this convenient syntax:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> find_and_sum tbl k1 k2 =
   <span class="ocamlkeyword">let</span>* x1 = Hashtbl.find_opt tbl k1 <span class="ocamlkeyword">in</span>
   <span class="ocamlkeyword">let</span>* x2 = Hashtbl.find_opt tbl k2 <span class="ocamlkeyword">in</span>
     return (x1 + x2)</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> find_and_sum tbl k1 k2 =
   ( <span class="ocamlkeyword">let</span>* ) (Hashtbl.find_opt tbl k1)
     (<span class="ocamlkeyword">fun</span> x1 -&gt;
        ( <span class="ocamlkeyword">let</span>* ) (Hashtbl.find_opt tbl k2)
          (<span class="ocamlkeyword">fun</span> x2 -&gt; return (x1 + x2)))</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> find_and_sum : ('a, int) Hashtbl.t -&gt; 'a -&gt; 'a -&gt; int option = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>Users can also define <em>and operators</em>:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> ZipSeq = <span class="ocamlkeyword">struct</span>

   <span class="ocamlkeyword">type</span> 'a t = 'a Seq.t

   <span class="ocamlkeyword">open</span> Seq

   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> return x =
     <span class="ocamlkeyword">fun</span> () -&gt; Cons(x, return x)

   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> prod a b =
     <span class="ocamlkeyword">fun</span> () -&gt;
       <span class="ocamlkeyword">match</span> a (), b () <span class="ocamlkeyword">with</span>
       | Nil, _ | _, Nil -&gt; Nil
       | Cons(x, a), Cons(y, b) -&gt; Cons((x, y), prod a b)

   <span class="ocamlkeyword">let</span> ( <span class="ocamlkeyword">let</span>+ ) f s = map s f
   <span class="ocamlkeyword">let</span> ( <span class="ocamlkeyword">and</span>+ ) a b = prod a b

 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> ZipSeq :
  <span class="ocamlkeyword">sig</span>
    <span class="ocamlkeyword">type</span> 'a t = 'a Seq.t
    <span class="ocamlkeyword">val</span> return : 'a -&gt; 'a Seq.t
    <span class="ocamlkeyword">val</span> prod : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
    <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">let</span>+ ) : 'a Seq.t -&gt; ('a -&gt; 'b) -&gt; 'b Seq.t
    <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">and</span>+ ) : 'a Seq.t -&gt; 'b Seq.t -&gt; ('a * 'b) Seq.t
  <span class="ocamlkeyword">end</span></div></div>

</div><p>to support the syntax:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">open</span> ZipSeq
 <span class="ocamlkeyword">let</span> sum3 z1 z2 z3 =
   <span class="ocamlkeyword">let</span>+ x1 = z1
   <span class="ocamlkeyword">and</span>+ x2 = z2
   <span class="ocamlkeyword">and</span>+ x3 = z3 <span class="ocamlkeyword">in</span>
     x1 + x2 + x3</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>which is equivalent to this expanded form:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">open</span> ZipSeq
 <span class="ocamlkeyword">let</span> sum3 z1 z2 z3 =
   ( <span class="ocamlkeyword">let</span>+ ) (( <span class="ocamlkeyword">and</span>+ ) (( <span class="ocamlkeyword">and</span>+ ) z1 z2) z3)
     (<span class="ocamlkeyword">fun</span> ((x1, x2), x3) -&gt; x1 + x2 + x3)</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> sum3 : int Seq.t -&gt; int Seq.t -&gt; int Seq.t -&gt; int Seq.t = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div>
<h3 class="subsection" id="ss:letops-rationale"><a class="section-anchor" href="#ss:letops-rationale" aria-hidden="true">﻿</a>23.1&nbsp;&nbsp;Rationale</h3>
<p>This extension is intended to provide a convenient syntax for working
with monads and applicatives.</p><p>An applicative should provide a module implementing the following
interface:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Applicative_syntax = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> 'a t
   <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">let</span>+ ) : 'a t -&gt; ('a -&gt; 'b) -&gt; 'b t
   <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">and</span>+ ): 'a t -&gt; 'b t -&gt; ('a * 'b) t
 <span class="ocamlkeyword">end</span></div></div>

</div><p>where <span class="c003">(let+)</span> is bound to the <span class="c003">map</span> operation and <span class="c003">(and+)</span> is bound to
the monoidal product operation.</p><p>A monad should provide a module implementing the following interface:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Monad_syntax = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">include</span> Applicative_syntax
   <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">let</span>* ) : 'a t -&gt; ('a -&gt; 'b t) -&gt; 'b t
   <span class="ocamlkeyword">val</span> ( <span class="ocamlkeyword">and</span>* ): 'a t -&gt; 'b t -&gt; ('a * 'b) t
 <span class="ocamlkeyword">end</span></div></div>

</div><p>where <span class="c003">(let*)</span> is bound to the <span class="c003">bind</span> operation, and <span class="c003">(and*)</span> is also
bound to the monoidal product operation.</p>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>