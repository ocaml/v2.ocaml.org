<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Lexer.html">Lexer</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;init&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;token&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;skip_hash_bang&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;error&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Illegal_character</span>&nbsp;<span class="keyword">of</span>&nbsp;char<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Illegal_escape</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Reserved_sequence</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unterminated_comment</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unterminated_string</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Unterminated_string_in_comment</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Location</span>.t&nbsp;*&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Keyword_as_label</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Invalid_literal</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Invalid_directive</span>&nbsp;<span class="keyword">of</span>&nbsp;string&nbsp;*&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Lexer</span>.error&nbsp;*&nbsp;<span class="constructor">Location</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_comment&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_string&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print_warnings&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;handle_docstrings&nbsp;:&nbsp;bool&nbsp;<span class="constructor">Stdlib</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;comments&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(string&nbsp;*&nbsp;<span class="constructor">Location</span>.t)&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;token_with_comments&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_preprocessor&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;((<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Parser</span>.token)&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;unit<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>