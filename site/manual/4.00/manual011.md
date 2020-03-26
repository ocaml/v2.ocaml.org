<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="manual021.html">Language extensions</a></li></ul>




<h1 class="chapter"><a name="htoc51"><span>Chapter 6</span></a>&nbsp;&nbsp;The OCaml language</h1><p> <a name="c:refman"></a>

</p><h3 class="subsection">Foreword</h3><p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection">Notations</h3><p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<font color="blue"><tt>like</tt> <tt>this</tt></font>).
Non-terminal symbols are set in italic font (<font color="maroon"><i>like</i></font> &nbsp;<font color="maroon"><i>that</i></font>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly bracket with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">Lexical conventions</a>
</li><li><a href="manual010.html#start-section">Values</a>
</li><li><a href="manual011.html#start-section">Names</a>
</li><li><a href="types.html#start-section">Type expressions</a>
</li><li><a href="manual013.html#start-section">Constants</a>
</li><li><a href="patterns.html#start-section">Patterns</a>
</li><li><a href="expr.html#start-section">Expressions</a>
</li><li><a href="manual016.html#start-section">Type and exception definitions</a>
</li><li><a href="manual017.html#start-section">Classes</a>
</li><li><a href="manual018.html#start-section">Module types (module specifications)</a>
</li><li><a href="manual019.html#start-section">Module expressions (module implementations)</a>
</li><li><a href="manual020.html#start-section">Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section"><a name="htoc62">6.3</a>&nbsp;&nbsp;Names</h2><p> <a name="s:names"></a>
</p><p>Identifiers are used to give names to several classes of language
objects and refer to these objects by name later:
</p><ul class="itemize"><li class="li-itemize">
value names (syntactic class <i><a href="#value-name" class="syntax"><font color="maroon">value-name</font></a></i>),
</li><li class="li-itemize">value constructors and exception constructors (class <i><a href="#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>),
</li><li class="li-itemize">labels (<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>),
</li><li class="li-itemize">polymorphic variant tags (<i><a href="#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>),
</li><li class="li-itemize">type constructors (<i><a href="#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>),
</li><li class="li-itemize">record fields (<i><a href="#field-name" class="syntax"><font color="maroon">field-name</font></a></i>),
</li><li class="li-itemize">class names (<i><a href="#class-name" class="syntax"><font color="maroon">class-name</font></a></i>),
</li><li class="li-itemize">method names (<i><a href="#method-name" class="syntax"><font color="maroon">method-name</font></a></i>),
</li><li class="li-itemize">instance variable names (<i><a href="#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>),
</li><li class="li-itemize">module names (<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>),
</li><li class="li-itemize">module type names (<i><a href="#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>).
</li></ul><p>
These eleven name spaces are distinguished both by the context and by the
capitalization of the identifier: whether the first letter of the
identifier is in lowercase (written <font color="maroon"><i>lowercase-ident</i></font> below) or in
uppercase (written <font color="maroon"><i>capitalized-ident</i></font>). Underscore is considered a
lowercase letter for this purpose.</p><p><a name="@manual.kwd0"></a>
<a name="@manual.kwd1"></a></p><h4 class="subsubsection">Naming objects</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="value-name" class="syntax"><font color="maroon">value-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#operator-name" class="syntax"><font color="maroon">operator-name</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="operator-name" class="syntax"><font color="maroon">operator-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i>&nbsp;∣&nbsp;&nbsp;<i><a href="#infix-op" class="syntax"><font color="maroon">infix-op</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="infix-op" class="syntax"><font color="maroon">infix-op</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>or</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&amp;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>:=</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>mod</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>land</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lor</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lxor</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lsl</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lsr</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>asr</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="constr-name" class="syntax"><font color="maroon">constr-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>capitalized-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="tag-name" class="syntax"><font color="maroon">tag-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="field-name" class="syntax"><font color="maroon">field-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="module-name" class="syntax"><font color="maroon">module-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>capitalized-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-name" class="syntax"><font color="maroon">class-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="method-name" class="syntax"><font color="maroon">method-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
As shown above, prefix and infix symbols as well as some keywords can
be used as value names, provided they are written between parentheses.
The capitalization rules are summarized in the table below.</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Name space</b></td><td align="center" nowrap=""><b>Case of first letter</b></td></tr>
<tr><td align="left" nowrap="">
Values</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Constructors</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Labels</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Polymorphic variant tags</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Exceptions</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Type constructors</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Record fields</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Classes</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Instance variables</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Methods</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Modules</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Module types</td><td align="left" nowrap="">any</td></tr>
</tbody></table></div><p><i>Note on polymorphic variant tags:</i> the current implementation accepts
lowercase variant tags in addition to uppercase variant tags, but we
suggest you avoid lowercase variant tags for portability and
compatibility with future OCaml versions.</p><h4 class="subsubsection">Referring to named objects</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="value-path" class="syntax"><font color="maroon">value-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#value-name" class="syntax"><font color="maroon">value-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="constr" class="syntax"><font color="maroon">constr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="field" class="syntax"><font color="maroon">field</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#field-name" class="syntax"><font color="maroon">field-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="module-path" class="syntax"><font color="maroon">module-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
{&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;}&nbsp;&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-path" class="syntax"><font color="maroon">class-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#class-name" class="syntax"><font color="maroon">class-name</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>A named object can be referred to either by its name (following the
usual static scoping rules for names) or by an access path <font color="maroon"><i>prefix</i></font> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font>,
where <font color="maroon"><i>prefix</i></font> designates a module and <font color="maroon"><i>name</i></font> is the name of an object
defined in that module. The first component of the path, <font color="maroon"><i>prefix</i></font>, is
either a simple module name or an access path <font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>2</sub> …,
in case the defining module is itself nested inside other modules.
For referring to type constructors or module types, the <font color="maroon"><i>prefix</i></font> can
also contain simple functor applications (as in the syntactic class
<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i> above), in case the defining module is the
result of a functor application.</p><p>Label names, tag names, method names and instance variable names need
not be qualified: the former three are global labels, while the latter
are local to a class.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>