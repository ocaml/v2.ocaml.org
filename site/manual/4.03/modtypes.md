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
symbols are set in typewriter font (<span class="c004"><span class="c006">like</span> <span class="c006">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c013">like</span> &nbsp;<span class="c013">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.03</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
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




<h2 class="section" id="sec185">10&nbsp;&nbsp;Module types (module specifications)</h2>
<ul>
<li><a href="modtypes.html#sec186">Simple module types</a>
</li><li><a href="modtypes.html#sec187">Signatures</a>
</li><li><a href="modtypes.html#sec197">Functor types</a>
</li><li><a href="modtypes.html#sec198">The <span class="c006">with</span> operator</a>
</li></ul>
<p>Module types are the module-level equivalent of type expressions: they
specify the general shape and type properties of modules.</p><p><a id="hevea_manual.kwd123"></a>
<a id="hevea_manual.kwd124"></a>
<a id="hevea_manual.kwd125"></a>
<a id="hevea_manual.kwd126"></a>
<a id="hevea_manual.kwd127"></a>
<a id="hevea_manual.kwd128"></a>
<a id="hevea_manual.kwd129"></a>
<a id="hevea_manual.kwd130"></a>
<a id="hevea_manual.kwd131"></a>
<a id="hevea_manual.kwd132"></a>
<a id="hevea_manual.kwd133"></a>
<a id="hevea_manual.kwd134"></a></p><table class="display dcenter"><tbody><tr class="c022"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c021">
<a class="syntax" id="module-type"><span class="c013">module-type</span></a></td><td class="c018">::=</td><td class="c020">
<a class="syntax" href="names.html#modtype-path"><span class="c013">modtype-path</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">sig</span>&nbsp;{&nbsp;<a class="syntax" href="#specification"><span class="c013">specification</span></a>&nbsp;&nbsp;[<span class="c007">;;</span>]&nbsp;}&nbsp;<span class="c007">end</span>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">functor</span>&nbsp;<span class="c007">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a>&nbsp;<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>&nbsp;<span class="c007">)</span>&nbsp;<span class="c007">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>&nbsp;<span class="c007">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>&nbsp;<span class="c007">with</span>&nbsp;&nbsp;<a class="syntax" href="#mod-constraint"><span class="c013">mod-constraint</span></a>&nbsp;&nbsp;{&nbsp;<span class="c007">and</span>&nbsp;<a class="syntax" href="#mod-constraint"><span class="c013">mod-constraint</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">(</span>&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>&nbsp;<span class="c007">)</span>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td></tr>
<tr><td class="c021">
<a class="syntax" id="mod-constraint"><span class="c013">mod-constraint</span></a></td><td class="c018">::=</td><td class="c020">
<span class="c007">type</span>&nbsp;[<a class="syntax" href="typedecl.html#type-params"><span class="c013">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c013">typeconstr</span></a>&nbsp;&nbsp;<a class="syntax" href="typedecl.html#type-equation"><span class="c013">type-equation</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="typedecl.html#type-constraint"><span class="c013">type-constraint</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">module</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a>&nbsp;<span class="c007">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c013">extended-module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr class="c022"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c021">
<a class="syntax" id="specification"><span class="c013">specification</span></a></td><td class="c018">::=</td><td class="c020">
<span class="c007">val</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c013">value-name</span></a>&nbsp;<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c013">value-name</span></a>&nbsp;<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a>&nbsp;<span class="c007">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c013">external-declaration</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c013">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">exception</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c013">constr-decl</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<a class="syntax" href="classes.html#class-specification"><span class="c013">class-specification</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c013">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a>&nbsp;<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c007">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a>&nbsp;<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>&nbsp;<span class="c007">)</span>&nbsp;}
<span class="c007">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">module</span>&nbsp;<span class="c007">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">module</span>&nbsp;<span class="c007">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a>&nbsp;<span class="c007">=</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c021">&nbsp;</td><td class="c018">∣</td><td class="c020">&nbsp;<span class="c007">include</span>&nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table>
<h3 class="subsection" id="sec186">10.1&nbsp;&nbsp;Simple module types</h3>
<p>The expression <a class="syntax" href="names.html#modtype-path"><span class="c013">modtype-path</span></a> is equivalent to the module type bound
to the name <a class="syntax" href="names.html#modtype-path"><span class="c013">modtype-path</span></a>.
The expression <span class="c007">(</span> <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> <span class="c007">)</span> denotes the same type as
<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>.</p>
<h3 class="subsection" id="sec187">10.2&nbsp;&nbsp;Signatures</h3>
<p><a id="hevea_manual.kwd135"></a>
<a id="hevea_manual.kwd136"></a></p><p>Signatures are type specifications for structures. Signatures
<span class="c007">sig</span> … <span class="c007">end</span> are collections of type specifications for value
names, type names, exceptions, module names and module type names. A
structure will match a signature if the structure provides definitions
(implementations) for all the names specified in the signature (and
possibly more), and these definitions meet the type requirements given
in the signature.</p><p>An optional <span class="c007">;;</span> is allowed after each specification in a
signature. It serves as a syntactic separator with no semantic
meaning.</p><h4 class="subsubsection" id="sec188">Value specifications</h4>
<p><a id="hevea_manual.kwd137"></a></p><p>A specification of a value component in a signature is written
<span class="c007">val</span> <a class="syntax" href="names.html#value-name"><span class="c013">value-name</span></a> <span class="c007">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a>, where <a class="syntax" href="names.html#value-name"><span class="c013">value-name</span></a> is the name of the
value and <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a> its expected type.</p><p><a id="hevea_manual.kwd138"></a></p><p>The form <span class="c007">external</span> <a class="syntax" href="names.html#value-name"><span class="c013">value-name</span></a> <span class="c007">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a> <span class="c007">=</span> &nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c013">external-declaration</span></a>
is similar, except that it requires in addition the name to be
implemented as the external function specified in <a class="syntax" href="intfc.html#external-declaration"><span class="c013">external-declaration</span></a>
(see chapter&nbsp;<a href="intfc.html#c%3Aintf-c">19</a>).</p><h4 class="subsubsection" id="sec189">Type specifications</h4>
<p><a id="hevea_manual.kwd139"></a></p><p>A specification of one or several type components in a signature is
written <span class="c007">type</span> <a class="syntax" href="typedecl.html#typedef"><span class="c013">typedef</span></a> &nbsp;{ <span class="c007">and</span> <a class="syntax" href="typedecl.html#typedef"><span class="c013">typedef</span></a> } and consists of a sequence
of mutually recursive definitions of type names.</p><p>Each type definition in the signature specifies an optional type
equation <span class="c007">=</span> <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a> and an optional type representation
<span class="c007">=</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c013">constr-decl</span></a> … or <span class="c004"><span class="c006">=</span> <span class="c006">{</span></span> <a class="syntax" href="typedecl.html#field-decl"><span class="c013">field-decl</span></a> … <span class="c007">}</span>.
The implementation of the type name in a matching structure must
be compatible with the type expression specified in the equation (if
given), and have the specified representation (if given). Conversely,
users of that signature will be able to rely on the type equation
or type representation, if given. More precisely, we have the
following four situations:</p><dl class="description"><dt class="dt-description">
<span class="c016">Abstract type: no equation, no representation.</span></dt><dd class="dd-description"> &nbsp; <br>
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
with any other type: a fresh type has been generated.</dd><dt class="dt-description"><span class="c016">Type abbreviation: an equation </span><span class="c007">=</span> <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a><span class="c016">, no representation.</span></dt><dd class="dd-description"> &nbsp; <br>
The type name must be implemented by a type compatible with <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a>.
All users of the structure know that the type name is
compatible with <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a>.</dd><dt class="dt-description"><span class="c016">New variant type or record type: no equation, a representation.</span></dt><dd class="dd-description"> &nbsp; <br>
The type name must be implemented by a variant type or record type
with exactly the constructors or fields specified. All users of the
structure have access to the constructors or fields, and can use them
to create or inspect values of that type. However, users of the
structure consider that type as incompatible with any other type: a
fresh type has been generated.</dd><dt class="dt-description"><span class="c016">Re-exported variant type or record type: an equation,
a representation.</span></dt><dd class="dd-description"> &nbsp; <br>
This case combines the previous two: the representation of the type is
made visible to all users, and no fresh type is generated.
</dd></dl><h4 class="subsubsection" id="sec190">Exception specification</h4>
<p><a id="hevea_manual.kwd140"></a></p><p>The specification <span class="c007">exception</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c013">constr-decl</span></a> in a signature requires the
matching structure to provide an exception with the name and arguments
specified in the definition, and makes the exception available to all
users of the structure.</p><h4 class="subsubsection" id="sec191">Class specifications</h4>
<p><a id="hevea_manual.kwd141"></a></p><p>A specification of one or several classes in a signature is written
<span class="c007">class</span> <a class="syntax" href="classes.html#class-spec"><span class="c013">class-spec</span></a> &nbsp;{ <span class="c007">and</span> <a class="syntax" href="classes.html#class-spec"><span class="c013">class-spec</span></a> } and consists of a sequence
of mutually recursive definitions of class names.</p><p>Class specifications are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclass-spec">6.9.4</a>.</p><h4 class="subsubsection" id="sec192">Class type specifications</h4>
<p><a id="hevea_manual.kwd142"></a>
<a id="hevea_manual.kwd143"></a></p><p>A specification of one or several classe types in a signature is
written <span class="c004"><span class="c006">class</span> <span class="c006">type</span></span> <a class="syntax" href="classes.html#classtype-def"><span class="c013">classtype-def</span></a> { <span class="c007">and</span> <a class="syntax" href="classes.html#classtype-def"><span class="c013">classtype-def</span></a> } and
consists of a sequence of mutually recursive definitions of class type
names. Class type specifications are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclasstype">6.9.5</a>.</p><h4 class="subsubsection" id="sec193">Module specifications</h4>
<p><a id="hevea_manual.kwd144"></a></p><p>A specification of a module component in a signature is written
<span class="c007">module</span> <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> <span class="c007">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>, where <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> is the
name of the module component and <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> its expected type.
Modules can be nested arbitrarily; in particular, functors can appear
as components of structures and functor types as components of
signatures.</p><p>For specifying a module component that is a functor, one may write
</p><div class="center">
<span class="c007">module</span> <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> <span class="c007">(</span> &nbsp;<span class="c013">name</span><sub>1</sub> <span class="c007">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>1</sub> <span class="c007">)</span>
… <span class="c007">(</span> &nbsp;<span class="c013">name</span><sub><span class="c012">n</span></sub> <span class="c007">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub><span class="c012">n</span></sub> <span class="c004"><span class="c006">)</span>
<span class="c006">:</span></span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
</div><p>
instead of
</p><div class="center">
<span class="c007">module</span> <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> <span class="c004"><span class="c006">:</span>
<span class="c006">functor</span> <span class="c006">(</span></span> &nbsp;<span class="c013">name</span><sub>1</sub> <span class="c007">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>1</sub> <span class="c004"><span class="c006">)</span> <span class="c006">-&gt;</span></span> …
<span class="c007">-&gt;</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
</div><h4 class="subsubsection" id="sec194">Module type specifications</h4>
<p><a id="hevea_manual.kwd145"></a>
<a id="hevea_manual.kwd146"></a></p><p>A module type component of a signature can be specified either as a
manifest module type or as an abstract module type.</p><p>An abstract module type specification
<span class="c004"><span class="c006">module</span> <span class="c006">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a> allows the name <a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a> to be
implemented by any module type in a matching signature, but hides the
implementation of the module type to all users of the signature.</p><p>A manifest module type specification
<span class="c004"><span class="c006">module</span> <span class="c006">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a> <span class="c007">=</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a>
requires the name <a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a> to be implemented by the module type
<a class="syntax" href="#module-type"><span class="c013">module-type</span></a> in a matching signature, but makes the equality between
<a class="syntax" href="names.html#modtype-name"><span class="c013">modtype-name</span></a> and <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> apparent to all users of the signature.</p>
<h4 class="subsubsection" id="sec195">Opening a module path</h4>
<p><a id="hevea_manual.kwd147"></a></p><p>The expression <span class="c007">open</span> <a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a> in a signature does not specify
any components. It simply affects the parsing of the following items
of the signature, allowing components of the module denoted by
<a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a> to be referred to by their simple names <span class="c013">name</span> instead of
path accesses <a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a> <span class="c007">.</span> &nbsp;<span class="c013">name</span>. The scope of the <span class="c007">open</span>
stops at the end of the signature expression.</p>
<h4 class="subsubsection" id="sec196">Including a signature</h4>
<p><a id="hevea_manual.kwd148"></a></p><p>The expression <span class="c007">include</span> <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> in a signature performs textual
inclusion of the components of the signature denoted by <a class="syntax" href="#module-type"><span class="c013">module-type</span></a>.
It behaves as if the components of the included signature were copied
at the location of the <span class="c007">include</span>. The <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> argument must
refer to a module type that is a signature, not a functor type.</p>
<h3 class="subsection" id="sec197">10.3&nbsp;&nbsp;Functor types</h3>
<p><a id="hevea_manual.kwd149"></a></p><p>The module type expression
<span class="c004"><span class="c006">functor</span> <span class="c006">(</span></span> <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> <span class="c007">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>1</sub> <span class="c004"><span class="c006">)</span> <span class="c006">-&gt;</span></span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>2</sub>
is the type of functors (functions from modules to modules) that take
as argument a module of type <a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>1</sub> and return as result a
module of type <a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>2</sub>. The module type <a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>2</sub> can
use the name <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a> to refer to type components of the actual
argument of the functor. If the type <a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>2</sub> does not
depend on type components of <a class="syntax" href="names.html#module-name"><span class="c013">module-name</span></a>, the module type expression
can be simplified with the alternative short syntax
 <a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>1</sub> <span class="c007">-&gt;</span> &nbsp;<a class="syntax" href="#module-type"><span class="c013">module-type</span></a><sub>2</sub> .
No restrictions are placed on the type of the functor argument; in
particular, a functor may take another functor as argument
(“higher-order” functor).</p>
<h3 class="subsection" id="sec198">10.4&nbsp;&nbsp;The <span class="c006">with</span> operator</h3>
<p><a id="hevea_manual.kwd150"></a></p><p>Assuming <a class="syntax" href="#module-type"><span class="c013">module-type</span></a> denotes a signature, the expression
<a class="syntax" href="#module-type"><span class="c013">module-type</span></a> <span class="c007">with</span> &nbsp;<a class="syntax" href="#mod-constraint"><span class="c013">mod-constraint</span></a> { <span class="c007">and</span> <a class="syntax" href="#mod-constraint"><span class="c013">mod-constraint</span></a> } denotes
the same signature where type equations have been added to some of the
type specifications, as described by the constraints following the
<span class="c006">with</span> keyword. The constraint <span class="c007">type</span> [<a class="syntax" href="classes.html#type-parameters"><span class="c013">type-parameters</span></a>] &nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c013">typeconstr</span></a>
<span class="c007">=</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a> adds the type equation <span class="c007">=</span> <a class="syntax" href="types.html#typexpr"><span class="c013">typexpr</span></a> to the specification
of the type component named <a class="syntax" href="names.html#typeconstr"><span class="c013">typeconstr</span></a> of the constrained signature.
The constraint <span class="c007">module</span> <a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a> <span class="c007">=</span> &nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c013">extended-module-path</span></a> adds
type equations to all type components of the sub-structure denoted by
<a class="syntax" href="names.html#module-path"><span class="c013">module-path</span></a>, making them equivalent to the corresponding type
components of the structure denoted by <a class="syntax" href="names.html#extended-module-path"><span class="c013">extended-module-path</span></a>.</p><p>For instance, if the module type name <span class="c006">S</span> is bound to the signature
</p><pre>        sig type t module M: (sig type u end) end
</pre><p>then <span class="c006">S with type t=int</span> denotes the signature
</p><pre>        sig type t=int module M: (sig type u end) end
</pre><p>and <span class="c006">S with module M = N</span> denotes the signature
</p><pre>        sig type t module M: (sig type u=N.u end) end
</pre><p>A functor taking two arguments of type <span class="c006">S</span> that share their <span class="c006">t</span> component
is written
</p><pre>        functor (A: S) (B: S with type t = A.t) ...
</pre><p>
Constraints are added left to right. After each constraint has been
applied, the resulting signature must be a subtype of the signature
before the constraint was applied. Thus, the <span class="c007">with</span> operator can
only add information on the type components of a signature, but never
remove information.

</p>






</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>