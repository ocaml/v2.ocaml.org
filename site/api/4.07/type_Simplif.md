<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Simplif.html">Simplif</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;simplify_lambda&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lambda</span>.lambda&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Lambda</span>.lambda<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;split_default_wrapper&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;id:<span class="constructor">Ident</span>.t&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;kind:<span class="constructor">Lambda</span>.function_kind&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;params:<span class="constructor">Ident</span>.t&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;body:<span class="constructor">Lambda</span>.lambda&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;attr:<span class="constructor">Lambda</span>.function_attribute&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;loc:<span class="constructor">Location</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Ident</span>.t&nbsp;*&nbsp;<span class="constructor">Lambda</span>.lambda)&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;is_tail_native_heuristic&nbsp;:&nbsp;(int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool)&nbsp;<span class="constructor">Pervasives</span>.ref<br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">Hooks</span>&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;<span class="constructor">Lambda</span>.lambda<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;add_hook&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;(<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;apply_hooks&nbsp;:&nbsp;<span class="constructor">Misc</span>.hook_info&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;t<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>