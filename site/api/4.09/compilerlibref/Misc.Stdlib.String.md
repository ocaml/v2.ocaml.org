<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Misc.Stdlib.String</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Misc.Stdlib.String.html">Misc.Stdlib.String</a></h1>

<pre><span id="MODULEString"><span class="keyword">module</span> String</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Misc.Stdlib.String.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><hr width="100%">

<pre><span class="keyword">include</span> String</pre>

<pre><span id="MODULESet"><span class="keyword">module</span> <a href="Misc.Stdlib.String.Set.html">Set</a></span>: <code class="type">Set.S</code><code class="type">  with type elt = string</code></pre>
<pre><span id="MODULEMap"><span class="keyword">module</span> <a href="Misc.Stdlib.String.Map.html">Map</a></span>: <code class="type">Map.S</code><code class="type">  with type key = string</code></pre>
<pre><span id="MODULETbl"><span class="keyword">module</span> <a href="Misc.Stdlib.String.Tbl.html">Tbl</a></span>: <code class="type">Hashtbl.S</code><code class="type">  with type key = string</code></pre>
<pre><span id="VALprint"><span class="keyword">val</span> print</span> : <code class="type">Format.formatter -&gt; t -&gt; unit</code></pre>
<pre><span id="VALfor_all"><span class="keyword">val</span> for_all</span> : <code class="type">(char -&gt; bool) -&gt; t -&gt; bool</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>