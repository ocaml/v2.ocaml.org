<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec71"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>

</p><h3 class="subsection" id="sec72">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec73">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c002"><span class="c003">like</span> <span class="c003">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c010">like</span> &nbsp;<span class="c010">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.07</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="lex.html#start-section">1&nbsp;&nbsp;Lexical conventions</a>
</li><li><a href="values.html#start-section">2&nbsp;&nbsp;Values</a>
</li><li><a href="names.html#start-section">3&nbsp;&nbsp;Names</a>
</li><li><a href="types.html#start-section">4&nbsp;&nbsp;Type expressions</a>
</li><li><a href="const.html#start-section">5&nbsp;&nbsp;Constants</a>
</li><li><a href="patterns.html#start-section">6&nbsp;&nbsp;Patterns</a>
</li><li><a href="expr.html#start-section">7&nbsp;&nbsp;Expressions</a>
</li><li><a href="typedecl.html#start-section">8&nbsp;&nbsp;Type and exception definitions</a>
</li><li><a href="classes.html#start-section">9&nbsp;&nbsp;Classes</a>
</li><li><a href="modtypes.html#start-section">10&nbsp;&nbsp;Module types (module specifications)</a>
</li><li><a href="modules.html#start-section">11&nbsp;&nbsp;Module expressions (module implementations)</a>
</li><li><a href="compunit.html#start-section">12&nbsp;&nbsp;Compilation units</a>
</li></ul></nav></header><a id="start-section"></a><section id="section">




<h2 class="section" id="sec115">6&nbsp;&nbsp;Patterns</h2>
<p>

<a id="hevea_manual.kwd15"></a>
</p><div class="syntax"><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="pattern"><span class="c010">pattern</span></a></td><td class="c015">::=</td><td class="c017">
<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">_</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="const.html#constant"><span class="c010">constant</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">as</span>&nbsp;&nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">(</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>&nbsp;<span class="c004">)</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">|</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">#</span><a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">,</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">{</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a>&nbsp;&nbsp;[<span class="c004">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>]&nbsp;&nbsp;[<span class="c004">=</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>]&nbsp;{&nbsp;<span class="c004">;</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a>&nbsp;&nbsp;[<span class="c004">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>]&nbsp;&nbsp;[<span class="c004">=</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>]&nbsp;}&nbsp;&nbsp;[<span class="c004">;</span>&nbsp;<span class="c004">_</span>&nbsp;]&nbsp;[&nbsp;<span class="c004">;</span>&nbsp;]&nbsp;<span class="c004">}</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">[</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">;</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;}&nbsp;&nbsp;[&nbsp;<span class="c004">;</span>&nbsp;]&nbsp;<span class="c004">]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;<span class="c004">::</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">[|</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c004">;</span>&nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a>&nbsp;}&nbsp;&nbsp;[&nbsp;<span class="c004">;</span>&nbsp;]&nbsp;<span class="c004">|]</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="lex.html#char-literal"><span class="c010">char-literal</span></a>&nbsp;<span class="c004">..</span>&nbsp;&nbsp;<a class="syntax" href="lex.html#char-literal"><span class="c010">char-literal</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table></div><p>
See also the following language extensions: <a href="extn.html#s%3Alazypat">lazy patterns</a>,
<a href="extn.html#s%3Alocal-opens">local opens</a>,
<a href="extn.html#s-first-class-modules">first-class modules</a>,
<a href="extn.html#s%3Aattributes">attributes</a>,
<a href="extn.html#s%3Aextension-nodes">extension nodes</a> and
<a href="extn.html#s%3Aexception-match">exception cases in pattern matching</a>.</p><p>The table below shows the relative precedences and associativity of
operators and non-closed pattern constructions. The constructions with
higher precedences come first.
<a id="hevea_manual.kwd16"></a>
</p><div class="tableau">
<div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">Operator</span></td><td class="c014"><span class="c013">Associativity</span> </td></tr>
<tr><td class="c016">
<span class="c003">..</span></td><td class="c016">– </td></tr>
<tr><td class="c016"><span class="c003">lazy</span> (see section&nbsp;<a href="extn.html#s%3Alazypat">8.3</a>)</td><td class="c016">– </td></tr>
<tr><td class="c016">Constructor application, Tag application</td><td class="c016">right </td></tr>
<tr><td class="c016"><span class="c003">::</span></td><td class="c016">right </td></tr>
<tr><td class="c016"><span class="c003">,</span></td><td class="c016">– </td></tr>
<tr><td class="c016"><span class="c003">|</span></td><td class="c016">left </td></tr>
<tr><td class="c016"><span class="c003">as</span></td><td class="c016">– </td></tr>
</tbody></table></div></div><p>Patterns are templates that allow selecting data structures of a
given shape, and binding identifiers to components of the data
structure. This selection operation is called pattern matching; its
outcome is either “this value does not match this pattern”, or
“this value matches this pattern, resulting in the following bindings
of names to values”.</p><h4 class="subsubsection" id="sec116">Variable patterns</h4>
<p>A pattern that consists in a value name matches any value,
binding the name to the value. The pattern <span class="c004">_</span> also matches
any value, but does not bind any name.</p><p>Patterns are <em>linear</em>: a variable cannot be bound several times by
a given pattern. In particular, there is no way to test for equality
between two parts of a data structure using only a pattern (but
<span class="c004">when</span> guards can be used for this purpose).</p><h4 class="subsubsection" id="sec117">Constant patterns</h4>
<p>A pattern consisting in a constant matches the values that
are equal to this constant.</p><h4 class="subsubsection" id="sec118">Alias patterns</h4>
<p>
<a id="hevea_manual.kwd17"></a></p><p>The pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">as</span> &nbsp;<a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a> matches the same values as
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>. If the matching against <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> is successful,
the name <a class="syntax" href="names.html#value-name"><span class="c010">value-name</span></a> is bound to the matched value, in addition to the
bindings performed by the matching against <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>.</p><h4 class="subsubsection" id="sec119">Parenthesized patterns</h4>
<p>The pattern <span class="c004">(</span> <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">)</span> matches the same values as
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>. A type constraint can appear in a
parenthesized pattern, as in <span class="c004">(</span> <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a> <span class="c004">)</span>. This
constraint forces the type of <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> to be compatible with
<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a>.</p><h4 class="subsubsection" id="sec120">“Or” patterns</h4>
<p>The pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub> represents the logical “or” of
the two patterns <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> and <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub>. A value matches
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub> if it matches <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> or
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub>. The two sub-patterns <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> and <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub>
must bind exactly the same identifiers to values having the same types.
Matching is performed from left to right.
More precisely,
in case some value&nbsp;<span class="c009">v</span> matches <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub>, the bindings
performed are those of <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> when <span class="c009">v</span> matches <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>.
Otherwise, value&nbsp;<span class="c009">v</span> matches <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub> whose bindings are performed.</p><h4 class="subsubsection" id="sec121">Variant patterns</h4>
<p>The pattern <a class="syntax" href="names.html#constr"><span class="c010">constr</span></a> <span class="c004">(</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">,</span> … <span class="c004">,</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> <span class="c004">)</span> matches
all variants whose
constructor is equal to <a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>, and whose arguments match
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub>. It is a type error if <span class="c009">n</span> is not the
number of arguments expected by the constructor.</p><p>The pattern <a class="syntax" href="names.html#constr"><span class="c010">constr</span></a> <span class="c004">_</span> matches all variants whose constructor is
<a class="syntax" href="names.html#constr"><span class="c010">constr</span></a>.</p><p>The pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">::</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub> matches non-empty lists whose
heads match <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>, and whose tails match <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>2</sub>.</p><p>The pattern <span class="c004">[</span> <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> <span class="c004">]</span> matches lists
of length <span class="c009">n</span> whose elements match <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> …<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub>,
respectively. This pattern behaves like
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">::</span> … <span class="c004">::</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">::</span> <span class="c003">[]</span></span>.</p><h4 class="subsubsection" id="sec122">Polymorphic variant patterns</h4>
<p>The pattern <span class="c004">`</span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> matches all polymorphic variants
whose tag is equal to <a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a>, and whose argument matches
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>.</p><h4 class="subsubsection" id="sec123">Polymorphic variant abbreviation patterns</h4>
<p>If the type [<span class="c004">('a,'b,</span>…<span class="c004">)</span>] <a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a> = <span class="c002"><span class="c003">[</span> <span class="c003">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a><sub>1</sub> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub> <span class="c004">|</span>
… <span class="c002"><span class="c003">|</span> <span class="c003">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a><sub><span class="c009">n</span></sub> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub><span class="c009">n</span></sub><span class="c004">]</span> is defined, then the pattern <span class="c004">#</span><a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a>
is a shorthand for the following or-pattern:
<span class="c002"><span class="c003">(</span> <span class="c003">`</span></span><a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a><sub>1</sub><span class="c002"><span class="c003">(_</span> <span class="c003">:</span></span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub><span class="c002"><span class="c003">)</span> <span class="c003">|</span></span> … <span class="c002"><span class="c003">|</span> <span class="c003">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c010">tag-name</span></a><sub><span class="c009">n</span></sub><span class="c002"><span class="c003">(_</span>
<span class="c003">:</span></span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub><span class="c009">n</span></sub><span class="c004">))</span>. It matches all values of type <span class="c004">[&lt;</span> <a class="syntax" href="names.html#typeconstr"><span class="c010">typeconstr</span></a> <span class="c004">]</span>.</p><h4 class="subsubsection" id="sec124">Tuple patterns</h4>
<p>The pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">,</span> … <span class="c004">,</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> matches <span class="c009">n</span>-tuples
whose components match the patterns <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> through <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub>. That
is, the pattern matches the tuple values (<span class="c009">v</span><sub>1</sub>, …, <span class="c009">v</span><sub><span class="c009">n</span></sub>) such that
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">i</span></sub> matches <span class="c009">v</span><sub><span class="c009">i</span></sub> for <span class="c009">i</span> = 1,… , <span class="c009">n</span>.</p><h4 class="subsubsection" id="sec125">Record patterns</h4>
<p>The pattern <span class="c004">{</span> <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> &nbsp;[<span class="c004">=</span> <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub>] <span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">n</span></sub> &nbsp;[<span class="c004">=</span>
<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub>] <span class="c004">}</span> matches records that define at least the fields
<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> through <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">n</span></sub>, and such that the value associated to
<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">i</span></sub> matches the pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">i</span></sub>, for <span class="c009">i</span> = 1,… , <span class="c009">n</span>.
A single identifier <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> stands for <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> ,
and a single qualified identifier <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a> <span class="c004">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> stands
for <a class="syntax" href="names.html#module-path"><span class="c010">module-path</span></a> <span class="c004">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> .
The record value can define more fields than <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> …<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">n</span></sub>; the values associated to these extra fields are not taken
into account for matching. Optionally, a record pattern can be terminated
by <span class="c002"><span class="c003">;</span> <span class="c003">_</span></span> to convey the fact that not all fields of the record type are
listed in the record pattern and that it is intentional.
Optional type constraints can be added field by field with
<span class="c004">{</span> <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub>1</sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub>1</sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">;</span>… <span class="c004">;</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">n</span></sub> <span class="c004">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub><span class="c009">n</span></sub> <span class="c004">=</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> <span class="c004">}</span> to force the type
of <a class="syntax" href="names.html#field"><span class="c010">field</span></a><sub><span class="c009">k</span></sub> to be compatible with <a class="syntax" href="types.html#typexpr"><span class="c010">typexpr</span></a><sub><span class="c009">k</span></sub>.</p><h4 class="subsubsection" id="sec126">Array patterns</h4>
<p>The pattern <span class="c004">[|</span> <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub>1</sub> <span class="c004">;</span> … <span class="c004">;</span> &nbsp;<a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">n</span></sub> <span class="c004">|]</span>
matches arrays of length <span class="c009">n</span> such that the <span class="c009">i</span>-th array element
matches the pattern <a class="syntax" href="#pattern"><span class="c010">pattern</span></a><sub><span class="c009">i</span></sub>, for <span class="c009">i</span> = 1,… , <span class="c009">n</span>.</p><h4 class="subsubsection" id="sec127">Range patterns</h4>
<p>The pattern
<span class="c002"><span class="c003">'</span> <span class="c010">c</span> <span class="c003">'</span> <span class="c003">..</span> <span class="c003">'</span> <span class="c010">d</span> <span class="c003">'</span></span> is a shorthand for the pattern
</p><div class="center">
<span class="c004">'</span> <span style="color:maroon"><span class="c009">c</span> <span class="c002"><span class="c003">'</span> <span class="c003">|</span> <span class="c003">'</span></span> <span class="c009">c</span></span><sub>1</sub> <span class="c002"><span class="c003">'</span> <span class="c003">|</span> <span class="c003">'</span></span> <span class="c010">c</span><sub>2</sub> <span class="c002"><span class="c003">'</span> <span class="c003">|</span></span> …
<span class="c002"><span class="c003">|</span> <span class="c003">'</span></span> <span class="c010">c</span><sub><span class="c009">n</span></sub> <span class="c002"><span class="c003">'</span> <span class="c003">|</span> <span class="c003">'</span> <span class="c010">d</span> <span class="c003">'</span></span>
</div><p>
where <span class="c009">c</span><sub>1</sub>, <span class="c009">c</span><sub>2</sub>, …, <span class="c009">c</span><sub><span class="c009">n</span></sub> are the characters
that occur between <span class="c009">c</span> and <span class="c009">d</span> in the ASCII character set. For
instance, the pattern <span class="c003">'0'<span class="c002">..</span>'9'</span> matches all characters that are digits.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>