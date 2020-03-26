<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Stdlib.LargeFile.html">Stdlib.LargeFile</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_out&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_out&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;out_channel_length&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;seek_in&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;pos_in&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;in_channel_length&nbsp;:&nbsp;<span class="constructor">Stdlib</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int64<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>