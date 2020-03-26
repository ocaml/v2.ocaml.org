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




<h2 class="section" id="s:doc-comments"><a class="section-anchor" href="#s:doc-comments" aria-hidden="true"></a>18&nbsp;&nbsp;Documentation comments</h2>
<ul>
<li><a href="doccomments.html#ss%3Afloating-comments">18.1&nbsp;&nbsp;Floating comments</a>
</li><li><a href="doccomments.html#ss%3Aitem-comments">18.2&nbsp;&nbsp;Item comments</a>
</li><li><a href="doccomments.html#ss%3Alabel-comments">18.3&nbsp;&nbsp;Label comments</a>
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






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>