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






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>