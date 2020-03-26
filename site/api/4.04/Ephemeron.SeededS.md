<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Ephemeron.SeededS</a></div><ul></ul></nav></header>

<h1>Module type <a href="type_Ephemeron.SeededS.html">Ephemeron.SeededS</a></h1>

<pre><span class="keyword">module type</span> SeededS = <code class="code"><span class="keyword">sig</span></code> <a href="Ephemeron.SeededS.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info modtype top">
The output signature of the functor <a href="Ephemeron.K1.MakeSeeded.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K1</span>.<span class="constructor">MakeSeeded</span></code></a> and <a href="Ephemeron.K2.MakeSeeded.html"><code class="code"><span class="constructor">Ephemeron</span>.<span class="constructor">K2</span>.<span class="constructor">MakeSeeded</span></code></a>.<br>
</div>
<hr width="100%">

<pre><span class="keyword">include</span> <a href="Hashtbl.SeededS.html">Hashtbl.SeededS</a></pre>

<pre><span id="VALclean"><span class="keyword">val</span> clean</span> : <code class="type">'a t -&gt; unit</code></pre><div class="info ">
remove all dead bindings. Done automatically during automatic resizing.<br>
</div>

<pre><span id="VALstats_alive"><span class="keyword">val</span> stats_alive</span> : <code class="type">'a t -&gt; <a href="Hashtbl.html#TYPEstatistics">Hashtbl.statistics</a></code></pre><div class="info ">
same as <a href="Hashtbl.SeededS.html#VALstats"><code class="code"><span class="constructor">Hashtbl</span>.<span class="constructor">SeededS</span>.stats</code></a> but only count the alive bindings<br>
</div>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>