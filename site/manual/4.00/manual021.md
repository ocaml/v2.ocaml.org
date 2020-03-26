<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li><a href="language.html">The OCaml language</a></li><li class="active"><a href="manual021.html">Language extensions</a></li></ul>




<h1 class="chapter"><a name="htoc92"><span>Chapter 7</span></a>&nbsp;&nbsp;Language extensions</h1><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.00</a></div><div class="toc_title"><a href="#">Language extensions</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="manual021.html#toc68">Integer literals for types <tt>int32</tt>, <tt>int64</tt>
and <tt>nativeint</tt></a>
</li><li><a href="manual021.html#toc69">Streams and stream parsers</a>
</li><li><a href="manual021.html#toc70">Recursive definitions of values</a>
</li><li><a href="manual021.html#toc71">Range patterns</a>
</li><li><a href="manual021.html#toc72">Assertion checking</a>
</li><li><a href="manual021.html#toc73">Lazy evaluation</a>
</li><li><a href="manual021.html#toc74">Local modules</a>
</li><li><a href="manual021.html#toc75">Recursive modules</a>
</li><li><a href="manual021.html#toc76">Private types</a>
</li><li><a href="manual021.html#toc77">Local opens</a>
</li><li><a href="manual021.html#toc78">Record notations</a>
</li><li><a href="manual021.html#toc79">Explicit polymorphic type annotations</a>
</li><li><a href="manual021.html#toc80">Locally abstract types</a>
</li><li><a href="manual021.html#toc81">First-class modules</a>
</li><li><a href="manual021.html#toc82">Recovering the type of a module</a>
</li><li><a href="manual021.html#toc83">Substituting inside a signature</a>
</li><li><a href="manual021.html#toc84">Explicit overriding in class definitions</a>
</li><li><a href="manual021.html#toc85">Generalized algebraic datatypes</a>
</li></ul></nav></header>
<p> <a name="c:extensions"></a>
</p><p>This chapter describes language extensions and convenience features
that are implemented in OCaml, but not described in the
OCaml reference manual.</p><h2 class="section"><a name="toc68"></a><a name="htoc93">1</a>&nbsp;&nbsp;Integer literals for types <tt>int32</tt>, <tt>int64</tt>
and <tt>nativeint</tt></h2><p>(Introduced in Objective Caml 3.07)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="int32-literal" class="syntax"><font color="maroon">int32-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>&nbsp;<font color="blue"><tt>l</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="int64-literal" class="syntax"><font color="maroon">int64-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>&nbsp;<font color="blue"><tt>L</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="nativeint-literal" class="syntax"><font color="maroon">nativeint-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>&nbsp;<font color="blue"><tt>n</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
An integer literal can be followed by one of the letters <tt>l</tt>, <tt>L</tt> or <tt>n</tt>
to indicate that this integer has type <tt>int32</tt>, <tt>int64</tt> or <tt>nativeint</tt>
respectively, instead of the default type <tt>int</tt> for integer literals.
<a name="@manual3"></a>
<a name="@manual4"></a>
<a name="@manual5"></a>
The library modules <tt>Int32</tt>[<tt><a href="../../api/4.00/Int32.html">Int32</a></tt>],
<tt>Int64</tt>[<tt><a href="../../api/4.00/Int64.html">Int64</a></tt>] and <tt>Nativeint</tt>[<tt><a href="../../api/4.00/Nativeint.html">Nativeint</a></tt>]
provide operations on these integer types.</p><h2 class="section"><a name="toc69"></a><a name="htoc94">2</a>&nbsp;&nbsp;Streams and stream parsers</h2><p>
<a name="s:streams"></a></p><p>(Removed in Objective Caml 3.03)</p><p>The syntax for streams and stream parsers is no longer part of the
OCaml language, but available through a Camlp4 syntax
extension. See the Camlp4 reference manual for more information.
Support for basic operations on streams is still available through the
<tt>Stream</tt>[<tt><a href="../../api/4.00/Stream.html">Stream</a></tt>] module of the standard library.
OCaml programs
that use the stream parser syntax should be compiled with the
<tt>-pp camlp4o</tt> option to <tt>ocamlc</tt> and <tt>ocamlopt</tt>. For interactive use,
run <tt>ocaml</tt> and issue the <code>#load "dynlink.cma";;</code> command,
followed by the <code>#load "camlp4o.cma";;</code> command.</p><h2 class="section"><a name="toc70"></a><a name="htoc95">3</a>&nbsp;&nbsp;Recursive definitions of values</h2><p> <a name="s:letrecvalues"></a></p><p>(Introduced in Objective Caml 1.00)</p><p>As mentioned in section&nbsp;<a href="expr.html#s:localdef">6.7.1</a>, the <font color="blue"><tt>let rec</tt></font> binding
construct, in addition to the definition of recursive functions,
also supports a certain class of recursive definitions of
non-functional values, such as
</p><div class="center">
<font color="blue"><tt>let</tt> <tt>rec</tt></font> <font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>=</tt> <tt>1</tt> <tt>::</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>2</sub>
<font color="blue"><tt>and</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>2</sub> <font color="blue"><tt>=</tt> <tt>2</tt> <tt>::</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub>
<font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
which binds <font color="maroon"><i>name</i></font><sub>1</sub> to the cyclic list <tt>1::2::1::2::</tt>…, and
<font color="maroon"><i>name</i></font><sub>2</sub> to the cyclic list <tt>2::1::2::1::</tt>…Informally, the class of accepted definitions consists of those
definitions where the defined names occur only inside function
bodies or as argument to a data constructor.</p><p>More precisely, consider the expression:
</p><div class="center">
<font color="blue"><tt>let</tt> <tt>rec</tt></font> <font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>and</tt></font> … <font color="blue"><tt>and</tt></font> &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
It will be accepted if each one of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> … &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> is
statically constructive with respect to <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>,
is not immediately linked to any of <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>,
and is not an array constructor whose arguments have abstract type.</p><p>An expression <font color="maroon"><i>e</i></font> is said to be <em>statically constructive
with respect to</em> the variables <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> if at least
one of the following conditions is true:
</p><ul class="itemize"><li class="li-itemize">
<font color="maroon"><i>e</i></font> has no free occurrence of any of <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> is a variable
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has the form <font color="blue"><tt>fun</tt></font> … <font color="blue"><tt>-&gt;</tt></font> …
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has the form <font color="blue"><tt>function</tt></font> … <font color="blue"><tt>-&gt;</tt></font> …
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has the form <font color="blue"><tt>lazy</tt> <tt>(</tt></font> … <font color="blue"><tt>)</tt></font>
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has one of the following forms, where each one of
<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> … &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> is statically constructive with respect to
<font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>, and <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub> is statically constructive with
respect to <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>, &nbsp;<font color="maroon"><i>xname</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">xname</font><sub>m</sub></i>:
<ul class="itemize"><li class="li-itemize">
<font color="blue"><tt>let</tt></font> [<font color="blue"><tt>rec</tt></font>] <font color="maroon"><i>xname</i></font><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>and</tt></font> …
<font color="blue"><tt>and</tt></font> &nbsp;<i><font color="maroon">xname</font><sub>m</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub>
</li><li class="li-itemize"><font color="blue"><tt>let</tt> <tt>module</tt></font> … <font color="blue"><tt>in</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>
</li><li class="li-itemize"><i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> <font color="blue"><tt>(</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i><font color="blue"><tt>)</tt></font>
</li><li class="li-itemize"><font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i> <font color="blue"><tt>(</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i><font color="blue"><tt>)</tt></font>
</li><li class="li-itemize"><font color="blue"><tt>[|</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>|]</tt></font>
</li><li class="li-itemize"><font color="blue"><tt>{</tt></font> <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>m</sub></i> = &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>}</tt></font>
</li><li class="li-itemize"><font color="blue"><tt>{</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>with</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>2</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub><font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font>
&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>m</sub></i> = &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>}</tt></font> where <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> is not immediately
linked to <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i>
</li><li class="li-itemize"><font color="blue"><tt>(</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>)</tt></font>
</li><li class="li-itemize"><i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i>
</li></ul>
</li></ul><p>An expression <font color="maroon"><i>e</i></font> is said to be <em>immediately linked to</em> the variable
<font color="maroon"><i>name</i></font> in the following cases:
</p><ul class="itemize"><li class="li-itemize">
<font color="maroon"><i>e</i></font> is <font color="maroon"><i>name</i></font>
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has the form <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub><font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> where <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i>
is immediately linked to <font color="maroon"><i>name</i></font>
</li><li class="li-itemize"><font color="maroon"><i>e</i></font> has the form <font color="blue"><tt>let</tt></font> [<font color="blue"><tt>rec</tt></font>] <font color="maroon"><i>xname</i></font><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>and</tt></font> …
<font color="blue"><tt>and</tt></font> &nbsp;<i><font color="maroon">xname</font><sub>m</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>m</sub></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub> where <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub> is immediately
linked to <font color="maroon"><i>name</i></font> or to one of the <i><font color="maroon">xname</font><sub>i</sub></i> such that <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i>
is immediately linked to <font color="maroon"><i>name</i></font>.
</li></ul><h2 class="section"><a name="toc71"></a><a name="htoc96">4</a>&nbsp;&nbsp;Range patterns</h2><p>(Introduced in Objective Caml 1.00)</p><p>In patterns, OCaml recognizes the form
<font color="blue"><tt>'</tt> <font color="maroon"><i>c</i></font> <tt>'</tt> <tt>..</tt> <tt>'</tt> <font color="maroon"><i>d</i></font> <tt>'</tt></font>
(two character literals separated by&nbsp;<tt>..</tt>) as shorthand for the pattern
</p><div class="center">
<font color="blue"><tt>'</tt></font> <font color="maroon"><i>c</i> <font color="blue"><tt>'</tt> <tt>|</tt> <tt>'</tt></font> <i>c</i></font><sub>1</sub> <font color="blue"><tt>'</tt> <tt>|</tt> <tt>'</tt></font> <font color="maroon"><i>c</i></font><sub>2</sub> <font color="blue"><tt>'</tt> <tt>|</tt></font> …
<font color="blue"><tt>|</tt> <tt>'</tt></font> <i><font color="maroon">c</font><sub>n</sub></i> <font color="blue"><tt>'</tt> <tt>|</tt> <tt>'</tt> <font color="maroon"><i>d</i></font> <tt>'</tt></font>
</div><p>
where <i>c</i><sub>1</sub>, <i>c</i><sub>2</sub>, …, <i>c<sub>n</sub></i> are the characters
that occur between <i>c</i> and <i>d</i> in the ASCII character set. For
instance, the pattern <tt>'0'..'9'</tt> matches all characters that are digits.</p><h2 class="section"><a name="toc72"></a><a name="htoc97">5</a>&nbsp;&nbsp;Assertion checking</h2><p>
<a name="@manual.kwd173"></a></p><p>(Introduced in Objective Caml 1.06)</p><p>OCaml supports the <tt>assert</tt> construct to check debugging assertions.
The expression <font color="blue"><tt>assert</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> evaluates the expression <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> and
returns <tt>()</tt> if <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> evaluates to <tt>true</tt>. Otherwise, the exception
<tt>Assert_failure</tt> is raised with the source file name and the
location of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> as arguments. Assertion
checking can be turned off with the <tt>-noassert</tt> compiler option.</p><p>As a special case, <tt>assert false</tt> is reduced to
<tt>raise (Assert_failure ...)</tt>, which is polymorphic (and
is not turned off by the <tt>-noassert</tt> option).
<a name="@manual6"></a></p><h2 class="section"><a name="toc73"></a><a name="htoc98">6</a>&nbsp;&nbsp;Lazy evaluation</h2><p>
<a name="@manual.kwd174"></a></p><p>(Introduced in Objective Caml 1.06 for expressions;
in Objective Caml 3.11 for patterns)</p><p>The expression <font color="blue"><tt>lazy</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> returns a value <i>v</i> of type <tt>Lazy.t</tt> that
encapsulates the computation of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. The argument <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> is not
evaluated at this point in the program. Instead, its evaluation will
be performed the first time <tt>Lazy.force</tt> is applied to the value
<i>v</i>, returning the actual value of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. Subsequent applications
of <tt>Lazy.force</tt> to <i>v</i> do not evaluate <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> again. Applications
of <tt>Lazy.force</tt> may be implicit through pattern matching.</p><p>The pattern <font color="blue"><tt>lazy</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> matches values <i>v</i> of type <tt>Lazy.t</tt>,
provided <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> matches the result of forcing <i>v</i> with
<tt>Lazy.force</tt>. A successful match of a pattern containing <tt>lazy</tt>
sub-patterns forces the corresponding parts of the value being matched, even
those that imply no test such as <font color="blue"><tt>lazy</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> or <font color="blue"><tt>lazy</tt> <tt>_</tt></font>.
Matching a value with a <i><a href="expr.html#pattern-matching" class="syntax"><font color="maroon">pattern-matching</font></a></i> where some patterns
contain <tt>lazy</tt> sub-patterns may imply forcing parts of the value,
even when the pattern selected in the end has no <tt>lazy</tt> sub-pattern.</p><p>For more information, see the description of module <tt>Lazy</tt> in the
standard library (see
<a href="../../api/4.00/Lazy.html">Module <tt>Lazy</tt></a>).
<a name="@manual7"></a><a name="@manual8"></a></p><h2 class="section"><a name="toc74"></a><a name="htoc99">7</a>&nbsp;&nbsp;Local modules</h2><p>
<a name="@manual.kwd175"></a>
<a name="@manual.kwd176"></a></p><p>(Introduced in Objective Caml 2.00)</p><p>The expression
<font color="blue"><tt>let</tt> <tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
locally binds the module expression <i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> to the identifier
<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> during the evaluation of the expression <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>.
It then returns the value of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. For example:
</p><pre>        let remove_duplicates comparison_fun string_list =
          let module StringSet =
            Set.Make(struct type t = string
                            let compare = comparison_fun end) in
          StringSet.elements
            (List.fold_right StringSet.add string_list StringSet.empty)
</pre><h2 class="section"><a name="toc75"></a><a name="htoc100">8</a>&nbsp;&nbsp;Recursive modules</h2><p> <a name="s-recursive-modules"></a>
<a name="@manual.kwd177"></a>
<a name="@manual.kwd178"></a></p><p>(Introduced in Objective Caml 3.07)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual019.html#definition" class="syntax"><font color="maroon">definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>rec</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;
&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i><font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>rec</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i><font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;}</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Recursive module definitions, introduced by the <tt>module rec</tt> …<tt>and</tt> … construction, generalize regular module definitions
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> and module specifications
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> by allowing the defining
<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> and the <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> to refer recursively to the module
identifiers being defined. A typical example of a recursive module
definition is:
</p><pre>    module rec A : sig
                     type t = Leaf of string | Node of ASet.t
                     val compare: t -&gt; t -&gt; int
                   end
                 = struct
                     type t = Leaf of string | Node of ASet.t
                     let compare t1 t2 =
                       match (t1, t2) with
                         (Leaf s1, Leaf s2) -&gt; Pervasives.compare s1 s2
                       | (Leaf _, Node _) -&gt; 1
                       | (Node _, Leaf _) -&gt; -1
                       | (Node n1, Node n2) -&gt; ASet.compare n1 n2
                   end
        and ASet : Set.S with type elt = A.t
                 = Set.Make(A)
</pre><p>It can be given the following specification:
</p><pre>    module rec A : sig
                     type t = Leaf of string | Node of ASet.t
                     val compare: t -&gt; t -&gt; int
                   end
        and ASet : Set.S with type elt = A.t
</pre><p>
This is an experimental extension of OCaml: the class of
recursive definitions accepted, as well as its dynamic semantics are
not final and subject to change in future releases.</p><p>Currently, the compiler requires that all dependency cycles between
the recursively-defined module identifiers go through at least one
“safe” module. A module is “safe” if all value definitions that
it contains have function types <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>. Evaluation of a
recursive module definition proceeds by building initial values for
the safe modules involved, binding all (functional) values to
<font color="blue"><tt>fun</tt> <tt>_</tt> <tt>-&gt;</tt> <tt>raise</tt> <tt>Undefined_recursive_module</tt></font>. The defining
module expressions are then evaluated, and the initial values
for the safe modules are replaced by the values thus computed. If a
function component of a safe module is applied during this computation
(which corresponds to an ill-founded recursive definition), the
<tt>Undefined_recursive_module</tt> exception is raised.</p><h2 class="section"><a name="toc76"></a><a name="htoc101">9</a>&nbsp;&nbsp;Private types</h2><p>
<a name="@manual.kwd179"></a></p><p>Private type declarations in module signatures, of the form
<tt>type t = private ...</tt>, enable libraries to
reveal some, but not all aspects of the implementation of a type to
clients of the library. In this respect, they strike a middle ground
between abstract type declarations, where no information is revealed
on the type implementation, and data type definitions and type
abbreviations, where all aspects of the type implementation are
publicized. Private type declarations come in three flavors: for
variant and record types (section&nbsp;<a href="#s-private-types-variant">7.9.1</a>),
for type abbreviations (section&nbsp;<a href="#s-private-types-abbrev">7.9.2</a>),
and for row types (section&nbsp;<a href="#s-private-rows">7.9.3</a>).</p><h3 class="subsection"><a name="htoc102">7.9.1</a>&nbsp;&nbsp;Private variant and record types</h3><p>
<a name="s-private-types-variant"></a></p><p>(Introduced in Objective Caml 3.07)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual016.html#type-representation" class="syntax"><font color="maroon">type-representation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;<font color="blue"><tt>private</tt></font>&nbsp;<i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;<font color="blue"><tt>private</tt></font>&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="manual016.html#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual016.html#field-decl" class="syntax"><font color="maroon">field-decl</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>}</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
Values of a variant or record type declared <tt>private</tt>
can be de-structured normally in pattern-matching or via
the <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> notation for record accesses. However, values of
these types cannot be constructed directly by constructor application
or record construction. Moreover, assignment on a mutable field of a
private record type is not allowed.</p><p>The typical use of private types is in the export signature of a
module, to ensure that construction of values of the private type always
go through the functions provided by the module, while still allowing
pattern-matching outside the defining module. For example:
</p><pre>        module M : sig
                     type t = private A | B of int
                     val a : t
                     val b : int -&gt; t
                   end
                 = struct
                     type t = A | B of int
                     let a = A
                     let b n = assert (n &gt; 0); B n
                   end
</pre><p>Here, the <tt>private</tt> declaration ensures that in any value of type
<tt>M.t</tt>, the argument to the <tt>B</tt> constructor is always a positive integer.</p><p>With respect to the variance of their parameters, private types are
handled like abstract types. That is, if a private type has
parameters, their variance is the one explicitly given by prefixing
the parameter by a ‘<tt>+</tt>’ or a ‘<tt>-</tt>’, it is invariant otherwise.</p><h3 class="subsection"><a name="htoc103">7.9.2</a>&nbsp;&nbsp;Private type abbreviations</h3><p> <a name="s-private-types-abbrev"></a></p><p>(Introduced in Objective Caml 3.11)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual016.html#type-equation" class="syntax"><font color="maroon">type-equation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;<font color="blue"><tt>private</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
Unlike a regular type abbreviation, a private type abbreviation
declares a type that is distinct from its implementation type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.
However, coercions from the type to <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> are permitted.
Moreover, the compiler “knows” the implementation type and can take
advantage of this knowledge to perform type-directed optimizations.
For ambiguity reasons, <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> cannot be an object or polymorphic
variant type, but a similar behaviour can be obtained through private
row types.</p><p>The following example uses a private type abbreviation to define a
module of nonnegative integers:
</p><pre>        module N : sig
                     type t = private int
                     val of_int: int -&gt; t
                     val to_int: t -&gt; int
                   end
                 = struct
                     type t = int
                     let of_int n = assert (n &gt;= 0); n
                     let to_int n = n
                   end
</pre><p>The type <tt>N.t</tt> is incompatible with <tt>int</tt>, ensuring that nonnegative
integers and regular integers are not confused. However, if <tt>x</tt> has
type <tt>N.t</tt>, the coercion <tt>(x :&gt; int)</tt> is legal and returns the
underlying integer, just like <tt>N.to_int x</tt>. Deep coercions are also
supported: if <tt>l</tt> has type <tt>N.t list</tt>, the coercion <tt>(l :&gt; int list)</tt>
returns the list of underlying integers, like <tt>List.map N.to_int l</tt>
but without copying the list <tt>l</tt>.</p><p>Note that the coercion <tt>(</tt><i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><tt> :&gt; </tt><i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><tt>)</tt> is actually an abbreviated form,
and will only work in presence of private abbreviations if both the
type of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> contain no type variables. If this is not the
case, you must use the full form <tt>(</tt><i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><tt> : </tt>typ_e<tt> :&gt; </tt><i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><tt>)</tt> where
typ_e is the expected type of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>. Concretely, this would be <tt>(x : N.t :&gt; int)</tt> and <tt>(l : N.t list :&gt; int list)</tt> for the above examples.</p><h3 class="subsection"><a name="htoc104">7.9.3</a>&nbsp;&nbsp;Private row types</h3><p> <a name="s-private-rows"></a>
<a name="@manual.kwd180"></a></p><p>(Introduced in Objective Caml 3.09)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual016.html#type-equation" class="syntax"><font color="maroon">type-equation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;<font color="blue"><tt>private</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
Private row types are type abbreviations where part of the
structure of the type is left abstract. Concretely <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> in the
above should denote either an object type or a polymorphic variant
type, with some possibility of refinement left. If the private
declaration is used in an interface, the corresponding implementation
may either provide a ground instance, or a refined private type.
</p><pre>   module M : sig type c = private &lt; x : int; .. &gt; val o : c end =
     struct
       class c = object method x = 3 method y = 2 end
       let o = new c
     end
</pre><p>This declaration does more than hiding the <tt>y</tt> method, it also makes
the type <tt>c</tt> incompatible with any other closed object type, meaning
that only <tt>o</tt> will be of type <tt>c</tt>. In that respect it behaves
similarly to private record types. But private row types are
more flexible with respect to incremental refinement. This feature can
be used in combination with functors.
</p><pre>   module F(X : sig type c = private &lt; x : int; .. &gt; end) =
     struct
       let get_x (o : X.c) = o#x
     end
   module G(X : sig type c = private &lt; x : int; y : int; .. &gt; end) =
     struct
       include F(X)
       let get_y (o : X.c) = o#y
     end
</pre><p>
Polymorphic variant types can be refined in two ways, either to allow
the addition of new constructors, or to allow the disparition of
declared constructors. The second case corresponds to private variant
types (one cannot create a value of the private type), while the first
case requires default cases in pattern-matching to handle addition.
</p><pre>   type t = [ `A of int | `B of bool ]
   type u = private [&lt; t &gt; `A ]
   type v = private [&gt; t ]
</pre><p>With type <tt>u</tt>, it is possible to create values of the form <tt>(`A n)</tt>,
but not <tt>(`B b)</tt>. With type <tt>v</tt>, construction is not restricted but
pattern-matching must have a default case.</p><p>Like for abstract and private types, the variance of type parameters
is not inferred, and must be given explicitly.</p><h2 class="section"><a name="toc77"></a><a name="htoc105">10</a>&nbsp;&nbsp;Local opens</h2><p>
<a name="@manual.kwd181"></a>
<a name="@manual.kwd182"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>let</tt></font>&nbsp;<font color="blue"><tt>open</tt></font>&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>in</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.(</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The expressions
<font color="blue"><tt>let</tt> <tt>open</tt></font> <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
and
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>.&nbsp;(<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>) are strictly equivalent. They
locally open the module referred to by the module path <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> in
the scope of the expression <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>.</p><p>Restricting opening to the scope of a single expression instead of a
whole structure allows one to benefit from shorter syntax to refer to
components of the opened module, without polluting the global
scope. Also, this can make the code easier to read (the open statement is
closer to where it is used) and to refactor (because the code
fragment is more self-contained).</p><h2 class="section"><a name="toc78"></a><a name="htoc106">11</a>&nbsp;&nbsp;Record notations</h2><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>]&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>]&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;]&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;}&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;}&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>In a record pattern or a record construction expression, a single
identifier <font color="maroon"><i>id</i></font> stands for <font color="maroon"><i>id</i></font> = &nbsp;<font color="maroon"><i>id</i></font>, and a qualified identifier
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>id</i></font> stands for <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>id</i></font> = &nbsp;<font color="maroon"><i>id</i></font>.
For example, assuming
the record type
</p><pre>          type point = { x: float; y: float }
</pre><p>has been declared, the following expressions are equivalent:
</p><pre>          let x = 1 and y = 2 in { x = x; y = y }
          let x = 1 and y = 2 in { x; y }
          let x = 1 and y = 2 in { x = x; y }
</pre><p>Likewise, the following functions are equivalent:
</p><pre>          fun {x = x; y = y} -&gt; x + y
          fun {x; y} -&gt; x + y
</pre><p>
Optionally, a record pattern can be terminated by <tt>; _</tt> to convey the
fact that not all fields of the record type are listed in the record
pattern and that it is intentional. By default, the compiler ignores
the <tt>; _</tt> annotation. If the <tt>R</tt> warning is turned on, however,
the compiler will warn if a record pattern fails to list all fields of
the corresponding record type and is not terminated by <tt>; _</tt>.
Continuing the <tt>point</tt> example above,
</p><pre>          fun {x} -&gt; x + 1
</pre><p>will warn if the <tt>R</tt> warning is on, while
</p><pre>          fun {x; _} -&gt; x + 1
</pre><p>will not warn. This warning can help spot program points where record
patterns may need to be modified after new fields were added to a
record type.</p><h2 class="section"><a name="toc79"></a><a name="htoc107">12</a>&nbsp;&nbsp;Explicit polymorphic type annotations</h2><p>
<a name="@manual.kwd183"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>Polymorphic type annotations in <tt>let</tt>-definitions behave in a way
similar to polymorphic methods: they explicitly require the defined
value to be polymorphic, and allow one to use this polymorphism in
recursive occurences (when using <tt>let rec</tt>). Note however that this
is just an usual polymorphic type, unifiable with any instance of
itself.</p><p>There two possible applications of this feature. One is polymorphic
recursion:
</p><pre>        type 'a t = Leaf of 'a | Node of ('a * 'a) t
        let rec depth : 'a. 'a t -&gt; 'b = function
            Leaf _ -&gt; 1
          | Node x -&gt; 1 + depth x
</pre><p>Note that <tt>'b</tt> is not explicitly polymorphic here, and it will
actually be unified with <tt>int</tt>.</p><p>The other application is to ensure that some definition is sufficiently
polymorphic.
</p><pre><font color="black">#</font><font color="#006000"> let id : 'a. 'a -&gt; 'a = <u>fun x -&gt; x+1</u> ;;
</font><font color="maroon">Error: This definition has type int -&gt; int which is less general than
         'a. 'a -&gt; 'a
</font></pre><h2 class="section"><a name="toc80"></a><a name="htoc108">13</a>&nbsp;&nbsp;Locally abstract types</h2><p>
<a name="@manual.kwd184"></a>
<a name="@manual.kwd185"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The expression <font color="blue"><tt>fun</tt> <tt>(</tt> <tt>type</tt></font> <i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> introduces a
type constructor named <i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i> which is considered abstract
in the scope of the sub-expression, but then replaced by a fresh type
variable. Note that contrary to what the syntax could suggest, the
expression <font color="blue"><tt>fun</tt> <tt>(</tt> <tt>type</tt></font> <i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> itself does not
suspend the evaluation of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> as a regular abstraction would. The
syntax has been chosen to fit nicely in the context of function
declarations, where it is generally used. It is possible to freely mix
regular function parameters with pseudo type parameters, as in:
</p><pre>        let f = fun (type t) (foo : t list) -&gt; ...
</pre><p>and even use the alternative syntax for declaring functions:
</p><pre>        let f (type t) (foo : t list) = ...
</pre><p>
This construction is useful because the type constructor it introduces
can be used in places where a type variable is not allowed. For
instance, one can use it to define an exception in a local module
within a polymorphic function.
</p><pre>        let f (type t) () =
          let module M = struct exception E of t end in
          (fun x -&gt; M.E x), (function M.E x -&gt; Some x | _ -&gt; None)
</pre><p>
Here is another example:
</p><pre>        let sort_uniq (type s) (cmp : s -&gt; s -&gt; int) =
          let module S = Set.Make(struct type t = s let compare = cmp end) in
          fun l -&gt;
            S.elements (List.fold_right S.add l S.empty)
</pre><p>
It is also extremely useful for first-class modules and GADTs.</p><h5 class="paragraph">Polymorphic syntax</h5><p> (Introduced in OCaml 4.00)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;&nbsp;{&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
The (<font color="blue"><tt>type</tt></font> <font color="maroon"><i>t</i></font>) syntax construction by itself does not make
polymorphic the type variable it introduces, but it can be combined
with explicit polymorphic annotations where needed. 
Some syntactic sugar is provided to make this easier.
Namely,
</p><pre>        let rec f : type t1 t2. t1 * t2 list -&gt; t1 = ...
</pre><p>is automatically expanded into
</p><pre>        let rec f : 't1 't2. 't1 * 't2 list -&gt; 't1 =
          fun (type t1) (type t2) -&gt; (... : t1 * t2 list -&gt; t1)
</pre><h2 class="section"><a name="toc81"></a><a name="htoc109">14</a>&nbsp;&nbsp;First-class modules</h2><p><a name="s-first-class-modules"></a>
<a name="@manual.kwd186"></a>
<a name="@manual.kwd187"></a>
<a name="@manual.kwd188"></a></p><p>(Introduced in OCaml 3.12, pattern syntax and package type inference
since 4.00)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(module</tt></font>&nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i><font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(val</tt></font>&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>]<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(module</tt></font>&nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>]<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>]<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="package-type" class="syntax"><font color="maroon">package-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="#package-constraint" class="syntax"><font color="maroon">package-constraint</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#package-constraint" class="syntax"><font color="maroon">package-constraint</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="package-constraint" class="syntax"><font color="maroon">package-constraint</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Modules are typically thought of as static components. This extension
makes it possible to pack a module as a first-class value, which can
later be dynamically unpacked into a module.</p><p>The expression (<font color="blue"><tt>module</tt></font> <i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>) converts the
module (structure or functor) denoted by module expression <i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
to a value of the core language that encapsulates this module. The
type of this core language value is (<font color="blue"><tt>module</tt></font> <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>).
The <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i> annotation can be omitted if it can be inferred
from the context.</p><p>Conversely, the module expression (<font color="blue"><tt>val</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>)
evaluates the core language expression <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> to a value, which must
have type <font color="blue"><tt>module</tt></font> <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>, and extracts the module that was
encapsulated in this value. Again <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i> can be omitted if the
type of <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> is known.</p><p>The pattern (<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>) matches a
package with type <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i> and binds it to <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>.
It is not allowed in toplevel let bindings.
Again <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i> can be omitted if it can be inferred from the
enclosing pattern.</p><p>The <i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i> syntactic class appearing in the (<font color="blue"><tt>module</tt></font>
<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>) type expression and in the annotated forms represents a
subset of module types.
This subset consists of named module types with optional constraints
of a limited form: only non-parametrized types can be specified. For
type-checking purposes, package types are compared by path equality on
the module type name component, and normal type equality for
constraints.</p><p>The module expression (<font color="blue"><tt>val</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>) cannot be used in the
body of a functor, because this can cause unsoundness in conjunction
with applicative functors. It can be used anywhere in the context of a local
module binding
<font color="blue"><tt>let</tt> <tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> = &nbsp;(<font color="blue"><tt>val</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="#package-type" class="syntax"><font color="maroon">package-type</font></a></i>) <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>,
however.</p><h5 class="paragraph">Basic example</h5><p> A typical use of first-class modules is to
select at run-time among several implementations of a signatures.
Each implementation is a structure that we can encapsulate as a
first-class module, then store in a data structure such as a hash
table:
</p><pre>        module type DEVICE = sig ... end
        let devices : (string, module DEVICE) Hashtbl.t = Hashtbl.create 17

        module SVG = struct ... end
        let _ = Hashtbl.add devices "SVG" (module SVG : DEVICE)

        module PDF = struct ... end
        let _ = Hashtbl.add devices "PDF" (module PDF: DEVICE)
</pre><p>We can then select one implementation based on command-line
arguments, for instance:
</p><pre>        module Device =
          (val (try Hashtbl.find devices (parse_cmdline())
                with Not_found -&gt; eprintf "Unknown device %s\n"; exit 2)
           : DEVICE)
</pre><p>Alternatively, the selection can be performed within a function:
</p><pre>        let draw_using_device device_name picture =
          let module Device =
            (val (Hashtbl.find_devices device_name) : DEVICE)
          in
            Device.draw picture
</pre><h5 class="paragraph">Advanced examples</h5><p>
With first-class modules, it is possible to parametrize some code over the
implementation of a module without using a functor.</p><pre>        let sort (type s) (module Set : Set.S with type elt = s) l =
          Set.elements (List.fold_right Set.add l Set.empty)
        val sort : (module Set.S with type elt = 'a) -&gt; 'a list -&gt; 'a list
</pre><p>
To use this function, one can wrap the <tt>Set.Make</tt> functor:</p><pre>        let make_set (type s) cmp =
          let module S = Set.Make(struct
            type t = s
            let compare = cmp
          end) in
          (module S : Set.S with type elt = s)
        val make_set : ('a -&gt; 'a -&gt; int) -&gt; (module Set.S with type elt = 'a)
</pre><h2 class="section"><a name="toc82"></a><a name="htoc110">15</a>&nbsp;&nbsp;Recovering the type of a module</h2><p><a name="@manual.kwd189"></a>
<a name="@manual.kwd190"></a>
<a name="@manual.kwd191"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<font color="blue"><tt>of</tt></font>&nbsp;<i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The construction <font color="blue"><tt>module</tt> <tt>type</tt> <tt>of</tt></font> <i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> expands to the module type
(signature or functor type) inferred for the module expression <i><a href="manual019.html#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>.</p><p>A typical use, in conjunction with the signature-level <font color="blue"><tt>include</tt></font>
construct, is to extend the signature of an existing structure, as in
the following example.
</p><pre>        module type MYHASH = sig
          include module type of Hashtbl
          val replace: ('a, 'b) t -&gt; 'a -&gt; 'b -&gt; unit
        end
</pre><p>The signature <tt>MYHASH</tt>, then, contains all the fields of the signature
of module <tt>Hashtbl</tt>, plus the new field <tt>replace</tt>. An implementation
of this signature can be obtained easily, using the <font color="blue"><tt>include</tt></font>
construct at the structure level this time:
</p><pre>        module MyHash : MYHASH = struct
          include Hashtbl
          let replace t k v = remove t k; add t k v
        end
</pre><h2 class="section"><a name="toc83"></a><a name="htoc111">16</a>&nbsp;&nbsp;Substituting inside a signature</h2><p>
<a name="@manual.kwd192"></a>
<a name="@manual.kwd193"></a>
<a name="@manual.kwd194"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual018.html#mod-constraint" class="syntax"><font color="maroon">mod-constraint</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;[<i><a href="manual017.html#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>]&nbsp;&nbsp;<i><a href="manual011.html#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>&nbsp;<font color="blue"><tt>:=</tt></font>&nbsp;&nbsp;[<i><a href="manual017.html#type-parameters" class="syntax"><font color="maroon">type-parameters</font></a></i>]&nbsp;&nbsp;<i><a href="manual011.html#typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:=</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>“Destructive” substitution (<tt>with ... :=</tt>) behaves essentially like
normal signature constraints (<tt>with ... =</tt>), but it additionally removes
the redefined type or module from the signature. There are a number of
restrictions: one can only remove types and modules at the outermost
level (not inside submodules), and the definition must be either
another type constructor (with identical type parameters), or a module
path.</p><p>A natural application of destructive substitution is merging two
signatures sharing a type name.
</p><pre>        module type Printable = sig
          type t
          val print : Format.formatter -&gt; t -&gt; unit
        end
        module type Comparable = sig
          type t
          val compare : t -&gt; t -&gt; int
        end
        module type PrintableComparable = sig
          include Printable
          include Comparable with type t := t
        end
</pre><p>
One can also use this to completely remove a field:
</p><pre><font color="black">#</font><font color="#006000"> module type S = Comparable with type t := int;;
</font><font color="maroon">module type S = sig val compare : int -&gt; int -&gt; int end
</font></pre><p>
or to rename one:
</p><pre><font color="black">#</font><font color="#006000"> module type S = sig
    type u
    include Comparable with type t := u
  end;;
</font><font color="maroon">module type S = sig type u val compare : u -&gt; u -&gt; int end
</font></pre><p>Note that you can also remove manifest types, by substituting with the
same type.
</p><pre><font color="black">#</font><font color="#006000"> module type ComparableInt = Comparable with type t = int ;;
<font color="maroon">module type ComparableInt = sig type t = int val compare : t -&gt; t -&gt; int end
</font><font color="black">#</font> module type CompareInt = ComparableInt with type t := int ;;
</font><font color="maroon">module type CompareInt = sig val compare : int -&gt; int -&gt; int end
</font></pre><h2 class="section"><a name="toc84"></a><a name="htoc112">17</a>&nbsp;&nbsp;Explicit overriding in class definitions</h2><p>
<a name="@manual.kwd195"></a>
<a name="@manual.kwd196"></a>
<a name="@manual.kwd197"></a></p><p>(Introduced in OCaml 3.12)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual017.html#class-field" class="syntax"><font color="maroon">class-field</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>inherit!</tt></font>&nbsp;<i><a href="manual017.html#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>as</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>val!</tt></font>&nbsp;[<font color="blue"><tt>mutable</tt></font>]&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method!</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;&nbsp;{<i><a href="expr.html#parameter" class="syntax"><font color="maroon">parameter</font></a></i>}&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;&nbsp;<font color="blue"><tt>method!</tt></font>&nbsp;[<font color="blue"><tt>private</tt></font>]&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#poly-typexpr" class="syntax"><font color="maroon">poly-typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The keywords <tt>inherit!</tt>, <tt>val!</tt> and <tt>method!</tt> have the same semantics
as <tt>inherit</tt>, <tt>val</tt> and <tt>method</tt>, but they additionally require the
definition they introduce to be an overriding. Namely, <tt>method!</tt>
requires <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> to be already defined in this class, <tt>val!</tt>
requires <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> to be already defined in this class, and
<tt>inherit!</tt> requires <i><a href="manual017.html#class-expr" class="syntax"><font color="maroon">class-expr</font></a></i> to override some definitions.
If no such overriding occurs, an error is signaled.</p><p>As a side-effect, these 3 keywords avoid the warnings
“method override” and “ instance variable override”.
As of OCaml 3.12, the warning “method override” has to be
enabled manually for backwards compatibility reasons.</p><h2 class="section"><a name="toc85"></a><a name="htoc113">18</a>&nbsp;&nbsp;Generalized algebraic datatypes</h2><p>
<a name="@manual.kwd198"></a>
<a name="@manual.kwd199"></a></p><p>(Introduced in OCaml 4.00)</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="manual016.html#type-param" class="syntax"><font color="maroon">type-param</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
...
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;[<i><a href="manual016.html#variance" class="syntax"><font color="maroon">variance</font></a></i>]&nbsp;<font color="blue"><tt>_</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Generalized algebraic datatypes, or GADTs, extend usual sum types in
two ways: constraints on type parameters may change depending on the
value constructor, and some type variables may be existentially
quantified.
Adding constraints is done by giving an explicit return type
(the rightmost <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> in the above syntax), where type parameters
are instantiated.
This return type must use the same type constructor as the type being
defined, and have the same number of parameters.
Variables are made existential when they appear inside a constructor’s
argument, but not in its return type.</p><p>Since the use of a return type often eludes the need to name type
parameters in the left-hand side of a type definition, one can replace
them with anonymous types “<tt>_</tt>” there.</p><p>The constraints associated to each constructor can be recovered
through pattern-matching.
Namely, if the type of the scrutinee of a pattern-matching contains
a locally abstract type, this type can be refined according to the
constructor used.
These extra constraints are only valid inside the corresponding branch
of the pattern-matching.
If a constructor has some existential variables, fresh locally
abstract types are generated, and they must not escape the
scope of this branch.</p><p>Here is a concrete example:
</p><pre>        type _ term =
          | Int : int -&gt; int term
          | Add : (int -&gt; int -&gt; int) term
          | App : ('b -&gt; 'a) term * 'b term -&gt; 'a term

        let rec eval : type a. a term -&gt; a = function
          | Int n    -&gt; n                 (* a = int *)
          | Add      -&gt; (fun x y -&gt; x+y)  (* a = int -&gt; int -&gt; int *)
          | App(f,x) -&gt; (eval f) (eval x)
                  (* eval called at types (b-&gt;a) and b for fresh b *)

        let two = eval (App (App (Add, Int 1), Int 1))
        val two : int = 2
</pre><p>
Type inference for GADTs is notoriously hard.
This is due to the fact some types may become ambiguous when escaping
from a branch.
For instance, in the <tt>Int</tt> case above, <tt>n</tt> could have either type <tt>int</tt>
or <tt>a</tt>, and they are not equivalent outside of that branch.
As a first approximation, type inference will always work if a
pattern-matching is annotated with types containing no free type
variables (both on the scrutinee and the return type).
This is the case in the above example, thanks to the type annotation
containing only locally abstract types.</p><p>In practice, type inference is a bit more clever than that: type
annotations do not need to be immediately on the pattern-matching, and
the types do not have to be always closed.
As a result, it is usually enough to only annotate functions, as in
the example above. Type annotations are
propagated in two ways: for the scrutinee, they follow the flow of
type inference, in a way similar to polymorphic methods; for the
return type, they follow the structure of the program, they are split
on functions, propagated to all branches of a pattern matching,
and go through tuples, records, and sum types.
Moreover, the notion of ambiguity used is stronger: a type is only
seen as ambiguous if it was mixed with incompatible types (equated by
constraints), without type annotations between them.
For instance, the following program types correctly.
</p><pre>        let rec sum : type a. a term -&gt; _ = fun x -&gt;
          let y =
            match x with
            | Int n -&gt; n
            | Add   -&gt; 0
            | App(f,x) -&gt; sum f + sum x
          in y + 1
        val sum : 'a term -&gt; int = &lt;fun&gt;
</pre><p>Here the return type <tt>int</tt> is never mixed with <tt>a</tt>, so it is seen as
non-ambiguous, and can be inferred.
When using such partial type annotations we strongly suggest
specifying the <tt>-principal</tt> mode, to check that inference is
principal.</p><p>The exhaustiveness check is aware of GADT constraints, and can
automatically infer that some cases cannot happen.
For instance, the following pattern matching is correctly seen as
exhaustive (the <tt>Add</tt> case cannot happen).
</p><pre>        let get_int : int term -&gt; int = function
          | Int n    -&gt; n
          | App(_,_) -&gt; 0
</pre><h5 class="paragraph">Advanced examples</h5><p>
The <tt>term</tt> type we have defined above is an <em>indexed</em> type, where
a type parameter reflects a property of the value contents.
Another use of GADTs is <em>singleton</em> types, where a GADT value
represents exactly one type. This value can be used as runtime
representation for this type, and a function receiving it can have a
polytypic behavior.</p><p>Here is an example of a polymorphic function that takes the
runtime representation of some type <tt>t</tt> and a value of the same type,
then pretty-prints the value as a string:
</p><pre>        type _ typ =
          | Int : int typ
          | String : string typ
          | Pair : 'a typ * 'b typ -&gt; ('a * 'b) typ

        let rec to_string: type t. t typ -&gt; t -&gt; string =
          fun t x -&gt;
          match t with
          | Int -&gt; string_of_int x
          | String -&gt; Printf.sprintf "%S" x
          | Pair(t1,t2) -&gt;
              let (x1, x2) = x in
              Printf.sprintf "(%s,%s)" (to_string t1 x1) (to_string t2 x2)
</pre><p>
Another frequent application of GADTs is equality witnesses.
</p><pre>        type (_,_) eq = Eq : ('a,'a) eq

        let cast : type a b. (a,b) eq -&gt; a -&gt; b = fun Eq x -&gt; x
</pre><p>Here type <tt>eq</tt> has only one constructor, and by matching on it one
adds a local constraint allowing the conversion between <tt>a</tt> and <tt>b</tt>.
By building such equality witnesses, one can make equal types which
are syntactically different.</p><p>Here is an example using both singleton types and equality witnesses
to implement dynamic types.
</p><pre>        let rec eq_type : type a b. a typ -&gt; b typ -&gt; (a,b) eq option =
          fun a b -&gt;
          match a, b with
          | Int, Int -&gt; Some Eq
          | String, String -&gt; Some Eq
          | Pair(a1,a2), Pair(b1,b2) -&gt;
              begin match eq_type a1 b1, eq_type a2 b2 with
              | Some Eq, Some Eq -&gt; Some Eq
              | _ -&gt; None
              end
          | _ -&gt; None

        type dyn = Dyn : 'a typ * 'a -&gt; dyn

        let get_dyn : type a. a typ -&gt; dyn -&gt; a option =
          fun a (Dyn(b,x)) -&gt;
          match eq_type a b with
          | None -&gt; None
          | Some Eq -&gt; Some x
</pre><hr>





<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>