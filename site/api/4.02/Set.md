<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.02</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
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
   logarithmic in the size of the set, for instance.
</p><p>

   The <code class="code"><span class="constructor">Make</span></code> functor constructs implementations for any type, given a
   <code class="code">compare</code> function.
   For instance:
   </p><pre class="codepre"><code class="code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">IntPairs</span>&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">struct</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">type</span>&nbsp;t&nbsp;=&nbsp;int&nbsp;*&nbsp;int<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;compare&nbsp;(x0,y0)&nbsp;(x1,y1)&nbsp;=<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">match</span>&nbsp;<span class="constructor">Pervasives</span>.compare&nbsp;x0&nbsp;x1&nbsp;<span class="keyword">with</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;<span class="constructor">Pervasives</span>.compare&nbsp;y0&nbsp;y1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywordsign">|</span>&nbsp;c&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;c<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">module</span>&nbsp;<span class="constructor">PairsSet</span>&nbsp;=&nbsp;<span class="constructor">Set</span>.<span class="constructor">Make</span>(<span class="constructor">IntPairs</span>)<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">let</span>&nbsp;m&nbsp;=&nbsp;<span class="constructor">PairsSet</span>.(empty&nbsp;|&gt;&nbsp;add&nbsp;(2,3)&nbsp;|&gt;&nbsp;add&nbsp;(5,7)&nbsp;|&gt;&nbsp;add&nbsp;(11,13))<br>
&nbsp;&nbsp;&nbsp;</code></pre>
<p>

   This creates a new module <code class="code"><span class="constructor">PairsSet</span></code>, with a new type <code class="code"><span class="constructor">PairsSet</span>.t</code>
   of sets of <code class="code">int * int</code>.<br>
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