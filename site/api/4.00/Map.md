<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.00</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Map</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Map.html">Map</a></h1>
<pre><span class="keyword">module</span> Map: <code class="code"><span class="keyword">sig</span></code> <a href="Map.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>Association tables over ordered types.
<p>

   This module implements applicative association tables, also known as
   finite maps or dictionaries, given a total ordering function
   over the keys.
   All operations over maps are purely applicative (no side-effects).
   The implementation uses balanced binary trees, and therefore searching
   and insertion take time logarithmic in the size of the map.<br>
</p><hr width="100%">
<pre><span class="keyword">module type</span> <a href="Map.OrderedType.html">OrderedType</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Map.OrderedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Input signature of the functor <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.
</div>
<pre><span class="keyword">module type</span> <a href="Map.S.html">S</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Map.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Output signature of the functor <a href="Map.Make.html"><code class="code"><span class="constructor">Map</span>.<span class="constructor">Make</span></code></a>.
</div>
<pre><span class="keyword">module</span> <a href="Map.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">Ord</span></code><code class="code"> : </code><code class="type"><a href="Map.OrderedType.html">OrderedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="Map.S.html">S</a></code><code class="type">  with type key = Ord.t</code></div></pre><div class="info">
Functor building an implementation of the map structure
   given a totally ordered type.
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>