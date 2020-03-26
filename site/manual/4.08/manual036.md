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




<h2 class="section" id="sec266">14&nbsp;&nbsp;Extension nodes</h2>
<ul>
<li><a href="manual036.html#sec267">14.1&nbsp;&nbsp;Built-in extension nodes</a>
</li></ul>
<p><a id="s:extension-nodes"></a></p><p>(Introduced in OCaml 4.02,
infix notations for constructs other than expressions added in 4.03,
infix notation (e1 ;%ext e2) added in 4.04.
)</p><p>Extension nodes are generic placeholders in the syntax tree. They are
rejected by the type-checker and are intended to be “expanded” by external
tools such as <span class="c003">-ppx</span> rewriters.</p><p>Extension nodes share the same notion of identifier and payload as
attributes&nbsp;<a href="manual035.html#s%3Aattributes">8.13</a>.</p><p>The first form of extension node is used for “algebraic” categories:</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="extension"><span class="c010">extension</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">[%</span>&nbsp;<a class="syntax" href="manual035.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="manual035.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
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
<span class="c004">[%%</span>&nbsp;<a class="syntax" href="manual035.html#attr-id"><span class="c010">attr-id</span></a>&nbsp;&nbsp;<a class="syntax" href="manual035.html#attr-payload"><span class="c010">attr-payload</span></a>&nbsp;<span class="c004">]</span>
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
<h3 class="subsection" id="sec267">14.1&nbsp;&nbsp;Built-in extension nodes</h3>
<p>(Introduced in OCaml 4.03)</p><p>Some extension nodes are understood by the compiler itself:
</p><ul class="itemize"><li class="li-itemize">
“ocaml.extension_constructor” or “extension_constructor”
take as payload a constructor from an extensible variant type
(see <a href="manual037.html#s%3Aextensible-variants">8.15</a>) and return its extension
constructor slot.
</li></ul><div class="caml-example verbatim">

<pre><div class="caml-input"> type t = ..
 type t += X of int | Y of string
 let x = [%extension_constructor X]
 let y = [%extension_constructor Y]
</div>
</pre>


</div><div class="caml-example toplevel">

<pre><div class="caml-input">  x &lt;&gt; y;;
</div><div class="caml-output ok">- : bool = true
</div></pre>


</div>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>