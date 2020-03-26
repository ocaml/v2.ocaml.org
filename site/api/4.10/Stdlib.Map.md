<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Stdlib.Map</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Stdlib.Map.html">Stdlib.Map</a></h1>

<pre><span id="MODULEMap"><span class="keyword">module</span> Map</span>: <code class="type"><a href="Map.html">Map</a></code></pre><hr width="100%">

<pre><span id="MODULETYPEOrderedType"><span class="keyword">module type</span> <a href="Map.OrderedType.html">OrderedType</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Map.OrderedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Input signature of the functor <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>

</div>

<pre><span id="MODULETYPES"><span class="keyword">module type</span> <a href="Map.S.html">S</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Map.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Output signature of the functor <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.</p>

</div>

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Map.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Ord</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Map.OrderedType.html">OrderedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Map.S.html">S</a></code><code class="type">  with type key = Ord.t</code></div></pre><div class="info">
<p>Functor building an implementation of the map structure
   given a totally ordered type.</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>