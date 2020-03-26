<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="CamlinternalMenhirLib.TableFormat.TABLES.html">CamlinternalMenhirLib.TableFormat.TABLES</a></div><ul></ul></nav></header>
<code class="code"><span class="keyword">sig</span><br>
&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;token<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;token2terminal&nbsp;:&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">TableFormat</span>.<span class="constructor">TABLES</span>.token&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error_terminal&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;token2value&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">TableFormat</span>.<span class="constructor">TABLES</span>.token&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;default_reduction&nbsp;:&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;error&nbsp;:&nbsp;int&nbsp;*&nbsp;string<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;action&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;lhs&nbsp;:&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;goto&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t&nbsp;*<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">PackedIntArray</span>.t<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;start&nbsp;:&nbsp;int<br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;semantic_action&nbsp;:<br>
&nbsp;&nbsp;&nbsp;&nbsp;((int,&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t,&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">TableFormat</span>.<span class="constructor">TABLES</span>.token)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">EngineTypes</span>.env&nbsp;<span class="keywordsign">-&gt;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(int,&nbsp;<span class="constructor">Stdlib</span>.<span class="constructor">Obj</span>.t)&nbsp;<span class="constructor">CamlinternalMenhirLib</span>.<span class="constructor">EngineTypes</span>.stack)<br>
&nbsp;&nbsp;&nbsp;&nbsp;array<br>
&nbsp;&nbsp;<span class="keyword">exception</span>&nbsp;<span class="constructor">Error</span><br>
&nbsp;&nbsp;<span class="keyword">val</span>&nbsp;trace&nbsp;:&nbsp;(string&nbsp;array&nbsp;*&nbsp;string&nbsp;array)&nbsp;option<br>
<span class="keyword">end</span></code>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>