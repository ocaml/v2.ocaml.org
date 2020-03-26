<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.09</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Consistbl</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Consistbl.html">Consistbl</a></h1>

<pre><span id="MODULEConsistbl"><span class="keyword">module</span> Consistbl</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Consistbl.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Consistency tables: for checking consistency of module CRCs</p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="MODULEMake"><span class="keyword">module</span> <a href="Consistbl.Make.html">Make</a></span>: <div class="sig_block"><code class="code"><span class="keyword">functor</span>&nbsp;(</code><code class="code"><span class="constructor">Module_name</span></code><code class="code">&nbsp;:&nbsp;</code><code class="code"><span class="keyword">sig</span></code></div></pre><div class="sig_block">
<pre><span id="TYPEt"><span class="keyword">type</span> <code class="type"></code>t</span> </pre>


<pre><span id="MODULESet"><span class="keyword">module</span> <a href="Consistbl.Make.Set.html">Set</a></span>: <code class="type">Set.S</code><code class="type">  with type elt = t</code></pre>
<pre><span id="MODULEMap"><span class="keyword">module</span> <a href="Consistbl.Make.Map.html">Map</a></span>: <code class="type">Map.S</code><code class="type">  with type key = t</code></pre>
<pre><span id="MODULETbl"><span class="keyword">module</span> <a href="Consistbl.Make.Tbl.html">Tbl</a></span>: <code class="type">Hashtbl.S</code><code class="type">  with type key = t</code></pre>
<pre><span id="VALcompare"><span class="keyword">val</span> compare</span> : <code class="type"><a href="Consistbl.Make.html#TYPEt">t</a> -&gt; <a href="Consistbl.Make.html#TYPEt">t</a> -&gt; int</code></pre></div><pre><code class="code"><span class="keyword">end</span></code><code class="code">)&nbsp;<span class="keywordsign">-&gt;</span>&nbsp;</code><code class="code"><span class="keyword">sig</span></code> <a href="Consistbl.Make.html">..</a> <code class="code"><span class="keyword">end</span></code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>