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




<h2 class="section"><a name="htoc65">6.6</a>&nbsp;&nbsp;Patterns</h2><p>

<a name="@manual.kwd5"></a>
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="pattern" class="syntax"><font color="maroon">pattern</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>_</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual013.html#constant" class="syntax"><font color="maroon">constant</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>as</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>#</tt></font><i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;}&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;]&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;}&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;]&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>::</tt></font>&nbsp;&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[|</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;}&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;]&nbsp;<font color="blue"><tt>|]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>lazy</tt></font>&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed pattern constructions. The constructions with
higher precedences come first.
<a name="@manual.kwd6"></a>
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Operator</b></td><td align="center" nowrap=""><b>Associativity</b></td></tr>
<tr><td align="left" nowrap="">
Constructor application</td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>::</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>,</tt></td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>|</tt></td><td align="left" nowrap="">left</td></tr>
<tr><td align="left" nowrap=""><tt>as</tt></td><td align="left" nowrap="">–</td></tr>
</tbody></table></div><p>Patterns are templates that allow selecting data structures of a
given shape, and binding identifiers to components of the data
structure. This selection operation is called pattern matching; its
outcome is either “this value does not match this pattern”, or
“this value matches this pattern, resulting in the following bindings
of names to values”.</p><h4 class="subsubsection">Variable patterns</h4><p>A pattern that consists in a value name matches any value,
binding the name to the value. The pattern <font color="blue"><tt>_</tt></font> also matches
any value, but does not bind any name.</p><p>Patterns are <em>linear</em>: a variable cannot be bound several times by
a given pattern. In particular, there is no way to test for equality
between two parts of a data structure using only a pattern (but
<font color="blue"><tt>when</tt></font> guards can be used for this purpose).</p><h4 class="subsubsection">Constant patterns</h4><p>A pattern consisting in a constant matches the values that
are equal to this constant.</p><h4 class="subsubsection">Alias patterns</h4><p>
<a name="@manual.kwd7"></a></p><p>The pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>as</tt></font> &nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> matches the same values as
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>. If the matching against <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> is successful,
the name <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> is bound to the matched value, in addition to the
bindings performed by the matching against <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>.</p><h4 class="subsubsection">Parenthesized patterns</h4><p>The pattern <font color="blue"><tt>(</tt></font> <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt></font> matches the same values as
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>. A type constraint can appear in a
parenthesized pattern, as in <font color="blue"><tt>(</tt></font> <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>)</tt></font>. This
constraint forces the type of <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> to be compatible with
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.</p><h4 class="subsubsection">“Or” patterns</h4><p>The pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>|</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub> represents the logical “or” of
the two patterns <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> and <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub>. A value matches
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>|</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub> if it matches <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> or
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub>. The two sub-patterns <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> and <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub>
must bind exactly the same identifiers to values having the same types.
Matching is performed from left to right.
More precisely,
in case some value&nbsp;<i>v</i> matches <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>|</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub>, the bindings
performed are those of <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> when <i>v</i> matches <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>.
Otherwise, value&nbsp;<i>v</i> matches <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub> whose bindings are performed.</p><h4 class="subsubsection">Variant patterns</h4><p>The pattern <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> <font color="blue"><tt>(</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>)</tt></font> matches
all variants whose
constructor is equal to <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>, and whose arguments match
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> … &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>. It is a type error if <i>n</i> is not the
number of arguments expected by the constructor.</p><p>The pattern <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> <font color="blue"><tt>_</tt></font> matches all variants whose constructor is
<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>.</p><p>The pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>::</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub> matches non-empty lists whose
heads match <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>, and whose tails match <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>2</sub>.</p><p>The pattern <font color="blue"><tt>[</tt></font> <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>]</tt></font> matches lists
of length <i>n</i> whose elements match <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> …<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>,
respectively. This pattern behaves like
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>::</tt></font> … <font color="blue"><tt>::</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>::</tt> <tt>[]</tt></font>.</p><h4 class="subsubsection">Polymorphic variant patterns</h4><p>The pattern <font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> matches all polymorphic variants
whose tag is equal to <i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>, and whose argument matches
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>.</p><h4 class="subsubsection">Polymorphic variant abbreviation patterns</h4><p>If the type [<font color="blue"><tt>('a,'b,</tt></font>…<font color="blue"><tt>)</tt></font>] <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> = <font color="blue"><tt>[</tt> <tt>`</tt></font>&nbsp;<i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i><sub>1</sub> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>|</tt></font>
… <font color="blue"><tt>|</tt> <tt>`</tt></font>&nbsp;<i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a><sub>n</sub></i> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i><font color="blue"><tt>]</tt></font> is defined, then the pattern <font color="blue"><tt>#</tt></font><i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
is a shorthand for the following or-pattern:
<font color="blue"><tt>(</tt> <tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i><sub>1</sub><font color="blue"><tt>(_</tt> <tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub><font color="blue"><tt>)</tt> <tt>|</tt></font> … <font color="blue"><tt>|</tt> <tt>`</tt></font>&nbsp;<i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a><sub>n</sub></i><font color="blue"><tt>(_</tt>
<tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a><sub>n</sub></i><font color="blue"><tt>))</tt></font>. It matches all values of type <font color="blue"><tt>[&lt;</tt></font> <i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i> <font color="blue"><tt>]</tt></font>.</p><h4 class="subsubsection">Tuple patterns</h4><p>The pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> matches <i>n</i>-tuples
whose components match the patterns <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> through <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>. That
is, the pattern matches the tuple values (<i>v</i><sub>1</sub>, …, <i>v<sub>n</sub></i>) such that
<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i> matches <i>v<sub>i</sub></i> for <i>i</i> = 1,… , <i>n</i>.</p><h4 class="subsubsection">Record patterns</h4><p>The pattern <font color="blue"><tt>{</tt></font> <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font>
&nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>}</tt></font> matches records that define at least the fields
<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> through <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i>, and such that the value associated to
<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>i</sub></i> matches the pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i>, for <i>i</i> = 1,… , <i>n</i>.
The record value can define more fields than <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> …<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i>; the values associated to these extra fields are not taken
into account for matching.</p><h4 class="subsubsection">Array patterns</h4><p>The pattern <font color="blue"><tt>[|</tt></font> <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>|]</tt></font>
matches arrays of length <i>n</i> such that the <i>i</i>-th array element
matches the pattern <i><a href="#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i>, for <i>i</i> = 1,… , <i>n</i>.</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>