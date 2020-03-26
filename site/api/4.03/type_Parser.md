<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Parser.html">Parser</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">AMPERAMPER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AMPERSAND</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AND</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">AS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ASSERT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BACKQUOTE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BANG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BAR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BARBAR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BARRBRACKET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">BEGIN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">CHAR</span>&nbsp;<span class="keyword">of</span>&nbsp;char
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">CLASS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COLON</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COLONCOLON</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COLONEQUAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COLONGREATER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COMMA</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">CONSTRAINT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DO</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DONE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DOT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DOTDOT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DOWNTO</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">ELSE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">END</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EOF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EQUAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EXCEPTION</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EXTERNAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FALSE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FLOAT</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;*&nbsp;char&nbsp;option)
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FOR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FUN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FUNCTION</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">FUNCTOR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GREATER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GREATERRBRACE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">GREATERRBRACKET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">IF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">IN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INCLUDE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INFIXOP0</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INFIXOP1</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INFIXOP2</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INFIXOP3</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INFIXOP4</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INHERIT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INITIALIZER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">INT</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;*&nbsp;char&nbsp;option)
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LABEL</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LAZY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACELESS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETBAR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETLESS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETGREATER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETPERCENT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETPERCENTPERCENT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LESS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LESSMINUS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LIDENT</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LPAREN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETAT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETATAT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">LBRACKETATATAT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MATCH</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">METHOD</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MINUS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MINUSDOT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MINUSGREATER</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MODULE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">MUTABLE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NEW</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">NONREC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">OBJECT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">OF</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">OPEN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">OPTLABEL</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">OR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PERCENT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PLUS</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PLUSDOT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PLUSEQ</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PREFIXOP</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">PRIVATE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">QUESTION</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">QUOTE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">RBRACE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">RBRACKET</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">REC</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">RPAREN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SEMI</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SEMISEMI</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SHARP</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SHARPOP</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">SIG</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">STAR</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">STRING</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;*&nbsp;string&nbsp;option)
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">STRUCT</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">THEN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TILDE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TO</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TRUE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TRY</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">TYPE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">UIDENT</span>&nbsp;<span class="keyword">of</span>&nbsp;string
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">UNDERSCORE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">VAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">VIRTUAL</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WHEN</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WHILE</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">WITH</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">COMMENT</span>&nbsp;<span class="keyword">of</span>&nbsp;(string&nbsp;*&nbsp;<span class="constructor">Location</span>.t)
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">DOCSTRING</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Docstrings</span>.docstring
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">EOL</span>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;implementation&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.structure
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;interface&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.signature
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;toplevel_phrase&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.toplevel_phrase
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;use_file&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.toplevel_phrase&nbsp;list
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_core_type&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.core_type
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_expression&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.expression
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_pattern&nbsp;:
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parsetree</span>.pattern
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>