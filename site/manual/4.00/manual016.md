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




<h2 class="section"><a name="htoc73">6.8</a>&nbsp;&nbsp;Type and exception definitions</h2><ul>
<li><a href="manual016.html#toc54">Type definitions</a>
</li><li><a href="manual016.html#toc55">Exception definitions</a>
</li></ul>
<h3 class="subsection"><a name="toc54"></a><a name="htoc74">6.8.1</a>&nbsp;&nbsp;Type definitions</h3><p>
<a name="s:type-defs"></a></p><p>Type definitions bind type constructors to data types: either
variant types, record types, type abbreviations, or abstract data
types. They also bind the value constructors and record fields
associated with the definition.</p><p><a name="@manual.kwd53"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="type-definition" class="syntax"><font color="maroon">type-definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="#typedef" class="syntax"><font color="maroon">typedef</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#typedef" class="syntax"><font color="maroon">typedef</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="typedef" class="syntax"><font color="maroon">typedef</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<i><a href="#type-params" class="syntax"><font color="maroon">type-params</font></a></i>]&nbsp;&nbsp;<i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>&nbsp;&nbsp;[<i><a href="#type-information" class="syntax"><font color="maroon">type-information</font></a></i>]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-information" class="syntax"><font color="maroon">type-information</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<i><a href="#type-equation" class="syntax"><font color="maroon">type-equation</font></a></i>]&nbsp;&nbsp;[<i><a href="#type-representation" class="syntax"><font color="maroon">type-representation</font></a></i>]&nbsp;&nbsp;{&nbsp;<i><a href="#type-constraint" class="syntax"><font color="maroon">type-constraint</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-equation" class="syntax"><font color="maroon">type-equation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-representation" class="syntax"><font color="maroon">type-representation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-params" class="syntax"><font color="maroon">type-params</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="#type-param" class="syntax"><font color="maroon">type-param</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#type-param" class="syntax"><font color="maroon">type-param</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="#type-param" class="syntax"><font color="maroon">type-param</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-param" class="syntax"><font color="maroon">type-param</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<i><a href="#variance" class="syntax"><font color="maroon">variance</font></a></i>]&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="variance" class="syntax"><font color="maroon">variance</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>+</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>-</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>&nbsp;<font color="blue"><tt>of</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="field-decl" class="syntax"><font color="maroon">field-decl</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#field-name" class="syntax"><font color="maroon">field-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>mutable</tt></font>&nbsp;<i><a href="manual011.html#field-name" class="syntax"><font color="maroon">field-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-constraint" class="syntax"><font color="maroon">type-constraint</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>constraint</tt></font>&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
<a name="@manual.kwd54"></a>
<a name="@manual.kwd55"></a></p><p>Type definitions are introduced by the <tt>type</tt> keyword, and
consist in one or several simple definitions, possibly mutually
recursive, separated by the <tt>and</tt> keyword. Each simple definition
defines one type constructor.</p><p>A simple definition consists in a lowercase identifier, possibly
preceded by one or several type parameters, and followed by an
optional type equation, then an optional type representation, and then
a constraint clause. The identifier is the name of the type
constructor being defined.</p><p>The optional type parameters are either one type variable <font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>,
for type constructors with one parameter, or a list of type variables
(<font color="blue"><tt>'</tt></font><i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i><sub>1</sub>,…,<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a><sub>n</sub></i>), for type constructors with several
parameters. Each type parameter may be prefixed by a variance
constraint <font color="blue"><tt>+</tt></font> (resp. <font color="blue"><tt>-</tt></font>) indicating that the parameter is
covariant (resp. contravariant). These type parameters can appear in
the type expressions of the right-hand side of the definition,
restricted eventually by a variance constraint ; <em>i.e.</em> a
covariant parameter may only appear on the right side of a functional
arrow (more precisely, follow the left branch of an even number of
arrows), and a contravariant parameter only the left side (left branch of
an odd number of arrows). If the type has either a representation or
an equation, and the parameter is free (<em>i.e.</em> not bound via a
type constraint to a constructed type), its variance constraint is
checked but subtyping <em>etc.</em> will use the inferred variance of the
parameter, which may be better; otherwise (<em>i.e.</em> for abstract
types or non-free parameters), the variance must be given explicitly,
and the parameter is invariant if no variance was given.</p><p>The optional type equation <font color="blue"><tt>=</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> makes the defined type
equivalent to the type expression <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> on the right of the <font color="blue"><tt>=</tt></font>
sign: one can be substituted for the other during typing.
If no type equation is given, a new type is generated: the defined type
is incompatible with any other type.</p><p>The optional type representation describes the data structure
representing the defined type, by giving the list of associated
constructors (if it is a variant type) or associated fields (if it is
a record type). If no type representation is given, nothing is
assumed on the structure of the type besides what is stated in the
optional type equation.</p><p>The type representation <font color="blue"><tt>=</tt></font> <i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i> &nbsp;{ <font color="blue"><tt>|</tt></font> <i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i> }
describes a variant type. The constructor declarations
<i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i><sub>1</sub>, …, &nbsp;<i><a href="#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a><sub>n</sub></i> describe the constructors
associated to this variant type. The constructor
declaration <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> <font color="blue"><tt>of</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>*</tt></font> … <font color="blue"><tt>*</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>
declares the name <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> as a non-constant constructor, whose
arguments have types <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> …<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>.
The constructor declaration <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>
declares the name <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> as a constant
constructor. Constructor names must be capitalized.</p><p>The type representation <font color="blue"><tt>=</tt> <tt>{</tt></font> <i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i> &nbsp;{ <font color="blue"><tt>;</tt></font> <i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i> } <font color="blue"><tt>}</tt></font>
describes a record type. The field declarations <i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i><sub>1</sub>, …,
&nbsp;<i><a href="#field-decl" class="syntax"><font color="maroon">field-decl</font></a><sub>n</sub></i> describe the fields associated to this record type.
The field declaration <i><a href="manual011.html#field-name" class="syntax"><font color="maroon">field-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i> declares
<i><a href="manual011.html#field-name" class="syntax"><font color="maroon">field-name</font></a></i> as a field whose argument has type <i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>.
The field declaration <font color="blue"><tt>mutable</tt></font> <i><a href="manual011.html#field-name" class="syntax"><font color="maroon">field-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
<a name="@manual.kwd56"></a>
behaves similarly; in addition, it allows physical modification over
the argument to this field.
Immutable fields are covariant, but mutable fields are neither
covariant nor contravariant.
Both mutable and immutable field may have an explicitly polymorphic
type. The polymorphism of the contents is statically checked whenever
a record value is created or modified. Extracted values may have their
types instanciated.</p><p>The two components of a type definition, the optional equation and the
optional representation, can be combined independently, giving
rise to four typical situations:</p><dl class="description"><dt class="dt-description">
<b>Abstract type: no equation, no representation.</b></dt><dd class="dd-description"> &nbsp;<br>
When appearing in a module signature, this definition specifies
nothing on the type constructor, besides its number of parameters: 
its representation is hidden and it is assumed incompatible with any
other type.</dd><dt class="dt-description"><b>Type abbreviation: an equation, no representation.</b></dt><dd class="dd-description"> &nbsp;<br>
This defines the type constructor as an abbreviation for the type
expression on the right of the <font color="blue"><tt>=</tt></font> sign. </dd><dt class="dt-description"><b>New variant type or record type: no equation, a representation.</b></dt><dd class="dd-description"> &nbsp;<br>
This generates a new type constructor and defines associated
constructors or fields, through which values of that type can be
directly built or inspected.</dd><dt class="dt-description"><b>Re-exported variant type or record type: an equation,
a representation.</b></dt><dd class="dd-description"> &nbsp;<br>
In this case, the type constructor is defined as an abbreviation for
the type expression given in the equation, but in addition the
constructors or fields given in the representation remain attached to
the defined type constructor. The type expression in the equation part
must agree with the representation: it must be of the same kind
(record or variant) and have exactly the same constructors or fields,
in the same order, with the same arguments. 
</dd></dl><p>The type variables appearing as type parameters can optionally be
prefixed by <tt>+</tt> or <tt>-</tt> to indicate that the type constructor is
covariant or contravariant with respect to this parameter. This
variance information is used to decide subtyping relations when
checking the validity of <font color="blue"><tt>:&gt;</tt></font> coercions (see section <a href="expr.html#s:coercions">6.7.6</a>).</p><p>For instance, <tt>type +'a t</tt> declares <tt>t</tt> as an abstract type that is
covariant in its parameter; this means that if the type τ is a
subtype of the type σ, then τ <i><tt> t</tt></i> is a subtype of σ
<i><tt> t</tt></i>. Similarly, <tt>type -'a t</tt> declares that the abstract type <tt>t</tt> is
contravariant in its parameter: if τ is subtype of σ, then
σ <i><tt> t</tt></i> is subtype of τ <i><tt> t</tt></i>. If no <tt>+</tt> or <tt>-</tt> variance
annotation is given, the type constructor is assumed invariant in the
corresponding parameter. For instance, the abstract type declaration
<tt>type 'a t</tt> means that τ <i><tt> t</tt></i> is neither a subtype nor a
supertype of σ <i><tt> t</tt></i> if τ is subtype of σ.</p><p>The variance indicated by the <tt>+</tt> and <tt>-</tt> annotations on parameters
are required only for abstract types. For abbreviations, variant
types or record types, the variance properties of the type constructor
are inferred from its definition, and the variance annotations are
only checked for conformance with the definition.</p><p><a name="@manual.kwd57"></a>
The construct  <font color="blue"><tt>constraint</tt> <tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>  allows the
specification of
type parameters. Any actual type argument corresponding to the type
parameter <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> has to be an instance of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> (more precisely,
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> are unified). Type variables of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> can
appear in the type equation and the type declaration.</p><h3 class="subsection"><a name="toc55"></a><a name="htoc75">6.8.2</a>&nbsp;&nbsp;Exception definitions</h3><p> <a name="s:excdef"></a>
<a name="@manual.kwd58"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="exception-definition" class="syntax"><font color="maroon">exception-definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>exception</tt></font>&nbsp;<i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>of</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>exception</tt></font>&nbsp;<i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>Exception definitions add new constructors to the built-in variant
type <code>exn</code> of exception values. The constructors are declared as
for a definition of a variant type.</p><p>The form <font color="blue"><tt>exception</tt></font> <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> &nbsp;[<font color="blue"><tt>of</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> &nbsp;{ <font color="blue"><tt>*</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> }]
generates a new exception, distinct from all other exceptions in the system.
The form <font color="blue"><tt>exception</tt></font> <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>
gives an alternate name to an existing exception.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>