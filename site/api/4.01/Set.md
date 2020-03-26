<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Set</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Set.html">Set</a></h1>

<pre><span class="keyword">module</span> Set: <code class="code"><span class="keyword">sig</span></code> <a href="Set.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Sets over ordered types.
<p>

   This module implements the set data structure, given a total ordering
   function over the set elements. All operations over sets
   are purely applicative (no side-effects).
   The implementation uses balanced binary trees, and is therefore
   reasonably efficient: insertion and membership take time
   logarithmic in the size of the set, for instance.<br>
</p></div>
<hr width="100%">

<pre><span class="keyword">module type</span> <a href="Set.OrderedType.html">OrderedType</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Set.OrderedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Input signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.
</div>

<pre><span class="keyword">module type</span> <a href="Set.S.html">S</a> = <code class="code"><span class="keyword">sig</span></code> <a href="Set.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
Output signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.
</div>

<pre><span class="keyword">module</span> <a href="Set.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">Ord</span></code><code class="code"> : </code><code class="type"><a href="Set.OrderedType.html">OrderedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="Set.S.html">S</a></code><code class="type">  with type elt = Ord.t</code></div></pre><div class="info">
Functor building an implementation of the set structure
   given a totally ordered type.
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>