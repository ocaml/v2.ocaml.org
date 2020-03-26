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




<h2 class="section" id="sec251">8&nbsp;&nbsp;Substituting inside a signature</h2>
<ul>
<li><a href="manual030.html#sec252">8.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li><a href="manual030.html#sec253">8.2&nbsp;&nbsp;Local substitution declarations</a>
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

<pre><div class="caml-input"> module type Printable = sig
   type t
   val print : Format.formatter -&gt; t -&gt; unit
 end
 module type Comparable = sig
   type t
   val compare : t -&gt; t -&gt; int
 end
 module type PrintableComparable = sig
   include Printable
   include Comparable with type t := t
 end
</div>
</pre>


</div><p>One can also use this to completely remove a field:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type S = Comparable with type t := int
</div><div class="caml-output ok">module type S = sig val compare : int -&gt; int -&gt; int end
</div></pre>


</div><p>

or to rename one:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type S = sig
   type u
   include Comparable with type t := u
 end
</div><div class="caml-output ok">module type S = sig type u val compare : u -&gt; u -&gt; int end
</div></pre>


</div><p>Note that you can also remove manifest types, by substituting with the
same type.


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module type ComparableInt = Comparable with type t = int ;;
</div><div class="caml-output ok">module type ComparableInt = sig type t = int val compare : t -&gt; t -&gt; int end
</div></pre>

<pre><div class="caml-input"> module type CompareInt = ComparableInt with type t := int
</div><div class="caml-output ok">module type CompareInt = sig val compare : int -&gt; int -&gt; int end
</div></pre>


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

<pre><div class="caml-input"> module type S = sig
   type t
   module Sub : sig
     type outer := t
     type t
     val to_outer : t -&gt; outer
   end
 end
</div><div class="caml-output ok">module type S =
  sig type t module Sub : sig type t val to_outer : t/1 -&gt; t/2 end end
</div></pre>


</div><p>Note that, unlike type declarations, type substitution declarations are not
recursive, so substitutions like the following are rejected:</p><div class="caml-example toplevel">

<pre><div class="caml-input"> module type S = sig
    type 'a poly_list := [ `Cons of 'a * 'a <u>poly_list</u> | `Nil ]
  end ;;
</div><div class="caml-output error">Error: Unbound type constructor poly_list
</div></pre>


</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>