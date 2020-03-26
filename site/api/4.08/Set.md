<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Set</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Set.html">Set</a></h1>

<pre><span id="MODULESet"><span class="keyword">module</span> Set</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Set.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Sets over ordered types.</p>

<p>This module implements the set data structure, given a total ordering
   function over the set elements. All operations over sets
   are purely applicative (no side-effects).
   The implementation uses balanced binary trees, and is therefore
   reasonably efficient: insertion and membership take time
   logarithmic in the size of the set, for instance.</p>

<p>The <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a> functor constructs implementations for any type, given a
   <code class="code">compare</code> function.
   For instance:</p>
<pre class="codepre"><code class="code">     <span class="keyword">module</span> <span class="constructor">IntPairs</span> =
       <span class="keyword">struct</span>
         <span class="keyword">type</span> t = int * int
         <span class="keyword">let</span> compare (x0,y0) (x1,y1) =
           <span class="keyword">match</span> <span class="constructor">Stdlib</span>.compare x0 x1 <span class="keyword">with</span>
               0 <span class="keywordsign">-&gt;</span> <span class="constructor">Stdlib</span>.compare y0 y1
             <span class="keywordsign">|</span> c <span class="keywordsign">-&gt;</span> c
       <span class="keyword">end</span>

     <span class="keyword">module</span> <span class="constructor">PairsSet</span> = <span class="constructor">Set</span>.<span class="constructor">Make</span>(<span class="constructor">IntPairs</span>)

     <span class="keyword">let</span> m = <span class="constructor">PairsSet</span>.(empty |&gt; add (2,3) |&gt; add (5,7) |&gt; add (11,13))
   </code></pre>
<p>This creates a new module <code class="code"><span class="constructor">PairsSet</span></code>, with a new type <code class="code"><span class="constructor">PairsSet</span>.t</code>
   of sets of <code class="code">int&nbsp;*&nbsp;int</code>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="MODULETYPEOrderedType"><span class="keyword">module type</span> <a href="Set.OrderedType.html">OrderedType</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Set.OrderedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Input signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.</p>

</div>

<pre><span id="MODULETYPES"><span class="keyword">module type</span> <a href="Set.S.html">S</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Set.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info">
<p>Output signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.</p>

</div>

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Set.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Ord</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Set.OrderedType.html">OrderedType</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Set.S.html">S</a></code><code class="type">  with type elt = Ord.t</code></div></pre><div class="info">
<p>Functor building an implementation of the set structure
   given a totally ordered type.</p>

</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>