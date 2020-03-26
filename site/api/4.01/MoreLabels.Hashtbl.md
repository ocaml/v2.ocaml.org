<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">MoreLabels.Hashtbl</a></div><ul></ul></nav></header>

<h1>Module <a href="type_MoreLabels.Hashtbl.html">MoreLabels.Hashtbl</a></h1>

<pre><span class="keyword">module</span> Hashtbl: <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Hashtbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('a, 'b)</code> t</span> = <code class="type">('a, 'b) <a href="Hashtbl.html#TYPEt">Hashtbl.t</a></code> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">?random:bool -&gt; int -&gt; ('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALclear"><span class="keyword">val</span> clear</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALreset"><span class="keyword">val</span> reset</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALcopy"><span class="keyword">val</span> copy</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; ('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; key:'a -&gt; data:'b -&gt; unit</code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b</code></pre>
<pre><span id="VALfind_all"><span class="keyword">val</span> find_all</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; 'b list</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; bool</code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; 'a -&gt; unit</code></pre>
<pre><span id="VALreplace"><span class="keyword">val</span> replace</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; key:'a -&gt; data:'b -&gt; unit</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(key:'a -&gt; data:'b -&gt; unit) -&gt; ('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">f:(key:'a -&gt; data:'b -&gt; 'c -&gt; 'c) -&gt;<br>       ('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; init:'c -&gt; 'c</code></pre>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALrandomize"><span class="keyword">val</span> randomize</span> : <code class="type">unit -&gt; unit</code></pre>
<pre><span id="TYPEstatistics"><span class="keyword">type</span> <code class="type"></code>statistics</span> = <code class="type"><a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code> </pre>


<pre><span id="VALstats"><span class="keyword">val</span> stats</span> : <code class="type">('a, 'b) <a href="MoreLabels.Hashtbl.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Hashtbl.html#TYPEstatistics">statistics</a></code></pre>
<pre><span class="keyword">module type</span> <a href="MoreLabels.Hashtbl.HashedType.html">HashedType</a> = <code class="type"><a href="Hashtbl.HashedType.html">Hashtbl.HashedType</a></code></pre>
<pre><span class="keyword">module type</span> <a href="MoreLabels.Hashtbl.SeededHashedType.html">SeededHashedType</a> = <code class="type"><a href="Hashtbl.SeededHashedType.html">Hashtbl.SeededHashedType</a></code></pre>
<pre><span class="keyword">module type</span> <a href="MoreLabels.Hashtbl.S.html">S</a> = <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Hashtbl.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module type</span> <a href="MoreLabels.Hashtbl.SeededS.html">SeededS</a> = <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Hashtbl.SeededS.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="MoreLabels.Hashtbl.Make.html">Make</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">H</span></code><code class="code"> : </code><code class="type"><a href="MoreLabels.Hashtbl.HashedType.html">HashedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="MoreLabels.Hashtbl.S.html">S</a></code><code class="type">  with type key = H.t</code></div></pre>
<pre><span class="keyword">module</span> <a href="MoreLabels.Hashtbl.MakeSeeded.html">MakeSeeded</a>: <div class="sig_block"><code class="code"><span class="keyword">functor</span> (</code><code class="code"><span class="constructor">H</span></code><code class="code"> : </code><code class="type"><a href="MoreLabels.Hashtbl.SeededHashedType.html">SeededHashedType</a></code><code class="code">) <span class="keywordsign">-&gt;</span> </code><code class="type"><a href="MoreLabels.Hashtbl.SeededS.html">SeededS</a></code><code class="type">  with type key = H.t</code></div></pre>
<pre><span id="VALhash"><span class="keyword">val</span> hash</span> : <code class="type">'a -&gt; int</code></pre>
<pre><span id="VALseeded_hash"><span class="keyword">val</span> seeded_hash</span> : <code class="type">int -&gt; 'a -&gt; int</code></pre>
<pre><span id="VALhash_param"><span class="keyword">val</span> hash_param</span> : <code class="type">int -&gt; int -&gt; 'a -&gt; int</code></pre>
<pre><span id="VALseeded_hash_param"><span class="keyword">val</span> seeded_hash_param</span> : <code class="type">int -&gt; int -&gt; int -&gt; 'a -&gt; int</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>