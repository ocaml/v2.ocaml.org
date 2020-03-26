<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Digest.html">Digest</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare&nbsp;:&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;equal&nbsp;:&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;string&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;bytes&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;substring&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;subbytes&nbsp;:&nbsp;bytes&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">external</span>&nbsp;channel&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="string">"caml_md5_chan"</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;file&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;output&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.out_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;unit<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;input&nbsp;:&nbsp;<span class="constructor">Pervasives</span>.in_channel&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;to_hex&nbsp;:&nbsp;<span class="constructor">Digest</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;from_hex&nbsp;:&nbsp;string&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Digest</span>.t<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>