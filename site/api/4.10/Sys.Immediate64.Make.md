<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Sys.Immediate64.Make</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Sys.Immediate64.Make.html">Sys.Immediate64.Make</a></h1>

<pre><span id="MODULEMake"><span class="keyword">module</span> Make</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Immediate</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Sys.Immediate64.Immediate.html">Immediate</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Non_immediate</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Sys.Immediate64.Non_immediate.html">Non_immediate</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="Sys.Immediate64.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></div></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>Immediate</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Sys.Immediate64.Immediate.html">Immediate</a></code>
</td></tr><tr>
<td align="center" valign="top" width="15%">
<code>Non_immediate</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Sys.Immediate64.Non_immediate.html">Non_immediate</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><code><span id="TYPErepr"><span class="keyword">type</span> <code class="type">'a</code> repr</span> = </code></pre><table class="typetable">
<tbody><tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTrepr.Immediate"><span class="constructor">Immediate</span></span> <span class="keyword">:</span> <code class="type"><a href="Sys.Immediate64.Immediate.html#TYPEt">Sys.Immediate64.Immediate.t</a> <a href="Sys.Immediate64.Make.html#TYPErepr">repr</a></code></code></td>

</tr>
<tr>
<td align="left" valign="top">
<code><span class="keyword">|</span></code></td>
<td align="left" valign="top">
<code><span id="TYPEELTrepr.Non_immediate"><span class="constructor">Non_immediate</span></span> <span class="keyword">:</span> <code class="type"><a href="Sys.Immediate64.Non_immediate.html#TYPEt">Sys.Immediate64.Non_immediate.t</a> <a href="Sys.Immediate64.Make.html#TYPErepr">repr</a></code></code></td>

</tr></tbody></table>



<pre><span id="VALrepr"><span class="keyword">val</span> repr</span> : <code class="type"><a href="Sys.Immediate64.Make.html#TYPEt">t</a> <a href="Sys.Immediate64.Make.html#TYPErepr">repr</a></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>