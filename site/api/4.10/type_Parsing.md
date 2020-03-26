<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Parsing.html">Parsing</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_start&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_end&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_start&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_end&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_start_pos&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;symbol_end_pos&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_start_pos&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs_end_pos&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;clear_parser&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Parse_error</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;set_trace&nbsp;:&nbsp;bool&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parser_env<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;parse_tables&nbsp;=&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;actions&nbsp;:&nbsp;(<span class="constructor">Parsing</span>.parser_env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t)&nbsp;array;<br>
&nbsp;&nbsp;&nbsp;&nbsp;transl_const&nbsp;:&nbsp;int&nbsp;array;<br>
&nbsp;&nbsp;&nbsp;&nbsp;transl_block&nbsp;:&nbsp;int&nbsp;array;<br>
&nbsp;&nbsp;&nbsp;&nbsp;lhs&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;len&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;defred&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;dgoto&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;sindex&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;rindex&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;gindex&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;tablesize&nbsp;:&nbsp;int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;table&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;check&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;error_function&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;names_const&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;&nbsp;&nbsp;names_block&nbsp;:&nbsp;string;<br>
&nbsp;&nbsp;}<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">YYexit</span>&nbsp;<span class="keyword">of</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;yyparse&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Parsing</span>.parse_tables&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.lexbuf&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;peek_val&nbsp;:&nbsp;<span class="constructor">Parsing</span>.parser_env&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_current_lookahead&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;parse_error&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>