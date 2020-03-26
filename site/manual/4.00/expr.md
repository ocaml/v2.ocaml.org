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




<h2 class="section"><a name="htoc66">6.7</a>&nbsp;&nbsp;Expressions<a name="s:value-expr"></a></h2><ul>
<li><a href="expr.html#toc48">Basic expressions</a>
</li><li><a href="expr.html#toc49">Control structures</a>
</li><li><a href="expr.html#toc50">Operations on data structures</a>
</li><li><a href="expr.html#toc51">Operators</a>
</li><li><a href="expr.html#toc52">Objects</a>
</li><li><a href="expr.html#toc53">Coercions</a>
</li></ul>
<p>
<a name="@manual.kwd8"></a>
<a name="@manual.kwd9"></a>
<a name="@manual.kwd10"></a>
<a name="@manual.kwd11"></a>
<a name="@manual.kwd12"></a>
<a name="@manual.kwd13"></a>
<a name="@manual.kwd14"></a>
<a name="@manual.kwd15"></a>
<a name="@manual.kwd16"></a>
<a name="@manual.kwd17"></a>
<a name="@manual.kwd18"></a>
<a name="@manual.kwd19"></a>
<a name="@manual.kwd20"></a>
<a name="@manual.kwd21"></a>
<a name="@manual.kwd22"></a>
<a name="@manual.kwd23"></a>
<a name="@manual.kwd24"></a>
<a name="@manual.kwd25"></a>
<a name="@manual.kwd26"></a>
<a name="@manual.kwd27"></a>
<a name="@manual.kwd28"></a>
<a name="@manual.kwd29"></a>
<a name="@manual.kwd30"></a>
<a name="@manual.kwd31"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="expr" class="syntax"><font color="maroon">expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#value-path" class="syntax"><font color="maroon">value-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual013.html#constant" class="syntax"><font color="maroon">constant</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>begin</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{<font color="blue"><tt>,</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>::</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>]&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[|</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>]&nbsp;<font color="blue"><tt>|]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>]&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>]&nbsp;<font color="blue"><tt>}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a></i>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;<i><a href="manual011.html#infix-op" class="syntax"><font color="maroon">infix-op</font></a></i>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i>&nbsp;<font color="blue"><tt>&lt;-</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.(</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.(</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;<font color="blue"><tt>&lt;-</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.[</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>.[</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>]</tt></font>&nbsp;<font color="blue"><tt>&lt;-</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>if</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>then</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;[&nbsp;<font color="blue"><tt>else</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;]
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>while</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>do</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>done</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>for</tt></font>&nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;(&nbsp;<font color="blue"><tt>to</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>downto</tt></font>&nbsp;)&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>do</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>done</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>match</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="#pattern-matching" class="syntax"><font color="maroon">pattern-matching</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>function</tt></font>&nbsp;<i><a href="#pattern-matching" class="syntax"><font color="maroon">pattern-matching</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>fun</tt></font>&nbsp;<i><a href="#multiple-matching" class="syntax"><font color="maroon">multiple-matching</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>try</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>with</tt></font>&nbsp;&nbsp;<i><a href="#pattern-matching" class="syntax"><font color="maroon">pattern-matching</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>let</tt></font>&nbsp;[<font color="blue"><tt>rec</tt></font>]&nbsp;<i><a href="#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>in</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>new</tt></font>&nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>object</tt></font>&nbsp;<i><a href="manual017.html#class-body" class="syntax"><font color="maroon">class-body</font></a></i>&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;&nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>&lt;-</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>:&gt;</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>:&gt;</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>{&lt;</tt></font>&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>;</tt></font>&nbsp;<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>;</tt></font>]&nbsp;<font color="blue"><tt>&gt;}</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>assert</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>lazy</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="argument" class="syntax"><font color="maroon">argument</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="pattern-matching" class="syntax"><font color="maroon">pattern-matching</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;]&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>when</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;{&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>when</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="multiple-matching" class="syntax"><font color="maroon">multiple-matching</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
{&nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i>&nbsp;}<sup>+</sup>&nbsp;&nbsp;[<font color="blue"><tt>when</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="let-binding" class="syntax"><font color="maroon">let-binding</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;&nbsp;{&nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i>&nbsp;}&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="parameter" class="syntax"><font color="maroon">parameter</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;&nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]&nbsp;&nbsp;[<font color="blue"><tt>=</tt></font>&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>]&nbsp;<font color="blue"><tt>)</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed constructions. The constructions with higher
precedence come first. For infix and prefix symbols, we write
“<tt>*</tt>…” to mean “any symbol starting with <tt>*</tt>”.
<a name="@manual.kwd32"></a><a name="@manual.kwd33"></a><a name="@manual.kwd34"></a><a name="@manual.kwd35"></a><a name="@manual.kwd36"></a><a name="@manual.kwd37"></a><a name="@manual.kwd38"></a></p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Construction or operator</b></td><td align="center" nowrap=""><b>Associativity</b></td></tr>
<tr><td align="left" nowrap="">
prefix-symbol</td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>.   .(    .[</tt></td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap="">function application, constructor application, <tt>assert</tt>, <tt>lazy</tt></td><td align="left" nowrap="">left</td></tr>
<tr><td align="left" nowrap=""><tt>-   -.</tt> (prefix)</td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>**</tt>…<tt>   lsl   lsr   asr</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>*</tt>…<tt>   /</tt>…<tt>   %</tt>…<tt>   mod   land   lor   lxor</tt></td><td align="left" nowrap="">left</td></tr>
<tr><td align="left" nowrap=""> <tt>+</tt>…<tt>   -</tt>…</td><td align="left" nowrap="">left</td></tr>
<tr><td align="left" nowrap=""><tt>::</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>@</tt>…<tt>   ^</tt>…</td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>=</tt>…<tt>   &lt;</tt>…<tt>   &gt;</tt>…<tt>   |</tt>…<tt>   &amp;</tt>…<tt>   $</tt>…</td><td align="left" nowrap="">left</td></tr>
<tr><td align="left" nowrap=""><tt>&amp;   &amp;&amp;</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>or  ||</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>,</tt></td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>&lt;-   :=</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>if</tt></td><td align="left" nowrap="">–</td></tr>
<tr><td align="left" nowrap=""><tt>;</tt></td><td align="left" nowrap="">right</td></tr>
<tr><td align="left" nowrap=""><tt>let  match  fun  function  try</tt></td><td align="left" nowrap="">–</td></tr>
</tbody></table></div><h3 class="subsection"><a name="toc48"></a><a name="htoc67">6.7.1</a>&nbsp;&nbsp;Basic expressions</h3><h4 class="subsubsection">Constants</h4><p>Expressions consisting in a constant evaluate to this constant.</p><h4 class="subsubsection">Value paths</h4><p> <a name="expr:var"></a></p><p>Expressions consisting in an access path evaluate to the value bound to
this path in the current evaluation environment. The path can
be either a value name or an access path to a value component of a module.</p><h4 class="subsubsection">Parenthesized expressions</h4><p>
<a name="@manual.kwd39"></a>
<a name="@manual.kwd40"></a></p><p>The expressions <font color="blue"><tt>(</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>)</tt></font> and <font color="blue"><tt>begin</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>end</tt></font> have the same
value as <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>. The two constructs are semantically equivalent, but it
is good style to use <font color="blue"><tt>begin</tt></font> … <font color="blue"><tt>end</tt></font> inside control structures:
</p><pre>        if … then begin … ; … end else begin … ; … end
</pre><p>
and <font color="blue"><tt>(</tt></font> … <font color="blue"><tt>)</tt></font> for the other grouping situations.</p><p>Parenthesized expressions can contain a type constraint, as in <font color="blue"><tt>(</tt></font>
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>)</tt></font>. This constraint forces the type of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> to be
compatible with <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.</p><p>Parenthesized expressions can also contain coercions
<font color="blue"><tt>(</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> &nbsp;[<font color="blue"><tt>:</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>] <font color="blue"><tt>:&gt;</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><font color="blue"><tt>)</tt></font> (see
subsection&nbsp;<a href="#s:coercions">6.7.6</a> below).</p><h4 class="subsubsection">Function application</h4><p>Function application is denoted by juxtaposition of (possibly labeled)
expressions. The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> &nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a></i><sub>1</sub> … &nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a><sub>n</sub></i>
evaluates the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> and those appearing in <i><a href="#argument" class="syntax"><font color="maroon">argument</font></a></i><sub>1</sub>
to <i><a href="#argument" class="syntax"><font color="maroon">argument</font></a><sub>n</sub></i>. The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> must evaluate to a
functional value <i>f</i>, which is then applied to the values of 
<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a></i><sub>1</sub>, …, &nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a><sub>n</sub></i>.</p><p>The order in which the expressions <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, &nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a></i><sub>1</sub>, …,
&nbsp;<i><a href="#argument" class="syntax"><font color="maroon">argument</font></a><sub>n</sub></i> are evaluated is not specified.</p><p>Arguments and parameters are matched according to their respective
labels. Argument order is irrelevant, except among arguments with the
same label, or no label.</p><p>If a parameter is specified as optional (label prefixed by <tt>?</tt>) in the
type of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the corresponding argument will be automatically
wrapped with the constructor <tt>Some</tt>, except if the argument itself is
also prefixed by <tt>?</tt>, in which case it is passed as is.
If a non-labeled argument is passed, and its corresponding parameter
is preceded by one or several optional parameters, then these
parameters are <em>defaulted</em>, <em>i.e.</em> the value <tt>None</tt> will be
passed for them.
All other missing parameters (without corresponding argument), both
optional and non-optional, will be kept, and the result of the
function will still be a function of these missing parameters to the
body of <i>f</i>.</p><p>As a special case, if the function has a known arity, all the
arguments are unlabeled, and their number matches the number of
non-optional parameters, then labels are ignored and non-optional
parameters are matched in their definition order. Optional arguments
are defaulted.</p><p>In all cases but exact match of order and labels, without optional
parameters, the function type should be known at the application
point. This can be ensured by adding a type constraint. Principality
of the derivation can be checked in the <tt>-principal</tt> mode.</p><h4 class="subsubsection">Function definition</h4><p>Two syntactic forms are provided to define functions. The first form
is introduced by the keyword <tt>function</tt>:
<a name="@manual.kwd41"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap=""><font color="blue"><tt>function</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>pattern</i></font><sub>1</sub></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font><sub>1</sub>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap="">…&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap=""><i><font color="maroon">pattern</font><sub>n</sub></i></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><i><font color="maroon">expr</font><sub>n</sub></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
This expression evaluates to a functional value with one argument.
When this function is applied to a value <i>v</i>, this value is
matched against each pattern <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> to <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>.
If one of these matchings succeeds, that is, if the value <i>v</i>
matches the pattern <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i> for some <i>i</i>,
then the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> associated to the selected pattern
is evaluated, and its value becomes the value of the function
application. The evaluation of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> takes place in an
environment enriched by the bindings performed during the matching.</p><p>If several patterns match the argument <i>v</i>, the one that occurs
first in the function definition is selected. If none of the patterns
matches the argument, the exception <tt>Match_failure</tt> is raised.
<a name="@manual0"></a></p><p><br>
</p><p>The other form of function definition is introduced by the keyword <tt>fun</tt>:
<a name="@manual.kwd42"></a>
</p><div class="center">
<font color="blue"><tt>fun</tt></font> <i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> … &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
This expression is equivalent to:
</p><div class="center">
<font color="blue"><tt>fun</tt></font> <i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> … <font color="blue"><tt>fun</tt></font> &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>The parameter patterns <tt>~var</tt> and <font color="blue"><tt>~(var</tt></font> [<font color="blue"><tt>:</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><font color="blue"><tt>])</tt></font>
are shorthands for respectively <tt>~var:var</tt> and
<font color="blue"><tt>~var:(var</tt></font> [<font color="blue"><tt>:</tt></font> <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>]<font color="blue"><tt>)</tt></font>, and similarly for their optional
counterparts.</p><p>Functions of the form <font color="blue"><tt>fun</tt> <tt>?lab:(</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font>
&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> are equivalent to
</p><div class="center">
<font color="blue"><tt>fun</tt> <tt>?lab:</tt></font><i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>-&gt;</tt>
<tt>let</tt></font> &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i> <font color="blue"><tt>=</tt>
<tt>match</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>with</tt> <tt>Some</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>|</tt> <tt>None</tt> <tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub>
<font color="blue"><tt>in</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
where <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
is a fresh variable. When <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>0</sub> will be evaluated is left
unspecified.</p><p>After these two transformations, expressions are of the form
</p><div class="center">
<font color="blue"><tt>fun</tt></font> [<i><a href="lex.html#label" class="syntax"><font color="maroon">label</font></a></i><sub>1</sub>] &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> … <font color="blue"><tt>fun</tt></font> &nbsp;[<i><a href="lex.html#label" class="syntax"><font color="maroon">label</font></a><sub>n</sub></i>] &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
If we ignore labels, which will only be meaningful at function
application, this is equivalent to
</p><div class="center">
<font color="blue"><tt>function</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>-&gt;</tt></font> … <font color="blue"><tt>function</tt></font> &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
That is, the <tt>fun</tt> expression above evaluates to a curried function
with <i>n</i> arguments: after applying this function <i>n</i> times to the
values <i>v</i><sub>1</sub>&nbsp;…&nbsp;<i>v<sub>m</sub></i>, the values will be matched
in parallel against the patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> … &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>.
If the matching succeeds, the function returns the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> in
an environment enriched by the bindings performed during the matchings.
If the matching fails, the exception <tt>Match_failure</tt> is raised.</p><h4 class="subsubsection">Guards in pattern-matchings</h4><p><a name="@manual.kwd43"></a>
Cases of a pattern matching (in the <tt>function</tt>, <tt>fun</tt>, <tt>match</tt> and
<tt>try</tt> constructs) can include guard expressions, which are
arbitrary boolean expressions that must evaluate to <tt>true</tt> for the
match case to be selected. Guards occur just before the <tt>-&gt;</tt> token and
are introduced by the <tt>when</tt> keyword:</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap=""><font color="blue"><tt>function</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>pattern</i></font><sub>1</sub>&nbsp;&nbsp;&nbsp;[<font color="blue"><tt>when</tt></font>&nbsp;&nbsp;&nbsp;<font color="maroon"><i>cond</i></font><sub>1</sub>]</td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font><sub>1</sub>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap="">…&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap=""><i><font color="maroon">pattern</font><sub>n</sub></i>&nbsp;&nbsp;&nbsp;&nbsp;[<font color="blue"><tt>when</tt></font>&nbsp;&nbsp;&nbsp;<i><font color="maroon">cond</font><sub>n</sub></i>]</td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><i><font color="maroon">expr</font><sub>n</sub></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>Matching proceeds as described before, except that if the value
matches some pattern <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i> which has a guard <i><font color="maroon">cond</font><sub>i</sub></i>, then the
expression <i><font color="maroon">cond</font><sub>i</sub></i> is evaluated (in an environment enriched by the
bindings performed during matching). If <i><font color="maroon">cond</font><sub>i</sub></i> evaluates to <tt>true</tt>,
then <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> is evaluated and its value returned as the result of the
matching, as usual. But if <i><font color="maroon">cond</font><sub>i</sub></i> evaluates to <tt>false</tt>, the matching
is resumed against the patterns following <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i>.</p><h4 class="subsubsection">Local definitions</h4><p> <a name="s:localdef"></a></p><p><a name="@manual.kwd44"></a></p><p>The <tt>let</tt> and <tt>let rec</tt> constructs bind value names locally.
The construct
</p><div class="center">
<font color="blue"><tt>let</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>and</tt></font> … <font color="blue"><tt>and</tt></font> &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>in</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
evaluates <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> … &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> in some unspecified order, then matches
their values against the patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> … &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>. If the
matchings succeed, <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> is evaluated in the environment enriched by
the bindings performed during matching, and the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> is
returned as the value of the whole <tt>let</tt> expression. If one of the
matchings fails, the exception <tt>Match_failure</tt> is raised.
<a name="@manual1"></a></p><p>An alternate syntax is provided to bind variables to functional
values: instead of writing
</p><div class="center">
<font color="blue"><tt>let</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> <font color="blue"><tt>=</tt> <tt>fun</tt></font> &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> … &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>m</sub></i> <font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
in a <tt>let</tt> expression, one may instead write
</p><div class="center">
<font color="blue"><tt>let</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a></i><sub>1</sub> … &nbsp;<i><a href="#parameter" class="syntax"><font color="maroon">parameter</font></a><sub>m</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p><br>
Recursive definitions of names are introduced by <tt>let rec</tt>:
</p><div class="center">
<font color="blue"><tt>let</tt> <tt>rec</tt></font> <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>and</tt></font> … <font color="blue"><tt>and</tt></font> &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>
<font color="blue"><tt>in</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
The only difference with the <tt>let</tt> construct described above is
that the bindings of names to values performed by the
pattern-matching are considered already performed when the expressions
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> are evaluated. That is, the expressions <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>
to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> can reference identifiers that are bound by one of the
patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>, …, &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>, and expect them to have the
same value as in <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the body of the <tt>let rec</tt> construct.</p><p>The recursive definition is guaranteed to behave as described above if
the expressions <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> are function definitions
(<font color="blue"><tt>fun</tt></font> … or <font color="blue"><tt>function</tt></font> …), and the patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub>
… &nbsp;<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i> are just value names, as in:
</p><div class="center">
<font color="blue"><tt>let</tt> <tt>rec</tt></font> <font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>=</tt> <tt>fun</tt></font> …
<font color="blue"><tt>and</tt></font> …
<font color="blue"><tt>and</tt></font> &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>=</tt> <tt>fun</tt></font> …
<font color="blue"><tt>in</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
</div><p>
This defines <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> as mutually recursive functions
local to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>. </p><p>The behavior of other forms of <tt>let rec</tt> definitions is
implementation-dependent. The current implementation also supports
a certain class of recursive definitions of non-functional values,
as explained in section&nbsp;<a href="manual021.html#s:letrecvalues">7.3</a>.</p><h3 class="subsection"><a name="toc49"></a><a name="htoc68">6.7.2</a>&nbsp;&nbsp;Control structures</h3><h4 class="subsubsection">Sequence</h4><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> first, then
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>, and returns the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>.</p><h4 class="subsubsection">Conditional</h4><p>
<a name="@manual.kwd45"></a></p><p>The expression <font color="blue"><tt>if</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>then</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>else</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> evaluates to
the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> if <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> evaluates to the boolean <font color="blue"><tt>true</tt></font>,
and to the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> if <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> evaluates to the boolean
<font color="blue"><tt>false</tt></font>.</p><p>The <font color="blue"><tt>else</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> part can be omitted, in which case it defaults to
<font color="blue"><tt>else</tt> <tt>()</tt></font>.</p><h4 class="subsubsection">Case expression</h4><p><a name="@manual.kwd46"></a></p><p>The expression
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap=""><font color="blue"><tt>match</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>with</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>pattern</i></font><sub>1</sub></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font><sub>1</sub>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap="">…&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap=""><i><font color="maroon">pattern</font><sub>n</sub></i></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><i><font color="maroon">expr</font><sub>n</sub></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
matches the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> against the patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> to
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>. If the matching against <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i> succeeds, the
associated expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> is evaluated, and its value becomes the
value of the whole <font color="blue"><tt>match</tt></font> expression. The evaluation of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> takes place in an environment enriched by the bindings
performed during matching. If several patterns match the value of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the one that occurs first in the <font color="blue"><tt>match</tt></font> expression is
selected. If none of the patterns match the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the
exception <font color="blue"><tt>Match_failure</tt></font> is raised.
<a name="@manual2"></a></p><h4 class="subsubsection">Boolean operators</h4><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>&amp;&amp;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates to <font color="blue"><tt>true</tt></font> if both
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> and <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluate to <font color="blue"><tt>true</tt></font>; otherwise, it evaluates to
<font color="blue"><tt>false</tt></font>. The first component, <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>, is evaluated first. The
second component, <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>, is not evaluated if the first component
evaluates to <font color="blue"><tt>false</tt></font>. Hence, the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>&amp;&amp;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> behaves
exactly as
</p><div class="center">
<font color="blue"><tt>if</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>then</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>else</tt> <tt>false</tt></font>.
</div><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>||</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates to <font color="blue"><tt>true</tt></font> if one of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> and <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates to <font color="blue"><tt>true</tt></font>; otherwise, it evaluates to
<font color="blue"><tt>false</tt></font>. The first component, <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>, is evaluated first. The
second component, <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>, is not evaluated if the first component
evaluates to <font color="blue"><tt>true</tt></font>. Hence, the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>||</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> behaves
exactly as
</p><div class="center">
<font color="blue"><tt>if</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>then</tt> <tt>true</tt> <tt>else</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>.
</div><p><a name="@manual.kwd47"></a>
The boolean operator <font color="blue"><tt>&amp;</tt></font> is synonymous for <font color="blue"><tt>&amp;&amp;</tt></font>. The boolean operator
<font color="blue"><tt>or</tt></font> is synonymous for <font color="blue"><tt>||</tt></font>.</p><h4 class="subsubsection">Loops</h4><p><a name="@manual.kwd48"></a>
The expression <font color="blue"><tt>while</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>do</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>done</tt></font> repeatedly
evaluates <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> while <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> evaluates to <font color="blue"><tt>true</tt></font>. The loop
condition <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> is evaluated and tested at the beginning of each
iteration. The whole <font color="blue"><tt>while</tt></font> … <font color="blue"><tt>done</tt></font> expression evaluates to
the unit value <font color="blue"><tt>()</tt></font>.</p><p><a name="@manual.kwd49"></a>
The expression <font color="blue"><tt>for</tt> <font color="maroon"><i>name</i></font> <tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>to</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>do</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> <font color="blue"><tt>done</tt></font>
first evaluates the expressions <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> and <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> (the boundaries)
into integer values <i>n</i> and <i>p</i>. Then, the loop body <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> is
repeatedly evaluated in an environment where <font color="maroon"><i>name</i></font> is successively
bound to the values
<i>n</i>, <i>n</i>+1, …, <i>p</i>−1, <i>p</i>.
The loop body is never evaluated if <i>n</i> &gt; <i>p</i>.</p><p>The expression <font color="blue"><tt>for</tt> <font color="maroon"><i>name</i></font> <tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>downto</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>do</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> <font color="blue"><tt>done</tt></font>
evaluates similarly, except that <font color="maroon"><i>name</i></font> is successively bound to the values
<i>n</i>, <i>n</i>−1, …, <i>p</i>+1, <i>p</i>.
The loop body is never evaluated if <i>n</i> &lt; <i>p</i>.</p><p>In both cases, the whole <font color="blue"><tt>for</tt></font> expression evaluates to the unit
value <font color="blue"><tt>()</tt></font>.</p><h4 class="subsubsection">Exception handling</h4><p>
<a name="@manual.kwd50"></a></p><p>The expression
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap=""><font color="blue"><tt>try&nbsp;</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>with</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>pattern</i></font><sub>1</sub></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><font color="maroon"><i>expr</i></font><sub>1</sub>&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap="">…&nbsp;</td></tr>
<tr><td align="right" nowrap=""><font color="blue"><tt>|</tt></font></td><td align="left" nowrap=""><i><font color="maroon">pattern</font><sub>n</sub></i></td><td align="left" nowrap=""><font color="blue"><tt>-&gt;</tt></font></td><td align="left" nowrap=""><i><font color="maroon">expr</font><sub>n</sub></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
evaluates the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> and returns its value if the
evaluation of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> does not raise any exception. If the evaluation
of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> raises an exception, the exception value is matched against
the patterns <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a></i><sub>1</sub> to <i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>n</sub></i>. If the matching against
<i><a href="patterns.html#pattern" class="syntax"><font color="maroon">pattern</font></a><sub>i</sub></i> succeeds, the associated expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> is evaluated,
and its value becomes the value of the whole <font color="blue"><tt>try</tt></font> expression. The
evaluation of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> takes place in an environment enriched by the
bindings performed during matching. If several patterns match the value of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the one that occurs first in the <font color="blue"><tt>try</tt></font> expression is
selected. If none of the patterns matches the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, the
exception value is raised again, thereby transparently “passing
through” the <font color="blue"><tt>try</tt></font> construct.</p><h3 class="subsection"><a name="toc50"></a><a name="htoc69">6.7.3</a>&nbsp;&nbsp;Operations on data structures</h3><h4 class="subsubsection">Products</h4><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> … <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> evaluates to the
<i>n</i>-tuple of the values of expressions <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>. The
evaluation order for the subexpressions is not specified.</p><h4 class="subsubsection">Variants</h4><p>The expression <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> evaluates to the variant value whose
constructor is <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>, and whose argument is the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>.</p><p>For lists, some syntactic sugar is provided. The expression
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>::</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> stands for the constructor <font color="blue"><tt>(</tt> <tt>::</tt> <tt>)</tt></font> 
applied to the argument <font color="blue"><tt>(</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>,</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>)</tt></font>, and therefore
evaluates to the list whose head is the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> and whose tail
is the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>. The expression <font color="blue"><tt>[</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font>
&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>]</tt></font> is equivalent to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>::</tt></font> … <font color="blue"><tt>::</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>::</tt>
<tt>[]</tt></font>, and therefore evaluates to the list whose elements are the
values of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>.</p><h4 class="subsubsection">Polymorphic variants</h4><p>The expression <font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> evaluates to the polymorphic variant
value whose tag is <i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>, and whose argument is the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>.</p><h4 class="subsubsection">Records</h4><p>The expression <font color="blue"><tt>{</tt></font> <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font>
&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>}</tt></font> evaluates to the record value
{ <i>field</i><sub>1</sub> = <i>v</i><sub>1</sub>; …; <i>field<sub>n</sub></i> = <i>v<sub>n</sub></i> }
where <i>v<sub>i</sub></i> is the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>i</sub></i> for <i>i</i> = 1,… , <i>n</i>.
The fields <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> to <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> must all belong to the same record
types; all fields belonging to this record type must appear exactly
once in the record expression, though they can appear in any
order. The order in which <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> are evaluated is not
specified.</p><p>The expression
<font color="blue"><tt>{</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>with</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>}</tt></font>
builds a fresh record with fields <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> … &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> equal to
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> … &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>, and all other fields having the same value as
in the record <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>. In other terms, it returns a shallow copy of
the record <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>, except for the fields <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> … &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i>,
which are initialized to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> … &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i>.</p><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> evaluates <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to a record
value, and returns the value associated to <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> in this record
value.</p><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> <font color="blue"><tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to a record
value, which is then modified in-place by replacing the value
associated to <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> in this record by the value of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>. This operation is permitted only if <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> has been
declared <font color="blue"><tt>mutable</tt></font> in the definition of the record type. The whole
expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i> <font color="blue"><tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> evaluates to the unit value
<font color="blue"><tt>()</tt></font>.</p><h4 class="subsubsection">Arrays</h4><p>The expression <font color="blue"><tt>[|</tt></font> <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>;</tt></font> … <font color="blue"><tt>;</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> <font color="blue"><tt>|]</tt></font> evaluates to
a <i>n</i>-element array, whose elements are initialized with the values of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> to <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a><sub>n</sub></i> respectively. The order in which these
expressions are evaluated is unspecified.</p><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.(</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>)</tt></font> returns the value of element
number <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> in the array denoted by <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>. The first element
has number 0; the last element has number <i>n</i>−1, where <i>n</i> is the
size of the array. The exception <tt>Invalid_argument</tt> is raised if the
access is out of bounds.</p><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.(</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>)</tt> <tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> modifies in-place
the array denoted by <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>, replacing element number <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> by
the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub>. The exception <tt>Invalid_argument</tt> is raised if
the access is out of bounds. The value of the whole expression is <font color="blue"><tt>()</tt></font>.</p><h4 class="subsubsection">Strings</h4><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.[</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>]</tt></font> returns the value of character
number <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> in the string denoted by <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>. The first character
has number 0; the last character has number <i>n</i>−1, where <i>n</i> is the
length of the string. The exception <tt>Invalid_argument</tt> is raised if the
access is out of bounds.</p><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> <font color="blue"><tt>.[</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> <font color="blue"><tt>]</tt> <tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub> modifies in-place
the string denoted by <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub>, replacing character number <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> by
the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>3</sub>. The exception <tt>Invalid_argument</tt> is raised if
the access is out of bounds. The value of the whole expression is <font color="blue"><tt>()</tt></font>.</p><h3 class="subsection"><a name="toc51"></a><a name="htoc70">6.7.4</a>&nbsp;&nbsp;Operators</h3><p>Symbols from the class <font color="blue"><tt>infix-symbols</tt></font>, as well as the keywords
<tt>*</tt>, <tt>=</tt>, <tt>or</tt> and <tt>&amp;</tt>, can appear in infix position (between two
expressions). Symbols from the class <font color="blue"><tt>prefix-symbols</tt></font>
can appear in prefix position (in front of an expression).</p><p>Infix and prefix symbols do not have a fixed meaning: they are simply
interpreted as applications of functions bound to the names
corresponding to the symbols. The expression <i><a href="lex.html#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> is
interpreted as the application <font color="blue"><tt>(</tt></font> <i><a href="lex.html#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i> <font color="blue"><tt>)</tt></font>
&nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>. Similarly, the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> &nbsp;<i><a href="lex.html#infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub> is
interpreted as the application <font color="blue"><tt>(</tt></font> <i><a href="lex.html#infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i> <font color="blue"><tt>)</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>1</sub> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i><sub>2</sub>.</p><p>The table below lists the symbols defined in the initial environment
and their initial meaning. (See the description of the core
library module <tt>Pervasives</tt> in chapter&nbsp;<a href="manual034.html#c:corelib">20</a> for more
details). Their meaning may be changed at any time using
<font color="blue"><tt>let</tt> <tt>(</tt></font> <i><a href="manual011.html#infix-op" class="syntax"><font color="maroon">infix-op</font></a></i> <font color="blue"><tt>)</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> &nbsp;<font color="maroon"><i>name</i></font><sub>2</sub> <font color="blue"><tt>=</tt></font> …</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Operator</b></td><td align="center" nowrap=""><b>Initial meaning</b></td></tr>
<tr><td valign="top" align="left" nowrap="">
<tt>+</tt></td><td valign="top" align="left">Integer addition.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>-</tt> (infix)</td><td valign="top" align="left">Integer subtraction.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>-</tt> (prefix)</td><td valign="top" align="left">Integer negation.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>*</tt></td><td valign="top" align="left">Integer multiplication.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>/</tt></td><td valign="top" align="left">Integer division.
Raise <tt>Division_by_zero</tt> if second argument is zero.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>mod</tt></td><td valign="top" align="left">Integer modulus. Raise
<tt>Division_by_zero</tt> if second argument is zero.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>land</tt></td><td valign="top" align="left">Bitwise logical “and” on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>lor</tt></td><td valign="top" align="left">Bitwise logical “or” on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>lxor</tt></td><td valign="top" align="left">Bitwise logical “exclusive or” on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>lsl</tt></td><td valign="top" align="left">Bitwise logical shift left on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>lsr</tt></td><td valign="top" align="left">Bitwise logical shift right on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>asr</tt></td><td valign="top" align="left">Bitwise arithmetic shift right on integers.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>+.</tt></td><td valign="top" align="left">Floating-point addition.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>-.</tt> (infix)</td><td valign="top" align="left">Floating-point subtraction.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>-.</tt> (prefix)</td><td valign="top" align="left">Floating-point negation.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>*.</tt></td><td valign="top" align="left">Floating-point multiplication.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>/.</tt></td><td valign="top" align="left">Floating-point division.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>**</tt></td><td valign="top" align="left">Floating-point exponentiation.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>@</tt> </td><td valign="top" align="left">List concatenation.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>^</tt> </td><td valign="top" align="left">String concatenation.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>!</tt> </td><td valign="top" align="left">Dereferencing (return the current
contents of a reference).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>:=</tt></td><td valign="top" align="left">Reference assignment (update the
reference given as first argument with the value of the second
argument).</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>=</tt> </td><td valign="top" align="left">Structural equality test.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>&lt;&gt;</tt> </td><td valign="top" align="left">Structural inequality test.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>==</tt> </td><td valign="top" align="left">Physical equality test.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>!=</tt> </td><td valign="top" align="left">Physical inequality test.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>&lt;</tt> </td><td valign="top" align="left">Test “less than”.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>&lt;=</tt> </td><td valign="top" align="left">Test “less than or equal”.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>&gt;</tt> </td><td valign="top" align="left">Test “greater than”.</td></tr>
<tr><td valign="top" align="left" nowrap=""><tt>&gt;=</tt> </td><td valign="top" align="left">Test “greater than or equal”.</td></tr>
</tbody></table></div><h3 class="subsection"><a name="toc52"></a><a name="htoc71">6.7.5</a>&nbsp;&nbsp;Objects</h3><p> <a name="s:objects"></a></p><h4 class="subsubsection">Object creation</h4><p><a name="@manual.kwd51"></a></p><p>When <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> evaluates to a class body, <font color="blue"><tt>new</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
evaluates to an object containing the instance variables and
methods of this class.</p><p>When <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> evaluates to a class function, <font color="blue"><tt>new</tt></font> <i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i>
evaluates to a function expecting the same number of arguments and
returning a new object of this class.</p><h4 class="subsubsection">Immediate object creation</h4><p><a name="@manual.kwd52"></a></p><p>Creating directly an object through the <font color="blue"><tt>object</tt></font> <i><a href="manual017.html#class-body" class="syntax"><font color="maroon">class-body</font></a></i> <font color="blue"><tt>end</tt></font>
construct is operationally equivalent to defining locally a <font color="blue"><tt>class</tt></font>
<i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i> <font color="blue"><tt>=</tt> <tt>object</tt></font> &nbsp;<i><a href="manual017.html#class-body" class="syntax"><font color="maroon">class-body</font></a></i> <font color="blue"><tt>end</tt></font> —see sections
<a href="manual017.html#ss:class-body">6.9.2</a> and following for the syntax of <i><a href="manual017.html#class-body" class="syntax"><font color="maroon">class-body</font></a></i>—
and immediately creating a single object from it by <font color="blue"><tt>new</tt></font> <i><a href="manual011.html#class-name" class="syntax"><font color="maroon">class-name</font></a></i>.</p><p>The typing of immediate objects is slightly different from explicitely
defining a class in two respects. First, the inferred object type may
contain free type variables. Second, since the class body of an
immediate object will never be extended, its self type can be unified
with a closed object type.</p><h4 class="subsubsection">Message sending</h4><p>The expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>#</tt></font> &nbsp;<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> invokes the method
<i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> of the object denoted by <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>.</p><p>If <i><a href="manual011.html#method-name" class="syntax"><font color="maroon">method-name</font></a></i> is a polymorphic method, its type should be known at
the invocation site. This is true for instance if <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> is the name
of a fresh object (<font color="blue"><tt>let</tt></font> <i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i> = <font color="blue"><tt>new</tt></font> &nbsp;<i><a href="manual011.html#class-path" class="syntax"><font color="maroon">class-path</font></a></i> … ) or if
there is a type constraint. Principality of the derivation can be
checked in the <tt>-principal</tt> mode.</p><h4 class="subsubsection">Accessing and modifying instance variables</h4><p>The instance variables of a class are visible only in the body of the
methods defined in the same class or a class that inherits from the
class defining the instance variables. The expression <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>
evaluates to the value of the given instance variable. The expression
<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> assigns the value of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> to the instance
variable <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>, which must be mutable. The whole expression
<i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>&lt;-</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> evaluates to <font color="blue"><tt>()</tt></font>.</p><h4 class="subsubsection">Object duplication</h4><p>An object can be duplicated using the library function <tt>Oo.copy</tt>
(see 
<a href="../../api/4.00/Oo.html">Module <tt>Oo</tt></a>). Inside a method, the expression
 <font color="blue"><tt>{&lt;</tt></font> <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> &nbsp;{ <font color="blue"><tt>;</tt></font> <i><a href="manual011.html#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> } <font color="blue"><tt>&gt;}</tt></font>
returns a copy of self with the given instance variables replaced by
the values of the associated expressions; other instance variables
have the same value in the returned object as in self.</p><h3 class="subsection"><a name="toc53"></a><a name="htoc72">6.7.6</a>&nbsp;&nbsp;Coercions</h3><p> <a name="s:coercions"></a></p><p>Expressions whose type contains object or polymorphic variant types
can be explicitly coerced (weakened) to a supertype.
The expression <font color="blue"><tt>(</tt></font><i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>:&gt;</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><font color="blue"><tt>)</tt></font> coerces the expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
to type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>.
The expression <font color="blue"><tt>(</tt></font><i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> <font color="blue"><tt>:&gt;</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub><font color="blue"><tt>)</tt></font> coerces the
expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> from type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> to type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>.</p><p>The former operator will sometimes fail to coerce an expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
from a type <i>t</i><sub>1</sub> to a type <i>t</i><sub>2</sub> even if type <i>t</i><sub>1</sub> is a subtype of type
<i>t</i><sub>2</sub>: in the current implementation it only expands two levels of
type abbreviations containing objects and/or polymorphic variants,
keeping only recursion when it is explicit in the class type (for objects).
As an exception to the above algorithm, if both the inferred type of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i>
and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> are ground (<em>i.e.</em> do not contain type variables), the
former operator behaves as the latter one, taking the inferred type of
<i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> as <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub>. In case of failure with the former operator,
the latter one should be used.</p><p>It is only possible to coerce an expression <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> from type
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> to type <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>, if the type of <i><a href="#expr" class="syntax"><font color="maroon">expr</font></a></i> is an instance of
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> (like for a type annotation), and <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> is a subtype
of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>. The type of the coerced expression is an
instance of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>. If the types contain variables,
they may be instantiated by the subtyping algorithm, but this is only
done after determining whether <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> is a potential subtype of
<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>. This means that typing may fail during this latter
unification step, even if some instance of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>1</sub> is a subtype of
some instance of <i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i><sub>2</sub>.
In the following paragraphs we describe the subtyping relation used.</p><h4 class="subsubsection">Object types</h4><p>A fixed object type admits as subtype any object type including all
its methods. The types of the methods shall be subtypes of those in
the supertype. Namely,
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><tt>&lt;&nbsp;</tt>&nbsp;<i>met</i><sub>1</sub>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ</i><sub>1</sub>&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;<i>met<sub>n</sub></i>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ<sub>n</sub></i>&nbsp;<tt>&gt;&nbsp;</tt>&nbsp;</td></tr>
</tbody></table><p>
is a supertype of
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><tt>&lt;&nbsp;</tt>&nbsp;<i>met</i><sub>1</sub>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ</i>′<sub>1</sub>&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;<i>met<sub>n</sub></i>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ</i>′<i><sub>n</sub></i>&nbsp;<tt>&nbsp;;&nbsp;</tt>
<i>met</i><sub><i>n</i>+1</sub>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ</i>′<sub><i>n</i>+1</sub>&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;;&nbsp;</tt>&nbsp;<i>met</i><sub><i>n</i>+<i>m</i></sub>&nbsp;<tt>&nbsp;:&nbsp;</tt>&nbsp;<i>typ</i>′<sub><i>n</i>+<i>m</i></sub>
&nbsp;[<tt>;&nbsp;..</tt>]&nbsp;<tt>&nbsp;&gt;</tt>&nbsp;</td></tr>
</tbody></table><p>
which may contain an ellipsis <tt>..</tt>, if every <i>typ<sub>i</sub></i> is a supertype of
<i>typ</i>′<i><sub>i</sub></i>.</p><p>A monomorphic method type can be a supertype of a polymorphic method
type. Namely, if <font color="maroon"><i>typ</i></font> is an instance of <i>typ</i>′, then <tt>'</tt><i>a</i><sub>1</sub>
...<tt>'</tt><i>a<sub>n</sub></i><tt>.</tt><i>typ</i>′ is a subtype of <font color="maroon"><i>typ</i></font>.</p><p>Inside a class definition, newly defined types are not available for
subtyping, as the type abbreviations are not yet completely
defined. There is an exception for coercing <font color="maroon"><i>self</i></font> to the (exact)
type of its class: this is allowed if the type of <font color="maroon"><i>self</i></font> does not
appear in a contravariant position in the class type, <em>i.e.</em> if
there are no binary methods.</p><h4 class="subsubsection">Polymorphic variant types</h4><p>A polymorphic variant type <font color="maroon"><i>typ</i></font> is subtype of another polymorphic
variant type <i>typ</i>′ if the upper bound of <font color="maroon"><i>typ</i></font> (<em>i.e.</em> the
maximum set of constructors that may appear in an instance of <font color="maroon"><i>typ</i></font>)
is included in the lower bound of <i>typ</i>′, and the types of arguments
for the constructors of <font color="maroon"><i>typ</i></font> are subtypes of those in
<i>typ</i>′. Namely,
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><tt>[</tt>[<tt>&lt;</tt>]&nbsp;<tt>&nbsp;'</tt><i>C</i><sub>1</sub>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>&nbsp;<i>typ</i><sub>1</sub>&nbsp;<tt>&nbsp;|&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;|&nbsp;'</tt><i>C<sub>n</sub></i>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>&nbsp;<i>typ<sub>n</sub></i>&nbsp;<tt>&nbsp;]</tt>&nbsp;</td></tr>
</tbody></table><p>
which may be a shrinkable type, is a subtype of
</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><tt>[</tt>[<tt>&gt;</tt>]&nbsp;<tt>&nbsp;'</tt><i>C</i><sub>1</sub>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>&nbsp;<i>typ</i>′<sub>1</sub>&nbsp;<tt>&nbsp;|&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;|&nbsp;'</tt><i>C<sub>n</sub></i>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>&nbsp;<i>typ</i>′<i><sub>n</sub></i>
<tt>|&nbsp;'</tt><i>C</i><sub><i>n</i>+1</sub>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>&nbsp;<i>typ</i>′<sub><i>n</i>+1</sub>&nbsp;<tt>&nbsp;|&nbsp;</tt>&nbsp;...&nbsp;<tt>&nbsp;|&nbsp;'</tt><i>C</i><sub><i>n</i>+<i>m</i></sub>&nbsp;<tt>&nbsp;<i>of</i>&nbsp;</tt>
<i>typ</i>′<sub><i>n</i>+<i>m</i></sub>&nbsp;<tt>&nbsp;]</tt>&nbsp;</td></tr>
</tbody></table><p>
which may be an extensible type, if every <i>typ<sub>i</sub></i> is a subtype of <i>typ</i>′<i><sub>i</sub></i>.</p><h4 class="subsubsection">Variance</h4><p>Other types do not introduce new subtyping, but they may propagate the
subtyping of their arguments. For instance, <i>typ</i><sub>1</sub> <tt> * </tt> <i>typ</i><sub>2</sub> is a
subtype of <i>typ</i>′<sub>1</sub> <tt> * </tt> <i>typ</i>′<sub>2</sub> when <i>typ</i><sub>1</sub> and <i>typ</i><sub>2</sub> are
respectively subtypes of <i>typ</i>′<sub>1</sub> and <i>typ</i>′<sub>2</sub>.
For function types, the relation is more subtle:
<i>typ</i><sub>1</sub> <tt>-&gt;</tt> <i>typ</i><sub>2</sub> is a subtype of <i>typ</i>′<sub>1</sub> <tt>-&gt;</tt> <i>typ</i>′<sub>2</sub>
if <i>typ</i><sub>1</sub> is a supertype of <i>typ</i>′<sub>1</sub> and <i>typ</i><sub>2</sub> is a
subtype of <i>typ</i>′<sub>2</sub>. For this reason, function types are covariant in
their second argument (like tuples), but contravariant in their first
argument. Mutable types, like <tt>array</tt> or <tt>ref</tt> are neither covariant
nor contravariant, they are nonvariant, that is they do not propagate
subtyping.</p><p>For user defined types, the variance is automatically inferred: a
parameter is covariant if it has only covariant occurences,
contravariant if it has only contravariant occurences,
variance-free if it has no occurences, and nonvariant otherwise.
A variance-free parameter may change freely through subtyping, it does
not have to be a subtype or a supertype.
For abstract and private types, the variance must be given explicitly,
otherwise the default is nonvariant. This is also the case for
constrained arguments in type definitions.</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>