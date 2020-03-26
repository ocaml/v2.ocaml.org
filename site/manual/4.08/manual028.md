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




<h2 class="section" id="sec247">6&nbsp;&nbsp;First-class modules</h2>
<p><a id="s-first-class-modules"></a>
<a id="hevea_manual.kwd213"></a>
<a id="hevea_manual.kwd214"></a>
<a id="hevea_manual.kwd215"></a>
<a id="hevea_manual.kwd216"></a></p><p>(Introduced in OCaml 3.12; pattern syntax and package type inference
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
functor, described in section&nbsp;<a href="manual038.html#s%3Agenerative-functors">8.16</a>.
It can also be used anywhere in the context of a local module binding
<span class="c002"><span class="c003">let</span> <span class="c003">module</span></span> <a class="syntax" href="names.html#module-name"><span class="c010">module-name</span></a> <span class="c002"><span class="c003">=</span> <span class="c003">(</span> <span class="c003">val</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>1</sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="#package-type"><span class="c010">package-type</span></a> <span class="c002"><span class="c003">)</span>
<span class="c003">in</span></span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c010">expr</span></a><sub>2</sub>.</p>
<h5 class="paragraph" id="sec248">Basic example</h5>
<p> A typical use of first-class modules is to
select at run-time among several implementations of a signature.
Each implementation is a structure that we can encapsulate as a
first-class module, then store in a data structure such as a hash
table:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> type picture = …
 module type DEVICE = sig
   val draw : picture -&gt; unit
   …
 end
 let devices : (string, (module DEVICE)) Hashtbl.t = Hashtbl.create 17

 module SVG = struct … end
 let _ = Hashtbl.add devices "SVG" (module SVG : DEVICE)

 module PDF = struct … end
 let _ = Hashtbl.add devices "PDF" (module PDF: DEVICE)
</div>
</pre>


</div><p>We can then select one implementation based on command-line
arguments, for instance:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let parse_cmdline () = …
 module Device =
   (val (let device_name = parse_cmdline () in
         try Hashtbl.find devices device_name
         with Not_found -&gt;
           Printf.eprintf "Unknown device %s\n" device_name;
           exit 2)
    : DEVICE)
</div>
</pre>


</div><p>

Alternatively, the selection can be performed within a function:


</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let draw_using_device device_name picture =
   let module Device =
     (val (Hashtbl.find devices device_name) : DEVICE)
   in
   Device.draw picture
</div>
</pre>


</div>
<h5 class="paragraph" id="sec249">Advanced examples</h5>
<p>
With first-class modules, it is possible to parametrize some code over the
implementation of a module without using a functor.</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let sort (type s) (module Set : Set.S with type elt = s) l =
   Set.elements (List.fold_right Set.add l Set.empty)
</div><div class="caml-output ok">val sort : (module Set.S with type elt = 'a) -&gt; 'a list -&gt; 'a list = &lt;fun&gt;
</div></pre>


</div><p>To use this function, one can wrap the <span class="c003">Set.Make</span> functor:</p><div class="caml-example verbatim">

<pre><div class="caml-input"> let make_set (type s) cmp =
   let module S = Set.Make(struct
     type t = s
     let compare = cmp
   end) in
   (module S : Set.S with type elt = s)
</div><div class="caml-output ok">val make_set : ('a -&gt; 'a -&gt; int) -&gt; (module Set.S with type elt = 'a) = &lt;fun&gt;
</div></pre>


</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>