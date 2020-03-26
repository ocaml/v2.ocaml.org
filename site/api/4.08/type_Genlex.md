<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="Genlex.html">Genlex</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">Kwd</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Ident</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Int</span>&nbsp;<span class="keyword">of</span>&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Float</span>&nbsp;<span class="keyword">of</span>&nbsp;float<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">String</span>&nbsp;<span class="keyword">of</span>&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">Char</span>&nbsp;<span class="keyword">of</span>&nbsp;char<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;make_lexer&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;string&nbsp;list&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;char&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Stream</span>.t&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Genlex</span>.token&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Stream</span>.t<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>