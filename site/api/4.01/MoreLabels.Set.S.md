<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.01</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">MoreLabels.Set.S</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_MoreLabels.Set.S.html">MoreLabels.Set.S</a></h1>

<pre><span class="keyword">module type</span> S = <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Set.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEelt"><span class="keyword">type</span> <code class="type"></code>elt</span> </pre>


<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALis_empty"><span class="keyword">val</span> is_empty</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALsingleton"><span class="keyword">val</span> singleton</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALunion"><span class="keyword">val</span> union</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALinter"><span class="keyword">val</span> inter</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALdiff"><span class="keyword">val</span> diff</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALequal"><span class="keyword">val</span> equal</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALsubset"><span class="keyword">val</span> subset</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; unit) -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; 'a -&gt; 'a) -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; init:'a -&gt; 'a</code></pre>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALexists"><span class="keyword">val</span> exists</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALfilter"><span class="keyword">val</span> filter</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALpartition"><span class="keyword">val</span> partition</span> : <code class="type">f:(<a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; bool) -&gt;<br>       <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> * <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALcardinal"><span class="keyword">val</span> cardinal</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALelements"><span class="keyword">val</span> elements</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEelt">elt</a> list</code></pre>
<pre><span id="VALmin_elt"><span class="keyword">val</span> min_elt</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEelt">elt</a></code></pre>
<pre><span id="VALmax_elt"><span class="keyword">val</span> max_elt</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEelt">elt</a></code></pre>
<pre><span id="VALchoose"><span class="keyword">val</span> choose</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEelt">elt</a></code></pre>
<pre><span id="VALsplit"><span class="keyword">val</span> split</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt;<br>       <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> * bool * <a href="MoreLabels.Set.S.html#TYPEt">t</a></code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type"><a href="MoreLabels.Set.S.html#TYPEelt">elt</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEt">t</a> -&gt; <a href="MoreLabels.Set.S.html#TYPEelt">elt</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>