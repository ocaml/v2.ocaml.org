<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.08</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Hashtbl.SeededHashedType</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></h1>

<pre><span id="MODULETYPESeededHashedType"><span class="keyword">module type</span> SeededHashedType</span> = <code class="code"><span class="keyword">sig</span></code> <a href="Hashtbl.SeededHashedType.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
<div class="info-desc">
<p>The input signature of the functor <a href="Hashtbl.MakeSeeded.html"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">MakeSeeded</span></code></a>.</p>
</div>
<ul class="info-attributes">
<li><b>Since</b> 4.00.0</li>
</ul>
</div>
<hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>
<div class="info ">
<div class="info-desc">
<p>The type of the hashtable keys.</p>
</div>
</div>


<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="Hashtbl.SeededHashedType.html#TYPEt">t</a> -&gt; <a href="Hashtbl.SeededHashedType.html#TYPEt">t</a> -&gt; bool</code></pre><div class="info ">
<div class="info-desc">
<p>The equality predicate used to compare keys.</p>
</div>
</div>

<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type">int -&gt; <a href="Hashtbl.SeededHashedType.html#TYPEt">t</a> -&gt; int</code></pre><div class="info ">
<div class="info-desc">
<p>A seeded hashing function on keys.  The first argument is
          the seed.  It must be the case that if <code class="code">equal&nbsp;x&nbsp;y</code> is true,
          then <code class="code">hash&nbsp;seed&nbsp;x&nbsp;=&nbsp;hash&nbsp;seed&nbsp;y</code> for any value of <code class="code">seed</code>.
          A suitable choice for <code class="code">hash</code> is the function <a href="Hashtbl.html#VALseeded_hash"><code class="code"><span class="constructor">Hashtbl</span>.seeded_hash</code></a>
          below.</p>
</div>
</div>

<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>