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




<h2 class="section" id="s:module-expr">11&nbsp;&nbsp;Module expressions (module implementations)</h2>
<ul>
<li><a href="modules.html#sec195">Simple module expressions</a>
</li><li><a href="modules.html#sec196">Structures</a>
</li><li><a href="modules.html#sec206">Functors</a>
</li></ul>
<p>Module expressions are the module-level equivalent of value
expressions: they evaluate to modules, thus providing implementations
for the specifications expressed in module types.</p><p><a id="hevea_manual.kwd147"></a>
<a id="hevea_manual.kwd148"></a>
<a id="hevea_manual.kwd149"></a>
<a id="hevea_manual.kwd150"></a>
<a id="hevea_manual.kwd151"></a>
<a id="hevea_manual.kwd152"></a>
<a id="hevea_manual.kwd153"></a>
<a id="hevea_manual.kwd154"></a>
<a id="hevea_manual.kwd155"></a>
<a id="hevea_manual.kwd156"></a>
<a id="hevea_manual.kwd157"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="module-expr"><span class="c014">module-expr</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">struct</span>&nbsp;[&nbsp;<a class="syntax" href="#module-items"><span class="c014">module-items</span></a>&nbsp;]&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">functor</span>&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">(</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-items"><span class="c014">module-items</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">;;</span>]&nbsp;(&nbsp;<a class="syntax" href="#definition"><span class="c014">definition</span></a>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;)&nbsp;&nbsp;{&nbsp;[<span class="c008">;;</span>]&nbsp;<a class="syntax" href="#definition"><span class="c014">definition</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">;;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;;</span>]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="definition"><span class="c014">definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">let</span>&nbsp;[<span class="c008">rec</span>]&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c014">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="typedecl.html#exception-definition"><span class="c014">exception-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#class-definition"><span class="c014">class-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c014">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;}
&nbsp;[&nbsp;<span class="c008">:</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;]&nbsp;&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<span class="c008">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">include</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table>
<h3 class="subsection" id="sec195">11.1&nbsp;&nbsp;Simple module expressions</h3>
<p>The expression <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> evaluates to the module bound to the name
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">)</span> evaluates to the same module as
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">)</span> checks that the
type of <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> is a subtype of <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>, that is, that all
components specified in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> are implemented in
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, and their implementation meets the requirements given
in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>. In other terms, it checks that the implementation
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> meets the type specification <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>. The whole
expression evaluates to the same module as <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, except that
all components not specified in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> are hidden and can no
longer be accessed.</p>
<h3 class="subsection" id="sec196">11.2&nbsp;&nbsp;Structures</h3>
<p><a id="hevea_manual.kwd158"></a>
<a id="hevea_manual.kwd159"></a></p><p>Structures <span class="c008">struct</span> … <span class="c008">end</span> are collections of definitions for
value names, type names, exceptions, module names and module type
names. The definitions are evaluated in the order in which they appear
in the structure. The scopes of the bindings performed by the
definitions extend to the end of the structure. As a consequence, a
definition may refer to names bound by earlier definitions in the same
structure.</p><p>For compatibility with toplevel phrases (chapter&nbsp;<a href="toplevel.html#c%3Acamllight">9</a>),
an optional <span class="c008">;;</span> is allowed after each
definition in a structure. The <span class="c008">;;</span> has no semantic meaning. Also for
compatibility, <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> is allowed as a component of a structure,
meaning <span class="c005"><span class="c007">let</span> <span class="c007">_</span> <span class="c007">=</span></span> <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>, i.e. evaluate <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> for its side-effects.
In this case, the <span class="c008">;;</span> of the previous component (if any) is not
optional.</p><h4 class="subsubsection" id="sec197">Value definitions</h4>
<p><a id="hevea_manual.kwd160"></a></p><p>A value definition <span class="c008">let</span> [<span class="c008">rec</span>] <a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a> }
bind value names in the same way as a <span class="c008">let</span> … <span class="c008">in</span> … expression
(see section&nbsp;<a href="expr.html#s%3Alocaldef">6.7.1</a>). The value names appearing in the
left-hand sides of the bindings are bound to the corresponding values
in the right-hand sides.</p><p><a id="hevea_manual.kwd161"></a></p><p>A value definition <span class="c008">external</span> <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
implements <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> as the external function specified in
<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a> (see chapter&nbsp;<a href="intfc.html#c%3Aintf-c">19</a>).</p><h4 class="subsubsection" id="sec198">Type definitions</h4>
<p><a id="hevea_manual.kwd162"></a></p><p>A definition of one or several type components is written
<span class="c008">type</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> } and consists of a sequence
of mutually recursive definitions of type names.</p><h4 class="subsubsection" id="sec199">Exception definitions</h4>
<p><a id="hevea_manual.kwd163"></a></p><p>Exceptions are defined with the syntax <span class="c008">exception</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c014">constr-decl</span></a>
or <span class="c008">exception</span> <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>.</p><h4 class="subsubsection" id="sec200">Class definitions</h4>
<p><a id="hevea_manual.kwd164"></a></p><p>A definition of one or several classes is written <span class="c008">class</span>
<a class="syntax" href="classes.html#class-binding"><span class="c014">class-binding</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="classes.html#class-binding"><span class="c014">class-binding</span></a> } and consists of a sequence of
mutually recursive definitions of class names. Class definitions are
described more precisely in section&nbsp;<a href="classes.html#s%3Aclassdef">6.9.3</a>.</p><h4 class="subsubsection" id="sec201">Class type definitions</h4>
<p><a id="hevea_manual.kwd165"></a>
<a id="hevea_manual.kwd166"></a></p><p>A definition of one or several classes is written
<span class="c005"><span class="c007">class</span> <span class="c007">type</span></span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> } and consists of
a sequence of mutually recursive definitions of class type names.
Class type definitions are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclasstype">6.9.5</a>.</p><h4 class="subsubsection" id="sec202">Module definitions</h4>
<p><a id="hevea_manual.kwd167"></a></p><p>The basic form for defining a module component is
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, which evaluates <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> and binds
the result to the name <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>.</p><p>One can write
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><p>
instead of
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c005"><span class="c007">=</span> <span class="c007">(</span></span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">)</span>.
</div><p>
Another derived form is
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">(</span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c008">)</span> …
<span class="c008">(</span> &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">)</span> <span class="c007">=</span></span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><p>
which is equivalent to
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c005"><span class="c007">=</span>
<span class="c007">functor</span> <span class="c007">(</span></span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span> …
<span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><h4 class="subsubsection" id="sec203">Module type definitions</h4>
<p><a id="hevea_manual.kwd168"></a>
<a id="hevea_manual.kwd169"></a></p><p>A definition for a module type is written
<span class="c005"><span class="c007">module</span> <span class="c007">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>.
It binds the name <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> to the module type denoted by the
expression <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>.</p><h4 class="subsubsection" id="sec204">Opening a module path</h4>
<p><a id="hevea_manual.kwd170"></a></p><p>The expression <span class="c008">open</span> <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> in a structure does not define any
components nor perform any bindings. It simply affects the parsing of
the following items of the structure, allowing components of the
module denoted by <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> to be referred to by their simple names
<span class="c014">name</span> instead of path accesses <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> <span class="c008">.</span> &nbsp;<span class="c014">name</span>. The scope of
the <span class="c008">open</span> stops at the end of the structure expression.</p><h4 class="subsubsection" id="sec205">Including the components of another structure</h4>
<p><a id="hevea_manual.kwd171"></a></p><p>The expression <span class="c008">include</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> in a structure re-exports in
the current structure all definitions of the structure denoted by
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>. For instance, if the identifier <span class="c007">S</span> is bound to the
module
</p><pre>        struct type t = int  let x = 2 end
</pre><p>the module expression
</p><pre>        struct include S  let y = (x + 1 : t) end
</pre><p>is equivalent to the module expression
</p><pre>        struct type t = S.t  let x = S.x  let y = (x + 1 : t) end
</pre><p>The difference between <span class="c008">open</span> and <span class="c008">include</span> is that <span class="c008">open</span>
simply provides short names for the components of the opened
structure, without defining any components of the current structure,
while <span class="c008">include</span> also adds definitions for the components of the
included structure.</p>
<h3 class="subsection" id="sec206">11.3&nbsp;&nbsp;Functors</h3>
<h4 class="subsubsection" id="sec207">Functor definition</h4>
<p><a id="hevea_manual.kwd172"></a></p><p>The expression <span class="c005"><span class="c007">functor</span> <span class="c007">(</span></span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span>
&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> evaluates to a functor that takes as argument modules of
the type <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub>, binds <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> to these modules,
evaluates <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> in the extended environment, and returns the
resulting modules as results. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p><h4 class="subsubsection" id="sec208">Functor application</h4>
<p>The expression <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub> <span class="c008">(</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> <span class="c008">)</span> evaluates
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub> to a functor and <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> to a module, and
applies the former to the latter. The type of <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> must
match the type expected for the arguments of the functor <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub>.</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>