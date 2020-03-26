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




<h2 class="section" id="s:attributes"><a class="section-anchor" href="#s:attributes" aria-hidden="true"></a>12&nbsp;&nbsp;Attributes</h2>
<ul>
<li><a href="attributes.html#ss%3Abuiltin-attributes">12.1&nbsp;&nbsp;Built-in attributes</a>
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






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>