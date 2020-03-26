<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Numbers</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Numbers.html">Numbers</a></h1>

<pre><span id="MODULENumbers"><span class="keyword">module</span> Numbers</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Numbers.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Modules about numbers, some of which satisfy <a href="Identifiable.S.html"><code class="code"><span class="constructor">Identifiable</span>.<span class="constructor">S</span></code></a>.</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="MODULEInt"><span class="keyword">module</span> <a href="Numbers.Int.html">Int</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Numbers.Int.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEInt8"><span class="keyword">module</span> <a href="Numbers.Int8.html">Int8</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Numbers.Int8.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEInt16"><span class="keyword">module</span> <a href="Numbers.Int16.html">Int16</a></span>: <code class="code"><span class="keyword">sig</span></code> <a href="Numbers.Int16.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEFloat"><span class="keyword">module</span> <a href="Numbers.Float.html">Float</a></span>: <code class="type"><a href="Identifiable.S.html">Identifiable.S</a></code><code class="type">  with type t = float</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>