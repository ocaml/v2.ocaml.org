<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.Engine.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_CamlinternalMenhirLib.Engine.Make.html">CamlinternalMenhirLib.Engine.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">T</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">CamlinternalMenhirLib.EngineTypes.TABLE</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type">ENGINE</code><code class="type"> 
  with type state = T.state
   and type token = T.token
   and type semantic_value = T.semantic_value
   and type production = T.production
   and type 'a env = (T.state, T.semantic_value, T.token) EngineTypes.env</code></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>T</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="CamlinternalMenhirLib.EngineTypes.TABLE.html">CamlinternalMenhirLib.EngineTypes.TABLE</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>