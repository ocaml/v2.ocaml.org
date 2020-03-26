<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Set.OrderedType</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Set.OrderedType.html">Set.OrderedType</a></h1>

<pre><span class="keyword">module type</span> OrderedType = <code class="code"><span class="keyword">sig</span></code> <a href="Set.OrderedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
Input signature of the functor <a href="Set.Make.html"><code class="code"><span class="constructor">Set</span>.<span class="constructor">Make</span></code></a>.<br>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
The type of the set elements.<br>
</div>


<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Set.OrderedType.html#TYPEt">t</a> -&gt; <a href="Set.OrderedType.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
A total ordering function over the set elements.
          This is a two-argument function <code class="code">f</code> such that
          <code class="code">f e1 e2</code> is zero if the elements <code class="code">e1</code> and <code class="code">e2</code> are equal,
          <code class="code">f e1 e2</code> is strictly negative if <code class="code">e1</code> is smaller than <code class="code">e2</code>,
          and <code class="code">f e1 e2</code> is strictly positive if <code class="code">e1</code> is greater than <code class="code">e2</code>.
          Example: a suitable ordering function is the generic structural
          comparison function <a href="Pervasives.html#VALcompare"><code class="code">compare</code></a>.<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>