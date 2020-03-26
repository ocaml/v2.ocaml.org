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




<h2 class="section" id="sec240">3&nbsp;&nbsp;Private types</h2>
<ul>
<li><a href="manual025.html#sec241">3.1&nbsp;&nbsp;Private variant and record types</a>
</li><li><a href="manual025.html#sec242">3.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li><a href="manual025.html#sec243">3.3&nbsp;&nbsp;Private row types</a>
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

<pre><div class="caml-input"> module M : sig
   type t = private A | B of int
   val a : t
   val b : int -&gt; t
 end = struct
   type t = A | B of int
   let a = A
   let b n = assert (n &gt; 0); B n
 end
</div>
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

<pre><div class="caml-input"> module N : sig
   type t = private int
   val of_int: int -&gt; t
   val to_int: t -&gt; int
 end = struct
   type t = int
   let of_int n = assert (n &gt;= 0); n
   let to_int n = n
 end
</div>
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

<pre><div class="caml-input"> module M : sig type c = private &lt; x : int; .. &gt; val o : c end =
 struct
   class c = object method x = 3 method y = 2 end
   let o = new c
 end
</div>
</pre>


</div><p>

This declaration does more than hiding the <span class="c003">y</span> method, it also makes
the type <span class="c003">c</span> incompatible with any other closed object type, meaning
that only <span class="c003">o</span> will be of type <span class="c003">c</span>. In that respect it behaves
similarly to private record types. But private row types are
more flexible with respect to incremental refinement. This feature can
be used in combination with functors.


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> module F(X : sig type c = private &lt; x : int; .. &gt; end) =
 struct
   let get_x (o : X.c) = o#x
 end
 module G(X : sig type c = private &lt; x : int; y : int; .. &gt; end) =
 struct
   include F(X)
   let get_y (o : X.c) = o#y
 end
</div>
</pre>


</div><p>A polymorphic variant type [t], for example


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> type t = [ `A of int | `B of bool ]
</div>
</pre>


</div><p>

can be refined in two ways. A definition [u] may add new field to [t],
and the declaration


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> type u = private [&gt; t]
</div>
</pre>


</div><p>

will keep those new fields abstract. Construction of values of type
[u] is possible using the known variants of [t], but any
pattern-matching will require a default case to handle the potential
extra fields. Dually, a declaration [u] may restrict the fields of [t]
through abstraction: the declaration


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> type v = private [&lt; t &gt; `A]
</div>
</pre>


</div><p>

corresponds to private variant types. One cannot create a value of the
private type [v], except using the constructors that are explicitly
listed as present, <span class="c003">(`A n)</span> in this example; yet, when
patter-matching on a [v], one should assume that any of the
constructors of [t] could be present.</p><p>Similarly to abstract types, the variance of type parameters
is not inferred, and must be given explicitly.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>