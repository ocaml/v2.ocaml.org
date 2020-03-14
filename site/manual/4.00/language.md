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
<li><a href="lex.html">Lexical conventions</a>
</li><li><a href="manual010.html">Values</a>
</li><li><a href="manual011.html">Names</a>
</li><li><a href="types.html">Type expressions</a>
</li><li><a href="manual013.html">Constants</a>
</li><li><a href="patterns.html">Patterns</a>
</li><li><a href="expr.html">Expressions</a>
</li><li><a href="manual016.html">Type and exception definitions</a>
</li><li><a href="manual017.html">Classes</a>
</li><li><a href="manual018.html">Module types (module specifications)</a>
</li><li><a href="manual019.html">Module expressions (module implementations)</a>
</li><li><a href="manual020.html">Compilation units</a>
</li></ul></nav></header>
<hr>









<h2 class="section"><a name="htoc52">1</a>&nbsp;&nbsp;Lexical conventions</h2><h4 class="subsubsection">Blanks</h4><p>The following characters are considered as blanks: space, newline,
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









<h2 class="section"><a name="htoc53">2</a>&nbsp;&nbsp;Values</h2><ul>
<li><a href="#toc40">Base values</a>
</li><li><a href="#toc41">Tuples</a>
</li><li><a href="#toc42">Records</a>
</li><li><a href="#toc43">Arrays</a>
</li><li><a href="#toc44">Variant values</a>
</li><li><a href="#toc45">Polymorphic variants</a>
</li><li><a href="#toc46">Functions</a>
</li><li><a href="#toc47">Objects</a>
</li></ul>
<p>This section describes the kinds of values that are manipulated by
OCaml programs.</p><h3 class="subsection"><a name="toc40"></a><a name="htoc54">6.2.1</a>&nbsp;&nbsp;Base values</h3><h4 class="subsubsection">Integer numbers</h4><p>Integer values are integer numbers from −2<sup>30</sup> to 2<sup>30</sup>−1, that
is −1073741824 to 1073741823. The implementation may support a
wider range of integer values: on 64-bit platforms, the current
implementation supports integers ranging from −2<sup>62</sup> to 2<sup>62</sup>−1.</p><h4 class="subsubsection">Floating-point numbers</h4><p>Floating-point values are numbers in floating-point representation.
The current implementation uses double-precision floating-point
numbers conforming to the IEEE 754 standard, with 53 bits of mantissa
and an exponent ranging from −1022 to 1023.</p><h4 class="subsubsection">Characters</h4><p>Character values are represented as 8-bit integers between 0 and 255.
Character codes between 0 and 127 are interpreted following the ASCII
standard. The current implementation interprets character codes
between 128 and 255 following the ISO 8859-1 standard.</p><h4 class="subsubsection">Character strings</h4><p> <a name="s:string-val"></a></p><p>String values are finite sequences of characters. The current
implementation supports strings containing up to 2<sup>24</sup> − 5
characters (16777211 characters); on 64-bit platforms, the limit is
2<sup>57</sup> − 9.</p><h3 class="subsection"><a name="toc41"></a><a name="htoc55">6.2.2</a>&nbsp;&nbsp;Tuples</h3><p>Tuples of values are written (<i>v</i><sub>1</sub>, …, <i>v<sub>n</sub></i>), standing for the
<i>n</i>-tuple of values <i>v</i><sub>1</sub> to <i>v<sub>n</sub></i>. The current implementation
supports tuple of up to 2<sup>22</sup> − 1 elements (4194303 elements).</p><h3 class="subsection"><a name="toc42"></a><a name="htoc56">6.2.3</a>&nbsp;&nbsp;Records</h3><p>Record values are labeled tuples of values. The record value written
<font color="blue"><tt>{</tt></font> <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a></i><sub>1</sub> <font color="blue"><tt>=</tt></font> <font color="maroon"><i>v</i></font><sub>1</sub><font color="blue"><tt>;</tt></font> …<font color="blue"><tt>;</tt></font> &nbsp;<i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>n</sub></i> <font color="blue"><tt>=</tt></font> <i><font color="maroon">v</font><sub>n</sub></i> <font color="blue"><tt>}</tt></font> associates the value
<i>v<sub>i</sub></i> to the record field <i><a href="manual011.html#field" class="syntax"><font color="maroon">field</font></a><sub>i</sub></i>, for <i>i</i> = 1 … <i>n</i>. The current
implementation supports records with up to 2<sup>22</sup> − 1 fields
(4194303 fields).</p><h3 class="subsection"><a name="toc43"></a><a name="htoc57">6.2.4</a>&nbsp;&nbsp;Arrays</h3><p>Arrays are finite, variable-sized sequences of values of the same
type. The current implementation supports arrays containing up to
2<sup>22</sup> − 1 elements (4194303 elements) unless the elements are
floating-point numbers (2097151 elements in this case); on 64-bit
platforms, the limit is 2<sup>54</sup> − 1 for all arrays.</p><h3 class="subsection"><a name="toc44"></a><a name="htoc58">6.2.5</a>&nbsp;&nbsp;Variant values</h3><p>Variant values are either a constant constructor, or a non-constant
constructor applied to a number of values. The former case is written
<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>; the latter case is written <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i> <font color="blue"><tt>(</tt></font><font color="maroon"><i>v</i></font><sub>1</sub><font color="blue"><tt>,</tt></font> ... <font color="blue"><tt>,</tt></font> <i><font color="maroon">v</font><sub>n</sub></i>
<font color="blue"><tt>)</tt></font>, where the <i><font color="maroon">v</font><sub>i</sub></i> are said to be the arguments of the non-constant
constructor <i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>. The parentheses may be omitted if there is only
one argument.</p><p>The following constants are treated like built-in constant
constructors:
</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Constant</b></td><td align="center" nowrap=""><b>Constructor</b></td></tr>
<tr><td align="left" nowrap="">
<tt>false</tt></td><td align="left" nowrap="">the boolean false</td></tr>
<tr><td align="left" nowrap=""><tt>true</tt></td><td align="left" nowrap="">the boolean true</td></tr>
<tr><td align="left" nowrap=""><tt>()</tt></td><td align="left" nowrap="">the “unit” value</td></tr>
<tr><td align="left" nowrap=""><tt>[]</tt></td><td align="left" nowrap="">the empty list</td></tr>
</tbody></table></div><p>The current implementation limits each variant type to have at most
246 non-constant constructors and 2<sup>30</sup>−1 constant constructors.</p><h3 class="subsection"><a name="toc45"></a><a name="htoc59">6.2.6</a>&nbsp;&nbsp;Polymorphic variants</h3><p>Polymorphic variants are an alternate form of variant values, not
belonging explicitly to a predefined variant type, and following
specific typing rules. They can be either constant, written
<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>, or non-constant, written <font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>(<i>v</i>).</p><h3 class="subsection"><a name="toc46"></a><a name="htoc60">6.2.7</a>&nbsp;&nbsp;Functions</h3><p>Functional values are mappings from values to values.</p><h3 class="subsection"><a name="toc47"></a><a name="htoc61">6.2.8</a>&nbsp;&nbsp;Objects</h3><p>Objects are composed of a hidden internal state which is a
record of instance variables, and a set of methods for accessing and
modifying these variables. The structure of an object is described by
the toplevel class that created it.</p>










<h2 class="section"><a name="htoc62">3</a>&nbsp;&nbsp;Names</h2><p> <a name="s:names"></a>
</p><p>Identifiers are used to give names to several classes of language
objects and refer to these objects by name later:
</p><ul class="itemize"><li class="li-itemize">
value names (syntactic class <i><a href="#value-name" class="syntax"><font color="maroon">value-name</font></a></i>),
</li><li class="li-itemize">value constructors and exception constructors (class <i><a href="#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>),
</li><li class="li-itemize">labels (<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i>),
</li><li class="li-itemize">polymorphic variant tags (<i><a href="#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i>),
</li><li class="li-itemize">type constructors (<i><a href="#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>),
</li><li class="li-itemize">record fields (<i><a href="#field-name" class="syntax"><font color="maroon">field-name</font></a></i>),
</li><li class="li-itemize">class names (<i><a href="#class-name" class="syntax"><font color="maroon">class-name</font></a></i>),
</li><li class="li-itemize">method names (<i><a href="#method-name" class="syntax"><font color="maroon">method-name</font></a></i>),
</li><li class="li-itemize">instance variable names (<i><a href="#inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i>),
</li><li class="li-itemize">module names (<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>),
</li><li class="li-itemize">module type names (<i><a href="#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>).
</li></ul><p>
These eleven name spaces are distinguished both by the context and by the
capitalization of the identifier: whether the first letter of the
identifier is in lowercase (written <font color="maroon"><i>lowercase-ident</i></font> below) or in
uppercase (written <font color="maroon"><i>capitalized-ident</i></font>). Underscore is considered a
lowercase letter for this purpose.</p><p><a name="@manual.kwd0"></a>
<a name="@manual.kwd1"></a></p><h4 class="subsubsection">Naming objects</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="value-name" class="syntax"><font color="maroon">value-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#operator-name" class="syntax"><font color="maroon">operator-name</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="operator-name" class="syntax"><font color="maroon">operator-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#prefix-symbol" class="syntax"><font color="maroon">prefix-symbol</font></a></i>&nbsp;∣&nbsp;&nbsp;<i><a href="#infix-op" class="syntax"><font color="maroon">infix-op</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="infix-op" class="syntax"><font color="maroon">infix-op</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#infix-symbol" class="syntax"><font color="maroon">infix-symbol</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>*</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>or</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>&amp;</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>:=</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>mod</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>land</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lor</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lxor</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lsl</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>lsr</tt></font>&nbsp;∣&nbsp;&nbsp;<font color="blue"><tt>asr</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="constr-name" class="syntax"><font color="maroon">constr-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>capitalized-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a href="lex.html#label-name" class="syntax"><font color="maroon">label-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="tag-name" class="syntax"><font color="maroon">tag-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="field-name" class="syntax"><font color="maroon">field-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="module-name" class="syntax"><font color="maroon">module-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>capitalized-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#ident" class="syntax"><font color="maroon">ident</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-name" class="syntax"><font color="maroon">class-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="inst-var-name" class="syntax"><font color="maroon">inst-var-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="method-name" class="syntax"><font color="maroon">method-name</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="maroon"><i>lowercase-ident</i></font></td></tr>
</tbody></table></td></tr>
</tbody></table><p>
As shown above, prefix and infix symbols as well as some keywords can
be used as value names, provided they are written between parentheses.
The capitalization rules are summarized in the table below.</p><div class="center"><table border="1" cellspacing="0" cellpadding="1" width="80%"><tbody><tr><td align="center" nowrap=""><b>Name space</b></td><td align="center" nowrap=""><b>Case of first letter</b></td></tr>
<tr><td align="left" nowrap="">
Values</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Constructors</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Labels</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Polymorphic variant tags</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Exceptions</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Type constructors</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Record fields</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Classes</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Instance variables</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Methods</td><td align="left" nowrap="">lowercase</td></tr>
<tr><td align="left" nowrap="">Modules</td><td align="left" nowrap="">uppercase</td></tr>
<tr><td align="left" nowrap="">Module types</td><td align="left" nowrap="">any</td></tr>
</tbody></table></div><p><i>Note on polymorphic variant tags:</i> the current implementation accepts
lowercase variant tags in addition to uppercase variant tags, but we
suggest you avoid lowercase variant tags for portability and
compatibility with future OCaml versions.</p><h4 class="subsubsection">Referring to named objects</h4><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="value-path" class="syntax"><font color="maroon">value-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#value-name" class="syntax"><font color="maroon">value-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="constr" class="syntax"><font color="maroon">constr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="typeconstr" class="syntax"><font color="maroon">typeconstr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#typeconstr-name" class="syntax"><font color="maroon">typeconstr-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="field" class="syntax"><font color="maroon">field</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#field-name" class="syntax"><font color="maroon">field-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="module-path" class="syntax"><font color="maroon">module-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
{&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;}&nbsp;&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#module-name" class="syntax"><font color="maroon">module-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="modtype-path" class="syntax"><font color="maroon">modtype-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="class-path" class="syntax"><font color="maroon">class-path</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
[&nbsp;<i><a href="#module-path" class="syntax"><font color="maroon">module-path</font></a></i>&nbsp;<font color="blue"><tt>.</tt></font>&nbsp;]&nbsp;&nbsp;<i><a href="#class-name" class="syntax"><font color="maroon">class-name</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>A named object can be referred to either by its name (following the
usual static scoping rules for names) or by an access path <font color="maroon"><i>prefix</i></font> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font>,
where <font color="maroon"><i>prefix</i></font> designates a module and <font color="maroon"><i>name</i></font> is the name of an object
defined in that module. The first component of the path, <font color="maroon"><i>prefix</i></font>, is
either a simple module name or an access path <font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>2</sub> …,
in case the defining module is itself nested inside other modules.
For referring to type constructors or module types, the <font color="maroon"><i>prefix</i></font> can
also contain simple functor applications (as in the syntactic class
<i><a href="#extended-module-path" class="syntax"><font color="maroon">extended-module-path</font></a></i> above), in case the defining module is the
result of a functor application.</p><p>Label names, tag names, method names and instance variable names need
not be qualified: the former three are global labels, while the latter
are local to a class.

</p>










<h2 class="section"><a name="htoc63">4</a>&nbsp;&nbsp;Type expressions</h2><p>
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










<h2 class="section"><a name="htoc64">5</a>&nbsp;&nbsp;Constants</h2><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="constant" class="syntax"><font color="maroon">constant</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="lex.html#integer-literal" class="syntax"><font color="maroon">integer-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#float-literal" class="syntax"><font color="maroon">float-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#char-literal" class="syntax"><font color="maroon">char-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="lex.html#string-literal" class="syntax"><font color="maroon">string-literal</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>false</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>true</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>()</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>[||]</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>`</tt></font><i><a href="manual011.html#tag-name" class="syntax"><font color="maroon">tag-name</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><p>The syntactic class of constants comprises literals from the four
base types (integers, floating-point numbers, characters, character
strings), and constant constructors from both normal and polymorphic
variants, as well as the special constants <tt>false</tt>, <tt>true</tt>, <tt>()</tt>,
<tt>[]</tt>, and <tt>[||]</tt>, which behave like constant constructors.

</p>










<h2 class="section"><a name="htoc65">6</a>&nbsp;&nbsp;Patterns</h2><p>

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










<h2 class="section"><a name="htoc66">7</a>&nbsp;&nbsp;Expressions<a name="s:value-expr"></a></h2><ul>
<li><a href="#toc48">Basic expressions</a>
</li><li><a href="#toc49">Control structures</a>
</li><li><a href="#toc50">Operations on data structures</a>
</li><li><a href="#toc51">Operators</a>
</li><li><a href="#toc52">Objects</a>
</li><li><a href="#toc53">Coercions</a>
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










<h2 class="section"><a name="htoc73">8</a>&nbsp;&nbsp;Type and exception definitions</h2><ul>
<li><a href="#toc54">Type definitions</a>
</li><li><a href="#toc55">Exception definitions</a>
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










<h2 class="section"><a name="htoc76">9</a>&nbsp;&nbsp;Classes</h2><ul>
<li><a href="#toc56">Class types</a>
</li><li><a href="#toc57">Class expressions</a>
</li><li><a href="#toc58">Class definitions</a>
</li><li><a href="#toc59">Class specification</a>
</li><li><a href="#toc60">Class type definitions</a>
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










<h2 class="section"><a name="htoc82">10</a>&nbsp;&nbsp;Module types (module specifications)</h2><ul>
<li><a href="#toc61">Simple module types</a>
</li><li><a href="#toc62">Signatures</a>
</li><li><a href="#toc63">Functor types</a>
</li><li><a href="#toc64">The <tt>with</tt> operator</a>
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










<h2 class="section"><a name="htoc87">11</a>&nbsp;&nbsp;Module<a name="s:module-expr"></a> expressions (module implementations)</h2><ul>
<li><a href="#toc65">Simple module expressions</a>
</li><li><a href="#toc66">Structures</a>
</li><li><a href="#toc67">Functors</a>
</li></ul>
<p>Module expressions are the module-level equivalent of value
expressions: they evaluate to modules, thus providing implementations
for the specifications expressed in module types.</p><p><a name="@manual.kwd147"></a>
<a name="@manual.kwd148"></a>
<a name="@manual.kwd149"></a>
<a name="@manual.kwd150"></a>
<a name="@manual.kwd151"></a>
<a name="@manual.kwd152"></a>
<a name="@manual.kwd153"></a>
<a name="@manual.kwd154"></a>
<a name="@manual.kwd155"></a>
<a name="@manual.kwd156"></a>
<a name="@manual.kwd157"></a></p><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>struct</tt></font>&nbsp;{&nbsp;<i><a href="#definition" class="syntax"><font color="maroon">definition</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;∣&nbsp;&nbsp;<i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>&nbsp;<font color="blue"><tt>;;</tt></font>&nbsp;}&nbsp;<font color="blue"><tt>end</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>functor</tt></font>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;<font color="blue"><tt>-&gt;</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="definition" class="syntax"><font color="maroon">definition</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">
<font color="blue"><tt>let</tt></font>&nbsp;[<font color="blue"><tt>rec</tt></font>]&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>and</tt></font>&nbsp;<i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i>&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>external</tt></font>&nbsp;<i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<font color="maroon"><i>external-declaration</i></font>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual016.html#type-definition" class="syntax"><font color="maroon">type-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual016.html#exception-definition" class="syntax"><font color="maroon">exception-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#class-definition" class="syntax"><font color="maroon">class-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<i><a href="manual017.html#classtype-definition" class="syntax"><font color="maroon">classtype-definition</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;&nbsp;{&nbsp;<font color="blue"><tt>(</tt></font>&nbsp;<i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;<font color="blue"><tt>)</tt></font>&nbsp;}
&nbsp;[&nbsp;<font color="blue"><tt>:</tt></font>&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>&nbsp;]&nbsp;&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>module</tt></font>&nbsp;<font color="blue"><tt>type</tt></font>&nbsp;<i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i>&nbsp;<font color="blue"><tt>=</tt></font>&nbsp;&nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>open</tt></font>&nbsp;<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td><td align="center" nowrap="">∣</td><td align="left" nowrap="">&nbsp;<font color="blue"><tt>include</tt></font>&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i></td></tr>
</tbody></table></td></tr>
</tbody></table><h3 class="subsection"><a name="toc65"></a><a name="htoc88">6.11.1</a>&nbsp;&nbsp;Simple module expressions</h3><p>The expression <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> evaluates to the module bound to the name
<i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>)</tt></font> evaluates to the same module as
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>.</p><p>The expression <font color="blue"><tt>(</tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt></font> checks that the
type of <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> is a subtype of <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>, that is, that all
components specified in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> are implemented in
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, and their implementation meets the requirements given
in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>. In other terms, it checks that the implementation
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> meets the type specification <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>. The whole
expression evaluates to the same module as <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, except that
all components not specified in <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> are hidden and can no
longer be accessed.</p><h3 class="subsection"><a name="toc66"></a><a name="htoc89">6.11.2</a>&nbsp;&nbsp;Structures</h3><p><a name="@manual.kwd158"></a>
<a name="@manual.kwd159"></a></p><p>Structures <font color="blue"><tt>struct</tt></font> … <font color="blue"><tt>end</tt></font> are collections of definitions for
value names, type names, exceptions, module names and module type
names. The definitions are evaluated in the order in which they appear
in the structure. The scope of the bindings performed by the
definitions extend to the end of the structure. As a consequence, a
definition may refer to names bound by earlier definitions in the same
structure.</p><p>For compatibility with toplevel phrases (chapter&nbsp;<a href="manual023.html#c:camllight">9</a>)
and with Caml Light, an optional <tt>;;</tt> is allowed after each
definition in a structure. The <tt>;;</tt> has no semantic meaning. Also for
compatibility, <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> <font color="blue"><tt>;;</tt></font> is allowed as a component of a structure,
meaning <font color="blue"><tt>let</tt> <tt>_</tt> <tt>=</tt></font> <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i>, i.e. evaluate <i><a href="expr.html#expr" class="syntax"><font color="maroon">expr</font></a></i> for its side-effects.
In this case, the <tt>;;</tt> of the previous component is not optional.</p><h4 class="subsubsection">Value definitions</h4><p><a name="@manual.kwd160"></a></p><p>A value definition <font color="blue"><tt>let</tt></font> [<font color="blue"><tt>rec</tt></font>] <i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="expr.html#let-binding" class="syntax"><font color="maroon">let-binding</font></a></i> }
bind value names in the same way as a <font color="blue"><tt>let</tt></font> … <font color="blue"><tt>in</tt></font> … expression
(see section&nbsp;<a href="expr.html#s:localdef">6.7.1</a>). The value names appearing in the
left-hand sides of the bindings are bound to the corresponding values
in the right-hand sides.</p><p><a name="@manual.kwd161"></a></p><p>A value definition <font color="blue"><tt>external</tt></font> <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="types.html#typexpr" class="syntax"><font color="maroon">typexpr</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<font color="maroon"><i>external-declaration</i></font>
implements <i><a href="manual011.html#value-name" class="syntax"><font color="maroon">value-name</font></a></i> as the external function specified in
<font color="maroon"><i>external-declaration</i></font> (see chapter&nbsp;<a href="manual033.html#c:intf-c">19</a>).</p><h4 class="subsubsection">Type definitions</h4><p><a name="@manual.kwd162"></a></p><p>A definition of one or several type components is written
<font color="blue"><tt>type</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual016.html#typedef" class="syntax"><font color="maroon">typedef</font></a></i> } and consists of a sequence
of mutually recursive definitions of type names.</p><h4 class="subsubsection">Exception definitions</h4><p><a name="@manual.kwd163"></a></p><p>Exceptions are defined with the syntax <font color="blue"><tt>exception</tt></font> <i><a href="manual016.html#constr-decl" class="syntax"><font color="maroon">constr-decl</font></a></i>
or <font color="blue"><tt>exception</tt></font> <i><a href="manual011.html#constr-name" class="syntax"><font color="maroon">constr-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual011.html#constr" class="syntax"><font color="maroon">constr</font></a></i>.</p><h4 class="subsubsection">Class definitions</h4><p><a name="@manual.kwd164"></a></p><p>A definition of one or several classes is written <font color="blue"><tt>class</tt></font>
<i><a href="manual017.html#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#class-binding" class="syntax"><font color="maroon">class-binding</font></a></i> } and consists of a sequence of
mutually recursive definitions of class names. Class definitions are
described more precisely in section&nbsp;<a href="manual017.html#s:classdef">6.9.3</a>.</p><h4 class="subsubsection">Class type definitions</h4><p><a name="@manual.kwd165"></a>
<a name="@manual.kwd166"></a></p><p>A definition of one or several classes is written
<font color="blue"><tt>class</tt> <tt>type</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> &nbsp;{ <font color="blue"><tt>and</tt></font> <i><a href="manual017.html#classtype-def" class="syntax"><font color="maroon">classtype-def</font></a></i> } and consists of
a sequence of mutually recursive definitions of class type names.
Class type definitions are described more precisely in
section&nbsp;<a href="manual017.html#s:classtype">6.9.5</a>.</p><h4 class="subsubsection">Module definitions</h4><p><a name="@manual.kwd167"></a></p><p>The basic form for defining a module component is
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>, which evaluates <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> and binds
the result to the name <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i>.</p><p>One can write
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><p>
instead of
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt> <tt>(</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt></font>.
</div><p>
Another derived form is
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt></font> …
<font color="blue"><tt>(</tt></font> &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a><sub>n</sub></i> <font color="blue"><tt>)</tt> <tt>=</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><p>
which is equivalent to
</p><div class="center">
<font color="blue"><tt>module</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>=</tt>
<tt>functor</tt> <tt>(</tt></font> &nbsp;<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font> …
<font color="blue"><tt>-&gt;</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>
</div><h4 class="subsubsection">Module type definitions</h4><p><a name="@manual.kwd168"></a>
<a name="@manual.kwd169"></a></p><p>A definition for a module type is written
<font color="blue"><tt>module</tt> <tt>type</tt></font> <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> <font color="blue"><tt>=</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.
It binds the name <i><a href="manual011.html#modtype-name" class="syntax"><font color="maroon">modtype-name</font></a></i> to the module type denoted by the
expression <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i>.</p><h4 class="subsubsection">Opening a module path</h4><p><a name="@manual.kwd170"></a></p><p>The expression <font color="blue"><tt>open</tt></font> <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> in a structure does not define any
components nor perform any bindings. It simply affects the parsing of
the following items of the structure, allowing components of the
module denoted by <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> to be referred to by their simple names
<font color="maroon"><i>name</i></font> instead of path accesses <i><a href="manual011.html#module-path" class="syntax"><font color="maroon">module-path</font></a></i> <font color="blue"><tt>.</tt></font> &nbsp;<font color="maroon"><i>name</i></font>. The scope of
the <tt>open</tt> stops at the end of the structure expression.</p><h4 class="subsubsection">Including the components of another structure</h4><p><a name="@manual.kwd171"></a></p><p>The expression <font color="blue"><tt>include </tt></font> <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> in a structure re-exports in
the current structure all definitions of the structure denoted by
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i>. For instance, if the identifier <tt>S</tt> is bound to the
module
</p><pre>        struct type t = int  let x = 2 end
</pre><p>the module expression
</p><pre>        struct include S  let y = (x + 1 : t) end
</pre><p>is equivalent to the module expression
</p><pre>        struct type t = S.t  let x = S.x  let y = (x + 1 : t) end
</pre><p>The difference between <font color="blue"><tt>open</tt></font> and <font color="blue"><tt>include</tt></font> is that <font color="blue"><tt>open</tt></font>
simply provides short names for the components of the opened
structure, without defining any components of the current structure,
while <font color="blue"><tt>include</tt></font> also adds definitions for the components of the
included structure.</p><h3 class="subsection"><a name="toc67"></a><a name="htoc90">6.11.3</a>&nbsp;&nbsp;Functors</h3><h4 class="subsubsection">Functor definition</h4><p><a name="@manual.kwd172"></a></p><p>The expression <font color="blue"><tt>functor</tt> <tt>(</tt></font> <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> <font color="blue"><tt>:</tt></font> &nbsp;<i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i> <font color="blue"><tt>)</tt> <tt>-&gt;</tt></font>
&nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> evaluates to a functor that takes as argument modules of
the type <i><a href="manual018.html#module-type" class="syntax"><font color="maroon">module-type</font></a></i><sub>1</sub>, binds <i><a href="manual011.html#module-name" class="syntax"><font color="maroon">module-name</font></a></i> to these modules,
evaluates <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i> in the extended environment, and returns the
resulting modules as results. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p><h4 class="subsubsection">Functor application</h4><p>The expression <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub> <font color="blue"><tt>(</tt></font> &nbsp;<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> <font color="blue"><tt>)</tt></font> evaluates
<i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub> to a functor and <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> to a module, and
applies the former to the latter. The type of <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>2</sub> must
match the type expected for the arguments of the functor <i><a href="#module-expr" class="syntax"><font color="maroon">module-expr</font></a></i><sub>1</sub>.</p>









<h2 class="section"><a name="htoc91">12</a>&nbsp;&nbsp;Compilation units</h2><table class="display dcenter"><tbody><tr valign="middle"><td class="dcell"><table cellspacing="6" cellpadding="0"><tbody><tr><td align="right" nowrap="">
<i><a name="unit-interface" class="syntax"><font color="maroon">unit-interface</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;{&nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;}
&nbsp;</td></tr>
<tr><td align="right" nowrap="">&nbsp;</td></tr>
<tr><td align="right" nowrap="">
<i><a name="unit-implementation" class="syntax"><font color="maroon">unit-implementation</font></a></i></td><td align="center" nowrap="">::=</td><td align="left" nowrap="">&nbsp;{&nbsp;<i><a href="manual019.html#definition" class="syntax"><font color="maroon">definition</font></a></i>&nbsp;&nbsp;[<font color="blue"><tt>;;</tt></font>]&nbsp;}</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Compilation units bridge the module system and the separate
compilation system. A compilation unit is composed of two parts: an
interface and an implementation. The interface contains a sequence of
specifications, just as the inside of a <font color="blue"><tt>sig</tt></font> … <font color="blue"><tt>end</tt></font>
signature expression. The implementation contains a sequence of
definitions, just as the inside of a <font color="blue"><tt>struct</tt></font> … <font color="blue"><tt>end</tt></font> module
expression. A compilation unit also has a name <font color="maroon"><i>unit-name</i></font>, derived
from the names of the files containing the interface and the
implementation (see chapter&nbsp;<a href="manual022.html#c:camlc">8</a> for more details). A
compilation unit behaves roughly as the module definition
</p><div class="center">
<font color="blue"><tt>module</tt> <font color="maroon"><i>unit-name</i></font> <tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="#unit-interface" class="syntax"><font color="maroon">unit-interface</font></a></i> <font color="blue"><tt>end</tt> <tt>=</tt>
<tt>struct</tt></font> &nbsp;<i><a href="#unit-implementation" class="syntax"><font color="maroon">unit-implementation</font></a></i> <font color="blue"><tt>end</tt></font>
</div><p>A compilation unit can refer to other compilation units by their
names, as if they were regular modules. For instance, if <tt>U</tt> is a
compilation unit that defines a type <tt>t</tt>, other compilation units can
refer to that type under the name <tt>U.t</tt>; they can also refer to <tt>U</tt> as
a whole structure. Except for names of other compilation units, a unit
interface or unit implementation must not have any other free variables.
In other terms, the type-checking and compilation of an interface or
implementation proceeds in the initial environment
</p><div class="center">
<font color="maroon"><i>name</i></font><sub>1</sub> <font color="blue"><tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i><sub>1</sub> <font color="blue"><tt>end</tt></font> …
&nbsp;<i><font color="maroon">name</font><sub>n</sub></i> <font color="blue"><tt>:</tt> <tt>sig</tt></font> &nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a><sub>n</sub></i> <font color="blue"><tt>end</tt></font>
</div><p>
where <font color="maroon"><i>name</i></font><sub>1</sub> … &nbsp;<i><font color="maroon">name</font><sub>n</sub></i> are the names of the other
compilation units available in the search path (see
chapter&nbsp;<a href="manual022.html#c:camlc">8</a> for more details) and <i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a></i><sub>1</sub> …
&nbsp;<i><a href="manual018.html#specification" class="syntax"><font color="maroon">specification</font></a><sub>n</sub></i> are their respective interfaces.

</p>




<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>