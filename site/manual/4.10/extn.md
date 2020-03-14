<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec238"><span>Chapter 8</span>&nbsp;&nbsp;Language extensions</h1>
<p> <a id="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.10</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#s:letrecvalues">1&nbsp;&nbsp;Recursive definitions of values</a>
</li><li><a href="#s:recursive-modules">2&nbsp;&nbsp;Recursive modules</a>
</li><li><a href="#s:private-types">3&nbsp;&nbsp;Private types</a>
</li><li><a href="#s:locally-abstract">4&nbsp;&nbsp;Locally abstract types</a>
</li><li><a href="#s:first-class-modules">5&nbsp;&nbsp;First-class modules</a>
</li><li><a href="#s:module-type-of">6&nbsp;&nbsp;Recovering the type of a module</a>
</li><li><a href="#s:signature-substitution">7&nbsp;&nbsp;Substituting inside a signature</a>
</li><li><a href="#s:module-alias">8&nbsp;&nbsp;Type-level module aliases</a>
</li><li><a href="#s:explicit-overriding-open">9&nbsp;&nbsp;Overriding in open statements</a>
</li><li><a href="#s:gadts">10&nbsp;&nbsp;Generalized algebraic datatypes</a>
</li><li><a href="#s:bigarray-access">11&nbsp;&nbsp;Syntax for Bigarray access</a>
</li><li><a href="#s:attributes">12&nbsp;&nbsp;Attributes</a>
</li><li><a href="#s:extension-nodes">13&nbsp;&nbsp;Extension nodes</a>
</li><li><a href="#s:extensible-variants">14&nbsp;&nbsp;Extensible variant types</a>
</li><li><a href="#s:generative-functors">15&nbsp;&nbsp;Generative functors</a>
</li><li><a href="#s:extension-syntax">16&nbsp;&nbsp;Extension-only syntax</a>
</li><li><a href="#s:inline-records">17&nbsp;&nbsp;Inline records</a>
</li><li><a href="#s:doc-comments">18&nbsp;&nbsp;Documentation comments</a>
</li><li><a href="#s:index-operators">19&nbsp;&nbsp;Extended indexing operators </a>
</li><li><a href="#s:empty-variants">20&nbsp;&nbsp;Empty variant types</a>
</li><li><a href="#s:alerts">21&nbsp;&nbsp;Alerts</a>
</li><li><a href="#s:generalized-open">22&nbsp;&nbsp;Generalized open statements</a>
</li><li><a href="#s:binding-operators">23&nbsp;&nbsp;Binding operators</a>
</li></ul></nav></header>

<hr>









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










<h2 class="section" id="s:recursive-modules"><a class="section-anchor" href="#s:recursive-modules" aria-hidden="true"></a>2&nbsp;&nbsp;Recursive modules</h2>
<p>
<a id="hevea_manual.kwd206"></a>
<a id="hevea_manual.kwd207"></a></p><p>(Introduced in Objective Caml 3.07)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">rec</span> A : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = Leaf <span class="ocamlkeyword">of</span> string | Node <span class="ocamlkeyword">of</span> ASet.t
   <span class="ocamlkeyword">val</span> compare: t -&gt; t -&gt; int
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = Leaf <span class="ocamlkeyword">of</span> string | Node <span class="ocamlkeyword">of</span> ASet.t
   <span class="ocamlkeyword">let</span> compare t1 t2 =
     <span class="ocamlkeyword">match</span> (t1, t2) <span class="ocamlkeyword">with</span>
     | (Leaf s1, Leaf s2) -&gt; Stdlib.compare s1 s2
     | (Leaf _, Node _) -&gt; 1
     | (Node _, Leaf _) -&gt; -1
     | (Node n1, Node n2) -&gt; ASet.compare n1 n2
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">and</span> ASet
   : Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = A.t
   = Set.Make(A)</div></div>

</div><p>


It can be given the following specification:


</p><div class="caml-example signature">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">rec</span> A : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = Leaf <span class="ocamlkeyword">of</span> string | Node <span class="ocamlkeyword">of</span> ASet.t
   <span class="ocamlkeyword">val</span> compare: t -&gt; t -&gt; int
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">and</span> ASet : Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = A.t</div></div>

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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">rec</span> M: <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> f: unit -&gt; int <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">let</span> f () = N.x <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">and</span> N:<span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> x: int <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">let</span> x = M.f () <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok">Exception: Undefined_recursive_module (<span class="ocamlstring">"exten.etex"</span>, 1, 43).</div></div>

</div><p>If there are no safe modules along a dependency cycle, an error is raised</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">rec</span> M: <span class="ocamlkeyword">sig</span> <span class="ocamlhighlight">val x: int</span> <span class="ocamlkeyword">end</span> = <span class="ocamlhighlight">struct let x = N.y end</span>
 <span class="ocamlkeyword">and</span> N:<span class="ocamlkeyword">sig</span> <span class="ocamlhighlight">val x: int</span> <span class="ocamlkeyword">val</span> y:int <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">let</span> x = M.x <span class="ocamlkeyword">let</span> y = 0 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Cannot safely evaluate the definition of the following cycle
       of recursively-defined modules: M -&gt; N -&gt; M.
       There are no safe modules in this cycle (see manual section 8.2).
  Module M defines an unsafe value, x .
  Module N defines an unsafe value, x .</div></div>

</div><p>Note that, in the <a class="syntax" href="modtypes.html#specification"><span class="c010">specification</span></a> case, the <a class="syntax" href="modtypes.html#module-type"><span class="c010">module-type</span></a>s must be
parenthesized if they use the <span class="c004">with</span> <a class="syntax" href="modtypes.html#mod-constraint"><span class="c010">mod-constraint</span></a> construct.</p>











<h2 class="section" id="s:private-types"><a class="section-anchor" href="#s:private-types" aria-hidden="true"></a>3&nbsp;&nbsp;Private types</h2>
<ul>
<li><a href="#ss%3Aprivate-types-variant">3.1&nbsp;&nbsp;Private variant and record types</a>
</li><li><a href="#ss%3Aprivate-types-abbrev">3.2&nbsp;&nbsp;Private type abbreviations</a>
</li><li><a href="#ss%3Aprivate-rows">3.3&nbsp;&nbsp;Private row types</a>
</li></ul>
<p>
<a id="hevea_manual.kwd208"></a></p><p>Private type declarations in module signatures, of the form
<span class="c003">type t = private ...</span>, enable libraries to
reveal some, but not all aspects of the implementation of a type to
clients of the library. In this respect, they strike a middle ground
between abstract type declarations, where no information is revealed
on the type implementation, and data type definitions and type
abbreviations, where all aspects of the type implementation are
publicized. Private type declarations come in three flavors: for
variant and record types (section&nbsp;<a href="#ss%3Aprivate-types-variant">8.3.1</a>),
for type abbreviations (section&nbsp;<a href="#ss%3Aprivate-types-abbrev">8.3.2</a>),
and for row types (section&nbsp;<a href="#ss%3Aprivate-rows">8.3.3</a>).</p>
<h3 class="subsection" id="ss:private-types-variant"><a class="section-anchor" href="#ss:private-types-variant" aria-hidden="true">﻿</a>3.1&nbsp;&nbsp;Private variant and record types</h3>
<p>(Introduced in Objective Caml 3.07)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = <span class="ocamlkeyword">private</span> A | B <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">val</span> a : t
   <span class="ocamlkeyword">val</span> b : int -&gt; t
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = A | B <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">let</span> a = A
   <span class="ocamlkeyword">let</span> b n = <span class="ocamlkeyword">assert</span> (n &gt; 0); B n
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


Here, the <span class="c004">private</span> declaration ensures that in any value of type
<span class="c003">M.t</span>, the argument to the <span class="c003">B</span> constructor is always a positive integer.</p><p>With respect to the variance of their parameters, private types are
handled like abstract types. That is, if a private type has
parameters, their variance is the one explicitly given by prefixing
the parameter by a ‘<span class="c003">+</span>’ or a ‘<span class="c003">-</span>’, it is invariant otherwise.</p>
<h3 class="subsection" id="ss:private-types-abbrev"><a class="section-anchor" href="#ss:private-types-abbrev" aria-hidden="true">﻿</a>3.2&nbsp;&nbsp;Private type abbreviations</h3>
<p>(Introduced in Objective Caml 3.11)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> N : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = <span class="ocamlkeyword">private</span> int
   <span class="ocamlkeyword">val</span> of_int: int -&gt; t
   <span class="ocamlkeyword">val</span> to_int: t -&gt; int
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = int
   <span class="ocamlkeyword">let</span> of_int n = <span class="ocamlkeyword">assert</span> (n &gt;= 0); n
   <span class="ocamlkeyword">let</span> to_int n = n
 <span class="ocamlkeyword">end</span></div></div>

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
<h3 class="subsection" id="ss:private-rows"><a class="section-anchor" href="#ss:private-rows" aria-hidden="true">﻿</a>3.3&nbsp;&nbsp;Private row types</h3>
<p>
<a id="hevea_manual.kwd209"></a></p><p>(Introduced in Objective Caml 3.09)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> c = <span class="ocamlkeyword">private</span> &lt; x : int; .. &gt; <span class="ocamlkeyword">val</span> o : c <span class="ocamlkeyword">end</span> =
 <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">class</span> c = <span class="ocamlkeyword">object</span> <span class="ocamlkeyword">method</span> x = 3 <span class="ocamlkeyword">method</span> y = 2 <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">let</span> o = <span class="ocamlkeyword">new</span> c
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


This declaration does more than hiding the <span class="c003">y</span> method, it also makes
the type <span class="c003">c</span> incompatible with any other closed object type, meaning
that only <span class="c003">o</span> will be of type <span class="c003">c</span>. In that respect it behaves
similarly to private record types. But private row types are
more flexible with respect to incremental refinement. This feature can
be used in combination with functors.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> F(X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> c = <span class="ocamlkeyword">private</span> &lt; x : int; .. &gt; <span class="ocamlkeyword">end</span>) =
 <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">let</span> get_x (o : X.c) = o#x
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">module</span> G(X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> c = <span class="ocamlkeyword">private</span> &lt; x : int; y : int; .. &gt; <span class="ocamlkeyword">end</span>) =
 <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">include</span> F(X)
   <span class="ocamlkeyword">let</span> get_y (o : X.c) = o#y
 <span class="ocamlkeyword">end</span></div></div>

</div><p>A polymorphic variant type [t], for example


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = [ `A <span class="ocamlkeyword">of</span> int | `B <span class="ocamlkeyword">of</span> bool ]</div></div>

</div><p>


can be refined in two ways. A definition [u] may add new field to [t],
and the declaration


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> u = <span class="ocamlkeyword">private</span> [&gt; t]</div></div>

</div><p>


will keep those new fields abstract. Construction of values of type
[u] is possible using the known variants of [t], but any
pattern-matching will require a default case to handle the potential
extra fields. Dually, a declaration [u] may restrict the fields of [t]
through abstraction: the declaration


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> v = <span class="ocamlkeyword">private</span> [&lt; t &gt; `A]</div></div>

</div><p>


corresponds to private variant types. One cannot create a value of the
private type [v], except using the constructors that are explicitly
listed as present, <span class="c003">(`A n)</span> in this example; yet, when
patter-matching on a [v], one should assume that any of the
constructors of [t] could be present.</p><p>Similarly to abstract types, the variance of type parameters
is not inferred, and must be given explicitly.</p>











<h2 class="section" id="s:locally-abstract"><a class="section-anchor" href="#s:locally-abstract" aria-hidden="true"></a>4&nbsp;&nbsp;Locally abstract types</h2>
<p>
<a id="hevea_manual.kwd210"></a>
<a id="hevea_manual.kwd211"></a>
</p><p>(Introduced in OCaml 3.12, short syntax added in 4.03)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f = <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t) (foo : t list) -&gt; …</div></div>

</div><p>


and even use the alternative syntax for declaring functions:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f (<span class="ocamlkeyword">type</span> t) (foo : t list) = …</div></div>

</div><p>


If several locally abstract types need to be introduced, it is possible to use
the syntax
<span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
as syntactic sugar for <span class="c002"><span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> <a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub>1</sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> … <span class="c002"><span class="c003">-&gt;</span>
<span class="c003">fun</span> <span class="c003">(</span> <span class="c003">type</span></span> &nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c010">typeconstr-name</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">)</span> <span class="c003">-&gt;</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>. For instance,


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f = <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t u v) -&gt; <span class="ocamlkeyword">fun</span> (foo : (t * u * v) list) -&gt; …
 <span class="ocamlkeyword">let</span> f' (<span class="ocamlkeyword">type</span> t u v) (foo : (t * u * v) list) = …</div></div>

</div><p>This construction is useful because the type constructors it introduces
can be used in places where a type variable is not allowed. For
instance, one can use it to define an exception in a local module
within a polymorphic function.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f (<span class="ocamlkeyword">type</span> t) () =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">exception</span> E <span class="ocamlkeyword">of</span> t <span class="ocamlkeyword">end</span> <span class="ocamlkeyword">in</span>
   (<span class="ocamlkeyword">fun</span> x -&gt; M.E x), (<span class="ocamlkeyword">function</span> M.E x -&gt; Some x | _ -&gt; None)</div></div>

</div><p>Here is another example:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> sort_uniq (<span class="ocamlkeyword">type</span> s) (cmp : s -&gt; s -&gt; int) =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> S = Set.Make(<span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">type</span> t = s <span class="ocamlkeyword">let</span> compare = cmp <span class="ocamlkeyword">end</span>) <span class="ocamlkeyword">in</span>
   <span class="ocamlkeyword">fun</span> l -&gt;
     S.elements (List.fold_right S.add l S.empty)</div></div>

</div><p>It is also extremely useful for first-class modules (see
section&nbsp;<a href="firstclassmodules.html#s%3Afirst-class-modules">8.5</a>) and generalized algebraic datatypes
(GADTs: see section&nbsp;<a href="gadts.html#s%3Agadts">8.10</a>).</p>
<h5 class="paragraph" id="p:polymorpic-locally-abstract"><a class="section-anchor" href="#p:polymorpic-locally-abstract" aria-hidden="true">﻿</a>Polymorphic syntax</h5>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> f : <span class="ocamlkeyword">type</span> t1 t2. t1 * t2 list -&gt; t1 = …</div></div>

</div><p>


is automatically expanded into


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> f : 't1 't2. 't1 * 't2 list -&gt; 't1 =
   <span class="ocamlkeyword">fun</span> (<span class="ocamlkeyword">type</span> t1) (<span class="ocamlkeyword">type</span> t2) -&gt; ( … : t1 * t2 list -&gt; t1)</div></div>

</div><p>


This syntax can be very useful when defining recursive functions involving
GADTs, see the section&nbsp;<a href="gadts.html#s%3Agadts">8.10</a> for a more detailed explanation.</p><p>The same feature is provided for method definitions.</p>











<h2 class="section" id="s:first-class-modules"><a class="section-anchor" href="#s:first-class-modules" aria-hidden="true"></a>5&nbsp;&nbsp;First-class modules</h2>
<p>
<a id="hevea_manual.kwd212"></a>
<a id="hevea_manual.kwd213"></a>
<a id="hevea_manual.kwd214"></a>
<a id="hevea_manual.kwd215"></a>
</p><p>(Introduced in OCaml 3.12; pattern syntax and package type inference
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
functor, described in section&nbsp;<a href="generativefunctors.html#s%3Agenerative-functors">8.15</a>.
It can also be used anywhere in the context of a local module binding
<span class="c002"><span class="c003">let</span> <span class="c003">module</span></span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c002"><span class="c003">=</span> <span class="c003">(</span> <span class="c003">val</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c002"><span class="c003">)</span>
<span class="c003">in</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub>.</p>
<h5 class="paragraph" id="p:fst-mod-example"><a class="section-anchor" href="#p:fst-mod-example" aria-hidden="true">﻿</a>Basic example</h5>
<p> A typical use of first-class modules is to
select at run-time among several implementations of a signature.
Each implementation is a structure that we can encapsulate as a
first-class module, then store in a data structure such as a hash
table:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> picture = …
 <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> DEVICE = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">val</span> draw : picture -&gt; unit
   …
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">let</span> devices : (string, (<span class="ocamlkeyword">module</span> DEVICE)) Hashtbl.t = Hashtbl.create 17

 <span class="ocamlkeyword">module</span> SVG = <span class="ocamlkeyword">struct</span> … <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">let</span> _ = Hashtbl.add devices <span class="ocamlstring">"SVG"</span> (<span class="ocamlkeyword">module</span> SVG : DEVICE)

 <span class="ocamlkeyword">module</span> PDF = <span class="ocamlkeyword">struct</span> … <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">let</span> _ = Hashtbl.add devices <span class="ocamlstring">"PDF"</span> (<span class="ocamlkeyword">module</span> PDF : DEVICE)</div></div>

</div><p>We can then select one implementation based on command-line
arguments, for instance:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> parse_cmdline () = …
 <span class="ocamlkeyword">module</span> Device =
   (<span class="ocamlkeyword">val</span> (<span class="ocamlkeyword">let</span> device_name = parse_cmdline () <span class="ocamlkeyword">in</span>
         <span class="ocamlkeyword">try</span> Hashtbl.find devices device_name
         <span class="ocamlkeyword">with</span> Not_found -&gt;
           Printf.eprintf <span class="ocamlstring">"Unknown device %s\n"</span> device_name;
           exit 2)
    : DEVICE)</div></div>

</div><p>


Alternatively, the selection can be performed within a function:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> draw_using_device device_name picture =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> Device =
     (<span class="ocamlkeyword">val</span> (Hashtbl.find devices device_name) : DEVICE)
   <span class="ocamlkeyword">in</span>
   Device.draw picture</div></div>

</div>
<h5 class="paragraph" id="p:fst-mod-advexamples"><a class="section-anchor" href="#p:fst-mod-advexamples" aria-hidden="true">﻿</a>Advanced examples</h5>
<p>
With first-class modules, it is possible to parametrize some code over the
implementation of a module without using a functor.</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> sort (<span class="ocamlkeyword">type</span> s) (<span class="ocamlkeyword">module</span> Set : Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = s) l =
   Set.elements (List.fold_right Set.add l Set.empty)</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> sort : (<span class="ocamlkeyword">module</span> Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = 's) -&gt; 's list -&gt; 's list = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>To use this function, one can wrap the <span class="c003">Set.Make</span> functor:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> make_set (<span class="ocamlkeyword">type</span> s) cmp =
   <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">module</span> S = Set.Make(<span class="ocamlkeyword">struct</span>
     <span class="ocamlkeyword">type</span> t = s
     <span class="ocamlkeyword">let</span> compare = cmp
   <span class="ocamlkeyword">end</span>) <span class="ocamlkeyword">in</span>
   (<span class="ocamlkeyword">module</span> S : Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = s)</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> make_set : ('s -&gt; 's -&gt; int) -&gt; (<span class="ocamlkeyword">module</span> Set.S <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> elt = 's) = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div>











<h2 class="section" id="s:module-type-of"><a class="section-anchor" href="#s:module-type-of" aria-hidden="true"></a>6&nbsp;&nbsp;Recovering the type of a module</h2>
<p><a id="hevea_manual.kwd216"></a>
<a id="hevea_manual.kwd217"></a>
<a id="hevea_manual.kwd218"></a>
<a id="hevea_manual.kwd219"></a></p><p>(Introduced in OCaml 3.12)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> MYHASH = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">include</span> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> <span class="ocamlkeyword">of</span> <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">include</span> Hashtbl <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">val</span> replace: ('a, 'b) t -&gt; 'a -&gt; 'b -&gt; unit
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


The signature <span class="c003">MYHASH</span> then contains all the fields of the signature
of the module <span class="c003">Hashtbl</span> (with strengthened type definitions), plus the
new field <span class="c003">replace</span>. An implementation of this signature can be
obtained easily by using the <span class="c004">include</span> construct again, but this
time at the structure level:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> MyHash : MYHASH = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">include</span> Hashtbl
   <span class="ocamlkeyword">let</span> replace t k v = remove t k; add t k v
 <span class="ocamlkeyword">end</span></div></div>

</div><p>Another application where the absence of strengthening comes handy, is
to provide an alternative implementation for an existing module.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> MySet : <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> <span class="ocamlkeyword">of</span> Set = <span class="ocamlkeyword">struct</span>
   …
 <span class="ocamlkeyword">end</span></div></div>

</div><p>


This idiom guarantees that <span class="c003">Myset</span> is compatible with Set, but allows
it to represent sets internally in a different way.</p>











<h2 class="section" id="s:signature-substitution"><a class="section-anchor" href="#s:signature-substitution" aria-hidden="true"></a>7&nbsp;&nbsp;Substituting inside a signature</h2>
<ul>
<li><a href="#ss%3Adestructive-substitution">7.1&nbsp;&nbsp;Destructive substitutions</a>
</li><li><a href="#ss%3Alocal-substitution">7.2&nbsp;&nbsp;Local substitution declarations</a>
</li></ul>
<p>
<a id="hevea_manual.kwd220"></a>
<a id="hevea_manual.kwd221"></a>
<a id="hevea_manual.kwd222"></a>
</p>
<h3 class="subsection" id="ss:destructive-substitution"><a class="section-anchor" href="#ss:destructive-substitution" aria-hidden="true">﻿</a>7.1&nbsp;&nbsp;Destructive substitutions</h3>
<p>(Introduced in OCaml 3.12, generalized in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Printable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">val</span> print : Format.formatter -&gt; t -&gt; unit
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> Comparable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">val</span> compare : t -&gt; t -&gt; int
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> PrintableComparable = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">include</span> Printable
   <span class="ocamlkeyword">include</span> Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := t
 <span class="ocamlkeyword">end</span></div></div>

</div><p>One can also use this to completely remove a field:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := int</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> compare : int -&gt; int -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div><p>


or to rename one:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> u
   <span class="ocamlkeyword">include</span> Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := u
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> u <span class="ocamlkeyword">val</span> compare : u -&gt; u -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div><p>Note that you can also remove manifest types, by substituting with the
same type.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> ComparableInt = Comparable <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t = int ;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> ComparableInt = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t = int <span class="ocamlkeyword">val</span> compare : t -&gt; t -&gt; int <span class="ocamlkeyword">end</span></div></div>
<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> CompareInt = ComparableInt <span class="ocamlkeyword">with</span> <span class="ocamlkeyword">type</span> t := int</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> CompareInt = <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> compare : int -&gt; int -&gt; int <span class="ocamlkeyword">end</span></div></div>

</div>
<h3 class="subsection" id="ss:local-substitution"><a class="section-anchor" href="#ss:local-substitution" aria-hidden="true">﻿</a>7.2&nbsp;&nbsp;Local substitution declarations</h3>
<p>(Introduced in OCaml 4.08)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t
   <span class="ocamlkeyword">module</span> Sub : <span class="ocamlkeyword">sig</span>
     <span class="ocamlkeyword">type</span> outer := t
     <span class="ocamlkeyword">type</span> t
     <span class="ocamlkeyword">val</span> to_outer : t -&gt; outer
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S =
  <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">module</span> Sub : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">val</span> to_outer : t/1 -&gt; t/2 <span class="ocamlkeyword">end</span> <span class="ocamlkeyword">end</span></div></div>

</div><p>Note that, unlike type declarations, type substitution declarations are not
recursive, so substitutions like the following are rejected:</p><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> 'a poly_list := [ `Cons <span class="ocamlkeyword">of</span> 'a * 'a <span class="ocamlhighlight">poly_list</span> | `Nil ]
 <span class="ocamlkeyword">end</span> ;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Unbound type constructor poly_list</div></div>

</div>











<h2 class="section" id="s:module-alias"><a class="section-anchor" href="#s:module-alias" aria-hidden="true"></a>8&nbsp;&nbsp;Type-level module aliases</h2>
<p>
<a id="hevea_manual.kwd223"></a>
</p><p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> N = P</div></div>

</div><p>


has type


</p><div class="caml-example signature">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> N = P</div></div>

</div><p>Type-level module aliases are used when checking module path
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











<h2 class="section" id="s:explicit-overriding-open"><a class="section-anchor" href="#s:explicit-overriding-open" aria-hidden="true"></a>9&nbsp;&nbsp;Overriding in open statements</h2>
<p>
<a id="hevea_manual.kwd224"></a>
</p><p>(Introduced in OCaml 4.01)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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











<h2 class="section" id="s:gadts"><a class="section-anchor" href="#s:gadts" aria-hidden="true"></a>10&nbsp;&nbsp;Generalized algebraic datatypes</h2>
<p> <a id="hevea_manual.kwd225"></a>
<a id="hevea_manual.kwd226"></a>
</p><p>(Introduced in OCaml 4.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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
<h5 class="paragraph" id="p:gadts-recfun"><a class="section-anchor" href="#p:gadts-recfun" aria-hidden="true">﻿</a>Recursive functions</h5>
<p>Here is a concrete example:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> _ term =
   | Int : int -&gt; int term
   | Add : (int -&gt; int -&gt; int) term
   | App : ('b -&gt; 'a) term * 'b term -&gt; 'a term

 <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> eval : <span class="ocamlkeyword">type</span> a. a term -&gt; a = <span class="ocamlkeyword">function</span>
   | Int n    -&gt; n                 <span class="ocamlcomment">(* a = int *)</span>
   | Add      -&gt; (<span class="ocamlkeyword">fun</span> x y -&gt; x+y)  <span class="ocamlcomment">(* a = int -&gt; int -&gt; int *)</span>
   | App(f,x) -&gt; (eval f) (eval x)
           <span class="ocamlcomment">(* eval called at types (b-&gt;a) and b for fresh b *)</span></div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> two = eval (App (App (Add, Int 1), Int 1))</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> two : int = 2</div></div>

</div><p>


It is important to remark that the function <span class="c003">eval</span> is using the
polymorphic syntax for locally abstract types. When defining a recursive
function that manipulates a GADT, explicit polymorphic recursion should
generally be used. For instance, the following definition fails with a
type error:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> eval (<span class="ocamlkeyword">type</span> a) : a term -&gt; a = <span class="ocamlkeyword">function</span>
   | Int n    -&gt; n
   | Add      -&gt; (<span class="ocamlkeyword">fun</span> x y -&gt; x+y)
   | App(f,x) -&gt; (eval <span class="ocamlhighlight">f</span>) (eval x)</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: This expression has type ($App_'b -&gt; a) term
       but an expression was expected of type 'a
       The type constructor $App_'b would escape its scope</div></div>

</div><p>


In absence of an explicit polymorphic annotation, a monomorphic type
is inferred for the recursive function. If a recursive call occurs
inside the function definition at a type that involves an existential
GADT type variable, this variable flows to the type of the recursive
function, and thus escapes its scope. In the above example, this happens
in the branch <span class="c003">App(f,x)</span> when <span class="c003">eval</span> is called with <span class="c003">f</span> as an argument.
In this branch, the type of <span class="c003">f</span> is <span class="c003">($App_ 'b-&gt; a)</span>. The prefix <span class="c003">$</span> in
<span class="c003">$App_ 'b</span> denotes an existential type named by the compiler
(see&nbsp;<a href="#p%3Aexistential-names">8.10</a>). Since the type of <span class="c003">eval</span> is
<span class="c003">'a term -&gt; 'a</span>, the call <span class="c003">eval f</span> makes the existential type <span class="c003">$App_'b</span>
flow to the type variable <span class="c003">'a</span> and escape its scope. This triggers the
above error.</p>
<h5 class="paragraph" id="p:gadts-type-inference"><a class="section-anchor" href="#p:gadts-type-inference" aria-hidden="true">﻿</a>Type inference</h5>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> sum : <span class="ocamlkeyword">type</span> a. a term -&gt; _ = <span class="ocamlkeyword">fun</span> x -&gt;
   <span class="ocamlkeyword">let</span> y =
     <span class="ocamlkeyword">match</span> x <span class="ocamlkeyword">with</span>
     | Int n -&gt; n
     | Add   -&gt; 0
     | App(f,x) -&gt; sum f + sum x
   <span class="ocamlkeyword">in</span> y + 1</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> sum : 'a term -&gt; int = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> get_int : int term -&gt; int = <span class="ocamlkeyword">function</span>
   | Int n    -&gt; n
   | App(_,_) -&gt; 0</div></div>

</div>
<h5 class="paragraph" id="p:gadt-refutation-cases"><a class="section-anchor" href="#p:gadt-refutation-cases" aria-hidden="true">﻿</a>Refutation cases</h5>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> _ t =
   | Int : int t
   | Bool : bool t

 <span class="ocamlkeyword">let</span> deep : (char t * int) option -&gt; char = <span class="ocamlkeyword">function</span>
   | None -&gt; 'c'
   | _ -&gt; .</div></div>

</div><p>Namely, the inferred remaining case is <span class="c003">Some _</span>, which is split into
<span class="c003">Some (Int, _)</span> and <span class="c003">Some (Bool, _)</span>, which are both untypable because
<span class="c003">deep</span> expects a non-existing <span class="c003">char t</span> as the first element of the tuple.
Note that the refutation case could be omitted here, because it is
automatically added when there is only one case in the pattern
matching.</p><p>Another addition is that the redundancy check is now aware of GADTs: a
case will be detected as redundant if it could be replaced by a
refutation case using the same pattern.</p>
<h5 class="paragraph" id="p:gadts-advexamples"><a class="section-anchor" href="#p:gadts-advexamples" aria-hidden="true">﻿</a>Advanced examples</h5>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> _ typ =
   | Int : int typ
   | String : string typ
   | Pair : 'a typ * 'b typ -&gt; ('a * 'b) typ

 <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> to_string: <span class="ocamlkeyword">type</span> t. t typ -&gt; t -&gt; string =
   <span class="ocamlkeyword">fun</span> t x -&gt;
   <span class="ocamlkeyword">match</span> t <span class="ocamlkeyword">with</span>
   | Int -&gt; Int.to_string x
   | String -&gt; Printf.sprintf <span class="ocamlstring">"%S"</span> x
   | Pair(t1,t2) -&gt;
       <span class="ocamlkeyword">let</span> (x1, x2) = x <span class="ocamlkeyword">in</span>
       Printf.sprintf <span class="ocamlstring">"(%s,%s)"</span> (to_string t1 x1) (to_string t2 x2)</div></div>

</div><p>Another frequent application of GADTs is equality witnesses.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> (_,_) eq = Eq : ('a,'a) eq

 <span class="ocamlkeyword">let</span> cast : <span class="ocamlkeyword">type</span> a b. (a,b) eq -&gt; a -&gt; b = <span class="ocamlkeyword">fun</span> Eq x -&gt; x</div></div>

</div><p>


Here type <span class="c003">eq</span> has only one constructor, and by matching on it one
adds a local constraint allowing the conversion between <span class="c003">a</span> and <span class="c003">b</span>.
By building such equality witnesses, one can make equal types which
are syntactically different.</p><p>Here is an example using both singleton types and equality witnesses
to implement dynamic types.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> eq_type : <span class="ocamlkeyword">type</span> a b. a typ -&gt; b typ -&gt; (a,b) eq option =
   <span class="ocamlkeyword">fun</span> a b -&gt;
   <span class="ocamlkeyword">match</span> a, b <span class="ocamlkeyword">with</span>
   | Int, Int -&gt; Some Eq
   | String, String -&gt; Some Eq
   | Pair(a1,a2), Pair(b1,b2) -&gt;
       <span class="ocamlkeyword">begin</span> <span class="ocamlkeyword">match</span> eq_type a1 b1, eq_type a2 b2 <span class="ocamlkeyword">with</span>
       | Some Eq, Some Eq -&gt; Some Eq
       | _ -&gt; None
       <span class="ocamlkeyword">end</span>
   | _ -&gt; None

 <span class="ocamlkeyword">type</span> dyn = Dyn : 'a typ * 'a -&gt; dyn

 <span class="ocamlkeyword">let</span> get_dyn : <span class="ocamlkeyword">type</span> a. a typ -&gt; dyn -&gt; a option =
   <span class="ocamlkeyword">fun</span> a (Dyn(b,x)) -&gt;
   <span class="ocamlkeyword">match</span> eq_type a b <span class="ocamlkeyword">with</span>
   | None -&gt; None
   | Some Eq -&gt; Some x</div></div>

</div>
<h5 class="paragraph" id="p:existential-names"><a class="section-anchor" href="#p:existential-names" aria-hidden="true">﻿</a>Existential type names in error messages</h5>
<p>(Updated in OCaml 4.03.0)</p><p>The typing of pattern matching in presence of GADT can generate many
existential types. When necessary, error messages refer to these
existential types using compiler-generated names. Currently, the
compiler generates these names according to the following nomenclature:
</p><ul class="itemize"><li class="li-itemize">
First, types whose name starts with a <span class="c003">$</span> are existentials.
</li><li class="li-itemize"><span class="c003">$Constr_'a</span> denotes an existential type introduced for the type
variable <span class="c003">'a</span> of the GADT constructor <span class="c003">Constr</span>:


<div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> any = Any : 'name -&gt; any
 <span class="ocamlkeyword">let</span> escape (Any x) = <span class="ocamlhighlight">x</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: This expression has type $Any_'name
       but an expression was expected of type 'a
       The type constructor $Any_'name would escape its scope</div></div>

</div>


</li><li class="li-itemize"><span class="c003">$Constr</span> denotes an existential type introduced for an anonymous type variable in the GADT constructor <span class="c003">Constr</span>:


<div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> any = Any : _ -&gt; any
 <span class="ocamlkeyword">let</span> escape (Any x) = <span class="ocamlhighlight">x</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: This expression has type $Any but an expression was expected of type
         'a
       The type constructor $Any would escape its scope</div></div>

</div>


</li><li class="li-itemize"><span class="c003">$'a</span> if the existential variable was unified with the type variable <span class="c003">'a</span> during typing:


<div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> ('arg,'result,'aux) fn =
   | Fun: ('a -&gt;'b) -&gt; ('a,'b,unit) fn
   | Mem1: ('a -&gt;'b) * 'a * 'b -&gt; ('a, 'b, 'a * 'b) fn
  <span class="ocamlkeyword">let</span> apply: ('arg,'result, _ ) fn -&gt; 'arg -&gt; 'result = <span class="ocamlkeyword">fun</span> f x -&gt;
   <span class="ocamlkeyword">match</span> f <span class="ocamlkeyword">with</span>
   | Fun f -&gt; f x
   | <span class="ocamlhighlight">Mem1 (f,y,fy)</span> -&gt; <span class="ocamlkeyword">if</span> x = y <span class="ocamlkeyword">then</span> fy <span class="ocamlkeyword">else</span> f x</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: This pattern matches values of type
         ($'arg, 'result, $'arg * 'result) fn
       but a pattern was expected which matches values of type
         ($'arg, 'result, unit) fn
       The type constructor $'arg would escape its scope</div></div>

</div>


</li><li class="li-itemize"><span class="c003">$n</span> (n a number) is an internally generated existential which could not be named using one of the previous schemes.
</li></ul><p>As shown by the last item, the current behavior is imperfect
and may be improved in future versions.</p>
<h5 class="paragraph" id="p:gadt-equation-nonlocal-abstract"><a class="section-anchor" href="#p:gadt-equation-nonlocal-abstract" aria-hidden="true">﻿</a>Equations on non-local abstract types</h5>
<p> (Introduced in OCaml
4.04)</p><p>GADT pattern-matching may also add type equations to non-local
abstract types. The behaviour is the same as with local abstract
types. Reusing the above <span class="c003">eq</span> type, one can write:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">val</span> x : t <span class="ocamlkeyword">val</span> e : (t,int) eq <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = int
   <span class="ocamlkeyword">let</span> x = 33
   <span class="ocamlkeyword">let</span> e = Eq
 <span class="ocamlkeyword">end</span>

 <span class="ocamlkeyword">let</span> x : int = <span class="ocamlkeyword">let</span> Eq = M.e <span class="ocamlkeyword">in</span> M.x</div></div>

</div><p>Of course, not all abstract types can be refined, as this would
contradict the exhaustiveness check. Namely, builtin types (those
defined by the compiler itself, such as <span class="c003">int</span> or <span class="c003">array</span>), and
abstract types defined by the local module, are non-instantiable, and
as such cause a type error rather than introduce an equation.</p>











<h2 class="section" id="s:bigarray-access"><a class="section-anchor" href="#s:bigarray-access" aria-hidden="true"></a>11&nbsp;&nbsp;Syntax for Bigarray access</h2>
<p>(Introduced in Objective Caml 3.00)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}&nbsp;<span class="c004">}</span>&nbsp;<span class="c004">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>This extension provides syntactic sugar for getting and setting
elements in the arrays provided by the <a href="../../api/4.10/Bigarray.html"><span class="c003">Bigarray</span></a> module.</p><p>The short expressions are translated into calls to functions of the
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











<h2 class="section" id="s:attributes"><a class="section-anchor" href="#s:attributes" aria-hidden="true"></a>12&nbsp;&nbsp;Attributes</h2>
<ul>
<li><a href="#ss%3Abuiltin-attributes">12.1&nbsp;&nbsp;Built-in attributes</a>
</li></ul>
<p><a id="hevea_manual.kwd227"></a></p><p>(Introduced in OCaml 4.02,
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
<h3 class="subsection" id="ss:builtin-attributes"><a class="section-anchor" href="#ss:builtin-attributes" aria-hidden="true">﻿</a>12.1&nbsp;&nbsp;Built-in attributes</h3>
<p>Some attributes are understood by the type-checker:
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
Same as “ocaml.warning”, for the <span class="c003">-warn-error</span> command-line option.</li><li class="li-itemize">“ocaml.alert” or “alert”: see section&nbsp;<a href="alerts.html#s%3Aalerts">8.21</a>.</li><li class="li-itemize">“ocaml.deprecated” or “deprecated”: alias for the
“deprecated” alert, see section&nbsp;<a href="alerts.html#s%3Aalerts">8.21</a>.
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
</li><li class="li-itemize">“ocaml.immediate64” or “immediate64” applied on an abstract type mark the
type as having a non-pointer implementation on 64 bit platforms. No assumption
is made on other platforms. In order to produce a type with the
“immediate64“ attribute, one must use “Sys.Immediate64.Make“ functor.
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> X = <span class="ocamlkeyword">struct</span>
   [@@@warning <span class="ocamlstring">"+9"</span>]  <span class="ocamlcomment">(* locally enable warning 9 in this structure *)</span>
   …
 <span class="ocamlkeyword">end</span>
 [@@deprecated <span class="ocamlstring">"Please use module 'Y' instead."</span>]

 <span class="ocamlkeyword">let</span> x = <span class="ocamlkeyword">begin</span>[@warning <span class="ocamlstring">"+9"</span>] […] <span class="ocamlkeyword">end</span>

 <span class="ocamlkeyword">type</span> t = A | B
   [@@deprecated <span class="ocamlstring">"Please use type 's' instead."</span>]</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> fires_warning_22 x =
   <span class="ocamlkeyword">assert</span> (x &gt;= 0) [@ppwarning <span class="ocamlhighlight">"TODO: remove this later"</span>]</div>



<div class="pre caml-output warn"><span class="ocamlwarning">Warning</span> 22: TODO: remove this later</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> is_a_tail_call = <span class="ocamlkeyword">function</span>
   | [] -&gt; ()
   | _ :: q -&gt; (is_a_tail_call[@tailcall]) q

 <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">rec</span> not_a_tail_call = <span class="ocamlkeyword">function</span>
   | [] -&gt; []
   | x :: q -&gt; x :: <span class="ocamlhighlight">(not_a_tail_call[@tailcall]) q</span></div>



<div class="pre caml-output warn"><span class="ocamlwarning">Warning</span> 51: expected tailcall</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> f x = x [@@inline]

 <span class="ocamlkeyword">let</span> () = (f[@inlined]) ()</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> fragile =
   | Int <span class="ocamlkeyword">of</span> int [@warn_on_literal_pattern]
   | String <span class="ocamlkeyword">of</span> string [@warn_on_literal_pattern]</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> fragile_match_1 = <span class="ocamlkeyword">function</span>
 | Int <span class="ocamlhighlight">0</span> -&gt; ()
 | _ -&gt; ()</div>



<div class="pre caml-output warn"><span class="ocamlwarning">Warning</span> 52: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 9.5)
val fragile_match_1 : fragile -&gt; unit = &lt;fun&gt;</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> fragile_match_2 = <span class="ocamlkeyword">function</span>
 | String <span class="ocamlhighlight">"constant"</span> -&gt; ()
 | _ -&gt; ()</div>



<div class="pre caml-output warn"><span class="ocamlwarning">Warning</span> 52: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 9.5)
val fragile_match_2 : fragile -&gt; unit = &lt;fun&gt;</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Immediate: <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t [@@immediate]
   <span class="ocamlkeyword">val</span> x: t <span class="ocamlkeyword">ref</span>
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = A | B
   <span class="ocamlkeyword">let</span> x = <span class="ocamlkeyword">ref</span> A
 <span class="ocamlkeyword">end</span></div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Int_or_int64 : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t [@@immediate64]
   <span class="ocamlkeyword">val</span> zero : t
   <span class="ocamlkeyword">val</span> one : t
   <span class="ocamlkeyword">val</span> add : t -&gt; t -&gt; t
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>

   <span class="ocamlkeyword">include</span> Sys.Immediate64.Make(Int)(Int64)

   <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
     <span class="ocamlkeyword">val</span> zero : t
     <span class="ocamlkeyword">val</span> one : t
     <span class="ocamlkeyword">val</span> add : t -&gt; t -&gt; t
   <span class="ocamlkeyword">end</span>

   <span class="ocamlkeyword">let</span> impl : (<span class="ocamlkeyword">module</span> S) =
     <span class="ocamlkeyword">match</span> repr <span class="ocamlkeyword">with</span>
     | Immediate -&gt;
         (<span class="ocamlkeyword">module</span> Int : S)
     | Non_immediate -&gt;
         (<span class="ocamlkeyword">module</span> Int64 : S)

   <span class="ocamlkeyword">include</span> (<span class="ocamlkeyword">val</span> impl : S)
 <span class="ocamlkeyword">end</span></div></div>

</div>











<h2 class="section" id="s:extension-nodes"><a class="section-anchor" href="#s:extension-nodes" aria-hidden="true"></a>13&nbsp;&nbsp;Extension nodes</h2>
<ul>
<li><a href="#ss%3Abuiltin-extension-nodes">13.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
<p>(Introduced in OCaml 4.02,
infix notations for constructs other than expressions added in 4.03,
infix notation (e1 ;%ext e2) added in 4.04.
)</p><p>Extension nodes are generic placeholders in the syntax tree. They are
rejected by the type-checker and are intended to be “expanded” by external
tools such as <span class="c003">-ppx</span> rewriters.</p><p>Extension nodes share the same notion of identifier and payload as
attributes&nbsp;<a href="attributes.html#s%3Aattributes">8.12</a>.</p><p>The first form of extension node is used for “algebraic” categories:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="extension"><span class="c010">extension</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[%</span>&nbsp;<a class="syntax" href="attributes.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="attributes.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
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
<span class="c004">[%%</span>&nbsp;<a class="syntax" href="attributes.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="attributes.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
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
<h3 class="subsection" id="ss:builtin-extension-nodes"><a class="section-anchor" href="#ss:builtin-extension-nodes" aria-hidden="true">﻿</a>13.1&nbsp;&nbsp;Built-in extension nodes</h3>
<p>(Introduced in OCaml 4.03)</p><p>Some extension nodes are understood by the compiler itself:
</p><ul class="itemize"><li class="li-itemize">
“ocaml.extension_constructor” or “extension_constructor”
take as payload a constructor from an extensible variant type
(see <a href="extensiblevariants.html#s%3Aextensible-variants">8.14</a>) and return its extension
constructor slot.
</li></ul><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = ..
 <span class="ocamlkeyword">type</span> t += X <span class="ocamlkeyword">of</span> int | Y <span class="ocamlkeyword">of</span> string
 <span class="ocamlkeyword">let</span> x = [%extension_constructor X]
 <span class="ocamlkeyword">let</span> y = [%extension_constructor Y]</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input">  x &lt;&gt; y;;</div>



<div class="pre caml-output ok">- : bool = <span class="ocamlkeyword">true</span></div></div>

</div>











<h2 class="section" id="s:extensible-variants"><a class="section-anchor" href="#s:extensible-variants" aria-hidden="true"></a>14&nbsp;&nbsp;Extensible variant types</h2>
<ul>
<li><a href="#ss%3Aprivate-extensible">14.1&nbsp;&nbsp;Private extensible variant types</a>
</li></ul>
<p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Expr = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> attr = ..

   <span class="ocamlkeyword">type</span> attr += Str <span class="ocamlkeyword">of</span> string

   <span class="ocamlkeyword">type</span> attr +=
     | Int <span class="ocamlkeyword">of</span> int
     | Float <span class="ocamlkeyword">of</span> float
 <span class="ocamlkeyword">end</span></div></div>

</div><p>Pattern matching on an extensible variant type requires a default case
to handle unknown variant constructors:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> to_string = <span class="ocamlkeyword">function</span>
   | Expr.Str s -&gt; s
   | Expr.Int i -&gt; Int.to_string i
   | Expr.Float f -&gt; string_of_float f
   | _ -&gt; <span class="ocamlstring">"?"</span></div></div>

</div><p>A preexisting example of an extensible variant type is the built-in
<span class="c003">exn</span> type used for exceptions. Indeed, exception constructors can be
declared using the type extension syntax:


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> exn += Exc <span class="ocamlkeyword">of</span> int</div></div>

</div><p>Extensible variant constructors can be rebound to a different name. This
allows exporting variants from another module.


</p><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> not_in_scope = <span class="ocamlhighlight">Str</span> <span class="ocamlstring">"Foo"</span>;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Unbound constructor Str</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> Expr.attr += Str = Expr.Str</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> now_works = Str <span class="ocamlstring">"foo"</span>;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> now_works : Expr.attr = Expr.Str <span class="ocamlstring">"foo"</span></div></div>

</div><p>Extensible variant constructors can be declared <span class="c003">private</span>. As with
regular variants, this prevents them from being constructed directly by
constructor application while still allowing them to be de-structured in
pattern-matching.


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> B : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> Expr.attr += <span class="ocamlkeyword">private</span> Bool <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">val</span> bool : bool -&gt; Expr.attr
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> Expr.attr += Bool <span class="ocamlkeyword">of</span> int
   <span class="ocamlkeyword">let</span> bool p = <span class="ocamlkeyword">if</span> p <span class="ocamlkeyword">then</span> Bool 1 <span class="ocamlkeyword">else</span> Bool 0
 <span class="ocamlkeyword">end</span></div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> inspection_works = <span class="ocamlkeyword">function</span>
   | B.Bool p -&gt; (p = 1)
   | _ -&gt; <span class="ocamlkeyword">true</span>;;</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> inspection_works : Expr.attr -&gt; bool = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> construction_is_forbidden = <span class="ocamlhighlight">B.Bool 1</span>;;</div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Cannot use private constructor Bool to create values of type Expr.attr</div></div>

</div>
<h3 class="subsection" id="ss:private-extensible"><a class="section-anchor" href="#ss:private-extensible" aria-hidden="true">﻿</a>14.1&nbsp;&nbsp;Private extensible variant types</h3>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Msg : <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">type</span> t = <span class="ocamlkeyword">private</span> ..
   <span class="ocamlkeyword">module</span> MkConstr (X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>) : <span class="ocamlkeyword">sig</span>
     <span class="ocamlkeyword">type</span> t += C <span class="ocamlkeyword">of</span> X.t
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = ..
   <span class="ocamlkeyword">module</span> MkConstr (X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>) = <span class="ocamlkeyword">struct</span>
     <span class="ocamlkeyword">type</span> t += C <span class="ocamlkeyword">of</span> X.t
   <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">end</span></div></div>

</div>











<h2 class="section" id="s:generative-functors"><a class="section-anchor" href="#s:generative-functors" aria-hidden="true"></a>15&nbsp;&nbsp;Generative functors</h2>
<p>(Introduced in OCaml 4.02)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
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











<h2 class="section" id="s:extension-syntax"><a class="section-anchor" href="#s:extension-syntax" aria-hidden="true"></a>16&nbsp;&nbsp;Extension-only syntax</h2>
<ul>
<li><a href="#ss%3Aextension-operators">16.1&nbsp;&nbsp;Extension operators</a>
</li><li><a href="#ss%3Aextension-literals">16.2&nbsp;&nbsp;Extension literals</a>
</li></ul>
<p>
(Introduced in OCaml 4.02.2, extended in 4.03)</p><p>Some syntactic constructions are accepted during parsing and rejected
during type checking. These syntactic constructions can therefore not
be used directly in vanilla OCaml. However, <span class="c003">-ppx</span> rewriters and other
external tools can exploit this parser leniency to extend the language
with these new syntactic constructions by rewriting them to
vanilla constructions.
</p>
<h3 class="subsection" id="ss:extension-operators"><a class="section-anchor" href="#ss:extension-operators" aria-hidden="true">﻿</a>16.1&nbsp;&nbsp;Extension operators</h3>
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
<h3 class="subsection" id="ss:extension-literals"><a class="section-anchor" href="#ss:extension-literals" aria-hidden="true">﻿</a>16.2&nbsp;&nbsp;Extension literals</h3>
<p>
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











<h2 class="section" id="s:inline-records"><a class="section-anchor" href="#s:inline-records" aria-hidden="true"></a>17&nbsp;&nbsp;Inline records</h2>
<p>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t =
   | Point <span class="ocamlkeyword">of</span> {width: int; <span class="ocamlkeyword">mutable</span> x: float; <span class="ocamlkeyword">mutable</span> y: float}
   | Other

 <span class="ocamlkeyword">let</span> v = Point {width = 10; x = 0.; y = 0.}

 <span class="ocamlkeyword">let</span> scale l = <span class="ocamlkeyword">function</span>
   | Point p -&gt; Point {p <span class="ocamlkeyword">with</span> x = l *. p.x; y = l *. p.y}
   | Other -&gt; Other

 <span class="ocamlkeyword">let</span> print = <span class="ocamlkeyword">function</span>
   | Point {x; y; _} -&gt; Printf.printf <span class="ocamlstring">"%f/%f"</span> x y
   | Other -&gt; ()

 <span class="ocamlkeyword">let</span> reset = <span class="ocamlkeyword">function</span>
   | Point p -&gt; p.x &lt;- 0.; p.y &lt;- 0.
   | Other -&gt; ()</div></div>

</div><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> invalid = <span class="ocamlkeyword">function</span>
   | Point p -&gt; <span class="ocamlhighlight">p</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: This form is not allowed as the type of the inlined record could escape.</div></div>

</div>











<h2 class="section" id="s:doc-comments"><a class="section-anchor" href="#s:doc-comments" aria-hidden="true"></a>18&nbsp;&nbsp;Documentation comments</h2>
<ul>
<li><a href="#ss%3Afloating-comments">18.1&nbsp;&nbsp;Floating comments</a>
</li><li><a href="#ss%3Aitem-comments">18.2&nbsp;&nbsp;Item comments</a>
</li><li><a href="#ss%3Alabel-comments">18.3&nbsp;&nbsp;Label comments</a>
</li></ul>
<p>
(Introduced in OCaml 4.03)</p><p>Comments which start with <span class="c003">**</span> are treated specially by the
compiler. They are automatically converted during parsing into
attributes (see <a href="attributes.html#s%3Aattributes">8.12</a>) to allow tools to process them as
documentation.</p><p>Such comments can take three forms: <em>floating comments</em>, <em>item
comments</em> and <em>label comments</em>. Any comment starting with <span class="c003">**</span> which
does not match one of these forms will cause the compiler to emit
warning 50.</p><p>Comments which start with <span class="c003">**</span> are also used by the ocamldoc
documentation generator (see <a href="ocamldoc.html#c%3Aocamldoc">16</a>). The three comment forms
recognised by the compiler are a subset of the forms accepted by
ocamldoc (see <a href="ocamldoc.html#s%3Aocamldoc-comments">16.2</a>).</p>
<h3 class="subsection" id="ss:floating-comments"><a class="section-anchor" href="#ss:floating-comments" aria-hidden="true">﻿</a>18.1&nbsp;&nbsp;Floating comments</h3>
<p>Comments surrounded by blank lines that appear within structures,
signatures, classes or class types are converted into
<a class="syntax" href="attributes.html#floating-attribute"><span class="c010">floating-attribute</span></a>s. For example:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T

 <span class="ocamlcomment">(** Now some definitions for [t] *)</span>

 <span class="ocamlkeyword">let</span> mkT = T</div></div>

</div><p>will be converted to:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T

 [@@@ocaml.text <span class="ocamlstring">" Now some definitions for [t] "</span>]

 <span class="ocamlkeyword">let</span> mkT = T</div></div>

</div>
<h3 class="subsection" id="ss:item-comments"><a class="section-anchor" href="#ss:item-comments" aria-hidden="true">﻿</a>18.2&nbsp;&nbsp;Item comments</h3>
<p>Comments which appear <em>immediately before</em> or <em>immediately
after</em> a structure item, signature item, class item or class type item
are converted into <a class="syntax" href="attributes.html#item-attribute"><span class="c010">item-attribute</span></a>s. Immediately before or immediately
after means that there must be no blank lines, <span class="c003">;;</span>, or other
documentation comments between them. For example:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T
 <span class="ocamlcomment">(** A description of [t] *)</span></div></div>

</div><p>or</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlcomment">(** A description of [t] *)</span>
 <span class="ocamlkeyword">type</span> t = T</div></div>

</div><p>will be converted to:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T
 [@@ocaml.doc <span class="ocamlstring">" A description of [t] "</span>]</div></div>

</div><p>Note that, if a comment appears immediately next to multiple items,
as in:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T
 <span class="ocamlcomment">(** An ambiguous comment *)</span>
 <span class="ocamlkeyword">type</span> s = S</div></div>

</div><p>then it will be attached to both items:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T
 [@@ocaml.doc <span class="ocamlstring">" An ambiguous comment "</span>]
 <span class="ocamlkeyword">type</span> s = S
 [@@ocaml.doc <span class="ocamlstring">" An ambiguous comment "</span>]</div></div>

</div><p>and the compiler will emit warning 50.</p>
<h3 class="subsection" id="ss:label-comments"><a class="section-anchor" href="#ss:label-comments" aria-hidden="true">﻿</a>18.3&nbsp;&nbsp;Label comments</h3>
<p>Comments which appear <em>immediately after</em> a labelled argument,
record field, variant constructor, object method or polymorphic variant
constructor are are converted into <a class="syntax" href="attributes.html#attribute"><span class="c010">attribute</span></a>s. Immediately
after means that there must be no blank lines or other documentation
comments between them. For example:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t1 = lbl:int <span class="ocamlcomment">(** Labelled argument *)</span> -&gt; unit

 <span class="ocamlkeyword">type</span> t2 = {
   fld: int; <span class="ocamlcomment">(** Record field *)</span>
   fld2: float;
 }

 <span class="ocamlkeyword">type</span> t3 =
   | Cstr <span class="ocamlkeyword">of</span> string <span class="ocamlcomment">(** Variant constructor *)</span>
   | Cstr2 <span class="ocamlkeyword">of</span> string

 <span class="ocamlkeyword">type</span> t4 = &lt; meth: int * int; <span class="ocamlcomment">(** Object method *)</span> &gt;

 <span class="ocamlkeyword">type</span> t5 = [
   `PCstr <span class="ocamlcomment">(** Polymorphic variant constructor *)</span>
 ]</div></div>

</div><p>will be converted to:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t1 = lbl:(int [@ocaml.doc <span class="ocamlstring">" Labelled argument "</span>]) -&gt; unit

 <span class="ocamlkeyword">type</span> t2 = {
   fld: int [@ocaml.doc <span class="ocamlstring">" Record field "</span>];
   fld2: float;
 }

 <span class="ocamlkeyword">type</span> t3 =
   | Cstr <span class="ocamlkeyword">of</span> string [@ocaml.doc <span class="ocamlstring">" Variant constructor "</span>]
   | Cstr2 <span class="ocamlkeyword">of</span> string

 <span class="ocamlkeyword">type</span> t4 = &lt; meth : int * int [@ocaml.doc <span class="ocamlstring">" Object method "</span>] &gt;

 <span class="ocamlkeyword">type</span> t5 = [
   `PCstr [@ocaml.doc <span class="ocamlstring">" Polymorphic variant constructor "</span>]
 ]</div></div>

</div><p>Note that label comments take precedence over item comments, so:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T <span class="ocamlkeyword">of</span> string
 <span class="ocamlcomment">(** Attaches to T not t *)</span></div></div>

</div><p>will be converted to:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t =  T <span class="ocamlkeyword">of</span> string [@ocaml.doc <span class="ocamlstring">" Attaches to T not t "</span>]</div></div>

</div><p>whilst:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T <span class="ocamlkeyword">of</span> string
 <span class="ocamlcomment">(** Attaches to T not t *)</span>
 <span class="ocamlcomment">(** Attaches to t *)</span></div></div>

</div><p>will be converted to:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t =  T <span class="ocamlkeyword">of</span> string [@ocaml.doc <span class="ocamlstring">" Attaches to T not t "</span>]
 [@@ocaml.doc <span class="ocamlstring">" Attaches to t "</span>]</div></div>

</div><p>In the absence of meaningful comment on the last constructor of
a type, an empty comment&nbsp;<span class="c003">(**)</span> can be used instead:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = T <span class="ocamlkeyword">of</span> string
 <span class="ocamlcomment">(**)</span>
 <span class="ocamlcomment">(** Attaches to t *)</span></div></div>

</div><p>will be converted directly to</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t =  T <span class="ocamlkeyword">of</span> string
 [@@ocaml.doc <span class="ocamlstring">" Attaches to t "</span>]</div></div>

</div>











<h2 class="section" id="s:index-operators"><a class="section-anchor" href="#s:index-operators" aria-hidden="true"></a>19&nbsp;&nbsp;Extended indexing operators </h2>
<ul>
<li><a href="#ss%3Amultiindexing">19.1&nbsp;&nbsp;Multi-index notation</a>
</li></ul>
<p>
(Introduced in 4.06)</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018"><a class="syntax" id="dot-ext"><span class="c010">dot-ext</span></a></td><td class="c015">::=</td><td class="c017">
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#dot-operator-char"><span class="c010">dot-operator-char</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="lex.html#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="dot-operator-char"><span class="c010">dot-operator-char</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">!</span>&nbsp;∣&nbsp;&nbsp;&nbsp;<span class="c004">?</span>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="lex.html#core-operator-char"><span class="c010">core-operator-char</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">%</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">:</span>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> Dict = <span class="ocamlkeyword">struct</span>
 <span class="ocamlkeyword">include</span> Hashtbl
 <span class="ocamlkeyword">let</span> ( .%{} ) tabl index = find tabl index
 <span class="ocamlkeyword">let</span> ( .%{}&lt;- ) tabl index value = add tabl index value
 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">let</span> dict =
   <span class="ocamlkeyword">let</span> dict = Dict.create 10 <span class="ocamlkeyword">in</span>
   <span class="ocamlkeyword">let</span> () =
     dict.Dict.%{<span class="ocamlstring">"one"</span>} &lt;- 1;
     <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">open</span> Dict <span class="ocamlkeyword">in</span>
     dict.%{<span class="ocamlstring">"two"</span>} &lt;- 2 <span class="ocamlkeyword">in</span>
   dict</div></div>

</div><div class="caml-example toplevel">

<div class="ocaml">



<div class="pre caml-input"> dict.Dict.%{<span class="ocamlstring">"one"</span>};;</div>



<div class="pre caml-output ok">- : int = 1</div></div>
<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">open</span> Dict <span class="ocamlkeyword">in</span> dict.%{<span class="ocamlstring">"two"</span>};;</div>



<div class="pre caml-output ok">- : int = 2</div></div>

</div>
<h3 class="subsection" id="ss:multiindexing"><a class="section-anchor" href="#ss:multiindexing" aria-hidden="true">﻿</a>19.1&nbsp;&nbsp;Multi-index notation</h3>
<div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">(</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">)</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">[</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">]</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;<span class="c004">.</span>&nbsp;&nbsp;[<a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a>&nbsp;<span class="c004">.</span>]&nbsp;&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;<span class="c004">{</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;&nbsp;{<span class="c004">;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">}</span>&nbsp;&nbsp;[&nbsp;<span class="c004">&lt;-</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<span class="c010">operator-name</span></td><td class="c015">::=</td><td class="c017">
...
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">.</span>&nbsp;<a class="syntax" href="#dot-ext"><span class="c010">dot-ext</span></a>&nbsp;&nbsp;(<span class="c004">(;..)</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">[;..]</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">{;..}</span>)&nbsp;[<span class="c004">&lt;-</span>]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>Multi-index are also supported through a second variant of indexing operators</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> (.%[;..]) = Bigarray.Genarray.get
 <span class="ocamlkeyword">let</span> (.%{;..}) = Bigarray.Genarray.get
 <span class="ocamlkeyword">let</span> (.%(;..)) = Bigarray.Genarray.get</div></div>

</div><p>which is called when an index literals contain a semicolon separated list
of expressions with two and more elements:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">let</span> sum x y = x.%[1;2;3] + y.%[1;2]
 <span class="ocamlcomment">(* is equivalent to *)</span>
 <span class="ocamlkeyword">let</span> sum x y = (.%[;..]) x [|1;2;3|] + (.%[;..]) y [|1;2|]</div></div>

</div><p>In particular this multi-index notation makes it possible to uniformly handle
indexing Genarray and other implementations of multidimensional arrays.</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> A = Bigarray.Genarray
 <span class="ocamlkeyword">let</span> (.%{;..}) = A.get
 <span class="ocamlkeyword">let</span> (.%{;..}&lt;- ) = A.set
 <span class="ocamlkeyword">let</span> (.%{ }) a k = A.get a [|k|]
 <span class="ocamlkeyword">let</span> (.%{ }&lt;-) a k x = A.set a [|k|] x
 <span class="ocamlkeyword">let</span> syntax_compare vec mat t3 t4 =
           vec.%{0} = A.get vec [|0|]
    &amp;&amp;   mat.%{0;0} = A.get mat [|0;0|]
    &amp;&amp;   t3.%{0;0;0} = A.get t3 [|0;0;0|]
    &amp;&amp; t4.%{0;0;0;0} = t4.{0,0,0,0}</div></div>

</div>











<h2 class="section" id="s:empty-variants"><a class="section-anchor" href="#s:empty-variants" aria-hidden="true"></a>20&nbsp;&nbsp;Empty variant types</h2>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">type</span> t = |
 <span class="ocamlkeyword">let</span> f (x: t) = <span class="ocamlkeyword">match</span> x <span class="ocamlkeyword">with</span> _ -&gt; .</div></div>

</div>











<h2 class="section" id="s:alerts"><a class="section-anchor" href="#s:alerts" aria-hidden="true"></a>21&nbsp;&nbsp;Alerts</h2>
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











<h2 class="section" id="s:generalized-open"><a class="section-anchor" href="#s:generalized-open" aria-hidden="true"></a>22&nbsp;&nbsp;Generalized open statements</h2>
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

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">let</span> x = 0 <span class="ocamlkeyword">let</span> hidden = 1 <span class="ocamlkeyword">end</span>
 <span class="ocamlkeyword">open</span> (M:<span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> x: int <span class="ocamlkeyword">end</span>)
 <span class="ocamlkeyword">let</span> y = <span class="ocamlhighlight">hidden</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: Unbound value hidden</div></div>

</div><p>Another possibility is to immediately open the result of a functor application</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input">   <span class="ocamlkeyword">let</span> sort (<span class="ocamlkeyword">type</span> x) (x:x list) =
     <span class="ocamlkeyword">let</span> <span class="ocamlkeyword">open</span> Set.Make(<span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">type</span> t = x <span class="ocamlkeyword">let</span> compare=compare <span class="ocamlkeyword">end</span>) <span class="ocamlkeyword">in</span>
     elements (of_list x)</div>



<div class="pre caml-output ok"><span class="ocamlkeyword">val</span> sort : 'x list -&gt; 'x list = &lt;<span class="ocamlkeyword">fun</span>&gt;</div></div>

</div><p>Going further, this construction can introduce local components inside a
structure,</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">let</span> x = 0
   <span class="ocamlkeyword">open</span>! <span class="ocamlkeyword">struct</span>
     <span class="ocamlkeyword">let</span> x = 0
     <span class="ocamlkeyword">let</span> y = 1
   <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">let</span> w = x + y
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> x : int <span class="ocamlkeyword">val</span> w : int <span class="ocamlkeyword">end</span></div></div>

</div><p>One important restriction is that types introduced by <span class="c002"><span class="c003">open</span> <span class="c003">struct</span></span> ...
<span class="c004">end</span> cannot appear in the signature of the enclosing structure, unless they
are defined equal to some non-local type.
So:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">open</span> <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">type</span> 'a t = 'a option = None | Some <span class="ocamlkeyword">of</span> 'a <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">let</span> x : int t = Some 1
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">val</span> x : int option <span class="ocamlkeyword">end</span></div></div>

</div><p>


is OK, but:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M = <span class="ocamlkeyword">struct</span>
   <span class="ocamlhighlight">open struct type t = A end</span>
   <span class="ocamlkeyword">let</span> x = A
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output error"><span class="ocamlerror">Error</span>: The type t/4516 introduced by this open appears in the signature
       File "exten.etex", line 3, characters 6-7:
         The value x has no valid type if t/4516 is hidden</div></div>

</div><p>


is not because <span class="c003">x</span> cannot be given any type other than <span class="c003">t</span>, which only exists
locally. Although the above would be OK if <span class="c003">x</span> too was local:</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> M: <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span> = <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">open</span> <span class="ocamlkeyword">struct</span>
   <span class="ocamlkeyword">type</span> t = A
   <span class="ocamlkeyword">end</span>
   …
   <span class="ocamlkeyword">open</span> <span class="ocamlkeyword">struct</span> <span class="ocamlkeyword">let</span> x = A <span class="ocamlkeyword">end</span>
   …
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> M : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span></div></div>

</div><p>Inside signatures, extended opens are limited to extended module paths,


</p><div class="caml-example verbatim">

<div class="ocaml">



<div class="pre caml-input"> <span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S = <span class="ocamlkeyword">sig</span>
   <span class="ocamlkeyword">module</span> F: <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span> -&gt; <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">module</span> X: <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span>
   <span class="ocamlkeyword">open</span> F(X)
   <span class="ocamlkeyword">val</span> f: t
 <span class="ocamlkeyword">end</span></div>



<div class="pre caml-output ok"><span class="ocamlkeyword">module</span> <span class="ocamlkeyword">type</span> S =
  <span class="ocamlkeyword">sig</span>
    <span class="ocamlkeyword">module</span> F : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span> -&gt; <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">type</span> t <span class="ocamlkeyword">end</span>
    <span class="ocamlkeyword">module</span> X : <span class="ocamlkeyword">sig</span> <span class="ocamlkeyword">end</span>
    <span class="ocamlkeyword">val</span> f : F(X).t
  <span class="ocamlkeyword">end</span></div></div>

</div><p>and not</p><pre>  open struct type t = int end
</pre><p>
In those situations, local substitutions(see <a href="signaturesubstitution.html#ss%3Alocal-substitution">8.7.2</a>)
can be used instead.</p><p>Beware that this extension is not available inside class definitions:</p><pre>class c =
  let open Set.Make(Int) in
  ...
</pre>










<h2 class="section" id="s:binding-operators"><a class="section-anchor" href="#s:binding-operators" aria-hidden="true"></a>23&nbsp;&nbsp;Binding operators</h2>
<ul>
<li><a href="#ss%3Aletops-rationale">23.1&nbsp;&nbsp;Rationale</a>
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




<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>