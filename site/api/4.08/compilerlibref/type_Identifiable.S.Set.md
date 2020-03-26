<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Identifiable.S.Set.html">Identifiable.S.Set</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;elt&nbsp;=&nbsp;<span class="constructor">T</span>.t<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;<span class="constructor">Set</span>.<span class="constructor">Make</span>(<span class="constructor">T</span>).t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;empty&nbsp;:&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_empty&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;mem&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;singleton&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;remove&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;union&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;inter&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;disjoint&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;diff&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;subset&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;iter&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;fold&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;for_all&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exists&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;filter&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;partition&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;*&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;cardinal&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;elements&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_elt&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;min_elt_opt&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_elt&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;max_elt_opt&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;choose&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;choose_opt&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;split&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;*&nbsp;bool&nbsp;*&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_opt&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_first&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_first_opt&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_last&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;find_last_opt&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;option<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_seq_from&nbsp;:&nbsp;elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;<span class="constructor">Seq</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_seq&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt&nbsp;<span class="constructor">Seq</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_seq&nbsp;:&nbsp;elt&nbsp;<span class="constructor">Seq</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;of_seq&nbsp;:&nbsp;elt&nbsp;<span class="constructor">Seq</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output&nbsp;:&nbsp;out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;print&nbsp;:&nbsp;<span class="constructor">Format</span>.formatter&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_string&nbsp;:&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;of_list&nbsp;:&nbsp;elt&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;map&nbsp;:&nbsp;(elt&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;elt)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>