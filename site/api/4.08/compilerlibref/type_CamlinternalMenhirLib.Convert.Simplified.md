<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.Convert.Simplified.html">CamlinternalMenhirLib.Convert.Simplified</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;traditional2revised&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>token,&nbsp;<span class="keywordsign">'</span>semantic_value)&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">Convert</span>.traditional&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>token&nbsp;*&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position&nbsp;*&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>semantic_value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">Convert</span>.revised<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;revised2traditional&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>token&nbsp;*&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position&nbsp;*&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Lexing</span>.position,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>semantic_value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">Convert</span>.revised&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keywordsign">'</span>token,&nbsp;<span class="keywordsign">'</span>semantic_value)&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">Convert</span>.traditional<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>