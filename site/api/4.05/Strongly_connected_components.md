<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.05</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Strongly_connected_components</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Strongly_connected_components.html">Strongly_connected_components</a></h1>

<pre><span class="keyword">module</span> Strongly_connected_components: <code class="code"><span class="keyword">sig</span></code> <a href="Strongly_connected_components.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Kosaraju's algorithm for strongly connected components.<br>
</div>
<hr width="100%">

<pre><span class="keyword">module type</span> <a href="Strongly_connected_components.S.html">S</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Strongly_connected_components.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="Strongly_connected_components.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Id</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Strongly_connected_components.S.html">S</a></code><code class="type">  with module Id := Id</code></div></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>