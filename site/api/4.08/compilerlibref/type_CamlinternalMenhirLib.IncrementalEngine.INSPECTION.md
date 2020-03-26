<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.IncrementalEngine.INSPECTION.html">CamlinternalMenhirLib.IncrementalEngine.INSPECTION</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">T</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;<span class="constructor">N</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;xsymbol&nbsp;=&nbsp;<span class="constructor">X</span>&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;lr1state<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;production<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;item&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_terminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_nonterminals&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_symbols&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_productions&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;compare_items&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;incoming_symbol&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;items&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.lr1state&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.item&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lhs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;xsymbol<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;rhs&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.production&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;xsymbol&nbsp;list<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;nullable&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;first&nbsp;:&nbsp;<span class="keywordsign">'</span>a&nbsp;nonterminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>b&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;xfirst&nbsp;:&nbsp;xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;terminal&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;bool<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;foreach_terminal_but_error&nbsp;:&nbsp;(xsymbol&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="keywordsign">'</span>a<br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;<span class="keywordsign">'</span>a&nbsp;env<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;feed&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;symbol&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>a&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.position&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">'</span>b&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">IncrementalEngine</span>.<span class="constructor">INSPECTION</span>.env<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>