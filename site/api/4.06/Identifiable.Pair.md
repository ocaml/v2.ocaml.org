<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable.Pair</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Identifiable.Pair.html">Identifiable.Pair</a></h1>

<pre><span id="MODULEPair"><span class="keyword">module</span> Pair</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">A</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">B</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="type">  with type t = A.t * B.t</code></div></div></pre><table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>A</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Identifiable.Thing.html">Thing</a></code>
</td></tr><tr>
<td align="center" valign="top" width="15%">
<code>B</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Identifiable.Thing.html">Thing</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span class="keyword">include</span> <a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a></pre>

<pre><span class="keyword">include</span> <a href="Map.OrderedType.html">Map.OrderedType</a></pre>

<pre><span id="VALoutput"><span class="keyword">val</span> output</span> : <code class="type"><a href="Pervasives.html#TYPEout_channel">out_channel</a> -&gt; <a href="Identifiable.Thing.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type"><a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; <a href="Identifiable.Thing.html#TYPEt">t</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>