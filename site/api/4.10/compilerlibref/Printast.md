<!-- ((! set title API !)) ((! set documentation !)) ((! set api !)) ((! set nobreadcrumb !)) -->
<div class="api"><header><nav class="toc brand"><a class="brand" href="https://ocaml.org/"><img src="colour-logo-gray.svg" class="svg" alt="OCaml"></a></nav><nav class="toc"><div class="toc_version"><a href="/docs" id="version-select">API Version 4.10</a></div><a href="index.html">&lt; General Index</a><div class="api_search"><input type="text" name="apisearch" id="api_search" oninput="mySearch(false);" onkeypress="this.oninput();" onclick="this.oninput();" onpaste="this.oninput();">
<img src="search_icon.svg" alt="Search" class="svg" onclick="mySearch(false)"></div>
<div id="search_results"></div><div class="toc_title"><a href="#top">Printast</a></div><ul></ul></nav></header>

<h1>Module <a href="type_Printast.html">Printast</a></h1>

<pre><span id="MODULEPrintast"><span class="keyword">module</span> Printast</span>: <code class="code"><span class="keyword">sig</span></code> <a href="Printast.html">..</a> <code class="code"><span class="keyword">end</span></code></pre><div class="info module top">
<div class="info-desc">
<p>Raw printer for <a href="Parsetree.html"><code class="code"><span class="constructor">Parsetree</span></code></a></p>

<p><b>Warning:</b> this module is unstable and part of
  <a href="Compiler_libs.html">compiler-libs</a>.</p>
</div>
</div>
<hr width="100%">

<pre><span id="VALinterface"><span class="keyword">val</span> interface</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEsignature_item">Parsetree.signature_item</a> list -&gt; unit</code></pre>
<pre><span id="VALimplementation"><span class="keyword">val</span> implementation</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEstructure_item">Parsetree.structure_item</a> list -&gt; unit</code></pre>
<pre><span id="VALtop_phrase"><span class="keyword">val</span> top_phrase</span> : <code class="type">Format.formatter -&gt; <a href="Parsetree.html#TYPEtoplevel_phrase">Parsetree.toplevel_phrase</a> -&gt; unit</code></pre>
<pre><span id="VALexpression"><span class="keyword">val</span> expression</span> : <code class="type">int -&gt; Format.formatter -&gt; <a href="Parsetree.html#TYPEexpression">Parsetree.expression</a> -&gt; unit</code></pre>
<pre><span id="VALstructure"><span class="keyword">val</span> structure</span> : <code class="type">int -&gt; Format.formatter -&gt; <a href="Parsetree.html#TYPEstructure">Parsetree.structure</a> -&gt; unit</code></pre>
<pre><span id="VALpayload"><span class="keyword">val</span> payload</span> : <code class="type">int -&gt; Format.formatter -&gt; <a href="Parsetree.html#TYPEpayload">Parsetree.payload</a> -&gt; unit</code></pre>
<div class="copyright">The present documentation is copyright Institut National de Recherche en Informatique et en Automatique (INRIA). A complete version can be obtained from <a href="http://caml.inria.fr/pub/docs/manual-ocaml/">this page</a>.</div></div>