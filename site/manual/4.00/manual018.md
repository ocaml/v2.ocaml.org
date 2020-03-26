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




<h2 class="section"><a name="htoc82">6.10</a>&nbsp;&nbsp;Module types (module specifications)</h2><ul>
<li><a href="manual018.html#toc61">Simple module types</a>
</li><li><a href="manual018.html#toc62">Signatures</a>
</li><li><a href="manual018.html#toc63">Functor types</a>
</li><li><a href="manual018.html#toc64">The <tt>with</tt> operator</a>
</li></ul>
<p>Module types are the module-level equivalent of type expressions: they
specify the general shape and type properties of modules.</p><p><a name="@manual.kwd119"></a>
<a name="@manual.kwd120"></a>
<a name="@manual.kwd121"></a>
<a name="@manual.kwd122"></a>
<a name="@manual.kwd123"></a>
<a name="@manual.kwd124"></a>
<a name="@manual.kwd125"></a>
<a name="@manual.kwd126"></a>
<a name="@manual.kwd127"></a>
<a name="@manual.kwd128"></a>
<a name="@manual.kwd129"></a>
<a name="@manual.kwd130"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="module-type" class="syntax"><font color="maroon">module-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>sig</tt></font>&nbsp;{&nbsp;<i><a href="#specification" class="syntax"><font color="maroon">specification</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;}&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>functor</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="#mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>type</tt></font>&nbsp;[<i><a href="manual016.html#type-params" class="syntax"><font color="maroon">type-params</font></a></i>]&nbsp;&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="specification" class="syntax"><font color="maroon">specification</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>val</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>external</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<font color="maroon"><i>external-declaration</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual016.html#type-definition" class="syntax"><font color="maroon">type-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>exception</tt></font>&nbsp;<i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#class-specification" class="syntax"><font color="maroon">class-specification</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#classtype-definition" class="syntax"><font color="maroon">classtype-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;}
<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>open</tt></font>&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>include</tt></font>&nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><h3 class="subsection"><a name="toc61"></a><a name="htoc83">6.10.1</a>&nbsp;&nbsp;Simple module types</h3><p>The expression <i><a href="manual011.html#modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i> is equivalent to the module type bound
to the name <i><a href="manual011.html#modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i>.
The expression <font color="blue"><tt>(</tt></font> <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt></font> denotes the same type as
<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.</p><h3 class="subsection"><a name="toc62"></a><a name="htoc84">6.10.2</a>&nbsp;&nbsp;Signatures</h3><p><a name="@manual.kwd131"></a>
<a name="@manual.kwd132"></a></p><p>Signatures are type specifications for structures. Signatures
<font color="blue"><tt>sig</tt></font> … <font color="blue"><tt>end</tt></font> are collections of type specifications for value
names, type names, exceptions, module names and module type names. A
structure will match a signature if the structure provides definitions
(implementations) for all the names specified in the signature (and
possibly more), and these definitions meet the type requirements given
in the signature.</p><p>For compatibility with Caml Light, an optional <tt>;;</tt> is allowed after each
specification in a signature. The <tt>;;</tt> has no semantic meaning.</p><h4 class="subsubsection">Value specifications</h4><p><a name="@manual.kwd133"></a></p><p>A specification of a value component in a signature is written
<font color="blue"><tt>val</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>, where <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> is the name of the
value and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> its expected type.</p><p><a name="@manual.kwd134"></a></p><p>The form <font color="blue"><tt>external</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<font color="maroon"><i>external-declaration</i></font>
is similar, except that it requires in addition the name to be
implemented as the external function specified in <font color="maroon"><i>external-declaration</i></font>
(see chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>).</p><h4 class="subsubsection">Type specifications</h4><p><a name="@manual.kwd135"></a></p><p>A specification of one or several type components in a signature is
written <font color="blue"><tt>type</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> } and consists of a sequence
of mutually recursive definitions of type names.</p><p>Each type definition in the signature specifies an optional type
equation <font color="blue"><tt>=</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> and an optional type representation 
<font color="blue"><tt>=</tt></font> <i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i> … or <font color="blue"><tt>=</tt> <tt>{</tt></font> <i><a href="manual016.html#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i> … <font color="blue"><tt>}</tt></font>.
The implementation of the type name in a matching structure must
be compatible with the type expression specified in the equation (if
given), and have the specified representation (if given). Conversely,
users of that signature will be able to rely on the type equation
or type representation, if given. More precisely, we have the
following four situations:</p><dl class="description"><dt class="dt-description">
<b>Abstract type: no equation, no representation.</b></dt><dd class="dd-description"> &nbsp;<br>
Names that are defined as abstract types in a signature can be
implemented in a matching structure by any kind of type definition
(provided it has the same number of type parameters). The exact
implementation of the type will be hidden to the users of the
structure. In particular, if the type is implemented as a variant type
or record type, the associated constructors and fields will not be
accessible to the users; if the type is implemented as an
abbreviation, the type equality between the type name and the
right-hand side of the abbreviation will be hidden from the users of the
structure. Users of the structure consider that type as incompatible
with any other type: a fresh type has been generated.</dd><dt class="dt-description"><b>Type abbreviation: an equation <font color="blue"><tt>=</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>, no representation.</b></dt><dd class="dd-description"> &nbsp;<br>
The type name must be implemented by a type compatible with <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.
All users of the structure know that the type name is
compatible with <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.</dd><dt class="dt-description"><b>New variant type or record type: no equation, a representation.</b></dt><dd class="dd-description"> &nbsp;<br>
The type name must be implemented by a variant type or record type
with exactly the constructors or fields specified. All users of the
structure have access to the constructors or fields, and can use them
to create or inspect values of that type. However, users of the
structure consider that type as incompatible with any other type: a
fresh type has been generated.</dd><dt class="dt-description"><b>Re-exported variant type or record type: an equation,
a representation.</b></dt><dd class="dd-description"> &nbsp;<br>
This case combines the previous two: the representation of the type is
made visible to all users, and no fresh type is generated.
</dd></dl><h4 class="subsubsection">Exception specification</h4><p><a name="@manual.kwd136"></a></p><p>The specification <font color="blue"><tt>exception</tt></font> <i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i> in a signature requires the
matching structure to provide an exception with the name and arguments
specified in the definition, and makes the exception available to all
users of the structure.</p><h4 class="subsubsection">Class specifications</h4><p><a name="@manual.kwd137"></a></p><p>A specification of one or several classes in a signature is written
<font color="blue"><tt>class</tt></font> <i><a href="manual017.html#class-spec" class="syntax"><font color="maroon">class-spec</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#class-spec" class="syntax"><font color="maroon">class-spec</font></a></i> } and consists of a sequence
of mutually recursive definitions of class names.</p><p>Class specifications are described more precisely in
section&nbsp;<a href="manual017.html#s:class-spec">6.9.4</a>.</p><h4 class="subsubsection">Class type specifications</h4><p><a name="@manual.kwd138"></a>
<a name="@manual.kwd139"></a></p><p>A specification of one or several classe types in a signature is
written <font color="blue"><tt>class</tt> <tt>type</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> { <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> } and
consists of a sequence of mutually recursive definitions of class type
names. Class type specifications are described more precisely in
section&nbsp;<a href="manual017.html#s:classtype">6.9.5</a>.</p><h4 class="subsubsection">Module specifications</h4><p><a name="@manual.kwd140"></a></p><p>A specification of a module component in a signature is written
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>, where <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> is the
name of the module component and <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> its expected type.
Modules can be nested arbitrarily; in particular, functors can appear
as components of structures and functor types as components of
signatures.</p><p>For specifying a module component that is a functor, one may write
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt></font>
… <font color="blue"><tt>(</tt></font> &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a><sub>n</sub></i> <font color="blue"><tt>)</tt>
<tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
</div><p>
instead of
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt>
<tt>functor</tt> <tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> …
<font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
</div><h4 class="subsubsection">Module type specifications</h4><p><a name="@manual.kwd141"></a>
<a name="@manual.kwd142"></a></p><p>A module type component of a signature can be specified either as a
manifest module type or as an abstract module type.</p><p>An abstract module type specification
<font color="blue"><tt>module</tt> <tt>type</tt></font> <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> allows the name <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> to be
implemented by any module type in a matching signature, but hides the
implementation of the module type to all users of the signature.</p><p>A manifest module type specification
<font color="blue"><tt>module</tt> <tt>type</tt></font> <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
requires the name <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> to be implemented by the module type
<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> in a matching signature, but makes the equality between
<i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> and <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> apparent to all users of the signature.</p><h4 class="subsubsection">Opening a module path</h4><p><a name="@manual.kwd143"></a></p><p>The expression <font color="blue"><tt>open</tt></font> <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> in a signature does not specify
any components. It simply affects the parsing of the following items
of the signature, allowing components of the module denoted by
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> to be referred to by their simple names <font color="maroon"><i>name</i></font> instead of
path accesses <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font>. The scope of the <tt>open</tt>
stops at the end of the signature expression.</p><h4 class="subsubsection">Including a signature</h4><p><a name="@manual.kwd144"></a></p><p>The expression <font color="blue"><tt>include</tt></font> <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> in a signature performs textual
inclusion of the components of the signature denoted by <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.
It behaves as if the components of the included signature were copied
at the location of the <font color="blue"><tt>include</tt></font>. The <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> argument must
refer to a module type that is a signature, not a functor type.</p><h3 class="subsection"><a name="toc63"></a><a name="htoc85">6.10.3</a>&nbsp;&nbsp;Functor types</h3><p><a name="@manual.kwd145"></a></p><p>The module type expression 
<font color="blue"><tt>functor</tt> <tt>(</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> &nbsp;<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>2</sub> 
is the type of functors (functions from modules to modules) that take
as argument a module of type <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> and return as result a
module of type <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>2</sub>. The module type <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>2</sub> can
use the name <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> to refer to type components of the actual
argument of the functor. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p><h3 class="subsection"><a name="toc64"></a><a name="htoc86">6.10.4</a>&nbsp;&nbsp;The <tt>with</tt> operator</h3><p><a name="@manual.kwd146"></a></p><p>Assuming <i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> denotes a signature, the expression
<i><a href="#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>with</tt></font> &nbsp;<i><a href="#mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i> { <font color="blue"><tt>and</tt></font> <i><a href="#mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i> } denotes
the same signature where type equations have been added to some of the
type specifications, as described by the constraints following the
<tt>with</tt> keyword. The constraint <font color="blue"><tt>type</tt></font> [<i><a href="manual017.html#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>] &nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
<font color="blue"><tt>=</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> adds the type equation <font color="blue"><tt>=</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> to the specification
of the type component named <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> of the constrained signature.
The constraint <font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual011.html#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i> adds
type equations to all type components of the sub-structure denoted by
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>, making them equivalent to the corresponding type
components of the structure denoted by <i><a href="manual011.html#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>.</p><p>For instance, if the module type name <tt>S</tt> is bound to the signature
</p><pre>        sig type t module M: (sig type u end) end
</pre><p>then <tt>S with type t=int</tt> denotes the signature
</p><pre>        sig type t=int module M: (sig type u end) end
</pre><p>and <tt>S with module M = N</tt> denotes the signature
</p><pre>        sig type t module M: (sig type u=N.u end) end
</pre><p>A functor taking two arguments of type <tt>S</tt> that share their <tt>t</tt> component
is written
</p><pre>        functor (A: S) (B: S with type t = A.t) ...
</pre><p>
Constraints are added left to right. After each constraint has been
applied, the resulting signature must be a subtype of the signature
before the constraint was applied. Thus, the <font color="blue"><tt>with</tt></font> operator can
only add information on the type components of a signature, but never
remove information.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>