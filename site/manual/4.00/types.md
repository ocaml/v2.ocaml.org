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




<h2 class="section"><a name="htoc63">6.4</a>&nbsp;&nbsp;Type expressions</h2><p>
<a name="@manual.kwd2"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="typexpr" class="syntax"><font color="maroon">typexpr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>_</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;[[<font color="blue"><tt>?</tt></font>]<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i><font color="blue"><tt>:</tt></font>]&nbsp;&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>as</tt></font>&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#polymorphic-variant-type" class="syntax"><font color="maroon">polymorphic-variant-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>&lt;</tt></font>&nbsp;[<font color="blue"><tt>..</tt></font>]&nbsp;<font color="blue"><tt>&gt;</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>&lt;</tt></font>&nbsp;<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>&nbsp;<font color="blue"><tt>..</tt></font>]&nbsp;<font color="blue"><tt>&gt;</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}&nbsp;)&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;{&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;}<sup>+</sup>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="method-type" class="syntax"><font color="maroon">method-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed type constructions. The constructions with
higher precedences come first.
<a name="@manual.kwd3"></a>
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Operator</b></td><td align="center" nowrap=""><b>Associativity</b></td></tr>
<tr><td align="left" nowrap="">
Type constructor application</td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>*</tt></td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>-&gt;</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>as</tt></td><td align="left" nowrap="">–</td></tr>
</tbody></table></div><p>Type expressions denote types in definitions of data types as well as
in type constraints over patterns and expressions.</p><h4 class="subsubsection">Type variables</h4><p>The type expression <font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> stands for the type variable named
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>. The type expression <font color="blue"><tt>_</tt></font> stands for an anonymous type variable.
In data type definitions, type variables are names for the
data type parameters. In type constraints, they represent unspecified
types that can be instantiated by any type to satisfy the type
constraint. In general the scope of a named type variable is the
whole top-level phrase where it appears, and it can only be
generalized when leaving
this scope. Anonymous variables have no such restriction.
In the following cases, the scope of named type variables is
restricted to the type expression where they appear: 1) for universal
(explicitly polymorphic) type variables; 2) for type variables that
only appear in public method specifications (as those variables will
be made universal, as described in section&nbsp;<a href="manual017.html#sec-methspec">6.9.1</a>);
3) for variables used as aliases, when the type they are aliased to
would be invalid in the scope of the enclosing definition (<i>i.e.</i>
when it contains free universal type variables, or locally
defined types.)</p><h4 class="subsubsection">Parenthesized types</h4><p>The type expression <font color="blue"><tt>(</tt></font> <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>)</tt></font> denotes the same type as
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.</p><h4 class="subsubsection">Function types</h4><p>The type expression <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub> denotes the type of
functions mapping arguments of type <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> to results of type
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>.</p><p><i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub> denotes the same function type, but
the argument is labeled <i><a href="lex.html#label" class="syntax"><font color="maroon">label</font></a></i>.</p><p><font color="blue"><tt>?</tt></font> <i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub> denotes the type of functions
mapping an optional labeled argument of type <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> to results of
type <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>. That is, the physical type of the function will be
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>option</tt> <tt>-&gt;</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>.</p><h4 class="subsubsection">Tuple types</h4><p>The type expression <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>*</tt></font> … <font color="blue"><tt>*</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>
denotes the type of tuples whose elements belong to types <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub>,
… &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i> respectively.</p><h4 class="subsubsection">Constructed types</h4><p>Type constructors with no parameter, as in <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>, are type
expressions.</p><p>The type expression <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> &nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>, where <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> is a type
constructor with one parameter, denotes the application of the unary type
constructor <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> to the type <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.</p><p>The type expression (<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub>,…,&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>) &nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>, where
<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> is a type constructor with <i>n</i> parameters, denotes the
application of the <i>n</i>-ary type constructor <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> to the types
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> through <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>.</p><h4 class="subsubsection">Aliased and recursive types</h4><p><a name="@manual.kwd4"></a></p><p>The type expression <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>as</tt> <tt>'</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> denotes the same type as
<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>, and also binds the type variable <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> to type <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> both
in <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> and in other types. In general the scope of an alias is
the same as for a named type variable, and covers the whole enclosing
definition. If the type variable
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> actually occurs in <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>, a recursive type is created. Recursive
types for which there exists a recursive path that does not contain
an object or polymorphic variant type constructor are rejected, except
when the <tt>-rectypes</tt> mode is selected.</p><p>If <font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> denotes an explicit polymorphic variable, and <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
denotes either an object or polymorphic variant type, the row variable
of <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> is captured by <font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>, and quantified upon.</p><h4 class="subsubsection">Polymorphic variant types</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="polymorphic-variant-type" class="syntax"><font color="maroon">polymorphic-variant-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>[</tt></font>&nbsp;[&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;]&nbsp;<i><a href="#tag-spec" class="syntax"><font color="maroon">tag-spec</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="#tag-spec" class="syntax"><font color="maroon">tag-spec</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[&gt;</tt></font>&nbsp;[&nbsp;<i><a href="#tag-spec" class="syntax"><font color="maroon">tag-spec</font></a></i>&nbsp;]&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="#tag-spec" class="syntax"><font color="maroon">tag-spec</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[&lt;</tt></font>&nbsp;[&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;]&nbsp;<i><a href="#tag-spec-full" class="syntax"><font color="maroon">tag-spec-full</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="#tag-spec-full" class="syntax"><font color="maroon">tag-spec-full</font></a></i>&nbsp;}&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>&gt;</tt></font>&nbsp;{&nbsp;<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>&nbsp;}<sup>+</sup>&nbsp;]&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="tag-spec" class="syntax"><font color="maroon">tag-spec</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>of</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="tag-spec-full" class="syntax"><font color="maroon">tag-spec-full</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>of</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;]&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>&amp;</tt></font>&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Polymorphic variant types describe the values a polymorphic variant
may take.</p><p>The first case is an exact variant type: all possible tags are
known, with their associated types, and they can all be present.
Its structure is fully known.</p><p>The second case is an open variant type, describing a polymorphic
variant value: it gives the list of all tags the value could take,
with their associated types. This type is still compatible with a
variant type containing more tags. A special case is the unknown
type, which does not define any tag, and is compatible with any
variant type.</p><p>The third case is a closed variant type. It gives information about
all the possible tags and their associated types, and which tags are
known to potentially appear in values. The exact variant type (first
case) is
just an abbreviation for a closed variant type where all possible tags
are also potentially present.</p><p>In all three cases, tags may be either specified directly in the
<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i> &nbsp;[<font color="blue"><tt>of</tt></font> <i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>] form, or indirectly through a type
expression. In this last case, the type expression must expand to an
exact variant type, whose tag specifications are inserted in its
place.</p><p>Full specifications of variant tags are only used for non-exact closed
types. They can be understood as a conjunctive type for the argument:
it is intended to have all the types enumerated in the
specification.</p><p>Such conjunctive constraints may be unsatisfiable. In such a case the
corresponding tag may not be used in a value of this type. This
does not mean that the whole type is not valid: one can still use
other available tags.</p><h4 class="subsubsection">Object types</h4><p>An object type
<font color="blue"><tt>&lt;</tt></font> [<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i> &nbsp;{ <font color="blue"><tt>;</tt></font> <i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i> }] <font color="blue"><tt>&gt;</tt></font>
is a record of method types.</p><p>Each method may have an explicit polymorphic type: { <font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> }<sup>+</sup>
<font color="blue"><tt>.</tt></font> &nbsp;<i><a href="#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>. Explicit polymorphic variables have a local scope, and
an explicit polymorphic type can only be unified to an
equivalent one, where only the order and names of polymorphic
variables may change.</p><p>The type <font color="blue"><tt>&lt;</tt></font> {<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i> <font color="blue"><tt>;</tt></font>} <font color="blue"><tt>..</tt> <tt>&gt;</tt></font> is the
type of an object whose method names and types are described by
<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a></i><sub>1</sub>, …, &nbsp;<i><a href="#method-type" class="syntax"><font color="maroon">method-type</font></a><sub>n</sub></i>, and possibly some other
methods represented by the ellipsis. This ellipsis actually is
a special kind of type variable (called <em>row variable</em> in the
literature) that stands for any number of extra method types.</p><h4 class="subsubsection">#-types</h4><p>
<a name="s:sharp-types"></a></p><p>The type <font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> is a special kind of abbreviation. This
abbreviation unifies with the type of any object belonging to a subclass
of class <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>.
It is handled in a special way as it usually hides a type variable (an
ellipsis, representing the methods that may be added in a subclass).
In particular, it vanishes when the ellipsis gets instantiated.
Each type expression <font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> defines a new type variable, so
type <font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> <font color="blue"><tt>-&gt;</tt> <tt>#</tt></font> &nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> is usually not the same as
type (<font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> <font color="blue"><tt>as</tt> <tt>'</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>) <font color="blue"><tt>-&gt;</tt> <tt>'</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>.
</p><p>Use of #-types to abbreviate polymorphic variant types is deprecated.
If <tt>t</tt> is an exact variant type then <tt>#t</tt> translates to <tt>[&lt; t]</tt>,
and <font color="blue"><tt>#t[&gt;</tt> <tt>`tag</tt></font><sub>1</sub> …<font color="blue"><tt>`tag</tt></font><i><sub>k</sub></i><font color="blue"><tt>]</tt></font> translates to
<font color="blue"><tt>[&lt;</tt> <tt>t</tt> <tt>&gt;</tt> <tt>`tag</tt></font><sub>1</sub> …<font color="blue"><tt>`tag</tt></font><i><sub>k</sub></i><font color="blue"><tt>]</tt></font></p><h4 class="subsubsection">Variant and record types</h4><p>There are no type expressions describing (defined) variant types nor
record types, since those are always named, i.e. defined before use
and referred to by name. Type definitions are described in
section&nbsp;<a href="manual016.html#s:type-defs">6.8.1</a>.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>