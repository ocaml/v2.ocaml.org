<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.06</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Tbl</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Tbl.html">Tbl</a></h1>

<pre><span id="MODULETbl"><span class="keyword">module</span> Tbl</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Tbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type">('k, 'v)</code> t</span> </pre>


<pre><span id="VALempty"><span class="keyword">val</span> empty</span> : <code class="type">('k, 'v) <a href="Tbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALadd"><span class="keyword">val</span> add</span> : <code class="type">'k -&gt; 'v -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALfind"><span class="keyword">val</span> find</span> : <code class="type">'k -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; 'v</code></pre>
<pre><span id="VALfind_str"><span class="keyword">val</span> find_str</span> : <code class="type">string -&gt; (string, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; 'v</code></pre>
<pre><span id="VALmem"><span class="keyword">val</span> mem</span> : <code class="type">'k -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; bool</code></pre>
<pre><span id="VALremove"><span class="keyword">val</span> remove</span> : <code class="type">'k -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALiter"><span class="keyword">val</span> iter</span> : <code class="type">('k -&gt; 'v -&gt; unit) -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; unit</code></pre>
<pre><span id="VALmap"><span class="keyword">val</span> map</span> : <code class="type">('k -&gt; 'v1 -&gt; 'v2) -&gt; ('k, 'v1) <a href="Tbl.html#TYPEt">t</a> -&gt; ('k, 'v2) <a href="Tbl.html#TYPEt">t</a></code></pre>
<pre><span id="VALfold"><span class="keyword">val</span> fold</span> : <code class="type">('k -&gt; 'v -&gt; 'acc -&gt; 'acc) -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; 'acc -&gt; 'acc</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">(<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'k -&gt; unit) -&gt;<br>       (<a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; 'v -&gt; unit) -&gt;<br>       <a href="Format.html#TYPEformatter">Format.formatter</a> -&gt; ('k, 'v) <a href="Tbl.html#TYPEt">t</a> -&gt; unit</code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>