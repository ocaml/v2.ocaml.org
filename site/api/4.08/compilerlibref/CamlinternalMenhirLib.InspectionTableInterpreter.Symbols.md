<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">CamlinternalMenhirLib.InspectionTableInterpreter.Symbols</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_CamlinternalMenhirLib.InspectionTableInterpreter.Symbols.html">CamlinternalMenhirLib.InspectionTableInterpreter.Symbols</a></h1>

<pre><span id="MODULESymbols"><span class="keyword">module</span> Symbols</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">T</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEterminal"><span class="keyword">type</span> <code class="type">'a</code> terminal</span> </pre>


<pre><span id="TYPEnonterminal"><span class="keyword">type</span> <code class="type">'a</code> nonterminal</span> </pre>

</div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html">CamlinternalMenhirLib.IncrementalEngine.SYMBOLS</a></code><code class="type"> 
  with type 'a terminal := 'a T.terminal
   and type 'a nonterminal := 'a T.nonterminal</code></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>T</code></td>
<td align="center" valign="top">:</td>
<td><code class="type">sig

  type 'a terminal
  type 'a nonterminal

end</code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEterminal"><span class="keyword">type</span> <code class="type">'a</code> terminal</span> </pre>


<pre><span id="TYPEnonterminal"><span class="keyword">type</span> <code class="type">'a</code> nonterminal</span> </pre>


<pre><code><span id="TYPEsymbol"><span class="keyword">type</span> <code class="type">'a</code> symbol</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsymbol.T"><span class="constructor">T</span></span> <span class="keyword">:</span> <code class="type">'a0 <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPEterminal">terminal</a></code> <span class="keyword">-&gt;</span> <code class="type">'a0 <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPEsymbol">symbol</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTsymbol.N"><span class="constructor">N</span></span> <span class="keyword">:</span> <code class="type">'a1 <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPEnonterminal">nonterminal</a></code> <span class="keyword">-&gt;</span> <code class="type">'a1 <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPEsymbol">symbol</a></code></code></td>

</tr></tbody></table>



<pre><code><span id="TYPExsymbol"><span class="keyword">type</span> <code class="type"></code>xsymbol</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTxsymbol.X"><span class="constructor">X</span></span> <span class="keyword">:</span> <code class="type">'a <a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPEsymbol">symbol</a></code> <span class="keyword">-&gt;</span> <code class="type"><a href="CamlinternalMenhirLib.IncrementalEngine.SYMBOLS.html#TYPExsymbol">xsymbol</a></code></code></td>

</tr></tbody></table>



<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>