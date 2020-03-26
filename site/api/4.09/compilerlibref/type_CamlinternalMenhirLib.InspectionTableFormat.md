<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.InspectionTableFormat.html">CamlinternalMenhirLib.InspectionTableFormat</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="keyword">type</span>&nbsp;<span class="constructor">TABLES</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">sig</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">T</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">N</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;xsymbol&nbsp;=&nbsp;<span class="constructor">X</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;terminal&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nonterminal&nbsp;:&nbsp;int&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lr0_core&nbsp;:&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lr0_items&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lr0_incoming&nbsp;:&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nullable&nbsp;:&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;first&nbsp;:&nbsp;int&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>