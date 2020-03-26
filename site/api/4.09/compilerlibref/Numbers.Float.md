<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Numbers.Float</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Numbers.Float.html">Numbers.Float</a></h1>

<pre><span id="MODULEFloat"><span class="keyword">module</span> Float</span>: <code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code><code class="type">  with type t = float</code></pre><hr width="100%">

<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="MODULET"><span class="keyword">module</span> <a href="Identifiable.S.T.html">T</a></span>: <code class="type"><a href="Identifiable.Thing.html">Identifiable.Thing</a></code><code class="type">  with type t = t</code></pre>
<pre><span class="keyword">include</span> <a href="Identifiable.Thing.html">Identifiable.Thing</a></pre>

<pre><span id="MODULESet"><span class="keyword">module</span> <a href="Identifiable.S.Set.html">Set</a></span>: <code class="type"><a href="Identifiable.Set.html">Identifiable.Set</a></code><code class="type">  with module T := T</code></pre>
<pre><span id="MODULEMap"><span class="keyword">module</span> <a href="Identifiable.S.Map.html">Map</a></span>: <code class="type"><a href="Identifiable.Map.html">Identifiable.Map</a></code><code class="type">  with module T := T</code></pre>
<pre><span id="MODULETbl"><span class="keyword">module</span> <a href="Identifiable.S.Tbl.html">Tbl</a></span>: <code class="type"><a href="Identifiable.Tbl.html">Identifiable.Tbl</a></code><code class="type">  with module T := T</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>