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




<h2 class="section"><a name="htoc87">6.11</a>&nbsp;&nbsp;Module<a name="s:module-expr"></a> expressions (module implementations)</h2><ul>
<li><a href="manual019.html#toc65">Simple module expressions</a>
</li><li><a href="manual019.html#toc66">Structures</a>
</li><li><a href="manual019.html#toc67">Functors</a>
</li></ul>
<p>Module expressions are the module-level equivalent of value
expressions: they evaluate to modules, thus providing implementations
for the specifications expressed in module types.</p><p><a name="@manual.kwd147"></a>
<a name="@manual.kwd148"></a>
<a name="@manual.kwd149"></a>
<a name="@manual.kwd150"></a>
<a name="@manual.kwd151"></a>
<a name="@manual.kwd152"></a>
<a name="@manual.kwd153"></a>
<a name="@manual.kwd154"></a>
<a name="@manual.kwd155"></a>
<a name="@manual.kwd156"></a>
<a name="@manual.kwd157"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>struct</tt></font>&nbsp;{&nbsp;<i><a href="#definition" class="syntax"><font color="maroon">definition</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;∣&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>;;</tt></font>&nbsp;}&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>functor</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="definition" class="syntax"><font color="maroon">definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>let</tt></font>&nbsp;[<font color="blue"><tt>rec</tt></font>]&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>external</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<font color="maroon"><i>external-declaration</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual016.html#type-definition" class="syntax"><font color="maroon">type-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual016.html#exception-definition" class="syntax"><font color="maroon">exception-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#class-definition" class="syntax"><font color="maroon">class-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#classtype-definition" class="syntax"><font color="maroon">classtype-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;}
&nbsp;[&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;]&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>open</tt></font>&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>include</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><h3 class="subsection"><a name="toc65"></a><a name="htoc88">6.11.1</a>&nbsp;&nbsp;Simple module expressions</h3><p>The expression <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> evaluates to the module bound to the name
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>)</tt></font> evaluates to the same module as
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt></font> checks that the
type of <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> is a subtype of <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>, that is, that all
components specified in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> are implemented in
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, and their implementation meets the requirements given
in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>. In other terms, it checks that the implementation
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> meets the type specification <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>. The whole
expression evaluates to the same module as <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, except that
all components not specified in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> are hidden and can no
longer be accessed.</p><h3 class="subsection"><a name="toc66"></a><a name="htoc89">6.11.2</a>&nbsp;&nbsp;Structures</h3><p><a name="@manual.kwd158"></a>
<a name="@manual.kwd159"></a></p><p>Structures <font color="blue"><tt>struct</tt></font> … <font color="blue"><tt>end</tt></font> are collections of definitions for
value names, type names, exceptions, module names and module type
names. The definitions are evaluated in the order in which they appear
in the structure. The scope of the bindings performed by the
definitions extend to the end of the structure. As a consequence, a
definition may refer to names bound by earlier definitions in the same
structure.</p><p>For compatibility with toplevel phrases (chapter&nbsp;<a href="manual023.html#c:camllight">9</a>)
and with Caml Light, an optional <tt>;;</tt> is allowed after each
definition in a structure. The <tt>;;</tt> has no semantic meaning. Also for
compatibility, <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>;;</tt></font> is allowed as a component of a structure,
meaning <font color="blue"><tt>let</tt> <tt>_</tt> <tt>=</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>, i.e. evaluate <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> for its side-effects.
In this case, the <tt>;;</tt> of the previous component is not optional.</p><h4 class="subsubsection">Value definitions</h4><p><a name="@manual.kwd160"></a></p><p>A value definition <font color="blue"><tt>let</tt></font> [<font color="blue"><tt>rec</tt></font>] <i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i> }
bind value names in the same way as a <font color="blue"><tt>let</tt></font> … <font color="blue"><tt>in</tt></font> … expression
(see section&nbsp;<a href="expr.html#s:localdef">6.7.1</a>). The value names appearing in the
left-hand sides of the bindings are bound to the corresponding values
in the right-hand sides.</p><p><a name="@manual.kwd161"></a></p><p>A value definition <font color="blue"><tt>external</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<font color="maroon"><i>external-declaration</i></font>
implements <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> as the external function specified in
<font color="maroon"><i>external-declaration</i></font> (see chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>).</p><h4 class="subsubsection">Type definitions</h4><p><a name="@manual.kwd162"></a></p><p>A definition of one or several type components is written
<font color="blue"><tt>type</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> } and consists of a sequence
of mutually recursive definitions of type names.</p><h4 class="subsubsection">Exception definitions</h4><p><a name="@manual.kwd163"></a></p><p>Exceptions are defined with the syntax <font color="blue"><tt>exception</tt></font> <i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>
or <font color="blue"><tt>exception</tt></font> <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>.</p><h4 class="subsubsection">Class definitions</h4><p><a name="@manual.kwd164"></a></p><p>A definition of one or several classes is written <font color="blue"><tt>class</tt></font>
<i><a href="manual017.html#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> } and consists of a sequence of
mutually recursive definitions of class names. Class definitions are
described more precisely in section&nbsp;<a href="manual017.html#s:classdef">6.9.3</a>.</p><h4 class="subsubsection">Class type definitions</h4><p><a name="@manual.kwd165"></a>
<a name="@manual.kwd166"></a></p><p>A definition of one or several classes is written
<font color="blue"><tt>class</tt> <tt>type</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> } and consists of
a sequence of mutually recursive definitions of class type names.
Class type definitions are described more precisely in
section&nbsp;<a href="manual017.html#s:classtype">6.9.5</a>.</p><h4 class="subsubsection">Module definitions</h4><p><a name="@manual.kwd167"></a></p><p>The basic form for defining a module component is
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, which evaluates <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> and binds
the result to the name <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>.</p><p>One can write
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><p>
instead of
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt> <tt>(</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt></font>.
</div><p>
Another derived form is
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt></font> …
<font color="blue"><tt>(</tt></font> &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a><sub>n</sub></i> <font color="blue"><tt>)</tt> <tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><p>
which is equivalent to
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt>
<tt>functor</tt> <tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> …
<font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><h4 class="subsubsection">Module type definitions</h4><p><a name="@manual.kwd168"></a>
<a name="@manual.kwd169"></a></p><p>A definition for a module type is written
<font color="blue"><tt>module</tt> <tt>type</tt></font> <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.
It binds the name <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> to the module type denoted by the
expression <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.</p><h4 class="subsubsection">Opening a module path</h4><p><a name="@manual.kwd170"></a></p><p>The expression <font color="blue"><tt>open</tt></font> <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> in a structure does not define any
components nor perform any bindings. It simply affects the parsing of
the following items of the structure, allowing components of the
module denoted by <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> to be referred to by their simple names
<font color="maroon"><i>name</i></font> instead of path accesses <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font>. The scope of
the <tt>open</tt> stops at the end of the structure expression.</p><h4 class="subsubsection">Including the components of another structure</h4><p><a name="@manual.kwd171"></a></p><p>The expression <font color="blue"><tt>include </tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> in a structure re-exports in
the current structure all definitions of the structure denoted by
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>. For instance, if the identifier <tt>S</tt> is bound to the
module
</p><pre>        struct type t = int  let x = 2 end
</pre><p>the module expression
</p><pre>        struct include S  let y = (x + 1 : t) end
</pre><p>is equivalent to the module expression
</p><pre>        struct type t = S.t  let x = S.x  let y = (x + 1 : t) end
</pre><p>The difference between <font color="blue"><tt>open</tt></font> and <font color="blue"><tt>include</tt></font> is that <font color="blue"><tt>open</tt></font>
simply provides short names for the components of the opened
structure, without defining any components of the current structure,
while <font color="blue"><tt>include</tt></font> also adds definitions for the components of the
included structure.</p><h3 class="subsection"><a name="toc67"></a><a name="htoc90">6.11.3</a>&nbsp;&nbsp;Functors</h3><h4 class="subsubsection">Functor definition</h4><p><a name="@manual.kwd172"></a></p><p>The expression <font color="blue"><tt>functor</tt> <tt>(</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font>
&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> evaluates to a functor that takes as argument modules of
the type <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub>, binds <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> to these modules,
evaluates <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> in the extended environment, and returns the
resulting modules as results. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p><h4 class="subsubsection">Functor application</h4><p>The expression <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub> <font color="blue"><tt>(</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> <font color="blue"><tt>)</tt></font> evaluates
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub> to a functor and <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> to a module, and
applies the former to the latter. The type of <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> must
match the type expected for the arguments of the functor <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub>.</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>