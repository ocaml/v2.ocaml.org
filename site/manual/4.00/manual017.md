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




<h2 class="section"><a name="htoc76">6.9</a>&nbsp;&nbsp;Classes</h2><ul>
<li><a href="manual017.html#toc56">Class types</a>
</li><li><a href="manual017.html#toc57">Class expressions</a>
</li><li><a href="manual017.html#toc58">Class definitions</a>
</li><li><a href="manual017.html#toc59">Class specification</a>
</li><li><a href="manual017.html#toc60">Class type definitions</a>
</li></ul>
<p>Classes are defined using a small language, similar to the module
language.</p><h3 class="subsection"><a name="toc56"></a><a name="htoc77">6.9.1</a>&nbsp;&nbsp;Class types</h3><p>Class types are the class-level equivalent of type expressions: they
specify the general shape and type properties of classes.</p><p><a name="@manual.kwd59"></a>
<a name="@manual.kwd60"></a>
<a name="@manual.kwd61"></a>
<a name="@manual.kwd62"></a>
<a name="@manual.kwd63"></a>
<a name="@manual.kwd64"></a>
<a name="@manual.kwd65"></a>
<a name="@manual.kwd66"></a>
<a name="@manual.kwd67"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-type" class="syntax"><font color="maroon">class-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="#class-body-type" class="syntax"><font color="maroon">class-body-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;[[<font color="blue"><tt>?</tt></font>]<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i><font color="blue"><tt>:</tt></font>]&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-body-type" class="syntax"><font color="maroon">class-body-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>object</tt></font>&nbsp;[<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>]&nbsp;&nbsp;{<i><a href="#class-field-spec" class="syntax"><font color="maroon">class-field-spec</font></a></i>}&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>}&nbsp;<font color="blue"><tt>]</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-field-spec" class="syntax"><font color="maroon">class-field-spec</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>inherit</tt></font>&nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>val</tt></font>&nbsp;[<font color="blue"><tt>mutable</tt></font>]&nbsp;[<font color="blue"><tt>virtual</tt></font>]&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<font color="blue"><tt>virtual</tt></font>&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>constraint</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><h4 class="subsubsection">Simple class expressions</h4><p>The expression <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> is equivalent to the class type bound to
the name <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>. Similarly, the expression
<font color="blue"><tt>[</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> … &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i> <font color="blue"><tt>]</tt></font> &nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> is equivalent to
the parametric class type bound to the name <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>, in which
type parameters have been instantiated to respectively <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub>,
…<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>.</p><h4 class="subsubsection">Class function type</h4><p>The class type expression <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> is the type of
class functions (functions from values to classes) that take as
argument a value of type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> and return as result a class of
type <i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>.</p><h4 class="subsubsection">Class body type</h4><p>The class type expression
<font color="blue"><tt>object</tt></font> [<font color="blue"><tt>(</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>)</tt></font>] &nbsp;{<i><a href="#class-field-spec" class="syntax"><font color="maroon">class-field-spec</font></a></i>} <font color="blue"><tt>end</tt></font>
is the type of a class body. It specifies its instance variables and
methods. In this type, <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> is matched against the self type, therefore
providing a binding for the self type.</p><p>A class body will match a class body type if it provides definitions
for all the components specified in the class type, and these
definitions meet the type requirements given in the class type.
Furthermore, all methods either virtual or public present in the class
body must also be present in the class type (on the other hand, some
instance variables and concrete private methods may be omitted). A
virtual method will match a concrete method, which makes it possible
to forget its implementation. An immutable instance variable will match a
mutable instance variable.</p><h4 class="subsubsection">Inheritance</h4><p><a name="@manual.kwd68"></a></p><p>The inheritance construct <font color="blue"><tt>inherit</tt></font> <i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> provides for inclusion of
methods and instance variables from other class types.
The instance variable and method types from <i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> are added
into the current class type.</p><h4 class="subsubsection">Instance variable specification</h4><p><a name="@manual.kwd69"></a>
<a name="@manual.kwd70"></a>
<a name="@manual.kwd71"></a></p><p>A specification of an instance variable is written
<font color="blue"><tt>val</tt></font> [<font color="blue"><tt>mutable</tt></font>] [<font color="blue"><tt>virtual</tt></font>] <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>, where
<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>
is the name of the instance variable and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> its expected type.
The flag <font color="blue"><tt>mutable</tt></font> indicates whether this instance variable can be
physically modified.
The flag <font color="blue"><tt>virtual</tt></font> indicates that this instance variable is not
initialized. It can be initialized later through inheritance.</p><p>An instance variable specification will hide any previous
specification of an instance variable of the same name.</p><h4 class="subsubsection">Method specification</h4><p>
<a name="sec-methspec"></a></p><p><a name="@manual.kwd72"></a>
<a name="@manual.kwd73"></a></p><p>The specification of a method is written
<font color="blue"><tt>method</tt></font> [<font color="blue"><tt>private</tt></font>] <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>, where
<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> is the name of the method and <i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i> its
expected type, possibly polymorphic. The flag <font color="blue"><tt>private</tt></font> indicates
that the method cannot be accessed from outside the object.</p><p>The polymorphism may be left implicit in public method specifications:
any type variable which is not bound to a class parameter and does not
appear elsewhere inside the class specification will be assumed to be
universal, and made polymorphic in the resulting method type.
Writing an explicit polymorphic type will disable this behaviour.</p><p>Several specifications for the same method must have compatible types.
Any non-private specification of a method forces it to be public.</p><h4 class="subsubsection">Virtual method specification</h4><p><a name="@manual.kwd74"></a>
<a name="@manual.kwd75"></a>
<a name="@manual.kwd76"></a></p><p>Virtual method specification is written <font color="blue"><tt>method</tt></font> [<font color="blue"><tt>private</tt></font>]
<font color="blue"><tt>virtual</tt></font> <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>, where <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> is the
name of the method and <i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i> its expected type.</p><h4 class="subsubsection">Constraints on type parameters</h4><p><a name="@manual.kwd77"></a></p><p>The construct <font color="blue"><tt>constraint</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub> forces the two
type expressions to be equals. This is typically used to specify type
parameters: they can be that way be bound to a specified type
expression.</p><h3 class="subsection"><a name="toc57"></a><a name="htoc78">6.9.2</a>&nbsp;&nbsp;Class expressions</h3><p>Class expressions are the class-level equivalent of value expressions:
they evaluate to classes, thus providing implementations for the
specifications expressed in class types.</p><p><a name="@manual.kwd78"></a>
<a name="@manual.kwd79"></a>
<a name="@manual.kwd80"></a>
<a name="@manual.kwd81"></a>
<a name="@manual.kwd82"></a>
<a name="@manual.kwd83"></a>
<a name="@manual.kwd84"></a>
<a name="@manual.kwd85"></a>
<a name="@manual.kwd86"></a>
<a name="@manual.kwd87"></a>
<a name="@manual.kwd88"></a>
<a name="@manual.kwd89"></a>
<a name="@manual.kwd90"></a>
<a name="@manual.kwd91"></a>
<a name="@manual.kwd92"></a>
<a name="@manual.kwd93"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-expr" class="syntax"><font color="maroon">class-expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>}&nbsp;<font color="blue"><tt>]</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>&nbsp;&nbsp;{<i><a href="expr.html#argument" class="syntax"><font color="maroon">argument</font></a></i>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>fun</tt></font>&nbsp;{<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i>}<sup>+</sup>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>let</tt></font>&nbsp;[<font color="blue"><tt>rec</tt></font>]&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;&nbsp;{<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>}&nbsp;<font color="blue"><tt>in</tt></font>&nbsp;&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>object</tt></font>&nbsp;<i><a href="#class-body" class="syntax"><font color="maroon">class-body</font></a></i>&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-field" class="syntax"><font color="maroon">class-field</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>inherit</tt></font>&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>as</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>val</tt></font>&nbsp;[<font color="blue"><tt>mutable</tt></font>]&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>val</tt></font>&nbsp;[<font color="blue"><tt>mutable</tt></font>]&nbsp;<font color="blue"><tt>virtual</tt></font>&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;&nbsp;{<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i>}&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<font color="blue"><tt>virtual</tt></font>&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>constraint</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>initializer</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><h4 class="subsubsection">Simple class expressions</h4><p>The expression <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> evaluates to the class bound to the name
<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>. Similarly, the expression
<font color="blue"><tt>[</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> … &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i> <font color="blue"><tt>]</tt></font> &nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
evaluates to the parametric class bound to the name <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>,
in which type parameters have been instantiated to respectively
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub>, …<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> <font color="blue"><tt>)</tt></font> evaluates to the same module as
<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> <font color="blue"><tt>)</tt></font> checks that
<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> match the type of <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> (that is, that the
implementation <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> meets the type specification
<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>). The whole expression evaluates to the same class as
<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>, except that all components not specified in
<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i> are hidden and can no longer be accessed.</p><h4 class="subsubsection">Class application</h4><p>Class application is denoted by juxtaposition of (possibly labeled)
expressions. It denotes the class whose constructor is the original
constructor applied to the given arguments. The arguments are
evaluated like for expression application, but the constructor itself will
only be evaluated when objects are created. In particular, side-effects
caused by the application of the constructor will only occur at object
creation time.</p><h4 class="subsubsection">Class function</h4><p>The expression <font color="blue"><tt>fun</tt></font> [[<font color="blue"><tt>?</tt></font>]<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i><font color="blue"><tt>:</tt></font>]&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> evaluates
to a function from values to classes.
When this function is applied to a value <i>v</i>, this value is
matched against the pattern <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> and the result is the result of
the evaluation of <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> in the extended environment.</p><p>Conversion from functions with default values to functions with
patterns only works identically for class functions as for normal
functions.</p><p>The expression
</p><div class="center">
<font color="blue"><tt>fun</tt></font> <i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> … &nbsp;<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>
</div><p>
is a short form for
</p><div class="center">
<font color="blue"><tt>fun</tt></font> <i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> … <font color="blue"><tt>fun</tt></font> &nbsp;<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><h4 class="subsubsection">Local definitions</h4><p>The <tt>let</tt> and <tt>let rec</tt> constructs bind value names locally,
as for the core language expressions.</p><p>If a local definition occurs at the very beginning of a class
definition, it will be evaluated when the class is created (just as if
the definition was outside of the class).
Otherwise, it will be evaluated when the object constructor is called.</p><h4 class="subsubsection">Class<a name="ss:class-body"></a> body</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-body" class="syntax"><font color="maroon">class-body</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;&nbsp;[<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>)</tt></font>]&nbsp;&nbsp;{&nbsp;<i><a href="#class-field" class="syntax"><font color="maroon">class-field</font></a></i>&nbsp;}</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
The expression
<font color="blue"><tt>object</tt></font> <i><a href="#class-body" class="syntax"><font color="maroon">class-body</font></a></i> <font color="blue"><tt>end</tt></font> denotes
a class body. This is the prototype for an object : it lists the
instance variables and methods of an objet of this class.</p><p>A class body is a class value: it is not evaluated at once. Rather,
its components are evaluated each time an object is created.</p><p>In a class body, the pattern <font color="blue"><tt>(</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> &nbsp;[<font color="blue"><tt>:</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>] <font color="blue"><tt>)</tt></font> is
matched against self, therefore provinding a binding for self and self
type. Self can only be used in method and initializers.</p><p>Self type cannot be a closed object type, so that the class remains
extensible.</p><h4 class="subsubsection">Inheritance</h4><p><a name="@manual.kwd94"></a></p><p>The inheritance construct <font color="blue"><tt>inherit</tt></font> <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> allows reusing
methods and instance variables from other classes. The class
expression <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> must evaluate to a class body. The instance
variables, methods and initializers from this class body are added
into the current class. The addition of a method will override any
previously defined methods of the same name.</p><p><a name="@manual.kwd95"></a>
An ancestor can be bound by prepending the construct <font color="blue"><tt>as</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>
to the inheritance construct above. <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> is not a true
variable and can only be used to select a method, i.e. in an expression
<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>#</tt></font> &nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>. This gives access to the
method <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> as it was defined in the parent class even if it is
redefined in the current class.
The scope of an ancestor binding is limited to the current class.
The ancestor method may be called from a subclass but only indirectly. </p><h4 class="subsubsection">Instance variable definition</h4><p><a name="@manual.kwd96"></a>
<a name="@manual.kwd97"></a></p><p>The definition <font color="blue"><tt>val</tt></font> [<font color="blue"><tt>mutable</tt></font>] <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> adds an
instance variable <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> whose initial value is the value of
expression <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>.
The flag <font color="blue"><tt>mutable</tt></font> allows physical modification of this variable by
methods.</p><p>An instance variables can only be used in the following methods and
initializers of the class.</p><p>Since version 3.10, redefinitions of a visible instance variable with
the same name do not create a new variable, but are merged, using the
last value for initialization. They must have identical types and
mutability.
However, if an instance variable is hidden by
omitting it from an interface, it will be kept distinct from
other instance variables with the same name.</p><h4 class="subsubsection">Virtual instance variable definition</h4><p><a name="@manual.kwd98"></a>
<a name="@manual.kwd99"></a>
<a name="@manual.kwd100"></a></p><p>Variable specification is written <font color="blue"><tt>val</tt></font> [<font color="blue"><tt>mutable</tt></font>] <font color="blue"><tt>virtual</tt></font>
<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>. It specifies whether the variable is
modifiable, and gives its type.</p><p>Virtual instance variables were added in version 3.10.</p><h4 class="subsubsection">Method definition</h4><p><a name="@manual.kwd101"></a>
<a name="@manual.kwd102"></a></p><p>Method definition is written <font color="blue"><tt>method</tt></font> <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. The
definition of a method overrides any previous definition of this
method. The method will be public (that is, not private) if any of
the definition states so.</p><p>A private method, <font color="blue"><tt>method</tt> <tt>private</tt></font> <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>, is a
method that can only be invoked on self (from other methods of the
same object, defined in this class or one of its subclasses). This
invocation is performed using the expression
<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>#</tt></font> &nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>, where <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> is directly bound to
self at the beginning of the class definition. Private methods do
not appear in object types. A method may have both public and private
definitions, but as soon as there is a public one, all subsequent
definitions will be made public.</p><p>Methods may have an explicitly polymorphic type, allowing them to be
used polymorphically in programs (even for the same object). The
explicit declaration may be done in one of three ways: (1) by giving an
explicit polymorphic type in the method definition, immediately after
the method name, <em>i.e.</em>
<font color="blue"><tt>method</tt></font> [<font color="blue"><tt>private</tt></font>] <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;{<font color="blue"><tt>'</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>}<sup>+</sup> <font color="blue"><tt>.</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>=</tt></font>
&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>; (2) by a forward declaration of the explicit polymorphic type
through a virtual method definition; (3) by importing such a
declaration through inheritance and/or constraining the type of <em>self</em>.</p><p>Some special expressions are available in method bodies for
manipulating instance variables and duplicating self:
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
…
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>&lt;-</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{&lt;</tt></font>&nbsp;[&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;]&nbsp;<font color="blue"><tt>&gt;}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The expression <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>&lt;-</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> modifies in-place the current
object by replacing the value associated to <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> by the
value of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. Of course, this instance variable must have been
declared mutable.</p><p>The expression
<font color="blue"><tt>{&lt;</tt></font> [ <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> &nbsp;{ <font color="blue"><tt>;</tt></font> <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> } ] <font color="blue"><tt>&gt;}</tt></font>
evaluates to a copy of the current object in which the values of
instance variables <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i><sub>1</sub>, …, &nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a><sub>n</sub></i> have
been replaced by the values of the corresponding expressions <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>,
…, &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>.</p><h4 class="subsubsection">Virtual method definition</h4><p><a name="@manual.kwd103"></a>
<a name="@manual.kwd104"></a>
<a name="@manual.kwd105"></a></p><p>Method specification is written <font color="blue"><tt>method</tt></font> [<font color="blue"><tt>private</tt></font>] <font color="blue"><tt>virtual</tt></font>
<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>. It specifies whether the method is
public or private, and gives its type. If the method is intended to be
polymorphic, the type should be explicit.</p><h4 class="subsubsection">Constraints on type parameters</h4><p><a name="@manual.kwd106"></a></p><p>The construct <font color="blue"><tt>constraint</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub> forces the two
type expressions to be equals. This is typically used to specify type
parameters: they can be that way be bound to a specified type
expression.</p><h4 class="subsubsection">Initializers</h4><p><a name="@manual.kwd107"></a></p><p>A class initializer <font color="blue"><tt>initializer</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> specifies an expression that
will be evaluated when an object will be created from the class, once
all the instance variables have been initialized.</p><h3 class="subsection"><a name="toc58"></a><a name="htoc79">6.9.3</a>&nbsp;&nbsp;Class definitions</h3><p>
<a name="s:classdef"></a></p><p><a name="@manual.kwd108"></a>
<a name="@manual.kwd109"></a>
<a name="@manual.kwd110"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-definition" class="syntax"><font color="maroon">class-definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>class</tt></font>&nbsp;<i><a href="#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-binding" class="syntax"><font color="maroon">class-binding</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<font color="blue"><tt>virtual</tt></font>]&nbsp;[<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>&nbsp;<font color="blue"><tt>]</tt></font>]&nbsp;&nbsp;<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i>
&nbsp;{<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i>}&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>]&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>,</tt></font>&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A class definition <font color="blue"><tt>class</tt></font> <i><a href="#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> } is
recursive. Each <i><a href="#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> defines a <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> that can be
used in the whole expression except for inheritance. It can also be
used for inheritance, but only in the definitions that follow its own.</p><p>A class binding binds the class name <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> to the value of
expression <i><a href="#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>. It also binds the class type <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> to
the type of the class, and defines two type abbreviations :
<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> and <font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i>. The first one is the type of
objects of this class, while the second is more general as it unifies
with the type of any object belonging to a subclass (see
section&nbsp;<a href="types.html#s:sharp-types">6.4</a>).</p><h4 class="subsubsection">Virtual class</h4><p><a name="@manual.kwd111"></a>
A class must be flagged virtual if one of its methods is virtual (that
is, appears in the class type, but is not actually defined).
Objects cannot be created from a virtual class.</p><h4 class="subsubsection">Type parameters</h4><p>The class type parameters correspond to the ones of the class type and
of the two type abbreviations defined by the class binding. They must
be bound to actual types in the class definition using type
constraints. So that the abbreviations are well-formed, type
variables of the inferred type of the class must either be type
parameters or be bound in the constraint clause.</p><h3 class="subsection"><a name="toc59"></a><a name="htoc80">6.9.4</a>&nbsp;&nbsp;Class specification</h3><p>
<a name="s:class-spec"></a></p><p><a name="@manual.kwd112"></a>
<a name="@manual.kwd113"></a>
<a name="@manual.kwd114"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="class-specification" class="syntax"><font color="maroon">class-specification</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>class</tt></font>&nbsp;<i><a href="#class-spec" class="syntax"><font color="maroon">class-spec</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#class-spec" class="syntax"><font color="maroon">class-spec</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-spec" class="syntax"><font color="maroon">class-spec</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<font color="blue"><tt>virtual</tt></font>]&nbsp;[<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>&nbsp;<font color="blue"><tt>]</tt></font>]&nbsp;&nbsp;<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>
&nbsp;<i><a href="#class-type" class="syntax"><font color="maroon">class-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>This is the counterpart in signatures of class definitions.
A class specification matches a class definition if they have the same
type parameters and their types match.</p><h3 class="subsection"><a name="toc60"></a><a name="htoc81">6.9.5</a>&nbsp;&nbsp;Class type definitions</h3><p>
<a name="s:classtype"></a></p><p><a name="@manual.kwd115"></a>
<a name="@manual.kwd116"></a>
<a name="@manual.kwd117"></a>
<a name="@manual.kwd118"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="classtype-definition" class="syntax"><font color="maroon">classtype-definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>class</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i>
&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<font color="blue"><tt>virtual</tt></font>]&nbsp;[<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>&nbsp;<font color="blue"><tt>]</tt></font>]&nbsp;&nbsp;<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#class-body-type" class="syntax"><font color="maroon">class-body-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A class type definition <font color="blue"><tt>class</tt></font> <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#class-body-type" class="syntax"><font color="maroon">class-body-type</font></a></i>
defines an abbreviation <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> for the class body type
<i><a href="#class-body-type" class="syntax"><font color="maroon">class-body-type</font></a></i>. As for class definitions, two type abbreviations
<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> and <font color="blue"><tt>#</tt></font> <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> are also defined. The definition can
be parameterized by some type parameters. If any method in the class
type body is virtual, the definition must be flagged <font color="blue"><tt>virtual</tt></font>.</p><p>Two class type definitions match if they have the same type parameters
and the types they expand to match.

</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>