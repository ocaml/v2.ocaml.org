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



<h2 class="section"><a name="htoc52">6.1</a>&nbsp;&nbsp;Lexical conventions</h2><h4 class="subsubsection">Blanks</h4><p>The following characters are considered as blanks: space, newline,
horizontal tabulation, carriage return, line feed and form feed. Blanks are
ignored, but they separate adjacent identifiers, literals and
keywords that would otherwise be confused as one single identifier,
literal or keyword.</p><h4 class="subsubsection">Comments</h4><p>Comments are introduced by the two characters <tt>(*</tt>, with no
intervening blanks, and terminated by the characters <tt>*)</tt>, with
no intervening blanks. Comments are treated as blank characters.
Comments do not occur inside string or character literals. Nested
comments are handled correctly.</p><h4 class="subsubsection">Identifiers</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="ident" class="syntax"><font color="maroon">ident</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;(<i><a href="#letter" class="syntax"><font color="maroon">letter</font></a></i>∣&nbsp;<font color="blue"><tt>_</tt></font>)&nbsp;{&nbsp;<i><a href="#letter" class="syntax"><font color="maroon">letter</font></a></i>∣&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>∣&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="letter" class="syntax"><font color="maroon">letter</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>A</tt></font>&nbsp;…&nbsp;<font color="blue"><tt>Z</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>a</tt></font>&nbsp;…&nbsp;<font color="blue"><tt>z</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>Identifiers are sequences of letters, digits, <tt>_</tt> (the underscore
character), and <tt>'</tt> (the single quote), starting with a
letter or an underscore.
Letters contain at least the 52 lowercase and uppercase
letters from the ASCII set. The current implementation
also recognizes as letters all accented characters from the ISO
8859-1 (“ISO Latin 1”) set. All characters in an identifier are
meaningful. The current implementation accepts identifiers up to
16000000 characters in length.</p><h4 class="subsubsection">Integer literals</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;[<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0x</tt></font>∣&nbsp;<font color="blue"><tt>0X</tt></font>)&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>A</tt></font>…<font color="blue"><tt>F</tt></font>∣&nbsp;<font color="blue"><tt>a</tt></font>…<font color="blue"><tt>f</tt></font>)
{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>A</tt></font>…<font color="blue"><tt>F</tt></font>∣&nbsp;<font color="blue"><tt>a</tt></font>…<font color="blue"><tt>f</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;[<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0o</tt></font>∣&nbsp;<font color="blue"><tt>0O</tt></font>)&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>7</tt></font>)&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>7</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;[<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0b</tt></font>∣&nbsp;<font color="blue"><tt>0B</tt></font>)&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>1</tt></font>)&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>1</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}</td></tr>
</tbody></table></td></tr>
</tbody></table><p>An integer literal is a sequence of one or more digits, optionally
preceded by a minus sign. By default, integer literals are in decimal
(radix 10). The following prefixes select a different radix:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Prefix</b></td><td align="center" nowrap=""><b>Radix</b></td></tr>
<tr><td align="left" nowrap="">
<tt>0x</tt>, <tt>0X</tt></td><td align="left" nowrap="">hexadecimal (radix 16)</td></tr>
<tr><td align="left" nowrap=""><tt>0o</tt>, <tt>0O</tt></td><td align="left" nowrap="">octal (radix 8)</td></tr>
<tr><td align="left" nowrap=""><tt>0b</tt>, <tt>0B</tt></td><td align="left" nowrap="">binary (radix 2)</td></tr>
</tbody></table></div><p>
(The initial <tt>0</tt> is the digit zero; the <tt>O</tt> for octal is the letter O.)
The interpretation of integer literals that fall outside the range of
representable integer values is undefined.</p><p>For convenience and readability, underscore characters (<tt>_</tt>) are accepted
(and ignored) within integer literals.</p><h4 class="subsubsection">Floating-point literals</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="float-literal" class="syntax"><font color="maroon">float-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}&nbsp;[<font color="blue"><tt>.</tt></font>&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}]
[(<font color="blue"><tt>e</tt></font>∣&nbsp;<font color="blue"><tt>E</tt></font>)&nbsp;[<font color="blue"><tt>+</tt></font>∣&nbsp;<font color="blue"><tt>-</tt></font>]&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)&nbsp;{&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>&nbsp;}]</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Floating-point decimals consist in an integer part, a decimal part and
an exponent part. The integer part is a sequence of one or more
digits, optionally preceded by a minus sign. The decimal part is a
decimal point followed by zero, one or more digits.
The exponent part is the character <tt>e</tt> or <tt>E</tt> followed by an
optional <tt>+</tt> or <tt>-</tt> sign, followed by one or more digits.
The decimal part or the exponent part can be omitted, but not both to
avoid ambiguity with integer literals.
The interpretation of floating-point literals that fall outside the
range of representable floating-point values is undefined.</p><p>For convenience and readability, underscore characters (<tt>_</tt>) are accepted
(and ignored) within floating-point literals.</p><h4 class="subsubsection">Character literals</h4><p>
<a name="s:characterliteral"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="char-literal" class="syntax"><font color="maroon">char-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>'</tt></font>&nbsp;<font color="maroon"><i>regular-char</i></font>&nbsp;<font color="blue"><tt>'</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;<i><a href="#escape-sequence" class="syntax"><font color="maroon">escape-sequence</font></a></i>&nbsp;<font color="blue"><tt>'</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="escape-sequence" class="syntax"><font color="maroon">escape-sequence</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>\</tt></font>&nbsp;(<font color="blue"><tt>\</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>"</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>n</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>t</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>b</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>r</tt></font>)
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>\</tt></font>&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>)
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>\x</tt></font>&nbsp;(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>A</tt></font>…<font color="blue"><tt>F</tt></font>∣&nbsp;<font color="blue"><tt>a</tt></font>…<font color="blue"><tt>f</tt></font>)
(<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>A</tt></font>…<font color="blue"><tt>F</tt></font>∣&nbsp;<font color="blue"><tt>a</tt></font>…<font color="blue"><tt>f</tt></font>)</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Character literals are delimited by <tt>'</tt> (single quote) characters.
The two single quotes enclose either one character different from
<tt>'</tt> and <tt>\</tt>, or one of the escape sequences below:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Sequence</b></td><td align="center" nowrap=""><b>Character denoted</b></td></tr>
<tr><td align="left" nowrap="">
<tt>\\</tt></td><td align="left" nowrap="">backslash (<tt>\</tt>)</td></tr>
<tr><td align="left" nowrap=""><tt>\"</tt></td><td align="left" nowrap="">double quote (<tt>"</tt>)</td></tr>
<tr><td align="left" nowrap=""><tt>\'</tt></td><td align="left" nowrap="">single quote (<tt>'</tt>)</td></tr>
<tr><td align="left" nowrap=""><tt>\n</tt></td><td align="left" nowrap="">linefeed (LF)</td></tr>
<tr><td align="left" nowrap=""><tt>\r</tt></td><td align="left" nowrap="">carriage return (CR)</td></tr>
<tr><td align="left" nowrap=""><tt>\t</tt></td><td align="left" nowrap="">horizontal tabulation (TAB)</td></tr>
<tr><td align="left" nowrap=""><tt>\b</tt></td><td align="left" nowrap="">backspace (BS)</td></tr>
<tr><td align="left" nowrap=""><tt>\</tt><i>space</i></td><td align="left" nowrap="">space (SPC)</td></tr>
<tr><td align="left" nowrap=""><tt>\</tt><i>ddd</i></td><td align="left" nowrap="">the character with ASCII code <i>ddd</i> in decimal</td></tr>
<tr><td align="left" nowrap=""><tt>\x</tt><i>hh</i></td><td align="left" nowrap="">the character with ASCII code <i>hh</i> in hexadecimal</td></tr>
</tbody></table></div><h4 class="subsubsection">String literals</h4><p>
<a name="s:stringliteral"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="string-literal" class="syntax"><font color="maroon">string-literal</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>"</tt></font>&nbsp;{&nbsp;<i><a href="#string-character" class="syntax"><font color="maroon">string-character</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>"</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="string-character" class="syntax"><font color="maroon">string-character</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>regular-char-str</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#escape-sequence" class="syntax"><font color="maroon">escape-sequence</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>String literals are delimited by <tt>"</tt> (double quote) characters.
The two double quotes enclose a sequence of either characters
different from <tt>"</tt> and <tt>\</tt>, or escape sequences from the
table given above for character literals.</p><p>To allow splitting long string literals across lines, the sequence
<tt>\</tt><i>newline</i>&nbsp;<i>blanks</i> (a <tt>\</tt> at end-of-line followed by any
number of blanks at the beginning of the next line) is ignored inside
string literals.</p><p>The current implementation places practically no restrictions on the
length of string literals.</p><h4 class="subsubsection">Naming labels</h4><p>To avoid ambiguities, naming labels in expressions cannot just be defined
syntactically as the sequence of the three tokens <tt>~</tt>, <i><a href="#ident" class="syntax"><font color="maroon">ident</font></a></i> and
<tt>:</tt>, and have to be defined at the lexical level.</p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;</td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;(<font color="blue"><tt>a</tt></font>&nbsp;…&nbsp;<font color="blue"><tt>z</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>)&nbsp;{&nbsp;<i><a href="#letter" class="syntax"><font color="maroon">letter</font></a></i>∣&nbsp;<font color="blue"><tt>0</tt></font>…<font color="blue"><tt>9</tt></font>∣&nbsp;<font color="blue"><tt>_</tt></font>∣&nbsp;<font color="blue"><tt>'</tt></font>&nbsp;}&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="label" class="syntax"><font color="maroon">label</font></a></i>&nbsp;</td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>~</tt></font>&nbsp;<i><a href="#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="optlabel" class="syntax"><font color="maroon">optlabel</font></a></i>&nbsp;</td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;<i><a href="#label-name" class="syntax"><font color="maroon">label-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>Naming labels come in two flavours: <i><a href="#label" class="syntax"><font color="maroon">label</font></a></i> for normal arguments and
<i><a href="#optlabel" class="syntax"><font color="maroon">optlabel</font></a></i> for optional ones. They are simply distinguished by their
first character, either <tt>~</tt> or <tt>?</tt>.</p><p>Despite <i><a href="#label" class="syntax"><font color="maroon">label</font></a></i> and <i><a href="#optlabel" class="syntax"><font color="maroon">optlabel</font></a></i> being lexical entities in expressions,
their expansions <font color="blue"><tt>~</tt></font> <i><a href="#label-name" class="syntax"><font color="maroon">label-name</font></a></i> <font color="blue"><tt>:</tt></font> and <font color="blue"><tt>?</tt></font> <i><a href="#label-name" class="syntax"><font color="maroon">label-name</font></a></i> <font color="blue"><tt>:</tt></font> will be
used in grammars, for the sake of readability. Note also that inside
type expressions, this expansion can be taken literally, <em>i.e.</em>
there are really 3 tokens, with optional spaces beween them.</p><h4 class="subsubsection">Prefix and infix symbols</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
(<font color="blue"><tt>=</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&lt;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&gt;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>@</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>^</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&amp;</tt></font>&nbsp;∣&nbsp;
<font color="blue"><tt>+</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>-</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>/</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>$</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>%</tt></font>)&nbsp;{&nbsp;<i><a href="#operator-char" class="syntax"><font color="maroon">operator-char</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>!</tt></font>&nbsp;{&nbsp;<i><a href="#operator-char" class="syntax"><font color="maroon">operator-char</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;(<font color="blue"><tt>?</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>~</tt></font>)&nbsp;{&nbsp;<i><a href="#operator-char" class="syntax"><font color="maroon">operator-char</font></a></i>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="operator-char" class="syntax"><font color="maroon">operator-char</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>!</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>$</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>%</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&amp;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>+</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>-</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;∣&nbsp;
<font color="blue"><tt>/</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&lt;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&gt;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>?</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>@</tt></font>&nbsp;∣&nbsp;
<font color="blue"><tt>^</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>|</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>~</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Sequences of “operator characters”, such as <tt>&lt;=&gt;</tt> or <tt>!!</tt>,
are read as a single token from the <i><a href="#infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i> or <i><a href="#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i>
class. These symbols are parsed as prefix and infix operators inside
expressions, but otherwise behave like normal identifiers.
</p><h4 class="subsubsection">Keywords</h4><p>The identifiers below are reserved as keywords, and cannot be employed
otherwise:
</p><pre>      and         as          assert      asr         begin       class
      constraint  do          done        downto      else        end
      exception   external    false       for         fun         function
      functor     if          in          include     inherit     initializer
      land        lazy        let         lor         lsl         lsr
      lxor        match       method      mod         module      mutable
      new         object      of          open        or          private
      rec         sig         struct      then        to          true
      try         type        val         virtual     when        while
      with
</pre><p>The following character sequences are also keywords:
</p><pre><tt>    !=    #     &amp;     &amp;&amp;    '     (     )     *     +     ,     -</tt>
<tt>    -.    -&gt;    .     ..    :     ::    :=    :&gt;    ;     ;;    &lt;</tt>
<tt>    &lt;-    =     &gt;     &gt;]    &gt;}    ?     ??    [     [&lt;    [&gt;    [|</tt>
<tt>    ]     _     `     {     {&lt;    |     |]    }     ~</tt>
</pre><p>
Note that the following identifiers are keywords of the Camlp4
extensions and should be avoided for compatibility reasons.
</p><pre>    parser    value   &lt;&lt;    &lt;:    &gt;&gt;    $     $$    $:
</pre><h4 class="subsubsection">Ambiguities</h4><p>Lexical ambiguities are resolved according to the “longest match”
rule: when a character sequence can be decomposed into two tokens in
several different ways, the decomposition retained is the one with the
longest first token.</p><h4 class="subsubsection">Line number directives</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="linenum-directive" class="syntax"><font color="maroon">linenum-directive</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>#</tt></font>&nbsp;{<font color="blue"><tt>0</tt></font>&nbsp;…&nbsp;<font color="blue"><tt>9</tt></font>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>#</tt></font>&nbsp;{<font color="blue"><tt>0</tt></font>&nbsp;…&nbsp;<font color="blue"><tt>9</tt></font>}<sup>+</sup>&nbsp;<font color="blue"><tt>"</tt></font>&nbsp;{&nbsp;<i><a href="#string-character" class="syntax"><font color="maroon">string-character</font></a></i>&nbsp;}&nbsp;<font color="blue"><tt>"</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Preprocessors that generate OCaml source code can insert line number
directives in their output so that error messages produced by the
compiler contain line numbers and file names referring to the source
file before preprocessing, instead of after preprocessing.
A line number directive is composed of a <tt>#</tt> (sharp sign), followed by
a positive integer (the source line number), optionally followed by a
character string (the source file name).
Line number directives are treated as blank characters during lexical
analysis.</p>




</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>