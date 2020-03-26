<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Identifiable</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Identifiable.html">Identifiable</a></h1>

<pre><span id="MODULEIdentifiable"><span class="keyword">module</span> Identifiable</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Uniform interface for common data structures over various things.</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="MODULETYPEThing"><span class="keyword">module type</span> <a href="Identifiable.Thing.html">Thing</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.Thing.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEPair"><span class="keyword">module</span> <a href="Identifiable.Pair.html">Pair</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">A</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">B</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="type">  with type t = A.t * B.t</code></div></div></pre>
<pre><span id="MODULETYPESet"><span class="keyword">module type</span> <a href="Identifiable.Set.html">Set</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.Set.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPEMap"><span class="keyword">module type</span> <a href="Identifiable.Map.html">Map</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.Map.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPETbl"><span class="keyword">module type</span> <a href="Identifiable.Tbl.html">Tbl</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.Tbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULETYPES"><span class="keyword">module type</span> <a href="Identifiable.S.html">S</a></span> = <code class="code"><span class="keyword">sig</span></code> <a href="Identifiable.S.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Identifiable.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">T</span></code><code class="code">&nbsp;:&nbsp;</code><code class="type"><a href="Identifiable.Thing.html">Thing</a></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="type"><a href="Identifiable.S.html">S</a></code><code class="type">  with type t := T.t</code></div></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>