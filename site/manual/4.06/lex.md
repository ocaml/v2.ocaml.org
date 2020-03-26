<!-- ((! set title Manual !)) ((! set documentation !)) ((! set manual !)) ((! set nobreadcrumb !)) -->
<div class="manual content"><ul class="part_menu"><li class="active"><a href="language.html">The OCaml language</a></li><li><a href="extn.html">Language extensions</a></li></ul>




<h1 class="chapter" id="sec70"><span>Chapter 7</span>&nbsp;&nbsp;The OCaml language</h1>
<p> <a id="c:refman"></a>

</p><h3 class="subsection" id="sec71">Foreword</h3>
<p>This document is intended as a reference manual for the OCaml
language. It lists the language constructs, and gives their precise
syntax and informal semantics. It is by no means a tutorial
introduction to the language: there is not a single example. A good
working knowledge of OCaml is assumed.</p><p>No attempt has been made at mathematical rigor: words are employed
with their intuitive meaning, without further definition. As a
consequence, the typing rules have been left out, by lack of the
mathematical framework required to express them, while they are
definitely part of a full formal definition of the language.</p><h3 class="subsection" id="sec72">Notations</h3>
<p>The syntax of the language is given in BNF-like notation. Terminal
symbols are set in typewriter font (<span class="c002"><span class="c003">like</span> <span class="c003">this</span></span>).
Non-terminal symbols are set in italic font (<span class="c010">like</span> &nbsp;<span class="c010">that</span>).
Square brackets […] denote optional components. Curly brackets
{…} denotes zero, one or several repetitions of the enclosed
components. Curly brackets with a trailing plus sign {…}<sup>+</sup>
denote one or several repetitions of the enclosed components.
Parentheses (…) denote grouping.</p><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">Version 4.06</a></div><div class="toc_title"><a href="#">The OCaml language</a></div><ul><li class="top"><a href="#">Top</a></li>
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



<h2 class="section" id="sec73">1&nbsp;&nbsp;Lexical conventions</h2>
<h4 class="subsubsection" id="sec74">Blanks</h4>
<p>The following characters are considered as blanks: space,
horizontal tabulation, carriage return, line feed and form feed. Blanks are
ignored, but they separate adjacent identifiers, literals and
keywords that would otherwise be confused as one single identifier,
literal or keyword.</p><h4 class="subsubsection" id="sec75">Comments</h4>
<p>Comments are introduced by the two characters <span class="c004">(*</span>, with no
intervening blanks, and terminated by the characters <span class="c004">*)</span>, with
no intervening blanks. Comments are treated as blank characters.
Comments do not occur inside string or character literals. Nested
comments are handled correctly.</p><h4 class="subsubsection" id="sec76">Identifiers</h4>
<table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="ident"><span class="c010">ident</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;(&nbsp;<a class="syntax" href="#letter"><span class="c010">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c010">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">0</span>&nbsp;…&nbsp;<span class="c004">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="capitalized-ident"><span class="c010">capitalized-ident</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;(<span class="c004">A</span>&nbsp;…&nbsp;<span class="c004">Z</span>)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c010">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">0</span>&nbsp;…&nbsp;<span class="c004">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="lowercase-ident"><span class="c010">lowercase-ident</span></a></td><td class="c015">::=</td><td class="c017">
(<span class="c004">a</span>&nbsp;…&nbsp;<span class="c004">z</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>)&nbsp;{&nbsp;<a class="syntax" href="#letter"><span class="c010">letter</span></a>&nbsp;∣&nbsp;&nbsp;<span class="c004">0</span>&nbsp;…&nbsp;<span class="c004">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">'</span>&nbsp;}&nbsp;&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="letter"><span class="c010">letter</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<span class="c004">A</span>&nbsp;…&nbsp;<span class="c004">Z</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">a</span>&nbsp;…&nbsp;<span class="c004">z</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Identifiers are sequences of letters, digits, <span class="c003">_</span> (the underscore
character), and <span class="c003">'</span> (the single quote), starting with a
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
purpose.</p><h4 class="subsubsection" id="sec77">Integer literals</h4>
<table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="integer-literal"><span class="c010">integer-literal</span></a></td><td class="c015">::=</td><td class="c017">
[<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0x</span>∣&nbsp;<span class="c004">0X</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0o</span>∣&nbsp;<span class="c004">0O</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">7</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">7</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0b</span>∣&nbsp;<span class="c004">0B</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">1</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">1</span>∣&nbsp;<span class="c004">_</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>An integer literal is a sequence of one or more digits, optionally
preceded by a minus sign. By default, integer literals are in decimal
(radix 10). The following prefixes select a different radix:
</p><div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">Prefix</span></td><td class="c014"><span class="c013">Radix</span> </td></tr>
<tr><td class="c016">
<span class="c003">0x</span>, <span class="c003">0X</span></td><td class="c016">hexadecimal (radix 16) </td></tr>
<tr><td class="c016"><span class="c003">0o</span>, <span class="c003">0O</span></td><td class="c016">octal (radix 8) </td></tr>
<tr><td class="c016"><span class="c003">0b</span>, <span class="c003">0B</span></td><td class="c016">binary (radix 2) </td></tr>
</tbody></table></div><p>
(The initial <span class="c004">0</span> is the digit zero; the <span class="c004">O</span> for octal is the letter O.)
The interpretation of integer literals that fall outside the range of
representable integer values is undefined.</p><p>For convenience and readability, underscore characters (<span class="c004">_</span>) are accepted
(and ignored) within integer literals.</p><h4 class="subsubsection" id="sec78">Floating-point literals</h4>
<table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="float-literal"><span class="c010">float-literal</span></a></td><td class="c015">::=</td><td class="c017">
[<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}&nbsp;[<span class="c004">.</span>&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[(<span class="c004">e</span>∣&nbsp;<span class="c004">E</span>)&nbsp;[<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;[<span class="c004">-</span>]&nbsp;(<span class="c004">0x</span>∣&nbsp;<span class="c004">0X</span>)
(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}&nbsp;
[<span class="c004">.</span>&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
[(<span class="c004">p</span>∣&nbsp;<span class="c004">P</span>)&nbsp;[<span class="c004">+</span>∣&nbsp;<span class="c004">-</span>]&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">_</span>&nbsp;}]
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Floating-point decimal literals consist in an integer part, a
fractional part and
an exponent part. The integer part is a sequence of one or more
digits, optionally preceded by a minus sign. The fractional part is a
decimal point followed by zero, one or more digits.
The exponent part is the character <span class="c004">e</span> or <span class="c004">E</span> followed by an
optional <span class="c004">+</span> or <span class="c004">-</span> sign, followed by one or more digits. It is
interpreted as a power of 10.
The fractional part or the exponent part can be omitted but not both, to
avoid ambiguity with integer literals.
The interpretation of floating-point literals that fall outside the
range of representable floating-point values is undefined.</p><p>Floating-point hexadecimal literals are denoted with the <span class="c004">0x</span> or <span class="c004">0X</span>
prefix. The syntax is similar to that of floating-point decimal
literals, with the following differences.
The integer part and the fractional part use hexadecimal
digits. The exponent part starts with the character <span class="c004">p</span> or <span class="c004">P</span>.
It is written in decimal and interpreted as a power of 2.</p><p>For convenience and readability, underscore characters (<span class="c004">_</span>) are accepted
(and ignored) within floating-point literals.</p><h4 class="subsubsection" id="sec79">Character literals</h4>
<p>
<a id="s:characterliteral"></a></p><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="char-literal"><span class="c010">char-literal</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">'</span>&nbsp;<span class="c010">regular-char</span>&nbsp;<span class="c004">'</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">'</span>&nbsp;<a class="syntax" href="#escape-sequence"><span class="c010">escape-sequence</span></a>&nbsp;<span class="c004">'</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="escape-sequence"><span class="c010">escape-sequence</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">\</span>&nbsp;(&nbsp;<span class="c004">\</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">"</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">'</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">n</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">t</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">b</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">r</span>&nbsp;∣&nbsp;&nbsp;<span class="c010">space</span>&nbsp;)
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">\</span>&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>)
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">\x</span>&nbsp;(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
(<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>)
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">\o</span>&nbsp;(<span class="c004">0</span>…<span class="c004">3</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">7</span>)&nbsp;(<span class="c004">0</span>…<span class="c004">7</span>)
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Character literals are delimited by <span class="c004">'</span> (single quote) characters.
The two single quotes enclose either one character different from
<span class="c004">'</span> and <span class="c004">\</span>, or one of the escape sequences below:
</p><div class="center"><table class="c000 cellpadding1" border="1"><tbody><tr><td class="c014"><span class="c013">Sequence</span></td><td class="c014"><span class="c013">Character denoted</span> </td></tr>
<tr><td class="c016">
<span class="c003">\\</span></td><td class="c016">backslash (<span class="c003">\</span>) </td></tr>
<tr><td class="c016"><span class="c003">\"</span></td><td class="c016">double quote (<span class="c003">"</span>) </td></tr>
<tr><td class="c016"><span class="c003">\'</span></td><td class="c016">single quote (<span class="c003">'</span>) </td></tr>
<tr><td class="c016"><span class="c003">\n</span></td><td class="c016">linefeed (LF) </td></tr>
<tr><td class="c016"><span class="c003">\r</span></td><td class="c016">carriage return (CR) </td></tr>
<tr><td class="c016"><span class="c003">\t</span></td><td class="c016">horizontal tabulation (TAB) </td></tr>
<tr><td class="c016"><span class="c003">\b</span></td><td class="c016">backspace (BS) </td></tr>
<tr><td class="c016"><span class="c003">\</span><span class="c009">space</span></td><td class="c016">space (SPC) </td></tr>
<tr><td class="c016"><span class="c003">\</span><span class="c009">ddd</span></td><td class="c016">the character with ASCII code <span class="c009">ddd</span> in decimal </td></tr>
<tr><td class="c016"><span class="c003">\x</span><span class="c009">hh</span></td><td class="c016">the character with ASCII code <span class="c009">hh</span> in hexadecimal </td></tr>
<tr><td class="c016"><span class="c003">\o</span><span class="c009">ooo</span></td><td class="c016">the character with ASCII code <span class="c009">ooo</span> in octal </td></tr>
</tbody></table></div><h4 class="subsubsection" id="sec80">String literals</h4>
<p>
<a id="s:stringliteral"></a></p><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="string-literal"><span class="c010">string-literal</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">"</span>&nbsp;{&nbsp;<a class="syntax" href="#string-character"><span class="c010">string-character</span></a>&nbsp;}&nbsp;<span class="c004">"</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="string-character"><span class="c010">string-character</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c010">regular-string-char</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<a class="syntax" href="#escape-sequence"><span class="c010">escape-sequence</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">\u{</span>&nbsp;{&nbsp;<span class="c004">0</span>…<span class="c004">9</span>∣&nbsp;<span class="c004">A</span>…<span class="c004">F</span>∣&nbsp;<span class="c004">a</span>…<span class="c004">f</span>&nbsp;}<sup>+</sup>&nbsp;<span class="c004">}</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">\</span>&nbsp;<span class="c010">newline</span>&nbsp;&nbsp;{&nbsp;<span class="c010">space</span>&nbsp;∣&nbsp;&nbsp;<span class="c010">tab</span>&nbsp;}
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>String literals are delimited by <span class="c004">"</span> (double quote) characters.
The two double quotes enclose a sequence of either characters
different from <span class="c004">"</span> and <span class="c004">\</span>, or escape sequences from the
table given above for character literals, or a Unicode character
escape sequence.</p><p>A Unicode character escape sequence is substituted by the UTF-8
encoding of the specified Unicode scalar value. The Unicode scalar
value, an integer in the ranges 0x0000...0xD7FF or 0xE000...0x10FFFF,
is defined using 1 to 6 hexadecimal digits; leading zeros are allowed.</p><p>To allow splitting long string literals across lines, the sequence
<span class="c003">\</span><span class="c009">newline</span>&nbsp;<span class="c009">spaces-or-tabs</span> (a backslash at the end of a line
followed by any number of spaces and horizontal tabulations at the
beginning of the next line) is ignored inside string literals.</p><p>The current implementation places practically no restrictions on the
length of string literals.</p><h4 class="subsubsection" id="sec81">Naming labels</h4>
<p>
<a id="s:labelname"></a></p><p>To avoid ambiguities, naming labels in expressions cannot just be defined
syntactically as the sequence of the three tokens <span class="c003">~</span>, <a class="syntax" href="#ident"><span class="c010">ident</span></a> and
<span class="c003">:</span>, and have to be defined at the lexical level.</p><table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="label-name"><span class="c010">label-name</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<a class="syntax" href="#lowercase-ident"><span class="c010">lowercase-ident</span></a>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="label"><span class="c010">label</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<span class="c004">~</span>&nbsp;<a class="syntax" href="#label-name"><span class="c010">label-name</span></a>&nbsp;<span class="c004">:</span>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="optlabel"><span class="c010">optlabel</span></a></td><td class="c015">::=</td><td class="c017">&nbsp;<span class="c004">?</span>&nbsp;<a class="syntax" href="#label-name"><span class="c010">label-name</span></a>&nbsp;<span class="c004">:</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Naming labels come in two flavours: <a class="syntax" href="#label"><span class="c010">label</span></a> for normal arguments and
<a class="syntax" href="#optlabel"><span class="c010">optlabel</span></a> for optional ones. They are simply distinguished by their
first character, either <span class="c003">~</span> or <span class="c003">?</span>.</p><p>Despite <a class="syntax" href="#label"><span class="c010">label</span></a> and <a class="syntax" href="#optlabel"><span class="c010">optlabel</span></a> being lexical entities in expressions,
their expansions <span class="c004">~</span> <a class="syntax" href="#label-name"><span class="c010">label-name</span></a> <span class="c004">:</span> and <span class="c004">?</span> <a class="syntax" href="#label-name"><span class="c010">label-name</span></a> <span class="c004">:</span> will be
used in grammars, for the sake of readability. Note also that inside
type expressions, this expansion can be taken literally, <em>i.e.</em>
there are really 3 tokens, with optional blanks between them.</p><h4 class="subsubsection" id="sec82">Prefix and infix symbols</h4>
<table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="infix-symbol"><span class="c010">infix-symbol</span></a></td><td class="c015">::=</td><td class="c017">
(<span class="c004">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">@</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">^</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">|</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&amp;</span>&nbsp;∣&nbsp;
<span class="c004">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">/</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">$</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">%</span>)&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">#</span>&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c010">operator-char</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="prefix-symbol"><span class="c010">prefix-symbol</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">!</span>&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c010">operator-char</span></a>&nbsp;}
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;(<span class="c004">?</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">~</span>)&nbsp;{&nbsp;<a class="syntax" href="#operator-char"><span class="c010">operator-char</span></a>&nbsp;}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td></tr>
<tr><td class="c018">
<a class="syntax" id="operator-char"><span class="c010">operator-char</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">!</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">$</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">%</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&amp;</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">*</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">+</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">-</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">.</span>&nbsp;∣&nbsp;
<span class="c004">/</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">:</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&lt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">=</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">&gt;</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">?</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">@</span>&nbsp;∣&nbsp;
<span class="c004">^</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">|</span>&nbsp;∣&nbsp;&nbsp;<span class="c004">~</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>
See also the following language extensions:
<a href="extn.html#s%3Aext-ops">extension operators</a> and
<a href="extn.html#s%3Aindex-operators">extended indexing operators</a>.</p><p>Sequences of “operator characters”, such as <span class="c003">&lt;=&gt;</span> or <span class="c003">!!</span>,
are read as a single token from the <a class="syntax" href="#infix-symbol"><span class="c010">infix-symbol</span></a> or <a class="syntax" href="#prefix-symbol"><span class="c010">prefix-symbol</span></a>
class. These symbols are parsed as prefix and infix operators inside
expressions, but otherwise behave like normal identifiers.
</p><h4 class="subsubsection" id="sec83">Keywords</h4>
<p>The identifiers below are reserved as keywords, and cannot be employed
otherwise:
</p><pre>      and         as          assert      asr         begin       class
      constraint  do          done        downto      else        end
      exception   external    false       for         fun         function
      functor     if          in          include     inherit     initializer
      land        lazy        let         lor         lsl         lsr
      lxor        match       method      mod         module      mutable
      new         nonrec      object      of          open        or
      private     rec         sig         struct      then        to
      true        try         type        val         virtual     when
      while       with
</pre><p> <br>
The following character sequences are also keywords:
</p><pre><span class="c003">    !=    #     &amp;     &amp;&amp;    '     (     )     *     +     ,     -</span>
<span class="c003">    -.    -&gt;    .     ..    :     ::    :=    :&gt;    ;     ;;    &lt;</span>
<span class="c003">    &lt;-    =     &gt;     &gt;]    &gt;}    ?     [     [&lt;    [&gt;    [|    ]</span>
<span class="c003">    _     `     {     {&lt;    |     |]    ||    }     ~</span>
</pre><p>
Note that the following identifiers are keywords of the Camlp4
extensions and should be avoided for compatibility reasons.
</p><pre>    parser    value    $     $$    $:    &lt;:    &lt;&lt;    &gt;&gt;    ??
</pre><h4 class="subsubsection" id="sec84">Ambiguities</h4>
<p>Lexical ambiguities are resolved according to the “longest match”
rule: when a character sequence can be decomposed into two tokens in
several different ways, the decomposition retained is the one with the
longest first token.</p><h4 class="subsubsection" id="sec85">Line number directives</h4>
<table class="display dcenter"><tbody><tr class="c019"><td class="dcell"><table class="c001 cellpading0"><tbody><tr><td class="c018">
<a class="syntax" id="linenum-directive"><span class="c010">linenum-directive</span></a></td><td class="c015">::=</td><td class="c017">
<span class="c004">#</span>&nbsp;{<span class="c004">0</span>&nbsp;…&nbsp;<span class="c004">9</span>}<sup>+</sup>
&nbsp;</td></tr>
<tr><td class="c018">&nbsp;</td><td class="c015">∣</td><td class="c017">&nbsp;<span class="c004">#</span>&nbsp;{<span class="c004">0</span>&nbsp;…&nbsp;<span class="c004">9</span>}<sup>+</sup>&nbsp;<span class="c004">"</span>&nbsp;{&nbsp;<a class="syntax" href="#string-character"><span class="c010">string-character</span></a>&nbsp;}&nbsp;<span class="c004">"</span>
</td></tr>
</tbody></table></td></tr>
</tbody></table><p>Preprocessors that generate OCaml source code can insert line number
directives in their output so that error messages produced by the
compiler contain line numbers and file names referring to the source
file before preprocessing, instead of after preprocessing.
A line number directive is composed of a <span class="c004">#</span> (sharp sign), followed by
a positive integer (the source line number), optionally followed by a
character string (the source file name).
Line number directives are treated as blanks during lexical
analysis.</p>





</section><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>