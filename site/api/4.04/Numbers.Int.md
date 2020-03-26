<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Numbers.Int</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Numbers.Int.html">Numbers.Int</a></h1>

<pre><span class="keyword">module</span> Int: <code class="code"><span class="keyword">sig</span></code> <a href="Numbers.Int.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> <a href="Identifiable.S.html">Identifiable.S</a></pre>

<pre><span id="VALzero_to_n"><span class="keyword">val</span> zero_to_n</span> : <code class="type">int -&gt; Set.t</code></pre><div class="info ">
<code class="code">zero_to_n&nbsp;n</code> is the set of numbers {0, ..., n} (inclusive).<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>