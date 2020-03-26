<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.03</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">StdLabels</a></div><ul></ul></nav></header>

<h1>Module <a href="type_StdLabels.html">StdLabels</a></h1>

<pre><span class="keyword">module</span> StdLabels: <code class="code"><span class="keyword">sig</span></code> <a href="StdLabels.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
Standard labeled libraries.
<p>

   This meta-module provides labelized version of the <a href="Array.html"><code class="code"><span class="constructor">Array</span></code></a>,
   <a href="Bytes.html"><code class="code"><span class="constructor">Bytes</span></code></a>, <a href="List.html"><code class="code"><span class="constructor">List</span></code></a> and <a href="String.html"><code class="code"><span class="constructor">String</span></code></a> modules.
</p><p>

   They only differ by their labels. Detailed interfaces can be found
   in <code class="code">arrayLabels.mli</code>, <code class="code">bytesLabels.mli</code>, <code class="code">listLabels.mli</code>
   and <code class="code">stringLabels.mli</code>.<br>
</p></div>
<hr width="100%">

<pre><span class="keyword">module</span> <a href="StdLabels.Array.html">Array</a>: <code class="type"><a href="ArrayLabels.html">ArrayLabels</a></code></pre>
<pre><span class="keyword">module</span> <a href="StdLabels.Bytes.html">Bytes</a>: <code class="type"><a href="BytesLabels.html">BytesLabels</a></code></pre>
<pre><span class="keyword">module</span> <a href="StdLabels.List.html">List</a>: <code class="type"><a href="ListLabels.html">ListLabels</a></code></pre>
<pre><span class="keyword">module</span> <a href="StdLabels.String.html">String</a>: <code class="type"><a href="StringLabels.html">StringLabels</a></code></pre><div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>