<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Lexing.html">Lexing</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;position&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;pos_fname&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pos_lnum&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pos_bol&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;pos_cnum&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;dummy_pos&nbsp;:&nbsp;<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;lexbuf&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;refill_buff&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_buffer&nbsp;:&nbsp;bytes;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_buffer_len&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_abs_pos&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_start_pos&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_curr_pos&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_last_pos&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_last_action&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_eof_reached&nbsp;:&nbsp;bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_mem&nbsp;:&nbsp;int&nbsp;array;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_start_p&nbsp;:&nbsp;<span class="constructor">Lexing</span>.position;<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">mutable</span>&nbsp;lex_curr_p&nbsp;:&nbsp;<span class="constructor">Lexing</span>.position;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_function&nbsp;:&nbsp;(bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme_char&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme_start&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme_end&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme_start_p&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lexeme_end_p&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_line&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;flush_input&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub_lexeme&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub_lexeme_opt&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub_lexeme_char&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sub_lexeme_char_opt&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;lex_tables&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_base&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_backtrk&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_default&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_trans&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_check&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_base_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_backtrk_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_default_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_trans_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_check_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lex_code&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;engine&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lex_tables&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;new_engine&nbsp;:&nbsp;<span class="constructor">Lexing</span>.lex_tables&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>