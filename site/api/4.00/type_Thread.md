<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Thread.html">Thread</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;create&nbsp;:&nbsp;(<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Thread</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;self&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Thread</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;id&nbsp;:&nbsp;<span class="constructor">Thread</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;exit&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;kill&nbsp;:&nbsp;<span class="constructor">Thread</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;delay&nbsp;:&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;join&nbsp;:&nbsp;<span class="constructor">Thread</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_read&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_write&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_timed_read&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_timed_write&nbsp;:&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;select&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;float&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list&nbsp;*&nbsp;<span class="constructor">Unix</span>.file_descr&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_pid&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;*&nbsp;<span class="constructor">Unix</span>.process_status<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;yield&nbsp;:&nbsp;unit&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;sigmask&nbsp;:&nbsp;<span class="constructor">Unix</span>.sigprocmask_command&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;wait_signal&nbsp;:&nbsp;int&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
<span class="keyword">end</span></code><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>