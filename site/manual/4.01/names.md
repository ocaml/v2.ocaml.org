<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec59"><span>Chapter 6</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>

</p><h3 class="subsection" id="sec60">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec61">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c005"><span class="c007">like</span> <span class="c007">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c014">like</span> &nbsp;<span class="c014">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.01</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">Lexical conventions</a>
</li><li><a href="values.html#start-section">Values</a>
</li><li><a href="names.html#start-section">Names</a>
</li><li><a href="types.html#start-section">Type expressions</a>
</li><li><a href="const.html#start-section">Constants</a>
</li><li><a href="patterns.html#start-section">Patterns</a>
</li><li><a href="expr.html#start-section">Expressions</a>
</li><li><a href="typedecl.html#start-section">Type and exception definitions</a>
</li><li><a href="classes.html#start-section">Classes</a>
</li><li><a href="modtypes.html#start-section">Module types (module specifications)</a>
</li><li><a href="modules.html#start-section">Module expressions (module implementations)</a>
</li><li><a href="compunit.html#start-section">Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="sec88">3&nbsp;&nbsp;Names</h2>
<p> <a id="s:names"></a>

</p><p>Identifiers are used to give names to several classes of language
objects and refer to these objects by name later:
</p><ul class="itemize"><li class="li-itemize">
value names (syntactic class <a class="syntax" href="#value-name"><span class="c014">value-name</span></a>),
</li><li class="li-itemize">value constructors and exception constructors (class <a class="syntax" href="#constr-name"><span class="c014">constr-name</span></a>),
</li><li class="li-itemize">labels (<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>, defined in section&nbsp;<a href="lex.html#s%3Alabelname">6.1</a>),
</li><li class="li-itemize">polymorphic variant tags (<a class="syntax" href="#tag-name"><span class="c014">tag-name</span></a>),
</li><li class="li-itemize">type constructors (<a class="syntax" href="#typeconstr-name"><span class="c014">typeconstr-name</span></a>),
</li><li class="li-itemize">record fields (<a class="syntax" href="#field-name"><span class="c014">field-name</span></a>),
</li><li class="li-itemize">class names (<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>),
</li><li class="li-itemize">method names (<a class="syntax" href="#method-name"><span class="c014">method-name</span></a>),
</li><li class="li-itemize">instance variable names (<a class="syntax" href="#inst-var-name"><span class="c014">inst-var-name</span></a>),
</li><li class="li-itemize">module names (<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>),
</li><li class="li-itemize">module type names (<a class="syntax" href="#modtype-name"><span class="c014">modtype-name</span></a>).
</li></ul><p>
These eleven name spaces are distinguished both by the context and by the
capitalization of the identifier: whether the first letter of the
identifier is in lowercase (written <a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a> below) or in
uppercase (written <a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>). Underscore is considered a
lowercase letter for this purpose.</p><p><a id="hevea_manual.kwd0"></a>
<a id="hevea_manual.kwd1"></a></p><h4 class="subsubsection" id="sec89">Naming objects</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="value-name"><span class="c014">value-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#operator-name"><span class="c014">operator-name</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="operator-name"><span class="c014">operator-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="#infix-op"><span class="c014">infix-op</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="infix-op"><span class="c014">infix-op</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#infix-symbol"><span class="c014">infix-symbol</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-.</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">!=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">or</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">||</span>
∣&nbsp;&nbsp;<span class="c008">&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&amp;&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">:=</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">mod</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">land</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lor</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lxor</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lsl</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lsr</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">asr</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="constr-name"><span class="c014">constr-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="tag-name"><span class="c014">tag-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="typeconstr-name"><span class="c014">typeconstr-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="field-name"><span class="c014">field-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-name"><span class="c014">module-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="modtype-name"><span class="c014">modtype-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-name"><span class="c014">class-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="inst-var-name"><span class="c014">inst-var-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="method-name"><span class="c014">method-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
As shown above, prefix and infix symbols as well as some keywords can
be used as value names, provided they are written between parentheses.
The capitalization rules are summarized in the table below.</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Name space</span></td><td class="c021"><span class="c019">Case of first letter</span> </td></tr>
<tr><td class="c023">
Values</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Constructors</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Labels</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Polymorphic variant tags</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Exceptions</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Type constructors</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Record fields</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Classes</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Instance variables</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Methods</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Modules</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Module types</td><td class="c023">any </td></tr>
</tbody></table></div><p><span class="c013">Note on polymorphic variant tags:</span> the current implementation accepts
lowercase variant tags in addition to capitalized variant tags, but we
suggest you avoid lowercase variant tags for portability and
compatibility with future OCaml versions.</p><h4 class="subsubsection" id="sec90">Referring to named objects</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="value-path"><span class="c014">value-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#value-name"><span class="c014">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="constr"><span class="c014">constr</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#constr-name"><span class="c014">constr-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="typeconstr"><span class="c014">typeconstr</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#typeconstr-name"><span class="c014">typeconstr-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="field"><span class="c014">field</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#field-name"><span class="c014">field-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="modtype-path"><span class="c014">modtype-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#modtype-name"><span class="c014">modtype-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-path"><span class="c014">class-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="classtype-path"><span class="c014">classtype-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-path"><span class="c014">module-path</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">.</span>&nbsp;<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="extended-module-path"><span class="c014">extended-module-path</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#extended-module-name"><span class="c014">extended-module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">.</span>&nbsp;<a class="syntax" href="#extended-module-name"><span class="c014">extended-module-name</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="extended-module-name"><span class="c014">extended-module-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">)</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A named object can be referred to either by its name (following the
usual static scoping rules for names) or by an access path <span class="c014">prefix</span> <span class="c008">.</span> &nbsp;<span class="c014">name</span>,
where <span class="c014">prefix</span> designates a module and <span class="c014">name</span> is the name of an object
defined in that module. The first component of the path, <span class="c014">prefix</span>, is
either a simple module name or an access path <span class="c014">name</span><sub>1</sub> <span class="c008">.</span> &nbsp;<span class="c014">name</span><sub>2</sub> …,
in case the defining module is itself nested inside other modules.
For referring to type constructors, module types, or class types,
the <span class="c014">prefix</span> can
also contain simple functor applications (as in the syntactic class
<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a> above) in case the defining module is the
result of a functor application.</p><p>Label names, tag names, method names and instance variable names need
not be qualified: the former three are global labels, while the latter
are local to a class.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>