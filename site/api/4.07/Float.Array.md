<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.07</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Float.Array</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Float.Array.html">Float.Array</a></h1>

<pre><span id="MODULEArray"><span class="keyword">module</span> Array</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Float.Array.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> = <code class="type">floatarray</code> </pre>


<pre><span id="VALcreate"><span class="keyword">val</span> create</span> : <code class="type">int -&gt; <a href="Float.Array.html#TYPEt">t</a></code></pre>
<pre><span id="VALlength"><span class="keyword">val</span> length</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int</code></pre>
<pre><span id="VALget"><span class="keyword">val</span> get</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre>
<pre><span id="VALset"><span class="keyword">val</span> set</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre>
<pre><span id="VALunsafe_get"><span class="keyword">val</span> unsafe_get</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float</code></pre>
<pre><span id="VALunsafe_set"><span class="keyword">val</span> unsafe_set</span> : <code class="type"><a href="Float.Array.html#TYPEt">t</a> -&gt; int -&gt; float -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>