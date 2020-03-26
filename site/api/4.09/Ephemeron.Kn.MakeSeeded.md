<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.Kn.MakeSeeded</a></div><ul></ul></nav></header>

<h1>Functor <a href="type_Ephemeron.Kn.MakeSeeded.html">Ephemeron.Kn.MakeSeeded</a></h1>

<pre><span id="MODULEMakeSeeded"><span class="keyword">module</span> MakeSeeded</span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">H</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Ephemeron.SeededS.html">Ephemeron.SeededS</a></code><code class="type">  with type key = H.t array</code></div></pre><div class="info module top">
<div class="info-desc">
<p>Functor building an implementation of a weak hash table.
      The seed is similar to the one of <a href="Hashtbl.MakeSeeded.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">MakeSeeded</span></code></a>.</p>
</div>
</div>
<table border="0" cellpadding="3" width="100%">
<tbody><tr>
<td align="left" valign="top" width="1%%"><b>Parameters: </b></td>
<td>
<table class="paramstable">
<tbody><tr>
<td align="center" valign="top" width="15%">
<code>H</code></td>
<td align="center" valign="top">:</td>
<td><code class="type"><a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></code>
</td></tr></tbody></table>
</td>
</tr>
</tbody></table>
<hr width="100%">

<pre><span class="keyword">include</span> <a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a></pre>

<pre><span id="VALclean"><span class="keyword">val</span> clean</span> : <code class="type">'a t -&gt; unit</code></pre><div class="info ">
<div class="info-desc">
<p>remove all dead bindings. Done automatically during automatic resizing.</p>
</div>
</div>

<pre><span id="VALstats_alive"><span class="keyword">val</span> stats_alive</span> : <code class="type">'a t -&gt; <a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code></pre><div class="info ">
<div class="info-desc">
<p>same as <a href="Hashtbl.SeededS.html#VALstats"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">SeededS</span>.stats</code></a> but only count the alive bindings</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>