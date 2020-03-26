<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.04</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">MoreLabels</a></div><ul></ul></nav></header>

<h1>Module <a href="type_MoreLabels.html">MoreLabels</a></h1>

<pre><span class="keyword">module</span> MoreLabels: <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Extra labeled libraries.
<p>

   This meta-module provides labelized version of the <a href="Hashtbl.html"><code class="code"><span class="constructor">Hashtbl</span></code></a>,
   <a href="Map.html"><code class="code"><span class="constructor">Map</span></code></a> and <a href="Set.html"><code class="code"><span class="constructor">Set</span></code></a> modules.
</p><p>

   They only differ by their labels. They are provided to help
   porting from previous versions of OCaml.
   The contents of this module are subject to change.<br>
</p></div>
<hr width="100%">

<pre><span class="keyword">module</span> <a href="MoreLabels.Hashtbl.html">Hashtbl</a>: <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Hashtbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="MoreLabels.Map.html">Map</a>: <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Map.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span class="keyword">module</span> <a href="MoreLabels.Set.html">Set</a>: <code class="code"><span class="keyword">sig</span></code> <a href="MoreLabels.Set.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>