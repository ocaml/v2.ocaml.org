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
symbols are set in typewriter font (<span class="c005"><span class="c007">like</span> <span class="c007">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c014">like</span> &nbsp;<span class="c014">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.02</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
<li><a href="#sec62">Lexical conventions</a>
</li><li><a href="#sec75">Values</a>
</li><li><a href="#sec88">Names</a>
</li><li><a href="#sec91">Type expressions</a>
</li><li><a href="#sec102">Constants</a>
</li><li><a href="#sec103">Patterns</a>
</li><li><a href="#s:value-expr">Expressions</a>
</li><li><a href="#sec149">Type and exception definitions</a>
</li><li><a href="#sec152">Classes</a>
</li><li><a href="#sec180">Module types (module specifications)</a>
</li><li><a href="#s:module-expr">Module expressions (module implementations)</a>
</li><li><a href="#sec209">Compilation units</a>
</li></ul></nav></header>

<hr>









<h2 class="section" id="sec62">1&nbsp;&nbsp;Lexical conventions</h2>
<h4 class="subsubsection" id="sec63">Blanks</h4>
<p>The following characters are considered as blanks: space,
horizontal tabulation, carriage return, line feed and form feed. Blanks are
ignored, but they separate adjacent identifiers, literals and
keywords that would otherwise be confused as one single identifier,
literal or keyword.</p><h4 class="subsubsection" id="sec64">Comments</h4>
<p>Comments are introduced by the two characters <span class="c008">(*</span>, with no
intervening blanks, and terminated by the characters <span class="c008">*)</span>, with
no intervening blanks. Comments are treated as blank characters.
Comments do not occur inside string or character literals. Nested
comments are handled correctly.</p><h4 class="subsubsection" id="sec65">Identifiers</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="ident"><span class="c014">ident</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;(&nbsp;<a class="syntax" href="#letter"><span class="c014">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>&nbsp;)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c014">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">0</span>&nbsp;…&nbsp;<span class="c008">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="capitalized-ident"><span class="c014">capitalized-ident</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;(<span class="c008">A</span>&nbsp;…&nbsp;<span class="c008">Z</span>)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c014">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">0</span>&nbsp;…&nbsp;<span class="c008">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="lowercase-ident"><span class="c014">lowercase-ident</span></a></td><td class="c022">::=</td><td class="c024">
(<span class="c008">a</span>&nbsp;…&nbsp;<span class="c008">z</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c014">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">0</span>&nbsp;…&nbsp;<span class="c008">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="letter"><span class="c014">letter</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;<span class="c008">A</span>&nbsp;…&nbsp;<span class="c008">Z</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">a</span>&nbsp;…&nbsp;<span class="c008">z</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Identifiers are sequences of letters, digits, <span class="c007">_</span> (the underscore
character), and <span class="c007">'</span> (the single quote), starting with a
letter or an underscore.
Letters contain at least the 52 lowercase and uppercase
letters from the ASCII set. The current implementation
also recognizes as letters some characters from the ISO
8859-1 set (characters 192–214 and 216–222 as uppercase letters;
characters 223–246 and 248–255 as lowercase letters). This
feature is deprecated and should be avoided for future compatibility.</p><p>All characters in an identifier are
meaningful. The current implementation accepts identifiers up to
16000000 characters in length.</p><p>In many places, OCaml makes a distinction between capitalized
identifiers and identifiers that begin with a lowercase letter. The
underscore character is considered a lowercase letter for this
purpose.</p><h4 class="subsubsection" id="sec66">Integer literals</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="integer-literal"><span class="c014">integer-literal</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">-</span>]&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;[<span class="c008">-</span>]&nbsp;(<span class="c008">0x</span>∣&nbsp;<span class="c008">0X</span>)&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">A</span>…<span class="c008">F</span>∣&nbsp;<span class="c008">a</span>…<span class="c008">f</span>)
{&nbsp;<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">A</span>…<span class="c008">F</span>∣&nbsp;<span class="c008">a</span>…<span class="c008">f</span>∣&nbsp;<span class="c008">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;[<span class="c008">-</span>]&nbsp;(<span class="c008">0o</span>∣&nbsp;<span class="c008">0O</span>)&nbsp;(<span class="c008">0</span>…<span class="c008">7</span>)&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">7</span>∣&nbsp;<span class="c008">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;[<span class="c008">-</span>]&nbsp;(<span class="c008">0b</span>∣&nbsp;<span class="c008">0B</span>)&nbsp;(<span class="c008">0</span>…<span class="c008">1</span>)&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">1</span>∣&nbsp;<span class="c008">_</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>An integer literal is a sequence of one or more digits, optionally
preceded by a minus sign. By default, integer literals are in decimal
(radix 10). The following prefixes select a different radix:
</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Prefix</span></td><td class="c021"><span class="c019">Radix</span> </td></tr>
<tr><td class="c023">
<span class="c007">0x</span>, <span class="c007">0X</span></td><td class="c023">hexadecimal (radix 16) </td></tr>
<tr><td class="c023"><span class="c007">0o</span>, <span class="c007">0O</span></td><td class="c023">octal (radix 8) </td></tr>
<tr><td class="c023"><span class="c007">0b</span>, <span class="c007">0B</span></td><td class="c023">binary (radix 2) </td></tr>
</tbody></table></div><p>
(The initial <span class="c008">0</span> is the digit zero; the <span class="c008">O</span> for octal is the letter O.)
The interpretation of integer literals that fall outside the range of
representable integer values is undefined.</p><p>For convenience and readability, underscore characters (<span class="c008">_</span>) are accepted
(and ignored) within integer literals.</p><h4 class="subsubsection" id="sec67">Floating-point literals</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="float-literal"><span class="c014">float-literal</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">-</span>]&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">_</span>&nbsp;}&nbsp;[<span class="c008">.</span>&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">_</span>&nbsp;}]
[(<span class="c008">e</span>∣&nbsp;<span class="c008">E</span>)&nbsp;[<span class="c008">+</span>∣&nbsp;<span class="c008">-</span>]&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)&nbsp;{&nbsp;<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">_</span>&nbsp;}]
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Floating-point decimals consist in an integer part, a decimal part and
an exponent part. The integer part is a sequence of one or more
digits, optionally preceded by a minus sign. The decimal part is a
decimal point followed by zero, one or more digits.
The exponent part is the character <span class="c008">e</span> or <span class="c008">E</span> followed by an
optional <span class="c008">+</span> or <span class="c008">-</span> sign, followed by one or more digits.
The decimal part or the exponent part can be omitted but not both, to
avoid ambiguity with integer literals.
The interpretation of floating-point literals that fall outside the
range of representable floating-point values is undefined.</p><p>For convenience and readability, underscore characters (<span class="c008">_</span>) are accepted
(and ignored) within floating-point literals.</p><h4 class="subsubsection" id="sec68">Character literals</h4>
<p>
<a id="s:characterliteral"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="char-literal"><span class="c014">char-literal</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">'</span>&nbsp;<span class="c014">regular-char</span>&nbsp;<span class="c008">'</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">'</span>&nbsp;<a class="syntax" href="#escape-sequence"><span class="c014">escape-sequence</span></a>&nbsp;<span class="c008">'</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="escape-sequence"><span class="c014">escape-sequence</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">\</span>&nbsp;(&nbsp;<span class="c008">\</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">"</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">'</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">n</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">t</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">b</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">r</span>&nbsp;∣&nbsp;&nbsp;<span class="c014">space</span>&nbsp;)
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">\</span>&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>)
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">\x</span>&nbsp;(<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">A</span>…<span class="c008">F</span>∣&nbsp;<span class="c008">a</span>…<span class="c008">f</span>)
(<span class="c008">0</span>…<span class="c008">9</span>∣&nbsp;<span class="c008">A</span>…<span class="c008">F</span>∣&nbsp;<span class="c008">a</span>…<span class="c008">f</span>)
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Character literals are delimited by <span class="c008">'</span> (single quote) characters.
The two single quotes enclose either one character different from
<span class="c008">'</span> and <span class="c008">\</span>, or one of the escape sequences below:
</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Sequence</span></td><td class="c021"><span class="c019">Character denoted</span> </td></tr>
<tr><td class="c023">
<span class="c007">\\</span></td><td class="c023">backslash (<span class="c007">\</span>) </td></tr>
<tr><td class="c023"><span class="c007">\"</span></td><td class="c023">double quote (<span class="c007">"</span>) </td></tr>
<tr><td class="c023"><span class="c007">\'</span></td><td class="c023">single quote (<span class="c007">'</span>) </td></tr>
<tr><td class="c023"><span class="c007">\n</span></td><td class="c023">linefeed (LF) </td></tr>
<tr><td class="c023"><span class="c007">\r</span></td><td class="c023">carriage return (CR) </td></tr>
<tr><td class="c023"><span class="c007">\t</span></td><td class="c023">horizontal tabulation (TAB) </td></tr>
<tr><td class="c023"><span class="c007">\b</span></td><td class="c023">backspace (BS) </td></tr>
<tr><td class="c023"><span class="c007">\</span><span class="c013">space</span></td><td class="c023">space (SPC) </td></tr>
<tr><td class="c023"><span class="c007">\</span><span class="c013">ddd</span></td><td class="c023">the character with ASCII code <span class="c013">ddd</span> in decimal </td></tr>
<tr><td class="c023"><span class="c007">\x</span><span class="c013">hh</span></td><td class="c023">the character with ASCII code <span class="c013">hh</span> in hexadecimal </td></tr>
</tbody></table></div><h4 class="subsubsection" id="sec69">String literals</h4>
<p>
<a id="s:stringliteral"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="string-literal"><span class="c014">string-literal</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">"</span>&nbsp;{&nbsp;<a class="syntax" href="#string-character"><span class="c014">string-character</span></a>&nbsp;}&nbsp;<span class="c008">"</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="string-character"><span class="c014">string-character</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c014">regular-string-char</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#escape-sequence"><span class="c014">escape-sequence</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">\</span>&nbsp;<span class="c014">newline</span>&nbsp;&nbsp;{&nbsp;<span class="c014">space</span>&nbsp;∣&nbsp;&nbsp;<span class="c014">tab</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>String literals are delimited by <span class="c008">"</span> (double quote) characters.
The two double quotes enclose a sequence of either characters
different from <span class="c008">"</span> and <span class="c008">\</span>, or escape sequences from the
table given above for character literals.</p><p>To allow splitting long string literals across lines, the sequence
<span class="c007">\</span><span class="c013">newline</span>&nbsp;<span class="c013">spaces-or-tabs</span> (a backslash at the end of a line
followed by any number of spaces and horizontal tabulations at the
beginning of the next line) is ignored inside string literals.</p><p>The current implementation places practically no restrictions on the
length of string literals.</p><h4 class="subsubsection" id="sec70">Naming labels</h4>
<p>
<a id="s:labelname"></a></p><p>To avoid ambiguities, naming labels in expressions cannot just be defined
syntactically as the sequence of the three tokens <span class="c007">~</span>, <a class="syntax" href="#ident"><span class="c014">ident</span></a> and
<span class="c007">:</span>, and have to be defined at the lexical level.</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="label-name"><span class="c014">label-name</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;<a class="syntax" href="#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="label"><span class="c014">label</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<a class="syntax" href="#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="optlabel"><span class="c014">optlabel</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Naming labels come in two flavours: <a class="syntax" href="#label"><span class="c014">label</span></a> for normal arguments and
<a class="syntax" href="#optlabel"><span class="c014">optlabel</span></a> for optional ones. They are simply distinguished by their
first character, either <span class="c007">~</span> or <span class="c007">?</span>.</p><p>Despite <a class="syntax" href="#label"><span class="c014">label</span></a> and <a class="syntax" href="#optlabel"><span class="c014">optlabel</span></a> being lexical entities in expressions,
their expansions <span class="c008">~</span> <a class="syntax" href="#label-name"><span class="c014">label-name</span></a> <span class="c008">:</span> and <span class="c008">?</span> <a class="syntax" href="#label-name"><span class="c014">label-name</span></a> <span class="c008">:</span> will be
used in grammars, for the sake of readability. Note also that inside
type expressions, this expansion can be taken literally, <em>i.e.</em>
there are really 3 tokens, with optional blanks between them.</p><h4 class="subsubsection" id="sec71">Prefix and infix symbols</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="infix-symbol"><span class="c014">infix-symbol</span></a></td><td class="c022">::=</td><td class="c024">
(<span class="c008">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">@</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">^</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">|</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&amp;</span>&nbsp;∣&nbsp;
<span class="c008">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">/</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">$</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">%</span>)&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c014">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="prefix-symbol"><span class="c014">prefix-symbol</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">!</span>&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c014">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;(<span class="c008">?</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">~</span>)&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c014">operator-char</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="operator-char"><span class="c014">operator-char</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">!</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">$</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">%</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">.</span>&nbsp;∣&nbsp;
<span class="c008">/</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">:</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">?</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">@</span>&nbsp;∣&nbsp;
<span class="c008">^</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">|</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">~</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Sequences of “operator characters”, such as <span class="c007">&lt;=&gt;</span> or <span class="c007">!!</span>,
are read as a single token from the <a class="syntax" href="#infix-symbol"><span class="c014">infix-symbol</span></a> or <a class="syntax" href="#prefix-symbol"><span class="c014">prefix-symbol</span></a>
class. These symbols are parsed as prefix and infix operators inside
expressions, but otherwise behave like normal identifiers.
</p><h4 class="subsubsection" id="sec72">Keywords</h4>
<p>The identifiers below are reserved as keywords, and cannot be employed
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
</pre><p> <br>
The following character sequences are also keywords:
</p><pre><span class="c007">    !=    #     &amp;     &amp;&amp;    '     (     )     *     +     ,     -</span>
<span class="c007">    -.    -&gt;    .     ..    :     ::    :=    :&gt;    ;     ;;    &lt;</span>
<span class="c007">    &lt;-    =     &gt;     &gt;]    &gt;}    ?     [     [&lt;    [&gt;    [|    ]</span>
<span class="c007">    _     `     {     {&lt;    |     |]    ||    }     ~</span>
</pre><p>
Note that the following identifiers are keywords of the Camlp4
extensions and should be avoided for compatibility reasons.
</p><pre>    parser    value    $     $$    $:    &lt;:    &lt;&lt;    &gt;&gt;    ??
</pre><h4 class="subsubsection" id="sec73">Ambiguities</h4>
<p>Lexical ambiguities are resolved according to the “longest match”
rule: when a character sequence can be decomposed into two tokens in
several different ways, the decomposition retained is the one with the
longest first token.</p><h4 class="subsubsection" id="sec74">Line number directives</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="linenum-directive"><span class="c014">linenum-directive</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">#</span>&nbsp;{<span class="c008">0</span>&nbsp;…&nbsp;<span class="c008">9</span>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">#</span>&nbsp;{<span class="c008">0</span>&nbsp;…&nbsp;<span class="c008">9</span>}<sup>+</sup>&nbsp;<span class="c008">"</span>&nbsp;{&nbsp;<a class="syntax" href="#string-character"><span class="c014">string-character</span></a>&nbsp;}&nbsp;<span class="c008">"</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Preprocessors that generate OCaml source code can insert line number
directives in their output so that error messages produced by the
compiler contain line numbers and file names referring to the source
file before preprocessing, instead of after preprocessing.
A line number directive is composed of a <span class="c008">#</span> (sharp sign), followed by
a positive integer (the source line number), optionally followed by a
character string (the source file name).
Line number directives are treated as blanks during lexical
analysis.</p>










<h2 class="section" id="sec75">2&nbsp;&nbsp;Values</h2>
<ul>
<li><a href="#sec76">Base values</a>
</li><li><a href="#sec81">Tuples</a>
</li><li><a href="#sec82">Records</a>
</li><li><a href="#sec83">Arrays</a>
</li><li><a href="#sec84">Variant values</a>
</li><li><a href="#sec85">Polymorphic variants</a>
</li><li><a href="#sec86">Functions</a>
</li><li><a href="#sec87">Objects</a>
</li></ul>
<p>This section describes the kinds of values that are manipulated by
OCaml programs.</p>
<h3 class="subsection" id="sec76">2.1&nbsp;&nbsp;Base values</h3>
<h4 class="subsubsection" id="sec77">Integer numbers</h4>
<p>Integer values are integer numbers from −2<sup>30</sup> to 2<sup>30</sup>−1, that
is −1073741824 to 1073741823. The implementation may support a
wider range of integer values: on 64-bit platforms, the current
implementation supports integers ranging from −2<sup>62</sup> to 2<sup>62</sup>−1.</p><h4 class="subsubsection" id="sec78">Floating-point numbers</h4>
<p>Floating-point values are numbers in floating-point representation.
The current implementation uses double-precision floating-point
numbers conforming to the IEEE 754 standard, with 53 bits of mantissa
and an exponent ranging from −1022 to 1023.</p><h4 class="subsubsection" id="sec79">Characters</h4>
<p>Character values are represented as 8-bit integers between 0 and 255.
Character codes between 0 and 127 are interpreted following the ASCII
standard. The current implementation interprets character codes
between 128 and 255 following the ISO 8859-1 standard.</p><h4 class="subsubsection" id="sec80">Character strings</h4>
<p> <a id="s:string-val"></a></p><p>String values are finite sequences of characters. The current
implementation supports strings containing up to 2<sup>24</sup> − 5
characters (16777211 characters); on 64-bit platforms, the limit is
2<sup>57</sup> − 9.</p>
<h3 class="subsection" id="sec81">2.2&nbsp;&nbsp;Tuples</h3>
<p>Tuples of values are written <span class="c008">(</span><span class="c014">v</span><sub>1</sub><span class="c008">,</span> …<span class="c008">,</span> <span class="c014">v</span><sub><span class="c013">n</span></sub><span class="c008">)</span>, standing for the
<span class="c013">n</span>-tuple of values <span class="c014">v</span><sub>1</sub> to <span class="c014">v</span><sub><span class="c013">n</span></sub>. The current implementation
supports tuple of up to 2<sup>22</sup> − 1 elements (4194303 elements).</p>
<h3 class="subsection" id="sec82">2.3&nbsp;&nbsp;Records</h3>
<p>Record values are labeled tuples of values. The record value written
<span class="c008">{</span> <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> <span class="c008">=</span> <span class="c014">v</span><sub>1</sub><span class="c008">;</span> …<span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span> <span class="c014">v</span><sub><span class="c013">n</span></sub> <span class="c008">}</span> associates the value
<span class="c014">v</span><sub><span class="c013">i</span></sub> to the record field <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">i</span></sub>, for <span class="c013">i</span> = 1 … <span class="c013">n</span>. The current
implementation supports records with up to 2<sup>22</sup> − 1 fields
(4194303 fields).</p>
<h3 class="subsection" id="sec83">2.4&nbsp;&nbsp;Arrays</h3>
<p>Arrays are finite, variable-sized sequences of values of the same
type. The current implementation supports arrays containing up to
2<sup>22</sup> − 1 elements (4194303 elements) unless the elements are
floating-point numbers (2097151 elements in this case); on 64-bit
platforms, the limit is 2<sup>54</sup> − 1 for all arrays.</p>
<h3 class="subsection" id="sec84">2.5&nbsp;&nbsp;Variant values</h3>
<p>Variant values are either a constant constructor, or a non-constant
constructor applied to a number of values. The former case is written
<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>; the latter case is written <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> <span class="c008">(</span><span class="c014">v</span><sub>1</sub><span class="c008">,</span> ... <span class="c008">,</span> <span class="c014">v</span><sub><span class="c013">n</span></sub>
<span class="c008">)</span>, where the <span class="c014">v</span><sub><span class="c013">i</span></sub> are said to be the arguments of the non-constant
constructor <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>. The parentheses may be omitted if there is only
one argument.</p><p>The following constants are treated like built-in constant
constructors:
</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Constant</span></td><td class="c021"><span class="c019">Constructor</span> </td></tr>
<tr><td class="c023">
<span class="c007">false</span></td><td class="c023">the boolean false </td></tr>
<tr><td class="c023"><span class="c007">true</span></td><td class="c023">the boolean true </td></tr>
<tr><td class="c023"><span class="c007">()</span></td><td class="c023">the “unit” value </td></tr>
<tr><td class="c023"><span class="c007">[]</span></td><td class="c023">the empty list </td></tr>
</tbody></table></div><p>The current implementation limits each variant type to have at most
246 non-constant constructors and 2<sup>30</sup>−1 constant constructors.</p>
<h3 class="subsection" id="sec85">2.6&nbsp;&nbsp;Polymorphic variants</h3>
<p>Polymorphic variants are an alternate form of variant values, not
belonging explicitly to a predefined variant type, and following
specific typing rules. They can be either constant, written
<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>, or non-constant, written <span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a><span class="c005"><span class="c007">(</span><span class="c014">v</span><span class="c007">)</span></span>.</p>
<h3 class="subsection" id="sec86">2.7&nbsp;&nbsp;Functions</h3>
<p>Functional values are mappings from values to values.</p>
<h3 class="subsection" id="sec87">2.8&nbsp;&nbsp;Objects</h3>
<p>Objects are composed of a hidden internal state which is a
record of instance variables, and a set of methods for accessing and
modifying these variables. The structure of an object is described by
the toplevel class that created it.

</p>











<h2 class="section" id="sec88">3&nbsp;&nbsp;Names</h2>
<p> <a id="s:names"></a>

</p><p>Identifiers are used to give names to several classes of language
objects and refer to these objects by name later:
</p><ul class="itemize"><li class="li-itemize">
value names (syntactic class <a class="syntax" href="#value-name"><span class="c014">value-name</span></a>),
</li><li class="li-itemize">value constructors and exception constructors (class <a class="syntax" href="#constr-name"><span class="c014">constr-name</span></a>),
</li><li class="li-itemize">labels (<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>, defined in section&nbsp;<a href="lex.html#s%3Alabelname">6.1</a>),
</li><li class="li-itemize">polymorphic variant tags (<a class="syntax" href="#tag-name"><span class="c014">tag-name</span></a>),
</li><li class="li-itemize">type constructors (<a class="syntax" href="#typeconstr-name"><span class="c014">typeconstr-name</span></a>),
</li><li class="li-itemize">record fields (<a class="syntax" href="#field-name"><span class="c014">field-name</span></a>),
</li><li class="li-itemize">class names (<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>),
</li><li class="li-itemize">method names (<a class="syntax" href="#method-name"><span class="c014">method-name</span></a>),
</li><li class="li-itemize">instance variable names (<a class="syntax" href="#inst-var-name"><span class="c014">inst-var-name</span></a>),
</li><li class="li-itemize">module names (<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>),
</li><li class="li-itemize">module type names (<a class="syntax" href="#modtype-name"><span class="c014">modtype-name</span></a>).
</li></ul><p>
These eleven name spaces are distinguished both by the context and by the
capitalization of the identifier: whether the first letter of the
identifier is in lowercase (written <a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a> below) or in
uppercase (written <a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>). Underscore is considered a
lowercase letter for this purpose.</p><p><a id="hevea_manual.kwd0"></a>
<a id="hevea_manual.kwd1"></a></p><h4 class="subsubsection" id="sec89">Naming objects</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="value-name"><span class="c014">value-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#operator-name"><span class="c014">operator-name</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="operator-name"><span class="c014">operator-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="#infix-op"><span class="c014">infix-op</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="infix-op"><span class="c014">infix-op</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#infix-symbol"><span class="c014">infix-symbol</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">-.</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">!=</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">or</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">||</span>
∣&nbsp;&nbsp;<span class="c008">&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">&amp;&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">:=</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">mod</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">land</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lor</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lxor</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lsl</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">lsr</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">asr</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="constr-name"><span class="c014">constr-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="tag-name"><span class="c014">tag-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="typeconstr-name"><span class="c014">typeconstr-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="field-name"><span class="c014">field-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-name"><span class="c014">module-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#capitalized-ident"><span class="c014">capitalized-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="modtype-name"><span class="c014">modtype-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-name"><span class="c014">class-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="inst-var-name"><span class="c014">inst-var-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="method-name"><span class="c014">method-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
As shown above, prefix and infix symbols as well as some keywords can
be used as value names, provided they are written between parentheses.
The capitalization rules are summarized in the table below.</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Name space</span></td><td class="c021"><span class="c019">Case of first letter</span> </td></tr>
<tr><td class="c023">
Values</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Constructors</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Labels</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Polymorphic variant tags</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Exceptions</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Type constructors</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Record fields</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Classes</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Instance variables</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Methods</td><td class="c023">lowercase </td></tr>
<tr><td class="c023">Modules</td><td class="c023">uppercase </td></tr>
<tr><td class="c023">Module types</td><td class="c023">any </td></tr>
</tbody></table></div><p><span class="c013">Note on polymorphic variant tags:</span> the current implementation accepts
lowercase variant tags in addition to capitalized variant tags, but we
suggest you avoid lowercase variant tags for portability and
compatibility with future OCaml versions.</p><h4 class="subsubsection" id="sec90">Referring to named objects</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="value-path"><span class="c014">value-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#value-name"><span class="c014">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="constr"><span class="c014">constr</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#constr-name"><span class="c014">constr-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="typeconstr"><span class="c014">typeconstr</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#typeconstr-name"><span class="c014">typeconstr-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="field"><span class="c014">field</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#field-name"><span class="c014">field-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="modtype-path"><span class="c014">modtype-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#modtype-name"><span class="c014">modtype-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-path"><span class="c014">class-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="classtype-path"><span class="c014">classtype-path</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">.</span>&nbsp;]&nbsp;&nbsp;<a class="syntax" href="#class-name"><span class="c014">class-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-path"><span class="c014">module-path</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">.</span>&nbsp;<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="extended-module-path"><span class="c014">extended-module-path</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#extended-module-name"><span class="c014">extended-module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">.</span>&nbsp;<a class="syntax" href="#extended-module-name"><span class="c014">extended-module-name</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="extended-module-name"><span class="c014">extended-module-name</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a>&nbsp;<span class="c008">)</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A named object can be referred to either by its name (following the
usual static scoping rules for names) or by an access path <span class="c014">prefix</span> <span class="c008">.</span> &nbsp;<span class="c014">name</span>,
where <span class="c014">prefix</span> designates a module and <span class="c014">name</span> is the name of an object
defined in that module. The first component of the path, <span class="c014">prefix</span>, is
either a simple module name or an access path <span class="c014">name</span><sub>1</sub> <span class="c008">.</span> &nbsp;<span class="c014">name</span><sub>2</sub> …,
in case the defining module is itself nested inside other modules.
For referring to type constructors, module types, or class types,
the <span class="c014">prefix</span> can
also contain simple functor applications (as in the syntactic class
<a class="syntax" href="#extended-module-path"><span class="c014">extended-module-path</span></a> above) in case the defining module is the
result of a functor application.</p><p>Label names, tag names, method names and instance variable names need
not be qualified: the former three are global labels, while the latter
are local to a class.

</p>











<h2 class="section" id="sec91">4&nbsp;&nbsp;Type expressions</h2>
<p>
<a id="hevea_manual.kwd2"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="typexpr"><span class="c014">typexpr</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">_</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;[[<span class="c008">?</span>]<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a><span class="c008">:</span>]&nbsp;&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">*</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">,</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;}&nbsp;<span class="c008">)</span>&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">as</span>&nbsp;<span class="c008">'</span>&nbsp;&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#polymorphic-variant-type"><span class="c014">polymorphic-variant-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">&lt;</span>&nbsp;[<span class="c008">..</span>]&nbsp;<span class="c008">&gt;</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">&lt;</span>&nbsp;<a class="syntax" href="#method-type"><span class="c014">method-type</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#method-type"><span class="c014">method-type</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">;</span>&nbsp;<span class="c008">..</span>]&nbsp;<span class="c008">&gt;</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">#</span>&nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">#</span>&nbsp;&nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">,</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;}&nbsp;<span class="c008">)</span>&nbsp;<span class="c008">#</span>&nbsp;&nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="poly-typexpr"><span class="c014">poly-typexpr</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;{&nbsp;<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>&nbsp;}<sup>+</sup>&nbsp;<span class="c008">.</span>&nbsp;&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="method-type"><span class="c014">method-type</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#poly-typexpr"><span class="c014">poly-typexpr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed type constructions. The constructions with
higher precedences come first.
<a id="hevea_manual.kwd3"></a>
</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Operator</span></td><td class="c021"><span class="c019">Associativity</span> </td></tr>
<tr><td class="c023">
Type constructor application</td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">#</span></td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">*</span></td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">-&gt;</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">as</span></td><td class="c023">– </td></tr>
</tbody></table></div><p>Type expressions denote types in definitions of data types as well as
in type constraints over patterns and expressions.</p><h4 class="subsubsection" id="sec92">Type variables</h4>
<p>The type expression <span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> stands for the type variable named
<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>. The type expression <span class="c008">_</span> stands for an anonymous type variable.
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
be made universal, as described in section&nbsp;<a href="classes.html#sec-methspec">6.9.1</a>);
3) for variables used as aliases, when the type they are aliased to
would be invalid in the scope of the enclosing definition (<span class="c013">i.e.</span>
when it contains free universal type variables, or locally
defined types.)</p><h4 class="subsubsection" id="sec93">Parenthesized types</h4>
<p>The type expression <span class="c008">(</span> <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> <span class="c008">)</span> denotes the same type as
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>.</p><h4 class="subsubsection" id="sec94">Function types</h4>
<p>The type expression <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub> denotes the type of
functions mapping arguments of type <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> to results of type
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub>.</p><p><a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub> denotes the same function type, but
the argument is labeled <a class="syntax" href="lex.html#label"><span class="c014">label</span></a>.</p><p><span class="c008">?</span> <a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub> denotes the type of functions
mapping an optional labeled argument of type <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> to results of
type <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub>. That is, the physical type of the function will be
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c005"><span class="c007">option</span> <span class="c007">-&gt;</span></span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>2</sub>.</p><h4 class="subsubsection" id="sec95">Tuple types</h4>
<p>The type expression <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">*</span> … <span class="c008">*</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>
denotes the type of tuples whose elements belong to types <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub>,
… &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub> respectively.</p><h4 class="subsubsection" id="sec96">Constructed types</h4>
<p>Type constructors with no parameter, as in <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>, are type
expressions.</p><p>The type expression <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> &nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>, where <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> is a type
constructor with one parameter, denotes the application of the unary type
constructor <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> to the type <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>.</p><p>The type expression (<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub>,…,&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>) &nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>, where
<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> is a type constructor with <span class="c013">n</span> parameters, denotes the
application of the <span class="c013">n</span>-ary type constructor <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> to the types
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> through <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>.</p><h4 class="subsubsection" id="sec97">Aliased and recursive types</h4>
<p><a id="hevea_manual.kwd4"></a></p><p>The type expression <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> <span class="c005"><span class="c007">as</span> <span class="c007">'</span></span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> denotes the same type as
<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>, and also binds the type variable <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> to type <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> both
in <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> and in other types. In general the scope of an alias is
the same as for a named type variable, and covers the whole enclosing
definition. If the type variable
<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> actually occurs in <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>, a recursive type is created. Recursive
types for which there exists a recursive path that does not contain
an object or polymorphic variant type constructor are rejected, except
when the <span class="c007">-rectypes</span> mode is selected.</p><p>If <span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> denotes an explicit polymorphic variable, and <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
denotes either an object or polymorphic variant type, the row variable
of <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a> is captured by <span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>, and quantified upon.</p><h4 class="subsubsection" id="sec98">Polymorphic variant types</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="polymorphic-variant-type"><span class="c014">polymorphic-variant-type</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">[</span>&nbsp;<a class="syntax" href="#tag-spec-first"><span class="c014">tag-spec-first</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">|</span>&nbsp;<a class="syntax" href="#tag-spec"><span class="c014">tag-spec</span></a>&nbsp;}&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[&gt;</span>&nbsp;[&nbsp;<a class="syntax" href="#tag-spec"><span class="c014">tag-spec</span></a>&nbsp;]&nbsp;&nbsp;{&nbsp;<span class="c008">|</span>&nbsp;<a class="syntax" href="#tag-spec"><span class="c014">tag-spec</span></a>&nbsp;}&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[&lt;</span>&nbsp;[<span class="c008">|</span>]&nbsp;<a class="syntax" href="#tag-spec-full"><span class="c014">tag-spec-full</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">|</span>&nbsp;<a class="syntax" href="#tag-spec-full"><span class="c014">tag-spec-full</span></a>&nbsp;}
&nbsp;[&nbsp;<span class="c008">&gt;</span>&nbsp;{&nbsp;<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;}<sup>+</sup>&nbsp;]&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="tag-spec-first"><span class="c014">tag-spec-first</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;&nbsp;[&nbsp;<span class="c008">of</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;[&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;]&nbsp;<span class="c008">|</span>&nbsp;&nbsp;<a class="syntax" href="#tag-spec"><span class="c014">tag-spec</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="tag-spec"><span class="c014">tag-spec</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;&nbsp;[&nbsp;<span class="c008">of</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="tag-spec-full"><span class="c014">tag-spec-full</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;&nbsp;[&nbsp;<span class="c008">of</span>&nbsp;[<span class="c008">&amp;</span>]&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">&amp;</span>&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>&nbsp;}&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>
</td></tr>
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
<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a> &nbsp;[<span class="c008">of</span> <a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>] form, or indirectly through a type
expression, which must expand to an
exact variant type, whose tag specifications are inserted in its
place.</p><p>Full specifications of variant tags are only used for non-exact closed
types. They can be understood as a conjunctive type for the argument:
it is intended to have all the types enumerated in the
specification.</p><p>Such conjunctive constraints may be unsatisfiable. In such a case the
corresponding tag may not be used in a value of this type. This
does not mean that the whole type is not valid: one can still use
other available tags.
Conjunctive constraints are mainly intended as output from the type
checker. When they are used in source programs, unsolvable constraints
may cause early failures.</p><h4 class="subsubsection" id="sec99">Object types</h4>
<p>An object type
<span class="c008">&lt;</span> [<a class="syntax" href="#method-type"><span class="c014">method-type</span></a> &nbsp;{ <span class="c008">;</span> <a class="syntax" href="#method-type"><span class="c014">method-type</span></a> }] <span class="c008">&gt;</span>
is a record of method types.</p><p>Each method may have an explicit polymorphic type: { <span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> }<sup>+</sup>
<span class="c008">.</span> &nbsp;<a class="syntax" href="#typexpr"><span class="c014">typexpr</span></a>. Explicit polymorphic variables have a local scope, and
an explicit polymorphic type can only be unified to an
equivalent one, where only the order and names of polymorphic
variables may change.</p><p>The type <span class="c008">&lt;</span> {<a class="syntax" href="#method-type"><span class="c014">method-type</span></a> <span class="c008">;</span>} <span class="c005"><span class="c007">..</span> <span class="c007">&gt;</span></span> is the
type of an object whose method names and types are described by
<a class="syntax" href="#method-type"><span class="c014">method-type</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="#method-type"><span class="c014">method-type</span></a><sub><span class="c013">n</span></sub>, and possibly some other
methods represented by the ellipsis. This ellipsis actually is
a special kind of type variable (called <em>row variable</em> in the
literature) that stands for any number of extra method types.</p><h4 class="subsubsection" id="sec100">#-types</h4>
<p>
<a id="s:sharp-types"></a></p><p>The type <span class="c008">#</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> is a special kind of abbreviation. This
abbreviation unifies with the type of any object belonging to a subclass
of class <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>.
It is handled in a special way as it usually hides a type variable (an
ellipsis, representing the methods that may be added in a subclass).
In particular, it vanishes when the ellipsis gets instantiated.
Each type expression <span class="c008">#</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> defines a new type variable, so
type <span class="c008">#</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> <span class="c005"><span class="c007">-&gt;</span> <span class="c007">#</span></span> &nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> is usually not the same as
type (<span class="c008">#</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> <span class="c005"><span class="c007">as</span> <span class="c007">'</span></span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>) <span class="c005"><span class="c007">-&gt;</span> <span class="c007">'</span></span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>.
</p><p>Use of #-types to abbreviate polymorphic variant types is deprecated.
If <span class="c014">t</span> is an exact variant type then <span class="c008">#</span><span class="c014">t</span> translates to <span class="c005"><span class="c007">[&lt;</span> <span class="c014">t</span><span class="c007">]</span></span>,
and <span class="c005"><span class="c007">#</span><span class="c014">t</span><span class="c007">[&gt;</span> <span class="c007">`</span></span><a class="syntax" href="names.html#tag-name"><span class="c014">tag</span></a><sub>1</sub> …<span class="c008">`</span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c014">tag</span></a><sub><span class="c013">k</span></sub><span class="c008">]</span> translates to
<span class="c005"><span class="c007">[&lt;</span> <span class="c014">t</span> <span class="c007">&gt;</span> <span class="c007">`</span></span><a class="syntax" href="names.html#tag-name"><span class="c014">tag</span></a><sub>1</sub> …<span class="c008">`</span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c014">tag</span></a><sub><span class="c013">k</span></sub><span class="c008">]</span></p><h4 class="subsubsection" id="sec101">Variant and record types</h4>
<p>There are no type expressions describing (defined) variant types nor
record types, since those are always named, i.e. defined before use
and referred to by name. Type definitions are described in
section&nbsp;<a href="typedecl.html#s%3Atype-defs">6.8.1</a>.

</p>











<h2 class="section" id="sec102">5&nbsp;&nbsp;Constants</h2>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="constant"><span class="c014">constant</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="lex.html#integer-literal"><span class="c014">integer-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#float-literal"><span class="c014">float-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#char-literal"><span class="c014">char-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#string-literal"><span class="c014">string-literal</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">false</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">true</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">()</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">begin</span>&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[||]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The syntactic class of constants comprises literals from the four
base types (integers, floating-point numbers, characters, character
strings), and constant constructors from both normal and polymorphic
variants, as well as the special constants <span class="c008">false</span>, <span class="c008">true</span>, <span class="c008">()</span>,
<span class="c008">[]</span>, and <span class="c008">[||]</span>, which behave like constant constructors, and
<span class="c005"><span class="c007">begin</span> <span class="c007">end</span></span>, which is equivalent to <span class="c008">()</span>.

</p>











<h2 class="section" id="sec103">6&nbsp;&nbsp;Patterns</h2>
<p>

<a id="hevea_manual.kwd5"></a>
</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="pattern"><span class="c014">pattern</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">_</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="const.html#constant"><span class="c014">constant</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">as</span>&nbsp;&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">|</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">#</span><a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">,</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">{</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;}&nbsp;&nbsp;[&nbsp;<span class="c008">;</span>&nbsp;]&nbsp;<span class="c008">}</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;}&nbsp;&nbsp;[&nbsp;<span class="c008">;</span>&nbsp;]&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">::</span>&nbsp;&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[|</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a>&nbsp;}&nbsp;&nbsp;[&nbsp;<span class="c008">;</span>&nbsp;]&nbsp;<span class="c008">|]</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed pattern constructions. The constructions with
higher precedences come first.
<a id="hevea_manual.kwd6"></a>
</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Operator</span></td><td class="c021"><span class="c019">Associativity</span> </td></tr>
<tr><td class="c023">
<span class="c007">..</span> (see section&nbsp;<a href="extn.html#s%3Arange-patterns">7.4</a>)</td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">lazy</span> (see section&nbsp;<a href="extn.html#s%3Alazy">7.6</a>)</td><td class="c023">– </td></tr>
<tr><td class="c023">Constructor application, Tag application</td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">::</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">,</span></td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">|</span></td><td class="c023">left </td></tr>
<tr><td class="c023"><span class="c007">as</span></td><td class="c023">– </td></tr>
</tbody></table></div><p>Patterns are templates that allow selecting data structures of a
given shape, and binding identifiers to components of the data
structure. This selection operation is called pattern matching; its
outcome is either “this value does not match this pattern”, or
“this value matches this pattern, resulting in the following bindings
of names to values”.</p><h4 class="subsubsection" id="sec104">Variable patterns</h4>
<p>A pattern that consists in a value name matches any value,
binding the name to the value. The pattern <span class="c008">_</span> also matches
any value, but does not bind any name.</p><p>Patterns are <em>linear</em>: a variable cannot be bound several times by
a given pattern. In particular, there is no way to test for equality
between two parts of a data structure using only a pattern (but
<span class="c008">when</span> guards can be used for this purpose).</p><h4 class="subsubsection" id="sec105">Constant patterns</h4>
<p>A pattern consisting in a constant matches the values that
are equal to this constant.</p><h4 class="subsubsection" id="sec106">Alias patterns</h4>
<p>
<a id="hevea_manual.kwd7"></a></p><p>The pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">as</span> &nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> matches the same values as
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>. If the matching against <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> is successful,
the name <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> is bound to the matched value, in addition to the
bindings performed by the matching against <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>.</p><h4 class="subsubsection" id="sec107">Parenthesized patterns</h4>
<p>The pattern <span class="c008">(</span> <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">)</span> matches the same values as
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>. A type constraint can appear in a
parenthesized pattern, as in <span class="c008">(</span> <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">)</span>. This
constraint forces the type of <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> to be compatible with
<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>.</p><h4 class="subsubsection" id="sec108">“Or” patterns</h4>
<p>The pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub> represents the logical “or” of
the two patterns <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> and <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub>. A value matches
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub> if it matches <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> or
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub>. The two sub-patterns <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> and <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub>
must bind exactly the same identifiers to values having the same types.
Matching is performed from left to right.
More precisely,
in case some value&nbsp;<span class="c013">v</span> matches <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">|</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub>, the bindings
performed are those of <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> when <span class="c013">v</span> matches <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>.
Otherwise, value&nbsp;<span class="c013">v</span> matches <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub> whose bindings are performed.</p><h4 class="subsubsection" id="sec109">Variant patterns</h4>
<p>The pattern <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> <span class="c008">(</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">,</span> … <span class="c008">,</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">)</span> matches
all variants whose
constructor is equal to <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>, and whose arguments match
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>. It is a type error if <span class="c013">n</span> is not the
number of arguments expected by the constructor.</p><p>The pattern <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> <span class="c008">_</span> matches all variants whose constructor is
<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>.</p><p>The pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">::</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub> matches non-empty lists whose
heads match <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>, and whose tails match <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>2</sub>.</p><p>The pattern <span class="c008">[</span> <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">]</span> matches lists
of length <span class="c013">n</span> whose elements match <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> …<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>,
respectively. This pattern behaves like
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">::</span> … <span class="c008">::</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">::</span> <span class="c007">[]</span></span>.</p><h4 class="subsubsection" id="sec110">Polymorphic variant patterns</h4>
<p>The pattern <span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> matches all polymorphic variants
whose tag is equal to <a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>, and whose argument matches
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub>.</p><h4 class="subsubsection" id="sec111">Polymorphic variant abbreviation patterns</h4>
<p>If the type [<span class="c008">('a,'b,</span>…<span class="c008">)</span>] <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> = <span class="c005"><span class="c007">[</span> <span class="c007">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a><sub>1</sub> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">|</span>
… <span class="c005"><span class="c007">|</span> <span class="c007">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a><sub><span class="c013">n</span></sub> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub><span class="c008">]</span> is defined, then the pattern <span class="c008">#</span><a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
is a shorthand for the following or-pattern:
<span class="c005"><span class="c007">(</span> <span class="c007">`</span></span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a><sub>1</sub><span class="c005"><span class="c007">(_</span> <span class="c007">:</span></span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub><span class="c005"><span class="c007">)</span> <span class="c007">|</span></span> … <span class="c005"><span class="c007">|</span> <span class="c007">`</span></span>&nbsp;<a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a><sub><span class="c013">n</span></sub><span class="c005"><span class="c007">(_</span>
<span class="c007">:</span></span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub><span class="c008">))</span>. It matches all values of type <span class="c008">[&lt;</span> <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> <span class="c008">]</span>.</p><h4 class="subsubsection" id="sec112">Tuple patterns</h4>
<p>The pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">,</span> … <span class="c008">,</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> matches <span class="c013">n</span>-tuples
whose components match the patterns <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> through <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>. That
is, the pattern matches the tuple values (<span class="c013">v</span><sub>1</sub>, …, <span class="c013">v</span><sub><span class="c013">n</span></sub>) such that
<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub> matches <span class="c013">v</span><sub><span class="c013">i</span></sub> for <span class="c013">i</span> = 1,… , <span class="c013">n</span>.</p><h4 class="subsubsection" id="sec113">Record patterns</h4>
<p>The pattern <span class="c008">{</span> <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span>
&nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">}</span> matches records that define at least the fields
<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> through <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub>, and such that the value associated to
<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">i</span></sub> matches the pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub>, for <span class="c013">i</span> = 1,… , <span class="c013">n</span>.
The record value can define more fields than <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> …<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub>; the values associated to these extra fields are not taken
into account for matching.</p><h4 class="subsubsection" id="sec114">Array patterns</h4>
<p>The pattern <span class="c008">[|</span> <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">|]</span>
matches arrays of length <span class="c013">n</span> such that the <span class="c013">i</span>-th array element
matches the pattern <a class="syntax" href="#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub>, for <span class="c013">i</span> = 1,… , <span class="c013">n</span>.</p>











<h2 class="section" id="s:value-expr">7&nbsp;&nbsp;Expressions</h2>
<ul>
<li><a href="#sec116">Basic expressions</a>
</li><li><a href="#sec124">Control structures</a>
</li><li><a href="#sec131">Operations on data structures</a>
</li><li><a href="#sec138">Operators</a>
</li><li><a href="#sec139">Objects</a>
</li><li><a href="#sec145">Coercions</a>
</li></ul>
<p>
<a id="hevea_manual.kwd8"></a>
<a id="hevea_manual.kwd9"></a>
<a id="hevea_manual.kwd10"></a>
<a id="hevea_manual.kwd11"></a>
<a id="hevea_manual.kwd12"></a>
<a id="hevea_manual.kwd13"></a>
<a id="hevea_manual.kwd14"></a>
<a id="hevea_manual.kwd15"></a>
<a id="hevea_manual.kwd16"></a>
<a id="hevea_manual.kwd17"></a>
<a id="hevea_manual.kwd18"></a>
<a id="hevea_manual.kwd19"></a>
<a id="hevea_manual.kwd20"></a>
<a id="hevea_manual.kwd21"></a>
<a id="hevea_manual.kwd22"></a>
<a id="hevea_manual.kwd23"></a>
<a id="hevea_manual.kwd24"></a>
<a id="hevea_manual.kwd25"></a>
<a id="hevea_manual.kwd26"></a>
<a id="hevea_manual.kwd27"></a>
<a id="hevea_manual.kwd28"></a>
<a id="hevea_manual.kwd29"></a>
<a id="hevea_manual.kwd30"></a>
<a id="hevea_manual.kwd31"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="expr"><span class="c014">expr</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#value-path"><span class="c014">value-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="const.html#constant"><span class="c014">constant</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">begin</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{<span class="c008">,</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">::</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">[|</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;<span class="c008">|]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">{</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;<span class="c008">}</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">{</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">with</span>&nbsp;&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;<span class="c008">}</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">-</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">-.</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;<a class="syntax" href="names.html#infix-op"><span class="c014">infix-op</span></a>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.</span>&nbsp;&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.</span>&nbsp;&nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a>&nbsp;<span class="c008">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.(</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.(</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">)</span>&nbsp;<span class="c008">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.[</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">]</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">.[</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">]</span>&nbsp;<span class="c008">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">if</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">then</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;[&nbsp;<span class="c008">else</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">while</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">do</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">done</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">for</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;(&nbsp;<span class="c008">to</span>&nbsp;∣&nbsp;&nbsp;<span class="c008">downto</span>&nbsp;)&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">do</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">done</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">;</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">match</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">with</span>&nbsp;&nbsp;<a class="syntax" href="#pattern-matching"><span class="c014">pattern-matching</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">function</span>&nbsp;<a class="syntax" href="#pattern-matching"><span class="c014">pattern-matching</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">fun</span>&nbsp;<a class="syntax" href="#multiple-matching"><span class="c014">multiple-matching</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">try</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">with</span>&nbsp;&nbsp;<a class="syntax" href="#pattern-matching"><span class="c014">pattern-matching</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">let</span>&nbsp;[<span class="c008">rec</span>]&nbsp;<a class="syntax" href="#let-binding"><span class="c014">let-binding</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#let-binding"><span class="c014">let-binding</span></a>&nbsp;}&nbsp;<span class="c008">in</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">new</span>&nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">object</span>&nbsp;<a class="syntax" href="classes.html#class-body"><span class="c014">class-body</span></a>&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">#</span>&nbsp;&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">:&gt;</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">:&gt;</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">{&lt;</span>&nbsp;[&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;]&nbsp;<span class="c008">&gt;}</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="argument"><span class="c014">argument</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="pattern-matching"><span class="c014">pattern-matching</span></a></td><td class="c022">::=</td><td class="c024">
[&nbsp;<span class="c008">|</span>&nbsp;]&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;[<span class="c008">when</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>]&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;{&nbsp;<span class="c008">|</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;[<span class="c008">when</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>]&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="multiple-matching"><span class="c014">multiple-matching</span></a></td><td class="c022">::=</td><td class="c024">
{&nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a>&nbsp;}<sup>+</sup>&nbsp;&nbsp;[<span class="c008">when</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>]&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="let-binding"><span class="c014">let-binding</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;&nbsp;[<span class="c008">:&gt;</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="parameter"><span class="c014">parameter</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">~</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;&nbsp;[<span class="c008">=</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>]&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">?</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;<span class="c008">(</span>&nbsp;&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;&nbsp;[<span class="c008">=</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>]&nbsp;<span class="c008">)</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The table below shows the relative precedences and associativity of
operators and non-closed constructions. The constructions with higher
precedence come first. For infix and prefix symbols, we write
“<span class="c007">*</span>…” to mean “any symbol starting with <span class="c007">*</span>”.
<a id="hevea_manual.kwd32"></a><a id="hevea_manual.kwd33"></a><a id="hevea_manual.kwd34"></a><a id="hevea_manual.kwd35"></a><a id="hevea_manual.kwd36"></a><a id="hevea_manual.kwd37"></a><a id="hevea_manual.kwd38"></a></p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Construction or operator</span></td><td class="c021"><span class="c019">Associativity</span> </td></tr>
<tr><td class="c023">
prefix-symbol</td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">.   .(   .[   .{</span> (see section&nbsp;<a href="extn.html#s%3Abigarray-access">7.21</a>)</td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">#</span></td><td class="c023">– </td></tr>
<tr><td class="c023">function application, constructor application, tag
application, <span class="c007">assert</span> (see&nbsp;<a href="extn.html#s%3Aassert">7.5</a>),
<span class="c007">lazy</span> (see&nbsp;<a href="extn.html#s%3Alazy">7.6</a>)</td><td class="c023">left </td></tr>
<tr><td class="c023"><span class="c007">-   -.</span> (prefix)</td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">**</span>…<span class="c007">   lsl   lsr   asr</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">*</span>…<span class="c007">   /</span>…<span class="c007">   %</span>…<span class="c007">   mod   land   lor   lxor</span></td><td class="c023">left </td></tr>
<tr><td class="c023"> <span class="c007">+</span>…<span class="c007">   -</span>…</td><td class="c023">left </td></tr>
<tr><td class="c023"><span class="c007">::</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">@</span>…<span class="c007">   ^</span>…</td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">=</span>…<span class="c007">   &lt;</span>…<span class="c007">   &gt;</span>…<span class="c007">   |</span>…<span class="c007">   &amp;</span>…<span class="c007">   $</span>…<span class="c007">   !=</span></td><td class="c023">left </td></tr>
<tr><td class="c023"><span class="c007">&amp;   &amp;&amp;</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">or  ||</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">,</span></td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">&lt;-   :=</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">if</span></td><td class="c023">– </td></tr>
<tr><td class="c023"><span class="c007">;</span></td><td class="c023">right </td></tr>
<tr><td class="c023"><span class="c007">let  match  fun  function  try</span></td><td class="c023">– </td></tr>
</tbody></table></div>
<h3 class="subsection" id="sec116">7.1&nbsp;&nbsp;Basic expressions</h3>
<h4 class="subsubsection" id="sec117">Constants</h4>
<p>An expression consisting in a constant evaluates to this constant.</p><h4 class="subsubsection" id="sec118">Value paths</h4>
<p> <a id="expr:var"></a></p><p>An expression consisting in an access path evaluates to the value bound to
this path in the current evaluation environment. The path can
be either a value name or an access path to a value component of a module.</p><h4 class="subsubsection" id="sec119">Parenthesized expressions</h4>
<p>
<a id="hevea_manual.kwd39"></a>
<a id="hevea_manual.kwd40"></a></p><p>The expressions <span class="c008">(</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">)</span> and <span class="c008">begin</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">end</span> have the same
value as <a class="syntax" href="#expr"><span class="c014">expr</span></a>. The two constructs are semantically equivalent, but it
is good style to use <span class="c008">begin</span> … <span class="c008">end</span> inside control structures:
</p><pre>        if … then begin … ; … end else begin … ; … end
</pre><p>
and <span class="c008">(</span> … <span class="c008">)</span> for the other grouping situations.</p><p>Parenthesized expressions can contain a type constraint, as in <span class="c008">(</span>
<a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">)</span>. This constraint forces the type of <a class="syntax" href="#expr"><span class="c014">expr</span></a> to be
compatible with <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>.</p><p>Parenthesized expressions can also contain coercions
<span class="c008">(</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a> &nbsp;[<span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>] <span class="c008">:&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><span class="c008">)</span> (see
subsection&nbsp;<a href="#s%3Acoercions">6.7.6</a> below).</p><h4 class="subsubsection" id="sec120">Function application</h4>
<p>Function application is denoted by juxtaposition of (possibly labeled)
expressions. The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> &nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub><span class="c013">n</span></sub>
evaluates the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> and those appearing in <a class="syntax" href="#argument"><span class="c014">argument</span></a><sub>1</sub>
to <a class="syntax" href="#argument"><span class="c014">argument</span></a><sub><span class="c013">n</span></sub>. The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> must evaluate to a
functional value <span class="c013">f</span>, which is then applied to the values of
<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub><span class="c013">n</span></sub>.</p><p>The order in which the expressions <a class="syntax" href="#expr"><span class="c014">expr</span></a>, &nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub>1</sub>, …,
&nbsp;<a class="syntax" href="#argument"><span class="c014">argument</span></a><sub><span class="c013">n</span></sub> are evaluated is not specified.</p><p>Arguments and parameters are matched according to their respective
labels. Argument order is irrelevant, except among arguments with the
same label, or no label.</p><p>If a parameter is specified as optional (label prefixed by <span class="c008">?</span>) in the
type of <a class="syntax" href="#expr"><span class="c014">expr</span></a>, the corresponding argument will be automatically
wrapped with the constructor <span class="c007">Some</span>, except if the argument itself is
also prefixed by <span class="c008">?</span>, in which case it is passed as is.
If a non-labeled argument is passed, and its corresponding parameter
is preceded by one or several optional parameters, then these
parameters are <em>defaulted</em>, <em>i.e.</em> the value <span class="c007">None</span> will be
passed for them.
All other missing parameters (without corresponding argument), both
optional and non-optional, will be kept, and the result of the
function will still be a function of these missing parameters to the
body of <span class="c013">f</span>.</p><p>As a special case, if the function has a known arity, all the
arguments are unlabeled, and their number matches the number of
non-optional parameters, then labels are ignored and non-optional
parameters are matched in their definition order. Optional arguments
are defaulted.</p><p>In all cases but exact match of order and labels, without optional
parameters, the function type should be known at the application
point. This can be ensured by adding a type constraint. Principality
of the derivation can be checked in the <span class="c007">-principal</span> mode.</p><h4 class="subsubsection" id="sec121">Function definition</h4>
<p>Two syntactic forms are provided to define functions. The first form
is introduced by the keyword <span class="c007">function</span>:
<a id="hevea_manual.kwd41"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025"><span class="c008">function</span></td><td class="c024"><span class="c018">pattern</span><sub>1</sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub>1</sub>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024">…&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024"><span class="c018">pattern</span><sub><span class="c013">n</span></sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub><span class="c013">n</span></sub>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
This expression evaluates to a functional value with one argument.
When this function is applied to a value <span class="c013">v</span>, this value is
matched against each pattern <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> to <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>.
If one of these matchings succeeds, that is, if the value <span class="c013">v</span>
matches the pattern <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub> for some <span class="c013">i</span>,
then the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> associated to the selected pattern
is evaluated, and its value becomes the value of the function
application. The evaluation of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> takes place in an
environment enriched by the bindings performed during the matching.</p><p>If several patterns match the argument <span class="c013">v</span>, the one that occurs
first in the function definition is selected. If none of the patterns
matches the argument, the exception <span class="c007">Match_failure</span> is raised.
<a id="hevea_manual0"></a></p><p><br>
</p><p>The other form of function definition is introduced by the keyword <span class="c007">fun</span>:
<a id="hevea_manual.kwd42"></a>
</p><div class="center">
<span class="c008">fun</span> <a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
This expression is equivalent to:
</p><div class="center">
<span class="c008">fun</span> <a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub>1</sub> <span class="c008">-&gt;</span> … <span class="c008">fun</span> &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>The parameter patterns <span class="c008">~</span><a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> and <span class="c008">~(</span><a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> &nbsp;[<span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>]<span class="c008">)</span>
are shorthands for respectively <span class="c008">~</span><a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a><span class="c008">:</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> and
<span class="c008">~</span><a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a><span class="c008">:(</span>&nbsp;<a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> &nbsp;[<span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>]<span class="c008">)</span>, and similarly for their optional
counterparts.</p><p>A function of the form <span class="c005"><span class="c007">fun</span> <span class="c007">?</span></span> <a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> <span class="c008">:(</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>0</sub> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span>
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> is equivalent to
</p><div class="center">
<span class="c005"><span class="c007">fun</span> <span class="c007">?</span></span> <a class="syntax" href="lex.html#label-name"><span class="c014">lab</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c005"><span class="c007">-&gt;</span>
<span class="c007">let</span></span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a> <span class="c005"><span class="c007">=</span>
<span class="c007">match</span></span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c005"><span class="c007">with</span> <span class="c007">Some</span></span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c005"><span class="c007">|</span> <span class="c007">None</span> <span class="c007">-&gt;</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>0</sub>
<span class="c008">in</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
where <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
is a fresh variable, except that it is unspecified when <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>0</sub> is evaluated.</p><p>After these two transformations, expressions are of the form
</p><div class="center">
<span class="c008">fun</span> [<a class="syntax" href="lex.html#label"><span class="c014">label</span></a><sub>1</sub>] &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">-&gt;</span> … <span class="c008">fun</span> &nbsp;[<a class="syntax" href="lex.html#label"><span class="c014">label</span></a><sub><span class="c013">n</span></sub>] &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
If we ignore labels, which will only be meaningful at function
application, this is equivalent to
</p><div class="center">
<span class="c008">function</span> <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">-&gt;</span> … <span class="c008">function</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
That is, the <span class="c008">fun</span> expression above evaluates to a curried function
with <span class="c013">n</span> arguments: after applying this function <span class="c013">n</span> times to the
values <span class="c014">v</span><sub>1</sub> … <span class="c014">v</span><sub><span class="c013">n</span></sub>, the values will be matched
in parallel against the patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>.
If the matching succeeds, the function returns the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a> in
an environment enriched by the bindings performed during the matchings.
If the matching fails, the exception <span class="c007">Match_failure</span> is raised.</p><h4 class="subsubsection" id="sec122">Guards in pattern-matchings</h4>
<p><a id="hevea_manual.kwd43"></a>
The cases of a pattern matching (in the <span class="c008">function</span>, <span class="c008">fun</span>, <span class="c008">match</span> and
<span class="c008">try</span> constructs) can include guard expressions, which are
arbitrary boolean expressions that must evaluate to <span class="c007">true</span> for the
match case to be selected. Guards occur just before the <span class="c008">-&gt;</span> token and
are introduced by the <span class="c008">when</span> keyword:</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025"><span class="c008">function</span></td><td class="c024"><span class="c014">pattern</span><sub>1</sub>&nbsp;&nbsp;&nbsp;[<span class="c008">when</span>&nbsp;&nbsp;&nbsp;<span class="c014">cond</span><sub>1</sub>]</td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c014">expr</span><sub>1</sub>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024">…&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024"><span class="c014">pattern</span><sub><span class="c013">n</span></sub>&nbsp;&nbsp;&nbsp;&nbsp;[<span class="c008">when</span>&nbsp;&nbsp;&nbsp;<span class="c014">cond</span><sub><span class="c013">n</span></sub>]</td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c014">expr</span><sub><span class="c013">n</span></sub>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Matching proceeds as described before, except that if the value
matches some pattern <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub> which has a guard <span class="c014">cond</span><sub><span class="c013">i</span></sub>, then the
expression <span class="c014">cond</span><sub><span class="c013">i</span></sub> is evaluated (in an environment enriched by the
bindings performed during matching). If <span class="c014">cond</span><sub><span class="c013">i</span></sub> evaluates to <span class="c007">true</span>,
then <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> is evaluated and its value returned as the result of the
matching, as usual. But if <span class="c014">cond</span><sub><span class="c013">i</span></sub> evaluates to <span class="c007">false</span>, the matching
is resumed against the patterns following <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub>.</p><h4 class="subsubsection" id="sec123">Local definitions</h4>
<p> <a id="s:localdef"></a></p><p><a id="hevea_manual.kwd44"></a></p><p>The <span class="c008">let</span> and <span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span> constructs bind value names locally.
The construct
</p><div class="center">
<span class="c008">let</span> <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">and</span> … <span class="c008">and</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">in</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
evaluates <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> in some unspecified order and matches
their values against the patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>. If the
matchings succeed, <a class="syntax" href="#expr"><span class="c014">expr</span></a> is evaluated in the environment enriched by
the bindings performed during matching, and the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a> is
returned as the value of the whole <span class="c008">let</span> expression. If one of the
matchings fails, the exception <span class="c007">Match_failure</span> is raised.
<a id="hevea_manual1"></a></p><p>An alternate syntax is provided to bind variables to functional
values: instead of writing
</p><div class="center">
<span class="c008">let</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c005"><span class="c007">=</span> <span class="c007">fun</span></span> &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub><span class="c013">m</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
in a <span class="c008">let</span> expression, one may instead write
</p><div class="center">
<span class="c008">let</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#parameter"><span class="c014">parameter</span></a><sub><span class="c013">m</span></sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p><br>
Recursive definitions of names are introduced by <span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span>:
</p><div class="center">
<span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span> <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">and</span> … <span class="c008">and</span> &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>
<span class="c008">in</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
The only difference with the <span class="c008">let</span> construct described above is
that the bindings of names to values performed by the
pattern-matching are considered already performed when the expressions
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> are evaluated. That is, the expressions <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>
to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> can reference identifiers that are bound by one of the
patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>, and expect them to have the
same value as in <a class="syntax" href="#expr"><span class="c014">expr</span></a>, the body of the <span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span> construct.</p><p>The recursive definition is guaranteed to behave as described above if
the expressions <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> are function definitions
(<span class="c008">fun</span> … or <span class="c008">function</span> …), and the patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub>
… &nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub> are just value names, as in:
</p><div class="center">
<span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span> <span class="c014">name</span><sub>1</sub> <span class="c005"><span class="c007">=</span> <span class="c007">fun</span></span> …
<span class="c008">and</span> …
<span class="c008">and</span> &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">=</span> <span class="c007">fun</span></span> …
<span class="c008">in</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>
</div><p>
This defines <span class="c014">name</span><sub>1</sub> … &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> as mutually recursive functions
local to <a class="syntax" href="#expr"><span class="c014">expr</span></a>.</p><p>The behavior of other forms of <span class="c005"><span class="c007">let</span> <span class="c007">rec</span></span> definitions is
implementation-dependent. The current implementation also supports
a certain class of recursive definitions of non-functional values,
as explained in section&nbsp;<a href="extn.html#s%3Aletrecvalues">7.3</a>.</p>
<h3 class="subsection" id="sec124">7.2&nbsp;&nbsp;Control structures</h3>
<h4 class="subsubsection" id="sec125">Sequence</h4>
<p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> first, then
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>, and returns the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>.</p><h4 class="subsubsection" id="sec126">Conditional</h4>
<p>
<a id="hevea_manual.kwd45"></a></p><p>The expression <span class="c008">if</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">then</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">else</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> evaluates to
the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> if <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> evaluates to the boolean <span class="c008">true</span>,
and to the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> if <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> evaluates to the boolean
<span class="c008">false</span>.</p><p>The <span class="c008">else</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> part can be omitted, in which case it defaults to
<span class="c005"><span class="c007">else</span> <span class="c007">()</span></span>.</p><h4 class="subsubsection" id="sec127">Case expression</h4>
<p><a id="hevea_manual.kwd46"></a></p><p>The expression
</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025"><span class="c008">match</span></td><td class="c024"><span class="c018">expr</span>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">with</span></td><td class="c024"><span class="c018">pattern</span><sub>1</sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub>1</sub>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024">…&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024"><span class="c018">pattern</span><sub><span class="c013">n</span></sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub><span class="c013">n</span></sub>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
matches the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a> against the patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> to
<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>. If the matching against <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub> succeeds, the
associated expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> is evaluated, and its value becomes the
value of the whole <span class="c008">match</span> expression. The evaluation of
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> takes place in an environment enriched by the bindings
performed during matching. If several patterns match the value of
<a class="syntax" href="#expr"><span class="c014">expr</span></a>, the one that occurs first in the <span class="c008">match</span> expression is
selected. If none of the patterns match the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a>, the
exception <span class="c007">Match_failure</span> is raised.
<a id="hevea_manual2"></a></p><h4 class="subsubsection" id="sec128">Boolean operators</h4>
<p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">&amp;&amp;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates to <span class="c008">true</span> if both
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> and <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluate to <span class="c008">true</span>; otherwise, it evaluates to
<span class="c008">false</span>. The first component, <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, is evaluated first. The
second component, <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>, is not evaluated if the first component
evaluates to <span class="c008">false</span>. Hence, the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">&amp;&amp;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> behaves
exactly as
</p><div class="center">
<span class="c008">if</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">then</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c005"><span class="c007">else</span> <span class="c007">false</span></span>.
</div><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">||</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates to <span class="c008">true</span> if one of
the expressions
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> and <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates to <span class="c008">true</span>; otherwise, it evaluates to
<span class="c008">false</span>. The first component, <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, is evaluated first. The
second component, <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>, is not evaluated if the first component
evaluates to <span class="c008">true</span>. Hence, the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">||</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> behaves
exactly as
</p><div class="center">
<span class="c008">if</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c005"><span class="c007">then</span> <span class="c007">true</span> <span class="c007">else</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>.
</div><p><a id="hevea_manual.kwd47"></a>
The boolean operators <span class="c008">&amp;</span> and <span class="c008">or</span> are deprecated synonyms for
(respectively) <span class="c008">&amp;&amp;</span> and <span class="c008">||</span>.</p><h4 class="subsubsection" id="sec129">Loops</h4>
<p><a id="hevea_manual.kwd48"></a>
The expression <span class="c008">while</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">do</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">done</span> repeatedly
evaluates <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> while <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> evaluates to <span class="c008">true</span>. The loop
condition <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> is evaluated and tested at the beginning of each
iteration. The whole <span class="c008">while</span> … <span class="c008">done</span> expression evaluates to
the unit value <span class="c008">()</span>.</p><p><a id="hevea_manual.kwd49"></a>
The expression <span class="c005"><span class="c007">for</span> <span class="c014">name</span> <span class="c007">=</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">to</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">do</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> <span class="c008">done</span>
first evaluates the expressions <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> and <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> (the boundaries)
into integer values <span class="c013">n</span> and <span class="c013">p</span>. Then, the loop body <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> is
repeatedly evaluated in an environment where <span class="c014">name</span> is successively
bound to the values
<span class="c013">n</span>, <span class="c013">n</span>+1, …, <span class="c013">p</span>−1, <span class="c013">p</span>.
The loop body is never evaluated if <span class="c013">n</span> &gt; <span class="c013">p</span>.</p><p>The expression <span class="c005"><span class="c007">for</span> <span class="c014">name</span> <span class="c007">=</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">downto</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">do</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> <span class="c008">done</span>
evaluates similarly, except that <span class="c014">name</span> is successively bound to the values
<span class="c013">n</span>, <span class="c013">n</span>−1, …, <span class="c013">p</span>+1, <span class="c013">p</span>.
The loop body is never evaluated if <span class="c013">n</span> &lt; <span class="c013">p</span>.</p><p>In both cases, the whole <span class="c008">for</span> expression evaluates to the unit
value <span class="c008">()</span>.</p><h4 class="subsubsection" id="sec130">Exception handling</h4>
<p>
<a id="hevea_manual.kwd50"></a></p><p>The expression
</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025"><span class="c008">try&nbsp;</span></td><td class="c024"><span class="c018">expr</span>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">with</span></td><td class="c024"><span class="c018">pattern</span><sub>1</sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub>1</sub>&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024">…&nbsp;</td></tr>
<tr><td class="c025"><span class="c008">|</span></td><td class="c024"><span class="c018">pattern</span><sub><span class="c013">n</span></sub></td><td class="c024"><span class="c008">-&gt;</span></td><td class="c024"><span class="c018">expr</span><sub><span class="c013">n</span></sub>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
evaluates the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> and returns its value if the
evaluation of <a class="syntax" href="#expr"><span class="c014">expr</span></a> does not raise any exception. If the evaluation
of <a class="syntax" href="#expr"><span class="c014">expr</span></a> raises an exception, the exception value is matched against
the patterns <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub>1</sub> to <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">n</span></sub>. If the matching against
<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a><sub><span class="c013">i</span></sub> succeeds, the associated expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> is evaluated,
and its value becomes the value of the whole <span class="c008">try</span> expression. The
evaluation of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> takes place in an environment enriched by the
bindings performed during matching. If several patterns match the value of
<a class="syntax" href="#expr"><span class="c014">expr</span></a>, the one that occurs first in the <span class="c008">try</span> expression is
selected. If none of the patterns matches the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a>, the
exception value is raised again, thereby transparently “passing
through” the <span class="c008">try</span> construct.</p>
<h3 class="subsection" id="sec131">7.3&nbsp;&nbsp;Operations on data structures</h3>
<h4 class="subsubsection" id="sec132">Products</h4>
<p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">,</span> … <span class="c008">,</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> evaluates to the
<span class="c013">n</span>-tuple of the values of expressions <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>. The
evaluation order of the subexpressions is not specified.</p><h4 class="subsubsection" id="sec133">Variants</h4>
<p>The expression <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> evaluates to the unary variant value
whose constructor is <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>, and whose argument is the value of
<a class="syntax" href="#expr"><span class="c014">expr</span></a>. Similarly, the expression <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> <span class="c008">(</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">,</span> … <span class="c008">,</span>
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">)</span> evaluates to the n-ary variant value whose constructor is
<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> and whose arguments are the values of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, …,
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>.</p><p>The expression <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a> <span class="c008">(</span>&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub><span class="c008">)</span> evaluates to the
variant value whose constructor is <a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>, and whose arguments are
the values of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>.</p><p>For lists, some syntactic sugar is provided. The expression
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">::</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> stands for the constructor <span class="c005"><span class="c007">(</span> <span class="c007">::</span> <span class="c007">)</span></span> 
applied to the arguments <span class="c008">(</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">,</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">)</span>, and therefore
evaluates to the list whose head is the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> and whose tail
is the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>. The expression <span class="c008">[</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span>
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">]</span> is equivalent to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">::</span> … <span class="c008">::</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">::</span>
<span class="c007">[]</span></span>, and therefore evaluates to the list whose elements are the
values of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>.</p><h4 class="subsubsection" id="sec134">Polymorphic variants</h4>
<p>The expression <span class="c008">`</span><a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> evaluates to the polymorphic variant
value whose tag is <a class="syntax" href="names.html#tag-name"><span class="c014">tag-name</span></a>, and whose argument is the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a>.</p><h4 class="subsubsection" id="sec135">Records</h4>
<p>The expression <span class="c008">{</span> <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span>
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">}</span> evaluates to the record value
{ <span class="c013">field</span><sub>1</sub> = <span class="c013">v</span><sub>1</sub>; …; <span class="c013">field</span><sub><span class="c013">n</span></sub> = <span class="c013">v</span><sub><span class="c013">n</span></sub> }
where <span class="c013">v</span><sub><span class="c013">i</span></sub> is the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">i</span></sub> for <span class="c013">i</span> = 1,… , <span class="c013">n</span>.
The fields <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> to <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> must all belong to the same record
type; each field of this record type must appear exactly
once in the record expression, though they can appear in any
order. The order in which <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> are evaluated is not
specified.</p><p>The expression
<span class="c008">{</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">with</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">}</span>
builds a fresh record with fields <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub> equal to
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>, and all other fields having the same value as
in the record <a class="syntax" href="#expr"><span class="c014">expr</span></a>. In other terms, it returns a shallow copy of
the record <a class="syntax" href="#expr"><span class="c014">expr</span></a>, except for the fields <a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a><sub><span class="c013">n</span></sub>,
which are initialized to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>.</p><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a> evaluates <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to a record
value, and returns the value associated to <a class="syntax" href="names.html#field"><span class="c014">field</span></a> in this record
value.</p><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a> <span class="c008">&lt;-</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to a record
value, which is then modified in-place by replacing the value
associated to <a class="syntax" href="names.html#field"><span class="c014">field</span></a> in this record by the value of
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>. This operation is permitted only if <a class="syntax" href="names.html#field"><span class="c014">field</span></a> has been
declared <span class="c008">mutable</span> in the definition of the record type. The whole
expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.</span> &nbsp;<a class="syntax" href="names.html#field"><span class="c014">field</span></a> <span class="c008">&lt;-</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> evaluates to the unit value
<span class="c008">()</span>.</p><h4 class="subsubsection" id="sec136">Arrays</h4>
<p>The expression <span class="c008">[|</span> <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">|]</span> evaluates to
a <span class="c013">n</span>-element array, whose elements are initialized with the values of
<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> to <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> respectively. The order in which these
expressions are evaluated is unspecified.</p><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.(</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">)</span> returns the value of element
number <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> in the array denoted by <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>. The first element
has number 0; the last element has number <span class="c013">n</span>−1, where <span class="c013">n</span> is the
size of the array. The exception <span class="c007">Invalid_argument</span> is raised if the
access is out of bounds.</p><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.(</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c005"><span class="c007">)</span> <span class="c007">&lt;-</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> modifies in-place
the array denoted by <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, replacing element number <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> by
the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub>. The exception <span class="c007">Invalid_argument</span> is raised if
the access is out of bounds. The value of the whole expression is <span class="c008">()</span>.</p><h4 class="subsubsection" id="sec137">Strings</h4>
<p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.[</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c008">]</span> returns the value of character
number <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> in the string denoted by <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>. The first character
has number 0; the last character has number <span class="c013">n</span>−1, where <span class="c013">n</span> is the
length of the string. The exception <span class="c007">Invalid_argument</span> is raised if the
access is out of bounds.</p><p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">.[</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> <span class="c005"><span class="c007">]</span> <span class="c007">&lt;-</span></span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub> modifies in-place
the string denoted by <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub>, replacing character number <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> by
the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>3</sub>. The exception <span class="c007">Invalid_argument</span> is raised if
the access is out of bounds. The value of the whole expression is <span class="c008">()</span>.</p><p><span class="c019">Note:</span> this possibility is offered only for backward
compatibility with older versions of OCaml and will be removed in a
future version. New code should use byte sequences and the <span class="c007">Bytes.set</span>
function.</p>
<h3 class="subsection" id="sec138">7.4&nbsp;&nbsp;Operators</h3>
<p>Symbols from the class <a class="syntax" href="lex.html#infix-symbol"><span class="c014">infix-symbol</span></a>, as well as the keywords
<span class="c008">*</span>, <span class="c008">+</span>, <span class="c008">-</span>, <span class="c008">-.</span>, <span class="c008">=</span>, <span class="c008">!=</span>, <span class="c008">&lt;</span>, <span class="c008">&gt;</span>, <span class="c008">or</span>, <span class="c008">||</span>,
<span class="c008">&amp;</span>, <span class="c008">&amp;&amp;</span>, <span class="c008">:=</span>, <span class="c008">mod</span>, <span class="c008">land</span>, <span class="c008">lor</span>, <span class="c008">lxor</span>, <span class="c008">lsl</span>, <span class="c008">lsr</span>,
and <span class="c008">asr</span> can appear in infix position (between two
expressions). Symbols from the class <a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a>, as well as
the keywords <span class="c008">-</span> and <span class="c008">-.</span>
can appear in prefix position (in front of an expression).</p><p>Infix and prefix symbols do not have a fixed meaning: they are simply
interpreted as applications of functions bound to the names
corresponding to the symbols. The expression <a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> is
interpreted as the application <span class="c008">(</span> <a class="syntax" href="lex.html#prefix-symbol"><span class="c014">prefix-symbol</span></a> <span class="c008">)</span>
&nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a>. Similarly, the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="lex.html#infix-symbol"><span class="c014">infix-symbol</span></a> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub> is
interpreted as the application <span class="c008">(</span> <a class="syntax" href="lex.html#infix-symbol"><span class="c014">infix-symbol</span></a> <span class="c008">)</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>1</sub> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a><sub>2</sub>.</p><p>The table below lists the symbols defined in the initial environment
and their initial meaning. (See the description of the core
library module <span class="c007">Pervasives</span> in chapter&nbsp;<a href="core.html#c%3Acorelib">20</a> for more
details). Their meaning may be changed at any time using
<span class="c005"><span class="c007">let</span> <span class="c007">(</span></span> <a class="syntax" href="names.html#infix-op"><span class="c014">infix-op</span></a> <span class="c008">)</span> &nbsp;<span class="c014">name</span><sub>1</sub> &nbsp;<span class="c014">name</span><sub>2</sub> <span class="c008">=</span> …</p><p>Note: the operators <span class="c008">&amp;&amp;</span>, <span class="c008">||</span>, and <span class="c008">~-</span> are handled specially
and it is not advisable to change their meaning.</p><p>The keywords <span class="c008">-</span> and <span class="c008">-.</span> can appear both as infix and
prefix operators. When they appear as prefix operators, they are
interpreted respectively as the functions <span class="c008">(~-)</span> and <span class="c008">(~-.)</span>.</p><div class="center"><table class="c001 cellpadding1" border="1"><tbody><tr><td class="c021"><span class="c019">Operator</span></td><td class="c021"><span class="c019">Initial meaning</span> </td></tr>
<tr><td class="c029">
<span class="c007">+</span></td><td class="c028">Integer addition. </td></tr>
<tr><td class="c029"><span class="c007">-</span> (infix)</td><td class="c028">Integer subtraction. </td></tr>
<tr><td class="c029"><span class="c007">~-   -</span> (prefix)</td><td class="c028">Integer negation. </td></tr>
<tr><td class="c029"><span class="c007">*</span></td><td class="c028">Integer multiplication. </td></tr>
<tr><td class="c029"><span class="c007">/</span></td><td class="c028">Integer division.
Raise <span class="c007">Division_by_zero</span> if second argument is zero. </td></tr>
<tr><td class="c029"><span class="c007">mod</span></td><td class="c028">Integer modulus. Raise
<span class="c007">Division_by_zero</span> if second argument is zero. </td></tr>
<tr><td class="c029"><span class="c007">land</span></td><td class="c028">Bitwise logical “and” on integers. </td></tr>
<tr><td class="c029"><span class="c007">lor</span></td><td class="c028">Bitwise logical “or” on integers. </td></tr>
<tr><td class="c029"><span class="c007">lxor</span></td><td class="c028">Bitwise logical “exclusive or” on integers. </td></tr>
<tr><td class="c029"><span class="c007">lsl</span></td><td class="c028">Bitwise logical shift left on integers. </td></tr>
<tr><td class="c029"><span class="c007">lsr</span></td><td class="c028">Bitwise logical shift right on integers. </td></tr>
<tr><td class="c029"><span class="c007">asr</span></td><td class="c028">Bitwise arithmetic shift right on integers. </td></tr>
<tr><td class="c029"><span class="c007">+.</span></td><td class="c028">Floating-point addition. </td></tr>
<tr><td class="c029"><span class="c007">-.</span> (infix)</td><td class="c028">Floating-point subtraction. </td></tr>
<tr><td class="c029"><span class="c007">~-.   -.</span> (prefix)</td><td class="c028">Floating-point negation. </td></tr>
<tr><td class="c029"><span class="c007">*.</span></td><td class="c028">Floating-point multiplication. </td></tr>
<tr><td class="c029"><span class="c007">/.</span></td><td class="c028">Floating-point division. </td></tr>
<tr><td class="c029"><span class="c007">**</span></td><td class="c028">Floating-point exponentiation. </td></tr>
<tr><td class="c029"><span class="c007">@</span> </td><td class="c028">List concatenation. </td></tr>
<tr><td class="c029"><span class="c007">^</span> </td><td class="c028">String concatenation. </td></tr>
<tr><td class="c029"><span class="c007">!</span> </td><td class="c028">Dereferencing (return the current
contents of a reference). </td></tr>
<tr><td class="c029"><span class="c007">:=</span></td><td class="c028">Reference assignment (update the
reference given as first argument with the value of the second
argument). </td></tr>
<tr><td class="c029"><span class="c007">=</span> </td><td class="c028">Structural equality test. </td></tr>
<tr><td class="c029"><span class="c007">&lt;&gt;</span> </td><td class="c028">Structural inequality test. </td></tr>
<tr><td class="c029"><span class="c007">==</span> </td><td class="c028">Physical equality test. </td></tr>
<tr><td class="c029"><span class="c007">!=</span> </td><td class="c028">Physical inequality test. </td></tr>
<tr><td class="c029"><span class="c007">&lt;</span> </td><td class="c028">Test “less than”. </td></tr>
<tr><td class="c029"><span class="c007">&lt;=</span> </td><td class="c028">Test “less than or equal”. </td></tr>
<tr><td class="c029"><span class="c007">&gt;</span> </td><td class="c028">Test “greater than”. </td></tr>
<tr><td class="c029"><span class="c007">&gt;=</span> </td><td class="c028">Test “greater than or equal”. </td></tr>
<tr><td class="c029"><span class="c007">&amp;&amp;   &amp;</span></td><td class="c028">Boolean conjunction. </td></tr>
<tr><td class="c029"><span class="c007">||   or</span></td><td class="c028">Boolean disjunction. </td></tr>
</tbody></table></div>
<h3 class="subsection" id="sec139">7.5&nbsp;&nbsp;Objects</h3>
<p> <a id="s:objects"></a></p><h4 class="subsubsection" id="sec140">Object creation</h4>
<p><a id="hevea_manual.kwd51"></a></p><p>When <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> evaluates to a class body, <span class="c008">new</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
evaluates to a new object containing the instance variables and
methods of this class.</p><p>When <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> evaluates to a class function, <span class="c008">new</span> <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
evaluates to a function expecting the same number of arguments and
returning a new object of this class.</p><h4 class="subsubsection" id="sec141">Immediate object creation</h4>
<p><a id="hevea_manual.kwd52"></a></p><p>Creating directly an object through the <span class="c008">object</span> <a class="syntax" href="classes.html#class-body"><span class="c014">class-body</span></a> <span class="c008">end</span>
construct is operationally equivalent to defining locally a <span class="c008">class</span>
<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> <span class="c005"><span class="c007">=</span> <span class="c007">object</span></span> &nbsp;<a class="syntax" href="classes.html#class-body"><span class="c014">class-body</span></a> <span class="c008">end</span> —see sections
<a href="classes.html#ss%3Aclass-body">6.9.2</a> and following for the syntax of <a class="syntax" href="classes.html#class-body"><span class="c014">class-body</span></a>—
and immediately creating a single object from it by <span class="c008">new</span> <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a>.</p><p>The typing of immediate objects is slightly different from explicitly
defining a class in two respects. First, the inferred object type may
contain free type variables. Second, since the class body of an
immediate object will never be extended, its self type can be unified
with a closed object type.</p><h4 class="subsubsection" id="sec142">Method invocation</h4>
<p>The expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">#</span> &nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> invokes the method
<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> of the object denoted by <a class="syntax" href="#expr"><span class="c014">expr</span></a>.</p><p>If <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> is a polymorphic method, its type should be known at
the invocation site. This is true for instance if <a class="syntax" href="#expr"><span class="c014">expr</span></a> is the name
of a fresh object (<span class="c008">let</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> = <span class="c008">new</span> &nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> … ) or if
there is a type constraint. Principality of the derivation can be
checked in the <span class="c007">-principal</span> mode.</p><h4 class="subsubsection" id="sec143">Accessing and modifying instance variables</h4>
<p>The instance variables of a class are visible only in the body of the
methods defined in the same class or a class that inherits from the
class defining the instance variables. The expression <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>
evaluates to the value of the given instance variable. The expression
<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">&lt;-</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> assigns the value of <a class="syntax" href="#expr"><span class="c014">expr</span></a> to the instance
variable <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>, which must be mutable. The whole expression
<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">&lt;-</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> evaluates to <span class="c008">()</span>.</p><h4 class="subsubsection" id="sec144">Object duplication</h4>
<p>An object can be duplicated using the library function <span class="c007">Oo.copy</span>
(see
<a href="../../api/4.02/Oo.html">Module <span class="c007">Oo</span></a>). Inside a method, the expression
 <span class="c008">{&lt;</span> <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> &nbsp;{ <span class="c008">;</span> <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#expr"><span class="c014">expr</span></a> } <span class="c008">&gt;}</span>
returns a copy of self with the given instance variables replaced by
the values of the associated expressions; other instance variables
have the same value in the returned object as in self.</p>
<h3 class="subsection" id="sec145">7.6&nbsp;&nbsp;Coercions</h3>
<p> <a id="s:coercions"></a></p><p>Expressions whose type contains object or polymorphic variant types
can be explicitly coerced (weakened) to a supertype.
The expression <span class="c008">(</span><a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">:&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><span class="c008">)</span> coerces the expression <a class="syntax" href="#expr"><span class="c014">expr</span></a>
to type <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>.
The expression <span class="c008">(</span><a class="syntax" href="#expr"><span class="c014">expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">:&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>2</sub><span class="c008">)</span> coerces the
expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> from type <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> to type <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>2</sub>.</p><p>The former operator will sometimes fail to coerce an expression <a class="syntax" href="#expr"><span class="c014">expr</span></a>
from a type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> to a type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>
even if type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> is a subtype of type
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>: in the current implementation it only expands two levels of
type abbreviations containing objects and/or polymorphic variants,
keeping only recursion when it is explicit in the class type (for objects).
As an exception to the above algorithm, if both the inferred type of <a class="syntax" href="#expr"><span class="c014">expr</span></a>
and <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a> are ground (<em>i.e.</em> do not contain type variables), the
former operator behaves as the latter one, taking the inferred type of
<a class="syntax" href="#expr"><span class="c014">expr</span></a> as <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub>. In case of failure with the former operator,
the latter one should be used.</p><p>It is only possible to coerce an expression <a class="syntax" href="#expr"><span class="c014">expr</span></a> from type
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> to type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>, if the type of <a class="syntax" href="#expr"><span class="c014">expr</span></a> is an instance of
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> (like for a type annotation), and <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> is a subtype
of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>. The type of the coerced expression is an
instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>. If the types contain variables,
they may be instantiated by the subtyping algorithm, but this is only
done after determining whether <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> is a potential subtype of
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>. This means that typing may fail during this latter
unification step, even if some instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> is a subtype of
some instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub>.
In the following paragraphs we describe the subtyping relation used.</p><h4 class="subsubsection" id="sec146">Object types</h4>
<p>A fixed object type admits as subtype any object type that includes all
its methods. The types of the methods shall be subtypes of those in
the supertype. Namely,
</p><div class="center">
 <span class="c008">&lt;</span> <a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub><span class="c013">n</span></sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub><span class="c013">n</span></sub> <span class="c008">&gt;</span> 
</div><p>
is a supertype of
</p><div class="center">
 <span class="c008">&lt;</span> <a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> <a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub><span class="c013">n</span></sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span></sub> <span class="c008">;</span>
<a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub><span class="c013">n</span>+1</sub> <span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span>+1</sub> <span class="c008">;</span> … <span class="c008">;</span> <a class="syntax" href="names.html#method-name"><span class="c014">met</span></a><sub><span class="c013">n</span>+<span class="c013">m</span></sub> <span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span>+<span class="c013">m</span></sub>
&nbsp;[<span class="c005"><span class="c007">;</span> <span class="c007">..</span></span>] <span class="c008">&gt;</span> 
</div><p>
which may contain an ellipsis <span class="c007">..</span> if every <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub><span class="c013">i</span></sub> is a supertype of
the corresponding <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">i</span></sub>.</p><p>A monomorphic method type can be a supertype of a polymorphic method
type. Namely, if <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a> is an instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′, then  <span class="c008">'</span><span class="c014">a</span><sub>1</sub>
… <span class="c008">'</span><span class="c014">a</span><sub><span class="c013">n</span></sub> <span class="c008">.</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′ is a subtype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>.</p><p>Inside a class definition, newly defined types are not available for
subtyping, as the type abbreviations are not yet completely
defined. There is an exception for coercing <span class="c014">self</span> to the (exact)
type of its class: this is allowed if the type of <span class="c014">self</span> does not
appear in a contravariant position in the class type, <em>i.e.</em> if
there are no binary methods.</p><h4 class="subsubsection" id="sec147">Polymorphic variant types</h4>
<p>A polymorphic variant type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a> is a subtype of another polymorphic
variant type <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′ if the upper bound of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a> (<em>i.e.</em> the
maximum set of constructors that may appear in an instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>)
is included in the lower bound of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′, and the types of arguments
for the constructors of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a> are subtypes of those in
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′. Namely,
</p><div class="center">
 <span class="c008">[</span>[<span class="c008">&lt;</span>] <span class="c008">`</span><a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub>1</sub> <span class="c008">of</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> <span class="c008">|</span> … <span class="c005"><span class="c007">|</span> <span class="c007">`</span></span>&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub><span class="c013">n</span></sub> <span class="c008">of</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub><span class="c013">n</span></sub> <span class="c008">]</span> 
</div><p>
which may be a shrinkable type, is a subtype of
</p><div class="center">
 <span class="c008">[</span>[<span class="c008">&gt;</span>] <span class="c008">`</span><a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub>1</sub> <span class="c008">of</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub> <span class="c008">|</span> … <span class="c005"><span class="c007">|</span> <span class="c007">`</span></span><a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub><span class="c013">n</span></sub> <span class="c008">of</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span></sub>
<span class="c005"><span class="c007">|</span> <span class="c007">`</span></span><a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub><span class="c013">n</span>+1</sub> <span class="c008">of</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span>+1</sub> <span class="c008">|</span> … <span class="c005"><span class="c007">|</span> <span class="c007">`</span></span><a class="syntax" href="names.html#constr-name"><span class="c014">C</span></a><sub><span class="c013">n</span>+<span class="c013">m</span></sub> <span class="c008">of</span>
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">n</span>+<span class="c013">m</span></sub> <span class="c008">]</span> 
</div><p>
which may be an extensible type, if every <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub><span class="c013">i</span></sub> is a subtype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub><span class="c013">i</span></sub>.</p><h4 class="subsubsection" id="sec148">Variance</h4>
<p>Other types do not introduce new subtyping, but they may propagate the
subtyping of their arguments. For instance, <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> <span class="c008">*</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub> is a
subtype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub> <span class="c008">*</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>2</sub> when <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> and <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub> are
respectively subtypes of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub> and <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>2</sub>.
For function types, the relation is more subtle:
<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub> is a subtype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub>&nbsp;<span class="c008">-&gt;</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>2</sub>
if <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>1</sub> is a supertype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>1</sub> and <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a><sub>2</sub> is a
subtype of <a class="syntax" href="types.html#typexpr"><span class="c014">typ</span></a>′<sub>2</sub>. For this reason, function types are covariant in
their second argument (like tuples), but contravariant in their first
argument. Mutable types, like <span class="c007">array</span> or <span class="c007">ref</span> are neither covariant
nor contravariant, they are nonvariant, that is they do not propagate
subtyping.</p><p>For user-defined types, the variance is automatically inferred: a
parameter is covariant if it has only covariant occurrences,
contravariant if it has only contravariant occurrences,
variance-free if it has no occurrences, and nonvariant otherwise.
A variance-free parameter may change freely through subtyping, it does
not have to be a subtype or a supertype.
For abstract and private types, the variance must be given explicitly
(see section&nbsp;<a href="typedecl.html#s%3Atype-defs">6.8.1</a>),
otherwise the default is nonvariant. This is also the case for
constrained arguments in type definitions.</p>











<h2 class="section" id="sec149">8&nbsp;&nbsp;Type and exception definitions</h2>
<ul>
<li><a href="#sec150">Type definitions</a>
</li><li><a href="#sec151">Exception definitions</a>
</li></ul>

<h3 class="subsection" id="sec150">8.1&nbsp;&nbsp;Type definitions</h3>
<p>
<a id="s:type-defs"></a></p><p>Type definitions bind type constructors to data types: either
variant types, record types, type abbreviations, or abstract data
types. They also bind the value constructors and record fields
associated with the definition.</p><p><a id="hevea_manual.kwd53"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="type-definition"><span class="c014">type-definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">type</span>&nbsp;<a class="syntax" href="#typedef"><span class="c014">typedef</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#typedef"><span class="c014">typedef</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="typedef"><span class="c014">typedef</span></a></td><td class="c022">::=</td><td class="c024">
[<a class="syntax" href="#type-params"><span class="c014">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr-name"><span class="c014">typeconstr-name</span></a>&nbsp;&nbsp;<a class="syntax" href="#type-information"><span class="c014">type-information</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-information"><span class="c014">type-information</span></a></td><td class="c022">::=</td><td class="c024">
[<a class="syntax" href="#type-equation"><span class="c014">type-equation</span></a>]&nbsp;&nbsp;[<a class="syntax" href="#type-representation"><span class="c014">type-representation</span></a>]&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#type-constraint"><span class="c014">type-constraint</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-equation"><span class="c014">type-equation</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">=</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-representation"><span class="c014">type-representation</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">=</span>&nbsp;[<span class="c008">|</span>]&nbsp;<a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">|</span>&nbsp;<a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">=</span>&nbsp;<span class="c008">{</span>&nbsp;<a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;<span class="c008">}</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-params"><span class="c014">type-params</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="#type-param"><span class="c014">type-param</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#type-param"><span class="c014">type-param</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">,</span>&nbsp;<a class="syntax" href="#type-param"><span class="c014">type-param</span></a>&nbsp;}&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-param"><span class="c014">type-param</span></a></td><td class="c022">::=</td><td class="c024">
[<a class="syntax" href="#variance"><span class="c014">variance</span></a>]&nbsp;<span class="c008">'</span>&nbsp;&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="variance"><span class="c014">variance</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">+</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">-</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="constr-decl"><span class="c014">constr-decl</span></a></td><td class="c022">::=</td><td class="c024">
(<a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">()</span>)&nbsp;[&nbsp;<span class="c008">of</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">*</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;}&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="field-decl"><span class="c014">field-decl</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">mutable</span>]&nbsp;<a class="syntax" href="names.html#field-name"><span class="c014">field-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-constraint"><span class="c014">type-constraint</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">constraint</span>&nbsp;<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
<a id="hevea_manual.kwd54"></a>
<a id="hevea_manual.kwd55"></a></p><p>Type definitions are introduced by the <span class="c007">type</span> keyword, and
consist in one or several simple definitions, possibly mutually
recursive, separated by the <span class="c007">and</span> keyword. Each simple definition
defines one type constructor.</p><p>A simple definition consists in a lowercase identifier, possibly
preceded by one or several type parameters, and followed by an
optional type equation, then an optional type representation, and then
a constraint clause. The identifier is the name of the type
constructor being defined.</p><p>The optional type parameters are either one type variable <span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>,
for type constructors with one parameter, or a list of type variables
<span class="c008">('</span><a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a><sub>1</sub>,…,<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a><sub><span class="c013">n</span></sub><span class="c008">)</span>, for type constructors with several
parameters. Each type parameter may be prefixed by a variance
constraint <span class="c008">+</span> (resp. <span class="c008">-</span>) indicating that the parameter is
covariant (resp. contravariant). These type parameters can appear in
the type expressions of the right-hand side of the definition,
optionally restricted by a variance constraint ; <em>i.e.</em> a
covariant parameter may only appear on the right side of a functional
arrow (more precisely, follow the left branch of an even number of
arrows), and a contravariant parameter only the left side (left branch of
an odd number of arrows). If the type has a representation or
an equation, and the parameter is free (<em>i.e.</em> not bound via a
type constraint to a constructed type), its variance constraint is
checked but subtyping <em>etc.</em> will use the inferred variance of the
parameter, which may be less restrictive; otherwise (<em>i.e.</em> for abstract
types or non-free parameters), the variance must be given explicitly,
and the parameter is invariant if no variance is given.</p><p>The optional type equation <span class="c008">=</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> makes the defined type
equivalent to the type expression <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>:
one can be substituted for the other during typing.
If no type equation is given, a new type is generated: the defined type
is incompatible with any other type.</p><p>The optional type representation describes the data structure
representing the defined type, by giving the list of associated
constructors (if it is a variant type) or associated fields (if it is
a record type). If no type representation is given, nothing is
assumed on the structure of the type besides what is stated in the
optional type equation.</p><p>The type representation <span class="c008">=</span> [<span class="c008">|</span>] <a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a> &nbsp;{ <span class="c008">|</span> <a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a> }
describes a variant type. The constructor declarations
<a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="#constr-decl"><span class="c014">constr-decl</span></a><sub><span class="c013">n</span></sub> describe the constructors
associated to this variant type. The constructor
declaration <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> <span class="c008">of</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">*</span> … <span class="c008">*</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>
declares the name <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> as a non-constant constructor, whose
arguments have types <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> …<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>.
The constructor declaration <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a>
declares the name <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> as a constant
constructor. Constructor names must be capitalized.</p><p>The type representation <span class="c005"><span class="c007">=</span> <span class="c007">{</span></span> <a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a> &nbsp;{ <span class="c008">;</span> <a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a> } &nbsp;[<span class="c008">;</span>] <span class="c008">}</span>
describes a record type. The field declarations <a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a><sub>1</sub>, …,
&nbsp;<a class="syntax" href="#field-decl"><span class="c014">field-decl</span></a><sub><span class="c013">n</span></sub> describe the fields associated to this record type.
The field declaration <a class="syntax" href="names.html#field-name"><span class="c014">field-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a> declares
<a class="syntax" href="names.html#field-name"><span class="c014">field-name</span></a> as a field whose argument has type <a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>.
The field declaration <span class="c008">mutable</span> <a class="syntax" href="names.html#field-name"><span class="c014">field-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
<a id="hevea_manual.kwd56"></a>
behaves similarly; in addition, it allows physical modification of
this field.
Immutable fields are covariant, mutable fields are non-variant.
Both mutable and immutable fields may have a explicitly polymorphic
types. The polymorphism of the contents is statically checked whenever
a record value is created or modified. Extracted values may have their
types instantiated.</p><p>The two components of a type definition, the optional equation and the
optional representation, can be combined independently, giving
rise to four typical situations:</p><dl class="description"><dt class="dt-description">
<span class="c019">Abstract type: no equation, no representation.</span></dt><dd class="dd-description"> &nbsp;<br>
When appearing in a module signature, this definition specifies
nothing on the type constructor, besides its number of parameters:
its representation is hidden and it is assumed incompatible with any
other type.</dd><dt class="dt-description"><span class="c019">Type abbreviation: an equation, no representation.</span></dt><dd class="dd-description"> &nbsp;<br>
This defines the type constructor as an abbreviation for the type
expression on the right of the <span class="c008">=</span> sign.</dd><dt class="dt-description"><span class="c019">New variant type or record type: no equation, a representation.</span></dt><dd class="dd-description"> &nbsp;<br>
This generates a new type constructor and defines associated
constructors or fields, through which values of that type can be
directly built or inspected.</dd><dt class="dt-description"><span class="c019">Re-exported variant type or record type: an equation,
a representation.</span></dt><dd class="dd-description"> &nbsp;<br>
In this case, the type constructor is defined as an abbreviation for
the type expression given in the equation, but in addition the
constructors or fields given in the representation remain attached to
the defined type constructor. The type expression in the equation part
must agree with the representation: it must be of the same kind
(record or variant) and have exactly the same constructors or fields,
in the same order, with the same arguments.
</dd></dl><p>The type variables appearing as type parameters can optionally be
prefixed by <span class="c007">+</span> or <span class="c007">-</span> to indicate that the type constructor is
covariant or contravariant with respect to this parameter. This
variance information is used to decide subtyping relations when
checking the validity of <span class="c008">:&gt;</span> coercions (see section <a href="expr.html#s%3Acoercions">6.7.6</a>).</p><p>For instance, <span class="c007">type +'a t</span> declares <span class="c007">t</span> as an abstract type that is
covariant in its parameter; this means that if the type τ is a
subtype of the type σ, then τ <span class="c009"> t</span> is a subtype of σ
<span class="c009"> t</span>. Similarly, <span class="c007">type -'a t</span> declares that the abstract type <span class="c007">t</span> is
contravariant in its parameter: if τ is a subtype of σ, then
σ <span class="c009"> t</span> is a subtype of τ <span class="c009"> t</span>. If no <span class="c007">+</span> or <span class="c007">-</span> variance
annotation is given, the type constructor is assumed non-variant in the
corresponding parameter. For instance, the abstract type declaration
<span class="c007">type 'a t</span> means that τ <span class="c009"> t</span> is neither a subtype nor a
supertype of σ <span class="c009"> t</span> if τ is subtype of σ.</p><p>The variance indicated by the <span class="c007">+</span> and <span class="c007">-</span> annotations on parameters
are required only for abstract types. For abbreviations, variant
types or record types, the variance properties of the type constructor
are inferred from its definition, and the variance annotations are
only checked for conformance with the definition.</p><p><a id="hevea_manual.kwd57"></a>
The construct  <span class="c005"><span class="c007">constraint</span> <span class="c007">'</span></span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>  allows the
specification of
type parameters. Any actual type argument corresponding to the type
parameter <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> has to be an instance of <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> (more precisely,
<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a> and <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> are unified). Type variables of <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> can
appear in the type equation and the type declaration.</p>
<h3 class="subsection" id="sec151">8.2&nbsp;&nbsp;Exception definitions</h3>
<p> <a id="s:excdef"></a>
<a id="hevea_manual.kwd58"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="exception-definition"><span class="c014">exception-definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">exception</span>&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a>&nbsp;&nbsp;[&nbsp;<span class="c008">of</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">*</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;}&nbsp;]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">exception</span>&nbsp;<a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Exception definitions add new constructors to the built-in variant
type <code>exn</code> of exception values. The constructors are declared as
for a definition of a variant type.</p><p>The form <span class="c008">exception</span> <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> &nbsp;[<span class="c008">of</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> &nbsp;{<span class="c008">*</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>}]
generates a new exception, distinct from all other exceptions in the system.
The form <span class="c008">exception</span> <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>
gives an alternate name to an existing exception.

</p>











<h2 class="section" id="sec152">9&nbsp;&nbsp;Classes</h2>
<ul>
<li><a href="#sec153">Class types</a>
</li><li><a href="#sec162">Class expressions</a>
</li><li><a href="#sec175">Class definitions</a>
</li><li><a href="#sec178">Class specifications</a>
</li><li><a href="#sec179">Class type definitions</a>
</li></ul>
<p>
Classes are defined using a small language, similar to the module
language.</p>
<h3 class="subsection" id="sec153">9.1&nbsp;&nbsp;Class types</h3>
<p>Class types are the class-level equivalent of type expressions: they
specify the general shape and type properties of classes.</p><p><a id="hevea_manual.kwd59"></a>
<a id="hevea_manual.kwd60"></a>
<a id="hevea_manual.kwd61"></a>
<a id="hevea_manual.kwd62"></a>
<a id="hevea_manual.kwd63"></a>
<a id="hevea_manual.kwd64"></a>
<a id="hevea_manual.kwd65"></a>
<a id="hevea_manual.kwd66"></a>
<a id="hevea_manual.kwd67"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-type"><span class="c014">class-type</span></a></td><td class="c022">::=</td><td class="c024">
[[<span class="c008">?</span>]<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a><span class="c008">:</span>]&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;&nbsp;<a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-body-type"><span class="c014">class-body-type</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">object</span>&nbsp;[<span class="c008">(</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">)</span>]&nbsp;&nbsp;{<a class="syntax" href="#class-field-spec"><span class="c014">class-field-spec</span></a>}&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;[<span class="c008">[</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{<span class="c008">,</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>}&nbsp;<span class="c008">]</span>]&nbsp;&nbsp;<a class="syntax" href="names.html#classtype-path"><span class="c014">classtype-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-field-spec"><span class="c014">class-field-spec</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">inherit</span>&nbsp;<a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">val</span>&nbsp;[<span class="c008">mutable</span>]&nbsp;[<span class="c008">virtual</span>]&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">val</span>&nbsp;<span class="c008">virtual</span>&nbsp;<span class="c008">mutable</span>&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;[<span class="c008">private</span>]&nbsp;[<span class="c008">virtual</span>]&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;<span class="c008">virtual</span>&nbsp;<span class="c008">private</span>&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">constraint</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><h4 class="subsubsection" id="sec154">Simple class expressions</h4>
<p>The expression <a class="syntax" href="names.html#classtype-path"><span class="c014">classtype-path</span></a> is equivalent to the class type bound to
the name <a class="syntax" href="names.html#classtype-path"><span class="c014">classtype-path</span></a>. Similarly, the expression
<span class="c008">[</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">,</span> … &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub> <span class="c008">]</span> &nbsp;<a class="syntax" href="names.html#classtype-path"><span class="c014">classtype-path</span></a> is equivalent to
the parametric class type bound to the name <a class="syntax" href="names.html#classtype-path"><span class="c014">classtype-path</span></a>, in which
type parameters have been instantiated to respectively <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub>,
…<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>.</p><h4 class="subsubsection" id="sec155">Class function type</h4>
<p>The class type expression <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a> is the type of
class functions (functions from values to classes) that take as
argument a value of type <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> and return as result a class of
type <a class="syntax" href="#class-type"><span class="c014">class-type</span></a>.</p><h4 class="subsubsection" id="sec156">Class body type</h4>
<p>The class type expression
<span class="c008">object</span> [<span class="c008">(</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">)</span>] &nbsp;{<a class="syntax" href="#class-field-spec"><span class="c014">class-field-spec</span></a>} <span class="c008">end</span>
is the type of a class body. It specifies its instance variables and
methods. In this type, <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> is matched against the self type, therefore
providing a name for the self type.</p><p>A class body will match a class body type if it provides definitions
for all the components specified in the class body type, and these
definitions meet the type requirements given in the class body type.
Furthermore, all methods either virtual or public present in the class
body must also be present in the class body type (on the other hand, some
instance variables and concrete private methods may be omitted). A
virtual method will match a concrete method, which makes it possible
to forget its implementation. An immutable instance variable will match a
mutable instance variable.</p><h4 class="subsubsection" id="sec157">Inheritance</h4>
<p><a id="hevea_manual.kwd68"></a></p><p>The inheritance construct <span class="c008">inherit</span> <a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a> provides for inclusion of
methods and instance variables from other class types.
The instance variable and method types from <a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a> are added
into the current class type.</p><h4 class="subsubsection" id="sec158">Instance variable specification</h4>
<p><a id="hevea_manual.kwd69"></a>
<a id="hevea_manual.kwd70"></a>
<a id="hevea_manual.kwd71"></a></p><p>A specification of an instance variable is written
<span class="c008">val</span> [<span class="c008">mutable</span>] [<span class="c008">virtual</span>] <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>, where
<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>
is the name of the instance variable and <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> its expected type.
The flag <span class="c008">mutable</span> indicates whether this instance variable can be
physically modified.
The flag <span class="c008">virtual</span> indicates that this instance variable is not
initialized. It can be initialized later through inheritance.</p><p>An instance variable specification will hide any previous
specification of an instance variable of the same name.</p><h4 class="subsubsection" id="sec159">Method specification</h4>
<p>
<a id="sec-methspec"></a></p><p><a id="hevea_manual.kwd72"></a>
<a id="hevea_manual.kwd73"></a></p><p>The specification of a method is written
<span class="c008">method</span> [<span class="c008">private</span>] <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>, where
<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> is the name of the method and <a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a> its
expected type, possibly polymorphic. The flag <span class="c008">private</span> indicates
that the method cannot be accessed from outside the object.</p><p>The polymorphism may be left implicit in public method specifications:
any type variable which is not bound to a class parameter and does not
appear elsewhere inside the class specification will be assumed to be
universal, and made polymorphic in the resulting method type.
Writing an explicit polymorphic type will disable this behaviour.</p><p>If several specifications are present for the same method, they
must have compatible types.
Any non-private specification of a method forces it to be public.</p><h4 class="subsubsection" id="sec160">Virtual method specification</h4>
<p><a id="hevea_manual.kwd74"></a>
<a id="hevea_manual.kwd75"></a>
<a id="hevea_manual.kwd76"></a></p><p>A virtual method specification is written <span class="c008">method</span> [<span class="c008">private</span>]
<span class="c008">virtual</span> <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>, where <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> is the
name of the method and <a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a> its expected type.</p><h4 class="subsubsection" id="sec161">Constraints on type parameters</h4>
<p><a id="hevea_manual.kwd77"></a></p><p>The construct <span class="c008">constraint</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>2</sub> forces the two
type expressions to be equal. This is typically used to specify type
parameters: in this way, they can be bound to specific type
expressions.</p>
<h3 class="subsection" id="sec162">9.2&nbsp;&nbsp;Class expressions</h3>
<p>Class expressions are the class-level equivalent of value expressions:
they evaluate to classes, thus providing implementations for the
specifications expressed in class types.</p><p><a id="hevea_manual.kwd78"></a>
<a id="hevea_manual.kwd79"></a>
<a id="hevea_manual.kwd80"></a>
<a id="hevea_manual.kwd81"></a>
<a id="hevea_manual.kwd82"></a>
<a id="hevea_manual.kwd83"></a>
<a id="hevea_manual.kwd84"></a>
<a id="hevea_manual.kwd85"></a>
<a id="hevea_manual.kwd86"></a>
<a id="hevea_manual.kwd87"></a>
<a id="hevea_manual.kwd88"></a>
<a id="hevea_manual.kwd89"></a>
<a id="hevea_manual.kwd90"></a>
<a id="hevea_manual.kwd91"></a>
<a id="hevea_manual.kwd92"></a>
<a id="hevea_manual.kwd93"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-expr"><span class="c014">class-expr</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">[</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;&nbsp;{<span class="c008">,</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>}&nbsp;<span class="c008">]</span>&nbsp;&nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>&nbsp;&nbsp;{<a class="syntax" href="expr.html#argument"><span class="c014">argument</span></a>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">fun</span>&nbsp;{<a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a>}<sup>+</sup>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">let</span>&nbsp;[<span class="c008">rec</span>]&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>&nbsp;&nbsp;{<span class="c008">and</span>&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>}&nbsp;<span class="c008">in</span>&nbsp;&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">object</span>&nbsp;<a class="syntax" href="#class-body"><span class="c014">class-body</span></a>&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-field"><span class="c014">class-field</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">inherit</span>&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>&nbsp;&nbsp;[<span class="c008">as</span>&nbsp;<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">val</span>&nbsp;[<span class="c008">mutable</span>]&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">val</span>&nbsp;[<span class="c008">mutable</span>]&nbsp;<span class="c008">virtual</span>&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">val</span>&nbsp;<span class="c008">virtual</span>&nbsp;<span class="c008">mutable</span>&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;[<span class="c008">private</span>]&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;&nbsp;{<a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a>}&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;[<span class="c008">private</span>]&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;[<span class="c008">private</span>]&nbsp;<span class="c008">virtual</span>&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">method</span>&nbsp;<span class="c008">virtual</span>&nbsp;<span class="c008">private</span>&nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">constraint</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;&nbsp;<span class="c008">initializer</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><h4 class="subsubsection" id="sec163">Simple class expressions</h4>
<p>The expression <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a> evaluates to the class bound to the name
<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>. Similarly, the expression
<span class="c008">[</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">,</span> … &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub> <span class="c008">]</span> &nbsp;<a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>
evaluates to the parametric class bound to the name <a class="syntax" href="names.html#class-path"><span class="c014">class-path</span></a>,
in which type parameters have been instantiated respectively to
<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub>, …<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub><span class="c013">n</span></sub>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> <span class="c008">)</span> evaluates to the same module as
<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a> <span class="c008">)</span> checks that
<a class="syntax" href="#class-type"><span class="c014">class-type</span></a> matches the type of <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> (that is, that the
implementation <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> meets the type specification
<a class="syntax" href="#class-type"><span class="c014">class-type</span></a>). The whole expression evaluates to the same class as
<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>, except that all components not specified in
<a class="syntax" href="#class-type"><span class="c014">class-type</span></a> are hidden and can no longer be accessed.</p><h4 class="subsubsection" id="sec164">Class application</h4>
<p>Class application is denoted by juxtaposition of (possibly labeled)
expressions. It denotes the class whose constructor is the first
expression applied to the given arguments. The arguments are
evaluated as for expression application, but the constructor itself will
only be evaluated when objects are created. In particular, side-effects
caused by the application of the constructor will only occur at object
creation time.</p><h4 class="subsubsection" id="sec165">Class function</h4>
<p>The expression <span class="c008">fun</span> [[<span class="c008">?</span>]<a class="syntax" href="lex.html#label-name"><span class="c014">label-name</span></a><span class="c008">:</span>]&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> evaluates
to a function from values to classes.
When this function is applied to a value <span class="c013">v</span>, this value is
matched against the pattern <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a> and the result is the result of
the evaluation of <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> in the extended environment.</p><p>Conversion from functions with default values to functions with
patterns only works identically for class functions as for normal
functions.</p><p>The expression
</p><div class="center">
<span class="c008">fun</span> <a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a><sub>1</sub> … &nbsp;<a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>
</div><p>
is a short form for
</p><div class="center">
<span class="c008">fun</span> <a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a><sub>1</sub> <span class="c008">-&gt;</span> … <span class="c008">fun</span> &nbsp;<a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a><sub><span class="c013">n</span></sub> <span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
</div><h4 class="subsubsection" id="sec166">Local definitions</h4>
<p>The <span class="c007">let</span> and <span class="c007">let rec</span> constructs bind value names locally,
as for the core language expressions.</p><p>If a local definition occurs at the very beginning of a class
definition, it will be evaluated when the class is created (just as if
the definition was outside of the class).
Otherwise, it will be evaluated when the object constructor is called.</p><h4 class="subsubsection" id="ss:class-body">Class body</h4>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-body"><span class="c014">class-body</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;&nbsp;[<span class="c008">(</span>&nbsp;<a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a>&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>]&nbsp;<span class="c008">)</span>]&nbsp;&nbsp;{&nbsp;<a class="syntax" href="#class-field"><span class="c014">class-field</span></a>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
The expression
<span class="c008">object</span> <a class="syntax" href="#class-body"><span class="c014">class-body</span></a> <span class="c008">end</span> denotes
a class body. This is the prototype for an object : it lists the
instance variables and methods of an objet of this class.</p><p>A class body is a class value: it is not evaluated at once. Rather,
its components are evaluated each time an object is created.</p><p>In a class body, the pattern <span class="c008">(</span> <a class="syntax" href="patterns.html#pattern"><span class="c014">pattern</span></a> &nbsp;[<span class="c008">:</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>] <span class="c008">)</span> is
matched against self, therefore providing a binding for self and self
type. Self can only be used in method and initializers.</p><p>Self type cannot be a closed object type, so that the class remains
extensible.</p><p>Since OCaml 4.01, it is an error if the same method or instance
variable name is defined several times in the same class body.</p><h4 class="subsubsection" id="sec168">Inheritance</h4>
<p><a id="hevea_manual.kwd94"></a></p><p>The inheritance construct <span class="c008">inherit</span> <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> allows reusing
methods and instance variables from other classes. The class
expression <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a> must evaluate to a class body. The instance
variables, methods and initializers from this class body are added
into the current class. The addition of a method will override any
previously defined method of the same name.</p><p><a id="hevea_manual.kwd95"></a>
An ancestor can be bound by appending <span class="c008">as</span> <a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a>
to the inheritance construct. <a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a> is not a true
variable and can only be used to select a method, i.e. in an expression
<a class="syntax" href="lex.html#lowercase-ident"><span class="c014">lowercase-ident</span></a> <span class="c008">#</span> &nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>. This gives access to the
method <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> as it was defined in the parent class even if it is
redefined in the current class.
The scope of this ancestor binding is limited to the current class.
The ancestor method may be called from a subclass but only indirectly.</p><h4 class="subsubsection" id="sec169">Instance variable definition</h4>
<p><a id="hevea_manual.kwd96"></a>
<a id="hevea_manual.kwd97"></a></p><p>The definition <span class="c008">val</span> [<span class="c008">mutable</span>] <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> adds an
instance variable <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> whose initial value is the value of
expression <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>.
The flag <span class="c008">mutable</span> allows physical modification of this variable by
methods.</p><p>An instance variable can only be used in the methods and
initializers that follow its definition.</p><p>Since version 3.10, redefinitions of a visible instance variable with
the same name do not create a new variable, but are merged, using the
last value for initialization. They must have identical types and
mutability.
However, if an instance variable is hidden by
omitting it from an interface, it will be kept distinct from
other instance variables with the same name.</p><h4 class="subsubsection" id="sec170">Virtual instance variable definition</h4>
<p><a id="hevea_manual.kwd98"></a>
<a id="hevea_manual.kwd99"></a>
<a id="hevea_manual.kwd100"></a></p><p>A variable specification is written <span class="c008">val</span> [<span class="c008">mutable</span>] <span class="c008">virtual</span>
<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>. It specifies whether the variable is
modifiable, and gives its type.</p><p>Virtual instance variables were added in version 3.10.</p><h4 class="subsubsection" id="sec171">Method definition</h4>
<p><a id="hevea_manual.kwd101"></a>
<a id="hevea_manual.kwd102"></a></p><p>A method definition is written <span class="c008">method</span> <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>. The
definition of a method overrides any previous definition of this
method. The method will be public (that is, not private) if any of
the definition states so.</p><p>A private method, <span class="c005"><span class="c007">method</span> <span class="c007">private</span></span> <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>, is a
method that can only be invoked on self (from other methods of the
same object, defined in this class or one of its subclasses). This
invocation is performed using the expression
<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> <span class="c008">#</span> &nbsp;<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a>, where <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> is directly bound to
self at the beginning of the class definition. Private methods do
not appear in object types. A method may have both public and private
definitions, but as soon as there is a public one, all subsequent
definitions will be made public.</p><p>Methods may have an explicitly polymorphic type, allowing them to be
used polymorphically in programs (even for the same object). The
explicit declaration may be done in one of three ways: (1) by giving an
explicit polymorphic type in the method definition, immediately after
the method name, <em>i.e.</em>
<span class="c008">method</span> [<span class="c008">private</span>] <a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">:</span> &nbsp;{<span class="c008">'</span> <a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>}<sup>+</sup> <span class="c008">.</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">=</span>
&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>; (2) by a forward declaration of the explicit polymorphic type
through a virtual method definition; (3) by importing such a
declaration through inheritance and/or constraining the type of <em>self</em>.</p><p>Some special expressions are available in method bodies for
manipulating instance variables and duplicating self:
</p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a></td><td class="c022">::=</td><td class="c024">
…
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">&lt;-</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">{&lt;</span>&nbsp;[&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">;</span>&nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;</span>]&nbsp;]&nbsp;<span class="c008">&gt;}</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>The expression <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> <span class="c008">&lt;-</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> modifies in-place the current
object by replacing the value associated to <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a> by the
value of <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>. Of course, this instance variable must have been
declared mutable.</p><p>The expression
<span class="c008">{&lt;</span> <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a><sub>1</sub> <span class="c008">;</span> … <span class="c008">;</span> &nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a><sub><span class="c013">n</span></sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub> <span class="c008">&gt;}</span>
evaluates to a copy of the current object in which the values of
instance variables <a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a><sub>1</sub>, …, &nbsp;<a class="syntax" href="names.html#inst-var-name"><span class="c014">inst-var-name</span></a><sub><span class="c013">n</span></sub> have
been replaced by the values of the corresponding expressions <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a><sub>1</sub>,
…, &nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a><sub><span class="c013">n</span></sub>.</p><h4 class="subsubsection" id="sec172">Virtual method definition</h4>
<p><a id="hevea_manual.kwd103"></a>
<a id="hevea_manual.kwd104"></a>
<a id="hevea_manual.kwd105"></a></p><p>A method specification is written <span class="c008">method</span> [<span class="c008">private</span>] <span class="c008">virtual</span>
<a class="syntax" href="names.html#method-name"><span class="c014">method-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#poly-typexpr"><span class="c014">poly-typexpr</span></a>. It specifies whether the method is
public or private, and gives its type. If the method is intended to be
polymorphic, the type must be explicitly polymorphic.</p><h4 class="subsubsection" id="sec173">Constraints on type parameters</h4>
<p><a id="hevea_manual.kwd106"></a></p><p>The construct <span class="c008">constraint</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>1</sub> <span class="c008">=</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><sub>2</sub> forces the two
type expressions to be equals. This is typically used to specify type
parameters: in that way they can be bound to specific type
expressions.</p><h4 class="subsubsection" id="sec174">Initializers</h4>
<p><a id="hevea_manual.kwd107"></a></p><p>A class initializer <span class="c008">initializer</span> <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> specifies an expression that
will be evaluated whenever an object is created from the class, once
all its instance variables have been initialized.</p>
<h3 class="subsection" id="sec175">9.3&nbsp;&nbsp;Class definitions</h3>
<p>
<a id="s:classdef"></a></p><p><a id="hevea_manual.kwd108"></a>
<a id="hevea_manual.kwd109"></a>
<a id="hevea_manual.kwd110"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-definition"><span class="c014">class-definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">class</span>&nbsp;<a class="syntax" href="#class-binding"><span class="c014">class-binding</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#class-binding"><span class="c014">class-binding</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-binding"><span class="c014">class-binding</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">virtual</span>]&nbsp;[<span class="c008">[</span>&nbsp;<a class="syntax" href="#type-parameters"><span class="c014">type-parameters</span></a>&nbsp;<span class="c008">]</span>]&nbsp;&nbsp;<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a>
&nbsp;{<a class="syntax" href="expr.html#parameter"><span class="c014">parameter</span></a>}&nbsp;&nbsp;[<span class="c008">:</span>&nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a>]&nbsp;&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="type-parameters"><span class="c014">type-parameters</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">,</span>&nbsp;<span class="c008">'</span>&nbsp;<a class="syntax" href="lex.html#ident"><span class="c014">ident</span></a>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A class definition <span class="c008">class</span> <a class="syntax" href="#class-binding"><span class="c014">class-binding</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="#class-binding"><span class="c014">class-binding</span></a> } is
recursive. Each <a class="syntax" href="#class-binding"><span class="c014">class-binding</span></a> defines a <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> that can be
used in the whole expression except for inheritance. It can also be
used for inheritance, but only in the definitions that follow its own.</p><p>A class binding binds the class name <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> to the value of
expression <a class="syntax" href="#class-expr"><span class="c014">class-expr</span></a>. It also binds the class type <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> to
the type of the class, and defines two type abbreviations :
<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> and <span class="c008">#</span> <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a>. The first one is the type of
objects of this class, while the second is more general as it unifies
with the type of any object belonging to a subclass (see
section&nbsp;<a href="types.html#s%3Asharp-types">6.4</a>).</p><h4 class="subsubsection" id="sec176">Virtual class</h4>
<p><a id="hevea_manual.kwd111"></a>
A class must be flagged virtual if one of its methods is virtual (that
is, appears in the class type, but is not actually defined).
Objects cannot be created from a virtual class.</p><h4 class="subsubsection" id="sec177">Type parameters</h4>
<p>The class type parameters correspond to the ones of the class type and
of the two type abbreviations defined by the class binding. They must
be bound to actual types in the class definition using type
constraints. So that the abbreviations are well-formed, type
variables of the inferred type of the class must either be type
parameters or be bound in the constraint clause.</p>
<h3 class="subsection" id="sec178">9.4&nbsp;&nbsp;Class specifications</h3>
<p>
<a id="s:class-spec"></a></p><p><a id="hevea_manual.kwd112"></a>
<a id="hevea_manual.kwd113"></a>
<a id="hevea_manual.kwd114"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="class-specification"><span class="c014">class-specification</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">class</span>&nbsp;<a class="syntax" href="#class-spec"><span class="c014">class-spec</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#class-spec"><span class="c014">class-spec</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="class-spec"><span class="c014">class-spec</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">virtual</span>]&nbsp;[<span class="c008">[</span>&nbsp;<a class="syntax" href="#type-parameters"><span class="c014">type-parameters</span></a>&nbsp;<span class="c008">]</span>]&nbsp;&nbsp;<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a>&nbsp;<span class="c008">:</span>
&nbsp;<a class="syntax" href="#class-type"><span class="c014">class-type</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>This is the counterpart in signatures of class definitions.
A class specification matches a class definition if they have the same
type parameters and their types match.</p>
<h3 class="subsection" id="sec179">9.5&nbsp;&nbsp;Class type definitions</h3>
<p>
<a id="s:classtype"></a></p><p><a id="hevea_manual.kwd115"></a>
<a id="hevea_manual.kwd116"></a>
<a id="hevea_manual.kwd117"></a>
<a id="hevea_manual.kwd118"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="classtype-definition"><span class="c014">classtype-definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">class</span>&nbsp;<span class="c008">type</span>&nbsp;<a class="syntax" href="#classtype-def"><span class="c014">classtype-def</span></a>
&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#classtype-def"><span class="c014">classtype-def</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="classtype-def"><span class="c014">classtype-def</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">virtual</span>]&nbsp;[<span class="c008">[</span>&nbsp;<a class="syntax" href="#type-parameters"><span class="c014">type-parameters</span></a>&nbsp;<span class="c008">]</span>]&nbsp;&nbsp;<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>A class type definition <span class="c008">class</span> <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a>
defines an abbreviation <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> for the class body type
<a class="syntax" href="#class-body-type"><span class="c014">class-body-type</span></a>. As for class definitions, two type abbreviations
<a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> and <span class="c008">#</span> <a class="syntax" href="names.html#class-name"><span class="c014">class-name</span></a> are also defined. The definition can
be parameterized by some type parameters. If any method in the class
type body is virtual, the definition must be flagged <span class="c008">virtual</span>.</p><p>Two class type definitions match if they have the same type parameters
and they expand to matching types.

</p>











<h2 class="section" id="sec180">10&nbsp;&nbsp;Module types (module specifications)</h2>
<ul>
<li><a href="#sec181">Simple module types</a>
</li><li><a href="#sec182">Signatures</a>
</li><li><a href="#sec192">Functor types</a>
</li><li><a href="#sec193">The <span class="c007">with</span> operator</a>
</li></ul>
<p>Module types are the module-level equivalent of type expressions: they
specify the general shape and type properties of modules.</p><p><a id="hevea_manual.kwd119"></a>
<a id="hevea_manual.kwd120"></a>
<a id="hevea_manual.kwd121"></a>
<a id="hevea_manual.kwd122"></a>
<a id="hevea_manual.kwd123"></a>
<a id="hevea_manual.kwd124"></a>
<a id="hevea_manual.kwd125"></a>
<a id="hevea_manual.kwd126"></a>
<a id="hevea_manual.kwd127"></a>
<a id="hevea_manual.kwd128"></a>
<a id="hevea_manual.kwd129"></a>
<a id="hevea_manual.kwd130"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="module-type"><span class="c014">module-type</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#modtype-path"><span class="c014">modtype-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">sig</span>&nbsp;{&nbsp;<a class="syntax" href="#specification"><span class="c014">specification</span></a>&nbsp;&nbsp;[<span class="c008">;;</span>]&nbsp;}&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">functor</span>&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">with</span>&nbsp;&nbsp;<a class="syntax" href="#mod-constraint"><span class="c014">mod-constraint</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="#mod-constraint"><span class="c014">mod-constraint</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="mod-constraint"><span class="c014">mod-constraint</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">type</span>&nbsp;[<a class="syntax" href="typedecl.html#type-params"><span class="c014">type-params</span></a>]&nbsp;&nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>&nbsp;&nbsp;<a class="syntax" href="typedecl.html#type-equation"><span class="c014">type-equation</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c014">extended-module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
</tbody></table></td></tr>
</tbody></table><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="specification"><span class="c014">specification</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">val</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c014">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">exception</span>&nbsp;<a class="syntax" href="typedecl.html#constr-decl"><span class="c014">constr-decl</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#class-specification"><span class="c014">class-specification</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c014">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;}
<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<span class="c008">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<span class="c008">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">include</span>&nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table>
<h3 class="subsection" id="sec181">10.1&nbsp;&nbsp;Simple module types</h3>
<p>The expression <a class="syntax" href="names.html#modtype-path"><span class="c014">modtype-path</span></a> is equivalent to the module type bound
to the name <a class="syntax" href="names.html#modtype-path"><span class="c014">modtype-path</span></a>.
The expression <span class="c008">(</span> <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> <span class="c008">)</span> denotes the same type as
<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>.</p>
<h3 class="subsection" id="sec182">10.2&nbsp;&nbsp;Signatures</h3>
<p><a id="hevea_manual.kwd131"></a>
<a id="hevea_manual.kwd132"></a></p><p>Signatures are type specifications for structures. Signatures
<span class="c008">sig</span> … <span class="c008">end</span> are collections of type specifications for value
names, type names, exceptions, module names and module type names. A
structure will match a signature if the structure provides definitions
(implementations) for all the names specified in the signature (and
possibly more), and these definitions meet the type requirements given
in the signature.</p><p>An optional <span class="c008">;;</span> is allowed after each specification in a
signature. It serves as a syntactic separator with no semantic
meaning.</p><h4 class="subsubsection" id="sec183">Value specifications</h4>
<p><a id="hevea_manual.kwd133"></a></p><p>A specification of a value component in a signature is written
<span class="c008">val</span> <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>, where <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> is the name of the
value and <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> its expected type.</p><p><a id="hevea_manual.kwd134"></a></p><p>The form <span class="c008">external</span> <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
is similar, except that it requires in addition the name to be
implemented as the external function specified in <a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
(see chapter&nbsp;<a href="intfc.html#c%3Aintf-c">19</a>).</p><h4 class="subsubsection" id="sec184">Type specifications</h4>
<p><a id="hevea_manual.kwd135"></a></p><p>A specification of one or several type components in a signature is
written <span class="c008">type</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> } and consists of a sequence
of mutually recursive definitions of type names.</p><p>Each type definition in the signature specifies an optional type
equation <span class="c008">=</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> and an optional type representation
<span class="c008">=</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c014">constr-decl</span></a> … or <span class="c005"><span class="c007">=</span> <span class="c007">{</span></span> <a class="syntax" href="typedecl.html#field-decl"><span class="c014">field-decl</span></a> … <span class="c008">}</span>.
The implementation of the type name in a matching structure must
be compatible with the type expression specified in the equation (if
given), and have the specified representation (if given). Conversely,
users of that signature will be able to rely on the type equation
or type representation, if given. More precisely, we have the
following four situations:</p><dl class="description"><dt class="dt-description">
<span class="c019">Abstract type: no equation, no representation.</span></dt><dd class="dd-description"> &nbsp; <br>
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
with any other type: a fresh type has been generated.</dd><dt class="dt-description"><span class="c019">Type abbreviation: an equation </span><span class="c008">=</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a><span class="c019">, no representation.</span></dt><dd class="dd-description"> &nbsp; <br>
The type name must be implemented by a type compatible with <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>.
All users of the structure know that the type name is
compatible with <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>.</dd><dt class="dt-description"><span class="c019">New variant type or record type: no equation, a representation.</span></dt><dd class="dd-description"> &nbsp; <br>
The type name must be implemented by a variant type or record type
with exactly the constructors or fields specified. All users of the
structure have access to the constructors or fields, and can use them
to create or inspect values of that type. However, users of the
structure consider that type as incompatible with any other type: a
fresh type has been generated.</dd><dt class="dt-description"><span class="c019">Re-exported variant type or record type: an equation,
a representation.</span></dt><dd class="dd-description"> &nbsp; <br>
This case combines the previous two: the representation of the type is
made visible to all users, and no fresh type is generated.
</dd></dl><h4 class="subsubsection" id="sec185">Exception specification</h4>
<p><a id="hevea_manual.kwd136"></a></p><p>The specification <span class="c008">exception</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c014">constr-decl</span></a> in a signature requires the
matching structure to provide an exception with the name and arguments
specified in the definition, and makes the exception available to all
users of the structure.</p><h4 class="subsubsection" id="sec186">Class specifications</h4>
<p><a id="hevea_manual.kwd137"></a></p><p>A specification of one or several classes in a signature is written
<span class="c008">class</span> <a class="syntax" href="classes.html#class-spec"><span class="c014">class-spec</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="classes.html#class-spec"><span class="c014">class-spec</span></a> } and consists of a sequence
of mutually recursive definitions of class names.</p><p>Class specifications are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclass-spec">6.9.4</a>.</p><h4 class="subsubsection" id="sec187">Class type specifications</h4>
<p><a id="hevea_manual.kwd138"></a>
<a id="hevea_manual.kwd139"></a></p><p>A specification of one or several classe types in a signature is
written <span class="c005"><span class="c007">class</span> <span class="c007">type</span></span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> { <span class="c008">and</span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> } and
consists of a sequence of mutually recursive definitions of class type
names. Class type specifications are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclasstype">6.9.5</a>.</p><h4 class="subsubsection" id="sec188">Module specifications</h4>
<p><a id="hevea_manual.kwd140"></a></p><p>A specification of a module component in a signature is written
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>, where <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> is the
name of the module component and <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> its expected type.
Modules can be nested arbitrarily; in particular, functors can appear
as components of structures and functor types as components of
signatures.</p><p>For specifying a module component that is a functor, one may write
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">(</span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c008">)</span>
… <span class="c008">(</span> &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">)</span>
<span class="c007">:</span></span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
</div><p>
instead of
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c005"><span class="c007">:</span>
<span class="c007">functor</span> <span class="c007">(</span></span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span> …
<span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
</div><h4 class="subsubsection" id="sec189">Module type specifications</h4>
<p><a id="hevea_manual.kwd141"></a>
<a id="hevea_manual.kwd142"></a></p><p>A module type component of a signature can be specified either as a
manifest module type or as an abstract module type.</p><p>An abstract module type specification
<span class="c005"><span class="c007">module</span> <span class="c007">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> allows the name <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> to be
implemented by any module type in a matching signature, but hides the
implementation of the module type to all users of the signature.</p><p>A manifest module type specification
<span class="c005"><span class="c007">module</span> <span class="c007">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a>
requires the name <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> to be implemented by the module type
<a class="syntax" href="#module-type"><span class="c014">module-type</span></a> in a matching signature, but makes the equality between
<a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> and <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> apparent to all users of the signature.</p>
<h4 class="subsubsection" id="sec190">Opening a module path</h4>
<p><a id="hevea_manual.kwd143"></a></p><p>The expression <span class="c008">open</span> <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> in a signature does not specify
any components. It simply affects the parsing of the following items
of the signature, allowing components of the module denoted by
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> to be referred to by their simple names <span class="c014">name</span> instead of
path accesses <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> <span class="c008">.</span> &nbsp;<span class="c014">name</span>. The scope of the <span class="c008">open</span>
stops at the end of the signature expression.</p>
<h4 class="subsubsection" id="sec191">Including a signature</h4>
<p><a id="hevea_manual.kwd144"></a></p><p>The expression <span class="c008">include</span> <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> in a signature performs textual
inclusion of the components of the signature denoted by <a class="syntax" href="#module-type"><span class="c014">module-type</span></a>.
It behaves as if the components of the included signature were copied
at the location of the <span class="c008">include</span>. The <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> argument must
refer to a module type that is a signature, not a functor type.</p>
<h3 class="subsection" id="sec192">10.3&nbsp;&nbsp;Functor types</h3>
<p><a id="hevea_manual.kwd145"></a></p><p>The module type expression
<span class="c005"><span class="c007">functor</span> <span class="c007">(</span></span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span> &nbsp;<a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>2</sub>
is the type of functors (functions from modules to modules) that take
as argument a module of type <a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>1</sub> and return as result a
module of type <a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>2</sub>. The module type <a class="syntax" href="#module-type"><span class="c014">module-type</span></a><sub>2</sub> can
use the name <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> to refer to type components of the actual
argument of the functor. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p>
<h3 class="subsection" id="sec193">10.4&nbsp;&nbsp;The <span class="c007">with</span> operator</h3>
<p><a id="hevea_manual.kwd146"></a></p><p>Assuming <a class="syntax" href="#module-type"><span class="c014">module-type</span></a> denotes a signature, the expression
<a class="syntax" href="#module-type"><span class="c014">module-type</span></a> <span class="c008">with</span> &nbsp;<a class="syntax" href="#mod-constraint"><span class="c014">mod-constraint</span></a> { <span class="c008">and</span> <a class="syntax" href="#mod-constraint"><span class="c014">mod-constraint</span></a> } denotes
the same signature where type equations have been added to some of the
type specifications, as described by the constraints following the
<span class="c007">with</span> keyword. The constraint <span class="c008">type</span> [<a class="syntax" href="classes.html#type-parameters"><span class="c014">type-parameters</span></a>] &nbsp;<a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a>
<span class="c008">=</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> adds the type equation <span class="c008">=</span> <a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> to the specification
of the type component named <a class="syntax" href="names.html#typeconstr"><span class="c014">typeconstr</span></a> of the constrained signature.
The constraint <span class="c008">module</span> <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="names.html#extended-module-path"><span class="c014">extended-module-path</span></a> adds
type equations to all type components of the sub-structure denoted by
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>, making them equivalent to the corresponding type
components of the structure denoted by <a class="syntax" href="names.html#extended-module-path"><span class="c014">extended-module-path</span></a>.</p><p>For instance, if the module type name <span class="c007">S</span> is bound to the signature
</p><pre>        sig type t module M: (sig type u end) end
</pre><p>then <span class="c007">S with type t=int</span> denotes the signature
</p><pre>        sig type t=int module M: (sig type u end) end
</pre><p>and <span class="c007">S with module M = N</span> denotes the signature
</p><pre>        sig type t module M: (sig type u=N.u end) end
</pre><p>A functor taking two arguments of type <span class="c007">S</span> that share their <span class="c007">t</span> component
is written
</p><pre>        functor (A: S) (B: S with type t = A.t) ...
</pre><p>
Constraints are added left to right. After each constraint has been
applied, the resulting signature must be a subtype of the signature
before the constraint was applied. Thus, the <span class="c008">with</span> operator can
only add information on the type components of a signature, but never
remove information.

</p>











<h2 class="section" id="s:module-expr">11&nbsp;&nbsp;Module expressions (module implementations)</h2>
<ul>
<li><a href="#sec195">Simple module expressions</a>
</li><li><a href="#sec196">Structures</a>
</li><li><a href="#sec206">Functors</a>
</li></ul>
<p>Module expressions are the module-level equivalent of value
expressions: they evaluate to modules, thus providing implementations
for the specifications expressed in module types.</p><p><a id="hevea_manual.kwd147"></a>
<a id="hevea_manual.kwd148"></a>
<a id="hevea_manual.kwd149"></a>
<a id="hevea_manual.kwd150"></a>
<a id="hevea_manual.kwd151"></a>
<a id="hevea_manual.kwd152"></a>
<a id="hevea_manual.kwd153"></a>
<a id="hevea_manual.kwd154"></a>
<a id="hevea_manual.kwd155"></a>
<a id="hevea_manual.kwd156"></a>
<a id="hevea_manual.kwd157"></a></p><table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="module-expr"><span class="c014">module-expr</span></a></td><td class="c022">::=</td><td class="c024">
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">struct</span>&nbsp;[&nbsp;<a class="syntax" href="#module-items"><span class="c014">module-items</span></a>&nbsp;]&nbsp;<span class="c008">end</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">functor</span>&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;<span class="c008">-&gt;</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">(</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="module-items"><span class="c014">module-items</span></a></td><td class="c022">::=</td><td class="c024">
[<span class="c008">;;</span>]&nbsp;(&nbsp;<a class="syntax" href="#definition"><span class="c014">definition</span></a>&nbsp;∣&nbsp;&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;)&nbsp;&nbsp;{&nbsp;[<span class="c008">;;</span>]&nbsp;<a class="syntax" href="#definition"><span class="c014">definition</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c008">;;</span>&nbsp;<a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>&nbsp;}&nbsp;&nbsp;[<span class="c008">;;</span>]
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="definition"><span class="c014">definition</span></a></td><td class="c022">::=</td><td class="c024">
<span class="c008">let</span>&nbsp;[<span class="c008">rec</span>]&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">and</span>&nbsp;<a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">external</span>&nbsp;<a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="typedecl.html#type-definition"><span class="c014">type-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="typedecl.html#exception-definition"><span class="c014">exception-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#class-definition"><span class="c014">class-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<a class="syntax" href="classes.html#classtype-definition"><span class="c014">classtype-definition</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;&nbsp;{&nbsp;<span class="c008">(</span>&nbsp;<a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>&nbsp;<span class="c008">:</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;<span class="c008">)</span>&nbsp;}
&nbsp;[&nbsp;<span class="c008">:</span>&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>&nbsp;]&nbsp;&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">module</span>&nbsp;<span class="c008">type</span>&nbsp;<a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a>&nbsp;<span class="c008">=</span>&nbsp;&nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">open</span>&nbsp;<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td><td class="c022">∣</td><td class="c024">&nbsp;<span class="c008">include</span>&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</td></tr>
</tbody></table></td></tr>
</tbody></table>
<h3 class="subsection" id="sec195">11.1&nbsp;&nbsp;Simple module expressions</h3>
<p>The expression <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> evaluates to the module bound to the name
<a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">)</span> evaluates to the same module as
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>.</p><p>The expression <span class="c008">(</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">)</span> checks that the
type of <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> is a subtype of <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>, that is, that all
components specified in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> are implemented in
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, and their implementation meets the requirements given
in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>. In other terms, it checks that the implementation
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> meets the type specification <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>. The whole
expression evaluates to the same module as <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, except that
all components not specified in <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> are hidden and can no
longer be accessed.</p>
<h3 class="subsection" id="sec196">11.2&nbsp;&nbsp;Structures</h3>
<p><a id="hevea_manual.kwd158"></a>
<a id="hevea_manual.kwd159"></a></p><p>Structures <span class="c008">struct</span> … <span class="c008">end</span> are collections of definitions for
value names, type names, exceptions, module names and module type
names. The definitions are evaluated in the order in which they appear
in the structure. The scopes of the bindings performed by the
definitions extend to the end of the structure. As a consequence, a
definition may refer to names bound by earlier definitions in the same
structure.</p><p>For compatibility with toplevel phrases (chapter&nbsp;<a href="toplevel.html#c%3Acamllight">9</a>),
an optional <span class="c008">;;</span> is allowed after each
definition in a structure. The <span class="c008">;;</span> has no semantic meaning. Also for
compatibility, <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> is allowed as a component of a structure,
meaning <span class="c005"><span class="c007">let</span> <span class="c007">_</span> <span class="c007">=</span></span> <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a>, i.e. evaluate <a class="syntax" href="expr.html#expr"><span class="c014">expr</span></a> for its side-effects.
In this case, the <span class="c008">;;</span> of the previous component (if any) is not
optional.</p><h4 class="subsubsection" id="sec197">Value definitions</h4>
<p><a id="hevea_manual.kwd160"></a></p><p>A value definition <span class="c008">let</span> [<span class="c008">rec</span>] <a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="expr.html#let-binding"><span class="c014">let-binding</span></a> }
bind value names in the same way as a <span class="c008">let</span> … <span class="c008">in</span> … expression
(see section&nbsp;<a href="expr.html#s%3Alocaldef">6.7.1</a>). The value names appearing in the
left-hand sides of the bindings are bound to the corresponding values
in the right-hand sides.</p><p><a id="hevea_manual.kwd161"></a></p><p>A value definition <span class="c008">external</span> <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="types.html#typexpr"><span class="c014">typexpr</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a>
implements <a class="syntax" href="names.html#value-name"><span class="c014">value-name</span></a> as the external function specified in
<a class="syntax" href="intfc.html#external-declaration"><span class="c014">external-declaration</span></a> (see chapter&nbsp;<a href="intfc.html#c%3Aintf-c">19</a>).</p><h4 class="subsubsection" id="sec198">Type definitions</h4>
<p><a id="hevea_manual.kwd162"></a></p><p>A definition of one or several type components is written
<span class="c008">type</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="typedecl.html#typedef"><span class="c014">typedef</span></a> } and consists of a sequence
of mutually recursive definitions of type names.</p><h4 class="subsubsection" id="sec199">Exception definitions</h4>
<p><a id="hevea_manual.kwd163"></a></p><p>Exceptions are defined with the syntax <span class="c008">exception</span> <a class="syntax" href="typedecl.html#constr-decl"><span class="c014">constr-decl</span></a>
or <span class="c008">exception</span> <a class="syntax" href="names.html#constr-name"><span class="c014">constr-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="names.html#constr"><span class="c014">constr</span></a>.</p><h4 class="subsubsection" id="sec200">Class definitions</h4>
<p><a id="hevea_manual.kwd164"></a></p><p>A definition of one or several classes is written <span class="c008">class</span>
<a class="syntax" href="classes.html#class-binding"><span class="c014">class-binding</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="classes.html#class-binding"><span class="c014">class-binding</span></a> } and consists of a sequence of
mutually recursive definitions of class names. Class definitions are
described more precisely in section&nbsp;<a href="classes.html#s%3Aclassdef">6.9.3</a>.</p><h4 class="subsubsection" id="sec201">Class type definitions</h4>
<p><a id="hevea_manual.kwd165"></a>
<a id="hevea_manual.kwd166"></a></p><p>A definition of one or several classes is written
<span class="c005"><span class="c007">class</span> <span class="c007">type</span></span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> &nbsp;{ <span class="c008">and</span> <a class="syntax" href="classes.html#classtype-def"><span class="c014">classtype-def</span></a> } and consists of
a sequence of mutually recursive definitions of class type names.
Class type definitions are described more precisely in
section&nbsp;<a href="classes.html#s%3Aclasstype">6.9.5</a>.</p><h4 class="subsubsection" id="sec202">Module definitions</h4>
<p><a id="hevea_manual.kwd167"></a></p><p>The basic form for defining a module component is
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>, which evaluates <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> and binds
the result to the name <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a>.</p><p>One can write
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><p>
instead of
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c005"><span class="c007">=</span> <span class="c007">(</span></span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c008">)</span>.
</div><p>
Another derived form is
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">(</span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c008">)</span> …
<span class="c008">(</span> &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">)</span> <span class="c007">=</span></span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><p>
which is equivalent to
</p><div class="center">
<span class="c008">module</span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c005"><span class="c007">=</span>
<span class="c007">functor</span> <span class="c007">(</span></span> &nbsp;<span class="c014">name</span><sub>1</sub> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span> …
<span class="c008">-&gt;</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>
</div><h4 class="subsubsection" id="sec203">Module type definitions</h4>
<p><a id="hevea_manual.kwd168"></a>
<a id="hevea_manual.kwd169"></a></p><p>A definition for a module type is written
<span class="c005"><span class="c007">module</span> <span class="c007">type</span></span> <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> <span class="c008">=</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>.
It binds the name <a class="syntax" href="names.html#modtype-name"><span class="c014">modtype-name</span></a> to the module type denoted by the
expression <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a>.</p><h4 class="subsubsection" id="sec204">Opening a module path</h4>
<p><a id="hevea_manual.kwd170"></a></p><p>The expression <span class="c008">open</span> <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> in a structure does not define any
components nor perform any bindings. It simply affects the parsing of
the following items of the structure, allowing components of the
module denoted by <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> to be referred to by their simple names
<span class="c014">name</span> instead of path accesses <a class="syntax" href="names.html#module-path"><span class="c014">module-path</span></a> <span class="c008">.</span> &nbsp;<span class="c014">name</span>. The scope of
the <span class="c008">open</span> stops at the end of the structure expression.</p><h4 class="subsubsection" id="sec205">Including the components of another structure</h4>
<p><a id="hevea_manual.kwd171"></a></p><p>The expression <span class="c008">include</span> <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> in a structure re-exports in
the current structure all definitions of the structure denoted by
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a>. For instance, if the identifier <span class="c007">S</span> is bound to the
module
</p><pre>        struct type t = int  let x = 2 end
</pre><p>the module expression
</p><pre>        struct include S  let y = (x + 1 : t) end
</pre><p>is equivalent to the module expression
</p><pre>        struct type t = S.t  let x = S.x  let y = (x + 1 : t) end
</pre><p>The difference between <span class="c008">open</span> and <span class="c008">include</span> is that <span class="c008">open</span>
simply provides short names for the components of the opened
structure, without defining any components of the current structure,
while <span class="c008">include</span> also adds definitions for the components of the
included structure.</p>
<h3 class="subsection" id="sec206">11.3&nbsp;&nbsp;Functors</h3>
<h4 class="subsubsection" id="sec207">Functor definition</h4>
<p><a id="hevea_manual.kwd172"></a></p><p>The expression <span class="c005"><span class="c007">functor</span> <span class="c007">(</span></span> <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> <span class="c008">:</span> &nbsp;<a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a> <span class="c005"><span class="c007">)</span> <span class="c007">-&gt;</span></span>
&nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> evaluates to a functor that takes as argument modules of
the type <a class="syntax" href="modtypes.html#module-type"><span class="c014">module-type</span></a><sub>1</sub>, binds <a class="syntax" href="names.html#module-name"><span class="c014">module-name</span></a> to these modules,
evaluates <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a> in the extended environment, and returns the
resulting modules as results. No restrictions are placed on the type of the
functor argument; in particular, a functor may take another functor as
argument (“higher-order” functor).</p><h4 class="subsubsection" id="sec208">Functor application</h4>
<p>The expression <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub> <span class="c008">(</span> &nbsp;<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> <span class="c008">)</span> evaluates
<a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub> to a functor and <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> to a module, and
applies the former to the latter. The type of <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>2</sub> must
match the type expected for the arguments of the functor <a class="syntax" href="#module-expr"><span class="c014">module-expr</span></a><sub>1</sub>.</p>










<h2 class="section" id="sec209">12&nbsp;&nbsp;Compilation units</h2>
<table class="display dcenter"><tbody><tr class="c026"><td class="dcell"><table class="c002 cellpading0"><tbody><tr><td class="c025">
<a class="syntax" id="unit-interface"><span class="c014">unit-interface</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;{&nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c014">specification</span></a>&nbsp;&nbsp;[<span class="c008">;;</span>]&nbsp;}
&nbsp;</td></tr>
<tr><td class="c025">&nbsp;</td></tr>
<tr><td class="c025">
<a class="syntax" id="unit-implementation"><span class="c014">unit-implementation</span></a></td><td class="c022">::=</td><td class="c024">&nbsp;[&nbsp;<a class="syntax" href="modules.html#module-items"><span class="c014">module-items</span></a>&nbsp;]
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Compilation units bridge the module system and the separate
compilation system. A compilation unit is composed of two parts: an
interface and an implementation. The interface contains a sequence of
specifications, just as the inside of a <span class="c008">sig</span> … <span class="c008">end</span>
signature expression. The implementation contains a sequence of
definitions and expressions, just as the inside of a
<span class="c008">struct</span> … <span class="c008">end</span> module
expression. A compilation unit also has a name <span class="c014">unit-name</span>, derived
from the names of the files containing the interface and the
implementation (see chapter&nbsp;<a href="comp.html#c%3Acamlc">8</a> for more details). A
compilation unit behaves roughly as the module definition
</p><div class="center">
<span class="c005"><span class="c007">module</span> <span class="c014">unit-name</span> <span class="c007">:</span> <span class="c007">sig</span></span> &nbsp;<a class="syntax" href="#unit-interface"><span class="c014">unit-interface</span></a> <span class="c005"><span class="c007">end</span> <span class="c007">=</span>
<span class="c007">struct</span></span> &nbsp;<a class="syntax" href="#unit-implementation"><span class="c014">unit-implementation</span></a> <span class="c008">end</span>
</div><p>A compilation unit can refer to other compilation units by their
names, as if they were regular modules. For instance, if <span class="c007">U</span> is a
compilation unit that defines a type <span class="c007">t</span>, other compilation units can
refer to that type under the name <span class="c007">U.t</span>; they can also refer to <span class="c007">U</span> as
a whole structure. Except for names of other compilation units, a unit
interface or unit implementation must not have any other free variables.
In other terms, the type-checking and compilation of an interface or
implementation proceeds in the initial environment
</p><div class="center">
<span class="c014">name</span><sub>1</sub> <span class="c005"><span class="c007">:</span> <span class="c007">sig</span></span> &nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c014">specification</span></a><sub>1</sub> <span class="c008">end</span> …
&nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> <span class="c005"><span class="c007">:</span> <span class="c007">sig</span></span> &nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c014">specification</span></a><sub><span class="c013">n</span></sub> <span class="c008">end</span>
</div><p>
where <span class="c014">name</span><sub>1</sub> … &nbsp;<span class="c014">name</span><sub><span class="c013">n</span></sub> are the names of the other
compilation units available in the search path (see
chapter&nbsp;<a href="comp.html#c%3Acamlc">8</a> for more details) and <a class="syntax" href="modtypes.html#specification"><span class="c014">specification</span></a><sub>1</sub> …
&nbsp;<a class="syntax" href="modtypes.html#specification"><span class="c014">specification</span></a><sub><span class="c013">n</span></sub> are their respective interfaces.

</p>




<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>